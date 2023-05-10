//=============================================================================
//
// �Q�[�����̃J����
// Author : Yuda Kaito
//
//=============================================================================
//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include "CameraGame.h"

//-----------------------------------------------------------------------------
//�}�N����`
//-----------------------------------------------------------------------------
#define	DISTANCE_X	((m_posV.x - m_posR.x)*(m_posV.x - m_posR.x))		//�����̌v�Z�pX
#define	DISTANCE_Y	((m_posV.y - m_posR.y)*(m_posV.y - m_posR.y))		//�����̌v�Z�pY
#define DISTANCE_Z	((m_posV.z - m_posR.z)*(m_posV.z - m_posR.z))		//�����̌v�Z�pZ

//-----------------------------------------------------------------------------
//�ÓI�ϐ��錾
//-----------------------------------------------------------------------------
const float CCameraGame::SPEED = 5.0f;		// �ړ����x
const float CCameraGame::FACTOR = 0.01f;	// �Ǐ]�̌W��
const float CCameraGame::ROTSPEED = 0.05f;	// ���񑬓x
const float CCameraGame::ZPOS = -400.0f;	// Z���W

//-----------------------------------------------------------------------------
// �R���X�g���N�^
//-----------------------------------------------------------------------------
CCameraGame::CCameraGame()
{
}

//-----------------------------------------------------------------------------
// �f�X�g���N�^
//-----------------------------------------------------------------------------
CCameraGame::~CCameraGame()
{
}

//-----------------------------------------------------------------------------
// ������
//-----------------------------------------------------------------------------
void CCameraGame::Init()
{
	//���_�E�����_�E�������ݒ�
	m_posV = D3DXVECTOR3(0.0f, 400.0f, -500.0f);
	m_posR = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	m_vecU = D3DXVECTOR3(0.0f, 1.0f, 0.0f);
	m_rot = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	m_rot.x = atan2f((m_posV.y - m_posR.y), (m_posV.z - m_posR.z));
	m_fDistance = sqrtf(DISTANCE_X + DISTANCE_Y + DISTANCE_Z);
}

//-----------------------------------------------------------------------------
// �X�V
//-----------------------------------------------------------------------------
void CCameraGame::Update()
{
	NormalizeRadian();	//�p�x�̐��K��
#ifdef _DEBUG
	CDebugProc::Print("�J�����̎��_�̊p�x x:%f y:%f z:%f", m_posV.x, m_posV.y, m_posV.z);
#endif // _DEBUG

}

//-----------------------------------------------------------------------------
// ����
//-----------------------------------------------------------------------------
CCameraGame * CCameraGame::Create()
{
	CCameraGame* pCamera = new CCameraGame;

	if (pCamera == nullptr)
	{
		return nullptr;
	}

	pCamera->Init();
	return pCamera;
}