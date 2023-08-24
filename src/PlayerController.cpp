//=========================================
// 
// �v���C���[����̓��͖��߃N���X
// Author YudaKaito
// 
//=========================================
//=========================================
// include
//=========================================
#include "PlayerController.h"
#include "application.h"
#include "input.h"

//-----------------------------------------
// �R���X�g���N�^
//-----------------------------------------
CPlayerController::CPlayerController(int inInputIndex)
{
	m_nInputIdx = inInputIndex;
}

//-----------------------------------------
// �f�X�g���N�^
//-----------------------------------------
CPlayerController::~CPlayerController()
{
}

//-----------------------------------------
// ������
//-----------------------------------------
HRESULT CPlayerController::Init()
{
	return S_OK;
}

//-----------------------------------------
// �I��
//-----------------------------------------
void CPlayerController::Uninit()
{
}

//-----------------------------------------
// �X�V
//-----------------------------------------
void CPlayerController::Update()
{
}

//-----------------------------------------
// �ړ�
//-----------------------------------------
D3DXVECTOR3 CPlayerController::Move()
{
	CInput* input = CInput::GetKey();

	D3DXVECTOR3 moveInput = D3DXVECTOR3(0.0f, 0.0f, 0.0f);

	if (input == nullptr)
	{
		return moveInput;
	}

	//pad�̈ړ�
	if (input->Press(KEY_UP, m_nInputIdx))
	{
		moveInput.z += 1.0f;
	}
	if (input->Press(KEY_LEFT, m_nInputIdx))
	{
		moveInput.x -= 1.0f;
	}
	if (input->Press(KEY_DOWN, m_nInputIdx))
	{
		moveInput.z -= 1.0f;
	}
	if (input->Press(KEY_RIGHT, m_nInputIdx))
	{
		moveInput.x += 1.0f;
	}

	//�L�[�{�[�h�̈ړ�
	if (input->Press(KEY_UP,-1))
	{
		moveInput.z += 1.0f;
	}
	if (input->Press(KEY_LEFT, -1))
	{
		moveInput.x -= 1.0f;
	}
	if (input->Press(KEY_DOWN, -1))
	{
		moveInput.z -= 1.0f;
	}
	if (input->Press(KEY_RIGHT, -1))
	{
		moveInput.x += 1.0f;
	}

	if (moveInput.x != 0.0f || moveInput.y != 0.0f)
	{
		D3DXVec3Normalize(&moveInput, &moveInput);
	}

	return moveInput;
}

//-----------------------------------------
// �X�L��
//-----------------------------------------
bool CPlayerController::Skill()
{
	CInput* pInput = CInput::GetKey();	//�C���v�b�g�̎擾

	bool k = false;
	bool l = false;
	bool y = false;
	bool x = false;

	if (m_nInputIdx != -1)
	{
		y = pInput->Trigger(JOYPAD_Y, m_nInputIdx);
		x = pInput->Trigger(JOYPAD_X, m_nInputIdx);
	}
	else
	{
		k = pInput->Trigger(DIK_K);
		l = pInput->Trigger(DIK_K);
	}

	return k || l || y || x;
}

//-----------------------------------------
// ����
//-----------------------------------------
bool CPlayerController::Throw()
{
	CInput* pInput = CInput::GetKey();	//�C���v�b�g�̎擾
	return 	(pInput->Trigger(DIK_G) || pInput->Trigger(JOYPAD_A, m_nInputIdx) || pInput->Trigger(JOYPAD_B, m_nInputIdx));
}
