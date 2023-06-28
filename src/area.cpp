//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include "area.h"
#include "Map.h"
#include "Application.h"
#include "Object3D.h"

//=============================================================================
// コンストラクタ
//=============================================================================
CArea::CArea(int nPriority) : CObject(nPriority)
{
}

//=============================================================================
// デストラクタ
//=============================================================================
CArea::~CArea()
{
}

//=============================================================================
// 初期化
//=============================================================================
HRESULT CArea::Init()
{
	return S_OK;
}

//=============================================================================
// 終了
//=============================================================================
void CArea::Uninit()
{
	m_wall[0]->Release();
	m_wall[1]->Release();
	m_wall[2]->Release();
	m_wall[3]->Release();
}

//=============================================================================
// 更新
//=============================================================================
void CArea::Update()
{
	m_time--;
	m_signsTime--;
	
	if (m_signsTime <= 0)
	{
		m_functionAtSignsEnd();

		for (int i = 0; i < 4; i++)
		{
			m_wall[i]->SetCol(D3DXCOLOR(0.0f, 1.0f, 0.0f, 0.8f));
		}
	}

	if (m_time <= 0)
	{
		m_functionAtDied();
		Release();		// 破棄予定
		return;
	}
}

//=============================================================================
// 生成
//=============================================================================
CArea * CArea::Create(D3DXVECTOR2 index, const unsigned int inRange, const unsigned int inSignsTime, const unsigned int inDiedTime)
{
	CArea* area = new CArea;

	// 生成出来なければ
	assert(area != nullptr);

	area->Init();
	area->m_centerIndex = index;
	area->m_time = inSignsTime + inDiedTime;
	area->m_signsTime = inSignsTime;
	area->m_range = inRange;
	return area;
}

//=============================================================================
// 壁の生成
//=============================================================================
void CArea::CreateWall(D3DXVECTOR3 inPos)
{
	D3DXVECTOR3 pos(inPos);

	{
		D3DXVECTOR3 wallpos = pos;
		wallpos.z -= 45.0f;
		m_wall[0] = CObject3D::Create(wallpos, D3DXVECTOR3(90.0f, 0.0f, 35.0f), 0);
		m_wall[0]->SetRot(D3DXVECTOR3(-D3DX_PI * 0.5f, 0.0f, 0.0f));
		m_wall[0]->SetCol(D3DXCOLOR(1.0f, 0.0f, 0.0f, 0.8f));
		m_wall[0]->SetBackCulling(true);
	}
	{
		D3DXVECTOR3 wallpos = pos;
		wallpos.z += 45.0f;
		m_wall[1] = CObject3D::Create(wallpos, D3DXVECTOR3(90.0f, 0.0f, 35.0f), 0);
		m_wall[1]->SetRot(D3DXVECTOR3(-D3DX_PI * 0.5f, 0.0f, 0.0f));
		m_wall[1]->SetCol(D3DXCOLOR(1.0f,0.0f,0.0f,0.8f));
		m_wall[1]->SetBackCulling(true);
	}
	{
		D3DXVECTOR3 wallpos = pos;
		wallpos.x -= 45.0f;
		m_wall[2] = CObject3D::Create(wallpos, D3DXVECTOR3(90.0f, 0.0f, 35.0f), 0);
		m_wall[2]->SetRot(D3DXVECTOR3(-D3DX_PI * 0.5f, D3DX_PI * 0.5f, 0.0f));
		m_wall[2]->SetCol(D3DXCOLOR(1.0f, 0.0f, 0.0f, 0.8f));
		m_wall[2]->SetBackCulling(true);
	}
	{
		D3DXVECTOR3 wallpos = pos;
		wallpos.x += 45.0f;
		m_wall[3] = CObject3D::Create(wallpos, D3DXVECTOR3(90.0f, 0.0f, 35.0f), 0);
		m_wall[3]->SetRot(D3DXVECTOR3(-D3DX_PI * 0.5f, D3DX_PI * 0.5f, 0.0f));
		m_wall[3]->SetCol(D3DXCOLOR(1.0f, 0.0f, 0.0f, 0.8f));
		m_wall[3]->SetBackCulling(true);
	}
}
