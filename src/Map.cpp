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
// 終了
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
	json map = LoadJson("data/FILE/map.json");

	int playerCount = map["PLAYER_SPAWN"].size();

	m_pBlock.resize(map["MAP"].size() * map["MAP"][0].size());

	for (int i = 0; i < (int)map["MAP"].size(); i++)
	{
		for (int j = 0; j < (int)map["MAP"][i].size(); j++)
		{
			float x = i * BLOCK_WIDTH - map["MAP"].size() * 0.5f * BLOCK_WIDTH;
			float z = j * -BLOCK_WIDTH + map["MAP"][i].size() * 0.5f * BLOCK_WIDTH;

			switch ((int)map["MAP"][i][j])
			{
			case 0:
				m_pBlock[i * map["MAP"][i].size() + j] = CBlock::Create(D3DXVECTOR3(x, 0.0f, z), 0.0f);
				break;
			case 1:
				m_pBlock[i * map["MAP"][i].size() + j] = CBlock::Create(D3DXVECTOR3(x, 0.0f, z), 0.0f);
				break;
			case -1:
				break;
			default:
				break;
			}
		}
	}
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
