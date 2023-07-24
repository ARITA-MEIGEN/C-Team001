//=========================================
// 
// �v���C���[����̓��͖��߃N���X
// Author YudaKaito
// 
//=========================================
//=========================================
// include
//=========================================
#include "computerController.h"
#include "utility.h"

//-----------------------------------------
// �R���X�g���N�^
//-----------------------------------------
CComputerController::CComputerController()
{
}

//-----------------------------------------
// �f�X�g���N�^
//-----------------------------------------
CComputerController::~CComputerController()
{
}

//-----------------------------------------
// ������
//-----------------------------------------
HRESULT CComputerController::Init()
{
	return S_OK;
}

//-----------------------------------------
// �I��
//-----------------------------------------
void CComputerController::Uninit()
{
}

//-----------------------------------------
// �X�V
//-----------------------------------------
void CComputerController::Update()
{
}

//-----------------------------------------
// �ړ�
//-----------------------------------------
D3DXVECTOR3 CComputerController::Move()
{

	D3DXVECTOR3 moveInput = D3DXVECTOR3(0.0f, 0.0f, 0.0f);

	int moveRandom = IntRandom(5,0);

	switch (moveRandom)
	{
	case 0:
		moveInput.x = 0.0f;
		moveInput.y = 0.0f;
		break;
	case 1:
		moveInput.x -= 1.0f;
		break;
	case 2:
		moveInput.z -= 1.0f;
		break;
	case 3:
		moveInput.x += 1.0f;
		break;
	case 4:
		moveInput.z += 1.0f;
		break;
	default:
		break;
	}

	return moveInput;
}

//-----------------------------------------
// �X�L��
//-----------------------------------------
bool CComputerController::Skill()
{
	return false;
}

//-----------------------------------------
// ����
//-----------------------------------------
bool CComputerController::Throw()
{
	return false;
}