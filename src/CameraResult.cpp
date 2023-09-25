//=============================================================================
//
// �Q�[�����̃J����
// Author : Yuda Kaito
//
//=============================================================================
//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include "CameraResult.h"
#include"Result.h"

//-----------------------------------------------------------------------------
//�ÓI�ϐ��錾
//-----------------------------------------------------------------------------
const float CCameraResult::SPEED = 5.0f;		// �ړ����x
const float CCameraResult::FACTOR = 0.01f;	// �Ǐ]�̌W��
const float CCameraResult::ROTSPEED = 0.05f;	// ���񑬓x
const float CCameraResult::ZPOS = -400.0f;	// Z���W
const float CCameraResult::ZPullCamera = -100.0f;	// Z���W
const float CCameraResult::YFlagCamera = 280.0f;	// �J�����������^�C�~���O

//-----------------------------------------------------------------------------
// �R���X�g���N�^
//-----------------------------------------------------------------------------
CCameraResult::CCameraResult()
{
}

//-----------------------------------------------------------------------------
// �f�X�g���N�^
//-----------------------------------------------------------------------------
CCameraResult::~CCameraResult()
{
}

//-----------------------------------------------------------------------------
// ������
//-----------------------------------------------------------------------------
void CCameraResult::Init()
{
	CCamera::Init();

	//���_�E�����_��ݒ�
	m_posV = D3DXVECTOR3(0.0f, 150.0f, 0.0f);
	m_posR = D3DXVECTOR3(0.0f, -500.0f, 0.0f);
	CAMERASTATE = CAMERA_ROLL;
}

//-----------------------------------------------------------------------------
// �X�V
//-----------------------------------------------------------------------------
void CCameraResult::Update()
{
	CCamera::Update();

	switch (CAMERASTATE)
	{
	case CCameraResult::CAMERA_ROLL:
		if (m_posR.y < 250.0f)
		{
			m_posR.y += 3.0f;
		}
		if (m_posV.z > -400.0f)
		{
			m_posV.z -= 1.5f;
		}
		if (m_posV.z <= -400.0f&&m_posR.y >= 250.0f)
		{
			CAMERASTATE = CAMERA_UP;
		}
		break;

	case CCameraResult::CAMERA_UP:
		if (m_posR.y >= 250.0f&&m_posV.z <= -400.0f&&m_posR.y < YFlagCamera)
		{
			m_posR.y += 1.0f;
			m_posV.y += 1.0f;
			
		}
		if (m_posR.y >= YFlagCamera)
		{
			CAMERASTATE = CAMERA_PULL;
		}
		break;

	case CCameraResult::CAMERA_PULL:
		if (m_posR.z >= ZPullCamera)
		{
			m_posV.z -= 1.0f;
			m_posR.z -= 1.0f;
			m_posV.y -= 0.2f;
			m_posR.y -= 0.2f;
		}
		else if (m_posR.z <ZPullCamera)
		{
			CAMERASTATE = CAMERA_END;
		}
		break;
	case CCameraResult::CAMERA_END:
		break;

	}
}

//-----------------------------------------------------------------------------
// ����
//-----------------------------------------------------------------------------
CCameraResult* CCameraResult::Create()
{
	CCameraResult* pCamera = new CCameraResult;

	if (pCamera == nullptr)
	{
		return nullptr;
	}

	pCamera->Init();
	return pCamera;
}
