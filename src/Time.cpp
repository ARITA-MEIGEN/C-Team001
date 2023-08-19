//=============================================================================
//
// �^�C�}�[
// Author : �L�c����
//
//=============================================================================

//�C���N���[�h
#include"renderer.h"
#include"Application.h"
#include"Object.h"
#include"Game.h"
#include"Player.h"
#include "Time.h"
#include"sound.h"

//=============================================================================
// �R���X�g���N�^
//=============================================================================
CTimer::CTimer(int /*nPriority*/)
{
}

//=============================================================================
// �f�X�g���N�^
//=============================================================================
CTimer::~CTimer()
{

}

//=============================================================================
// ������
//=============================================================================
HRESULT CTimer::Init()
{
	m_pos = D3DXVECTOR3(SCREEN_WIDTH * 0.5f, 70.0f, 0.0f);

	for (int i = 0; i < 2; i++)
	{
		m_apNumber[i] = new CObject2D(CObject::OBJTYPE_UI);
		m_apNumber[i]->Init();
		m_apNumber[i]->SetSiz(D3DXVECTOR2(40.0f, 80.0f));
		m_apNumber[i]->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));
		m_apNumber[i]->SetTextureKey("NUMBER");
		D3DXVECTOR3 pos(m_pos);
		pos.x += i * 34.0f - 34.0f * 0.5f;
		m_apNumber[i]->SetPos(pos);
	}

	m_apNumber[0]->SetUV(0.1f*(m_nTimer / 10), 0.1f * ((m_nTimer / 10) + 1), 0.0f, 1.0f);
	m_apNumber[1]->SetUV(0.1f*(m_nTimer % 10), 0.1f * ((m_nTimer % 10) + 1), 0.0f, 1.0f);

	return S_OK;
}

//=============================================================================
//�I��
//=============================================================================
void CTimer::Uninit()
{
	for (int i = 0; i < 2; i++)
	{
		m_apNumber[i]->Release();
	}
}

//=============================================================================
// �X�V
//=============================================================================
void CTimer::Update()
{
	m_nCreateTimer++;
	if (m_nCreateTimer % 60 == 0)
	{
		m_nTimer--;
		if (m_nTimer < 0)
		{
			m_nTimer++;
		}
		m_apNumber[0]->SetUV(0.1f * (m_nTimer / 10), 0.1f * ((m_nTimer / 10) + 1), 0.0f, 1.0f);
		m_apNumber[1]->SetUV(0.1f * (m_nTimer % 10), 0.1f * ((m_nTimer % 10) + 1), 0.0f, 1.0f);
	}
}

//=============================================================================
// �`��
//=============================================================================
void CTimer::Draw()
{

}

//=============================================================================
// �w�i����
//=============================================================================
CTimer * CTimer::Create(const int inTimer)
{
	CTimer* pTimer;
	pTimer = new CTimer;
	if (pTimer != nullptr)
	{// �|���S���̏���������
		pTimer->m_nTimer = inTimer;
		pTimer->Init();
	}
	return pTimer;
}

void CTimer::SetPos(const D3DXVECTOR3 & inPos)
{
	m_pos = inPos;

	for (int i = 0; i < 2; i++)
	{
		D3DXVECTOR3 pos(m_pos);
		pos.x += i * 34.0f - 34.0f * 0.5f;
		m_apNumber[i]->SetPos(pos);
	}
}
