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
#include "nlohmann/json.hpp"
#include"file.h"

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
	for (int i = 0; i < MAX_BLOCK; i++)
	{
		m_pBlock[i] = CBlock::Create(D3DXVECTOR3(0.0f, 0.0f, 0.0f), 0.0f);
	}
	Load();
	return S_OK;
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
	for (int i = 0; i < MAX_BLOCK; i++)
	{
		D3DXVECTOR3 pos = D3DXVECTOR3(map["BLOCK"][i]["POS"][0], map["BLOCK"][i]["POS"][1], map["BLOCK"][i]["POS"][2]);
		m_pBlock[i]->SetPos(pos);
	}
}
