//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include "area.h"
#include "Map.h"
#include "Application.h"
#include "Object3D.h"

//=============================================================================
// �R���X�g���N�^
//=============================================================================
CArea::CArea(int nPriority) : CObject(nPriority)
{
}

//=============================================================================
// �f�X�g���N�^
//=============================================================================
CArea::~CArea()
{
}

//=============================================================================
// ������
//=============================================================================
HRESULT CArea::Init()
{
	return S_OK;
}

//=============================================================================
// �I��
//=============================================================================
void CArea::Uninit()
{
	m_wall[0]->Release();
	m_wall[1]->Release();
	m_wall[2]->Release();
	m_wall[3]->Release();
}

//=============================================================================
// �X�V
//=============================================================================
void CArea::Update()
{
	m_time--;

	if (m_time <= 0)
	{
		m_functionAtDied();
		Release();		// �j���\��
		return;
	}
}

//=============================================================================
// ����
//=============================================================================
CArea * CArea::Create(D3DXVECTOR2 index, const unsigned int inRange, const unsigned int inTime)
{
	CArea* area = new CArea;

	// �����o���Ȃ����
	assert(area != nullptr);

	area->Init();
	area->m_centerIndex = index;
	area->m_time = inTime;
	area->m_range = inRange;
	return area;
}

void CArea::CreateWall(D3DXVECTOR3 inPos)
{
	D3DXVECTOR3 pos(inPos);

	{
		D3DXVECTOR3 wallpos = pos;
		wallpos.z -= 45.0f;
		m_wall[0] = CObject3D::Create(wallpos, D3DXVECTOR3(90.0f, 0.0f, 35.0f), 0);
		m_wall[0]->SetRot(D3DXVECTOR3(-D3DX_PI * 0.5f, 0.0f, 0.0f));
		m_wall[0]->SetCol(D3DXCOLOR(1.0f, 0.0f, 0.0f, 0.8f));
	}
	{
		D3DXVECTOR3 wallpos = pos;
		wallpos.z += 45.0f;
		m_wall[1] = CObject3D::Create(wallpos, D3DXVECTOR3(90.0f, 0.0f, 35.0f), 0);
		m_wall[1]->SetRot(D3DXVECTOR3(-D3DX_PI * 0.5f, 0.0f, 0.0f));
		m_wall[1]->SetCol(D3DXCOLOR(1.0f,0.0f,0.0f,0.8f));
	}
	{
		D3DXVECTOR3 wallpos = pos;
		wallpos.x -= 45.0f;
		m_wall[2] = CObject3D::Create(wallpos, D3DXVECTOR3(90.0f, 0.0f, 35.0f), 0);
		m_wall[2]->SetRot(D3DXVECTOR3(-D3DX_PI * 0.5f, D3DX_PI * 0.5f, 0.0f));
		m_wall[2]->SetCol(D3DXCOLOR(1.0f, 0.0f, 0.0f, 0.8f));
	}
	{
		D3DXVECTOR3 wallpos = pos;
		wallpos.x += 45.0f;
		m_wall[3] = CObject3D::Create(wallpos, D3DXVECTOR3(90.0f, 0.0f, 35.0f), 0);
		m_wall[3]->SetRot(D3DXVECTOR3(-D3DX_PI * 0.5f, D3DX_PI * 0.5f, 0.0f));
		m_wall[3]->SetCol(D3DXCOLOR(1.0f, 0.0f, 0.0f, 0.8f));
	}
}
