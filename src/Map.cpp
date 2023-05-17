//=============================================================================
//
// マップ生成
// Author:arita meigen
//
//=============================================================================

//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include"Map.h"
#include"file.h"

//-----------------------------------------------------------------------------
// 静的メンバー変数の宣言
//-----------------------------------------------------------------------------
const float CMap::BLOCK_WIDTH = 25.0f;	// ブロック同士の幅
int CMap::m_anRanking[MAX_PLAYER];	//	ランキング順位

//=============================================================================
// コンストラクタ
//=============================================================================
CMap::CMap()
{
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
	return S_OK;
}

//=============================================================================
// 生成
//=============================================================================
void CMap::Uninit()
{
	for (int i = 0; i < GetBlockCount(); i++)
	{
		if (m_pBlock[i]!=nullptr)
		{
			m_pBlock[i] = CBlock::Create(D3DXVECTOR3(0.0f, 0.0f, 0.0f), 0.0f);
		}
	}
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

			switch ((int)map["MAP"][i][j])
			{
			case -1:
				break;
			case 0:
				m_pBlock[i * map["MAP"][i].size() + j] = CBlock::Create(D3DXVECTOR3(x, 0.0f, z), 0.0f);
				break;
			case 1:
			case 2:
			case 3:
			case 4:
			{
				m_pBlock[i * map["MAP"][i].size() + j] = CBlock::Create(D3DXVECTOR3(x, 0.0f, z), 0.0f);
				D3DXVECTOR2 idx;
				idx.x = j;
				idx.y = i;
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
	int number;
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
	{
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
		if (m_pBlock[i]!=nullptr)
		{//中身がある場合
			m_nAllBlock[m_pBlock[i]->GetNumber()]++;
		}
	}
	return m_nAllBlock[nType];
}

//=============================================================================
// ブロックの取得
//=============================================================================
CBlock * CMap::GetBlock(const int x, const int y)
{
	int idx = (m_axisSizeX * y) + x;
	return m_pBlock[idx];
}
