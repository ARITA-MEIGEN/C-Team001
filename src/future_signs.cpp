//=============================================================================
//
// �u���b�N����
// Author:arita meigen
//
//=============================================================================

//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include "future_signs.h"
#include "Item.h"

//=============================================================================
// �R���X�g���N�^
//=============================================================================
CFutureSigns::CFutureSigns(int priorty) :CObjectX(priorty)
{
	m_number = 0;
}

//=============================================================================
// �f�X�g���N�^
//=============================================================================
CFutureSigns::~CFutureSigns()
{

}

//=============================================================================
// ������
//=============================================================================
HRESULT CFutureSigns::Init()
{
	CObjectX::Init();
	BindModel("BLOCK");
	SetRot(D3DXVECTOR3(0.0f, 0.0f, 0.0f));
	m_number = -1;
	m_time = 0;
	return S_OK;
}

//=============================================================================
//�I��
//=============================================================================
void  CFutureSigns::Uninit()
{
	CObjectX::Uninit();
}

//=============================================================================
// �X�V
//=============================================================================
void  CFutureSigns::Update()
{
	m_time++;

	CObjectX::Update();

	D3DXVECTOR3 sizeMag = GetSizeMag();
	sizeMag += D3DXVECTOR3(-0.000f, 0.0025f, -0.000f);
	SetSizeMag(sizeMag);

	if (m_time % 10 == 0)
	{
	SetCol(D3DXCOLOR(0.5f, 0.0f, 0.75f, 0.8f));
	}
	else if (m_time % 15 == 0)
	{
		SetPlayerNumber(m_number);
	}

	if (sizeMag.y >= 1.25f)
	{
		Uninit();
	}
}

//=============================================================================
// ����
//=============================================================================
CFutureSigns* CFutureSigns::Create(D3DXVECTOR3 pos)
{
	CFutureSigns* pBlock = new CFutureSigns(5);

	if (pBlock != nullptr)
	{
		pBlock->Init();
		pBlock->SetPos(pos);
	}
	return pBlock;
}

//=============================================================================
// �v���C���[�ݒ�
//=============================================================================
void CFutureSigns::SetPlayerNumber(int number)
{
	m_number = number;

	switch (m_number)
	{
	case -2:
		SetCol(D3DXCOLOR(0.5f, 0.0f, 0.75f, 0.8f));
		break;
	case -1:
		SetCol(D3DXCOLOR(0.0f, 0.0f, 0.0f, 1.0f));
		break;
	case 0:
		SetCol(D3DXCOLOR(1.0f, 0.0f, 0.0f, 1.0f));
		break;
	case 1:
		SetCol(D3DXCOLOR(0.0f, 0.0f, 1.0f, 1.0f));
		break;
	case 2:
		SetCol(D3DXCOLOR(0.55f, 0.55f, 0.0f, 1.0f));
		break;
	case 3:
		SetCol(D3DXCOLOR(0.0f, 1.0f, 0.0f, 1.0f));
		break;
	default:
		break;
	}
}