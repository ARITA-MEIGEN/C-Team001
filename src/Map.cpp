//=============================================================================
//
// マップ生成
// Author:arita meigen
//
//=============================================================================

//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include "Map.h"
#include "file.h"
#include "utility.h"
#include "Item_Speed.h"

//-----------------------------------------------------------------------------
// 静的メンバー変数の宣言
//-----------------------------------------------------------------------------
const float CMap::BLOCK_WIDTH = 30.0f;	// ブロック同士の幅
int CMap::m_anRanking[MAX_PLAYER];	//	ランキング順位

//=============================================================================
// コンストラクタ
//=============================================================================
CMap::CMap()
{
	m_nPopCnt = 0;
}

//=============================================================================
// デストラクタ
//=============================================================================
CMap::~CMap()
{
}

//=============================================================================
// 初期化
//=============================================================================
HRESULT CMap::Init()
{
	Load();

	m_nPopCnt = IntRandom(2 * 60, 1 * 60);
	return S_OK;
}

//=============================================================================
// 生成
//=============================================================================
void CMap::Uninit()
{
	for (int i = 0; i < GetBlockCount(); i++)
	{
		m_pBlock[i] = CBlock::Create(D3DXVECTOR3(0.0f, 0.0f, 0.0f));
	}
}

//=============================================================================
// 更新
//=============================================================================
void CMap::Update()
{
	PopItem();
}

//=============================================================================
// 生成
//=============================================================================
CMap * CMap::Create(int stgnumber)
{
	CMap*pMap = new CMap();

	if (pMap!=nullptr)
	{
	pMap->m_StageNumber = (STAGE)stgnumber;
	pMap->Init();
	}
	return pMap;
}

//=============================================================================
// 読み込み
//=============================================================================
void CMap::Load()
{
	using json = nlohmann::json;
	json map = LoadJson("data/FILE/map01.json");

	m_pBlock.resize(map["MAP"].size() * map["MAP"][0].size());
	m_axisSizeX = map["MAP"][0].size();

	m_playerSpawnIdx.resize(4);

	for (int i = 0; i < (int)map["MAP"].size(); i++)
	{
		for (int j = 0; j < (int)map["MAP"][i].size(); j++)
		{
			float z = i * -BLOCK_WIDTH + map["MAP"].size() * 0.5f * BLOCK_WIDTH;
			float x = j * BLOCK_WIDTH - map["MAP"][i].size() * 0.5f * BLOCK_WIDTH;

			m_pBlock[i * map["MAP"][i].size() + j] = CBlock::Create(D3DXVECTOR3(x, 0.0f, z));
			switch ((int)map["MAP"][i][j])
			{
			case -1:
				m_pBlock[i * map["MAP"][i].size() + j]->SetCol(D3DXCOLOR(0.0f, 0.0f, 0.0f, 0.0f));
				m_pBlock[i * map["MAP"][i].size() + j]->SetStop(true);
				break;
			case 0:
				break;
			case 1:
			case 2:
			case 3:
			case 4:
			{
				D3DXVECTOR2 idx;
				idx.x = (float)j;
				idx.y = (float)i;
				m_playerSpawnIdx[(int)map["MAP"][i][j]-1] = idx;
			}
				break;
			default:
				break;
			}
		}
	}
}

//=============================================================================
// ランキング処理
//=============================================================================
int CMap::Ranking()
{
	int Score[4];
	int Rank[4];	//プレイヤーの番号を渡す

	for (int i = 0; i < MAX_PLAYER; i++)
	{
		Score[i] = GetCountBlockType(i);
	}

	//昇順に並び変える
	std::vector<int> rank = { Score[0], Score[1], Score[2],Score[3] };
	std::sort(rank.begin(), rank.end());

	for (int i = 0; i < MAX_PLAYER; i++)
	{//並び変えたやつを代入
		for (int j = 0; j < MAX_PLAYER; j++)
		{
			if (rank[i] == Score[j])
			{//ランキングの数値とプレイヤーの数値が一致している場合プレイヤーの番号を代入する
				if (Rank[0] != j&& Rank[1] != j && Rank[2] != j && Rank[3] != j)
				{//他の順位とプレイヤーの番号を被らないようにする
					Rank[i] = j;
				}
			}
		}
	}

	//ランキングを代入
	for (int i = 0; i < MAX_PLAYER; i++)
	{//昇順
		m_anRanking[i] = Rank[i];
	}

	return m_anRanking[3];	//一位のプレイヤーの番号を出力
}

//=============================================================================
// 読み込み
//=============================================================================
int CMap::GetCountBlockType(int nType)
{
//	CBlock* AllBlock;
	for (int i = 0; i < 4; i++)
	{//リセット
		m_nAllBlock[i] = 0;
	}

	for (int i = 0; i < GetBlockCount(); i++)
	{//タイプ分け

		if (m_pBlock[i]->GetNumber() < 0)
		{
			continue;
		}

		m_nAllBlock[m_pBlock[i]->GetNumber()]++;
	}
	return m_nAllBlock[nType];
}

//=============================================================================
// アイテムの出現
//=============================================================================
void CMap::PopItem()
{
	m_nPopCnt--;
	if (m_nPopCnt > 0)
	{
		return;
	}

	/* ↓出現間隔が0以下↓ */

	CBlock* popPlanBlock = m_pBlock[IntRandom(m_pBlock.size() - 1, 0)];

	if (popPlanBlock->IsStop())
	{
		return;
	}

	/* ↓ランダム指定のブロックが侵入不可ブロックではない↓ */


	if (popPlanBlock->GetOnItem() != nullptr)
	{
		return;
	}

	/* ↓ランダム指定のブロックにアイテムが乗っていない↓ */

	D3DXVECTOR3 pos = popPlanBlock->GetPos();
	pos.y += 30.0f;

	//アイテムの生成
	popPlanBlock->SetOnItem(CSpeed::Create(pos, D3DXVECTOR3(35.0f, 0.0f, 35.0f), D3DXVECTOR3(-D3DX_PI * 0.5f, 0.0f, 0.0f), 300));

	// 次回出現時間の設定
	m_nPopCnt = IntRandom(60, 180);
}

//=============================================================================
// ブロックの取得
//=============================================================================
CBlock * CMap::GetBlock(const int x, const int y)
{
	int idx = (m_axisSizeX * y) + x;
	return m_pBlock[idx];
}

//=============================================================================
// ブロックの番号取得
//=============================================================================
D3DXVECTOR2 CMap::GetBlockIdx(CBlock * block)
{
	for (int i = 0; i < (int)m_pBlock.size(); i++)
	{
		CBlock* pBlock = m_pBlock[i];

		if (pBlock == nullptr)
		{
			continue;
		}

		if (pBlock == block)
		{
			D3DXVECTOR2 idx;
			idx.y = (float)(i / m_axisSizeX);
			idx.x = (float)(i % m_axisSizeX);
			return idx;
		}
	}

	return D3DXVECTOR2(0.0f,0.0f);
}
