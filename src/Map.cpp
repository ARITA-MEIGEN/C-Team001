//=============================================================================
//
// É}ÉbÉvê∂ê¨
// Author:arita meigen
//
//=============================================================================

//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include"Map.h"

CMap::CMap()
{
}

CMap::~CMap()
{
}

HRESULT CMap::Init()
{
	for (int i = 0; i < BLOCK_Y; i++)
	{
		for (int j = 0; j < BLOCK_X; j++)
		{
			m_pBlock[i] = CBlock::Create(D3DXVECTOR3(j*50.0f, 0.0f, i*50.0f), 0.0f);
		}
	}
	return S_OK;
}

void CMap::Uninit()
{
}

void CMap::Update()
{
}

void CMap::Draw()
{
}

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
