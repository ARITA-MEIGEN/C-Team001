//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include "area.h"
#include "Map.h"
#include "Application.h"
#include "area_warning.h"
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
	m_warning = CAreaWarning::Create(D3DXVECTOR3(SCREEN_WIDTH * 0.6f,50.0f,0.0f));
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
	m_wall2[0]->Release();
	m_wall2[1]->Release();
	m_wall2[2]->Release();
	m_wall2[3]->Release();
}

//=============================================================================
// 更新
//=============================================================================
void CArea::Update()
{
	for (int i = 0; i < 4; i++)
	{
		m_wall[i]->SetUV(0.0f, 5.0f, m_length, m_length + -1.0f);
		m_wall2[i]->SetUV(0.5f, 5.5f, m_length * 0.9f + -0.5f, m_length * 0.9f + -1.5f);
	}

	m_time--;
	m_signsTime--;
	m_length -= 0.01f;
	
	if (m_signsTime <= 0)
	{
		m_functionAtSignsEnd();

		if (m_warning != nullptr)
		{
			m_warning->Release();
			m_warning = nullptr;
		}

		for (int i = 0; i < 4; i++)
		{
			m_wall[i]->SetCol(D3DXCOLOR(0.0f, 1.0f, 0.0f, 0.0f));
			m_wall2[i]->SetCol(D3DXCOLOR(0.0f, 1.0f, 0.0f, 0.0f));
		}
	}

	if (m_time <= 20)
	{
		for (int i = 0; i < 4; i++)
		{
			m_wall[i]->SetCol(D3DXCOLOR(0.5f, 0.5f, 1.0f, 1.0f));
			m_wall2[i]->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));
			m_length += 0.02f;
		}
	}

	if (m_time <= 10)
	{
		m_functionAtDied();
	}

	if (m_time <= 0)
	{
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

	float width = m_range * CMap::BLOCK_WIDTH + CMap::BLOCK_WIDTH * 0.5f;

	pos.y += 50.0f;


	{
		D3DXVECTOR3 wallpos = pos;
		wallpos.z -= width;
		m_wall[0] = CObject3D::Create(wallpos, D3DXVECTOR3(width * 2.0f, 0.0f, 105.0f), 0);
		m_wall[0]->SetRot(D3DXVECTOR3(-D3DX_PI * 0.5f, 0.0f, 0.0f));
		m_wall2[0] = CObject3D::Create(wallpos, D3DXVECTOR3(width * 2.0f, 0.0f, 105.0f), 0);
		m_wall2[0]->SetRot(D3DXVECTOR3(-D3DX_PI * 0.5f, 0.0f, 0.0f));
	}
	{
		D3DXVECTOR3 wallpos = pos;
		wallpos.z += width;
		m_wall[1] = CObject3D::Create(wallpos, D3DXVECTOR3(width * 2.0f, 0.0f, 105.0f), 0);
		m_wall[1]->SetRot(D3DXVECTOR3(-D3DX_PI * 0.5f, 0.0f, 0.0f));
		m_wall2[1] = CObject3D::Create(wallpos, D3DXVECTOR3(width * 2.0f, 0.0f, 105.0f), 0);
		m_wall2[1]->SetRot(D3DXVECTOR3(-D3DX_PI * 0.5f, 0.0f, 0.0f));
	}
	{
		D3DXVECTOR3 wallpos = pos;
		wallpos.x -= width;
		m_wall[2] = CObject3D::Create(wallpos, D3DXVECTOR3(width * 2.0f, 0.0f, 105.0f), 0);
		m_wall[2]->SetRot(D3DXVECTOR3(-D3DX_PI * 0.5f, D3DX_PI * 0.5f, 0.0f));
		m_wall2[2] = CObject3D::Create(wallpos, D3DXVECTOR3(width * 2.0f, 0.0f, 105.0f), 0);
		m_wall2[2]->SetRot(D3DXVECTOR3(-D3DX_PI * 0.5f, D3DX_PI * 0.5f, 0.0f));
	}
	{
		D3DXVECTOR3 wallpos = pos;
		wallpos.x += width;
		m_wall[3] = CObject3D::Create(wallpos, D3DXVECTOR3(width * 2.0f, 0.0f, 105.0f), 0);
		m_wall[3]->SetRot(D3DXVECTOR3(-D3DX_PI * 0.5f, D3DX_PI * 0.5f, 0.0f));
		m_wall2[3] = CObject3D::Create(wallpos, D3DXVECTOR3(width * 2.0f, 0.0f, 105.0f), 0);
		m_wall2[3]->SetRot(D3DXVECTOR3(-D3DX_PI * 0.5f, D3DX_PI * 0.5f, 0.0f));
	}

	for (int i = 0; i < 4; i++)
	{
		m_wall[i]->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));
		m_wall[i]->SetBackCulling(true);
		m_wall[i]->SetTextureKey("AREA_EFFECT");
		m_wall[i]->SetUV(0.0f, 5.0f, 0.0f, 1.0f);
		m_wall2[i]->SetCol(D3DXCOLOR(1.0f, 0.0f, 0.9f, 1.0f));
		m_wall2[i]->SetBackCulling(true);
		m_wall2[i]->SetTextureKey("AREA_EFFECT");
		m_wall2[i]->SetUV(0.5f, 5.5f, 0.25f, 1.25f);
	}
}
