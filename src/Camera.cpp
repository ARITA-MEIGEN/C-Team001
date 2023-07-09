//=================================================
// Content     (�Q�[���̐ݒ�)(camera.cpp)
// Author     : �L�c����
//=================================================

//-----------------------------------------------------------------------------
//�C���N���[�h
//-----------------------------------------------------------------------------
#include "camera.h"
#include "renderer.h"
#include "Application.h"
#include "DebugProc.h"
#include "Player.h"
#include "input.h"
#include "utility.h"

//-----------------------------------------------------------------------------
//�}�N����`
//-----------------------------------------------------------------------------
#define	DISTANCE_X	((m_posV.x - m_posR.x) * (m_posV.x - m_posR.x))		//�����̌v�Z�pX
#define	DISTANCE_Y	((m_posV.y - m_posR.y) * (m_posV.y - m_posR.y))		//�����̌v�Z�pY
#define DISTANCE_Z	((m_posV.z - m_posR.z) * (m_posV.z - m_posR.z))		//�����̌v�Z�pZ

//-----------------------------------------------------------------------------
//�ÓI�ϐ��錾
//-----------------------------------------------------------------------------
const float CCamera::CAMERA_NEAR = 1.0f;	// �j�A
const float CCamera::CAMERA_FAR = 2000.0f;	// �t�@�[
const float CCamera::FIELD_OF_VIEW = D3DXToRadian(45.0f);	// ����p

//===========================
//�R���X�g���N�^
//===========================
CCamera::CCamera()
{
}

//===========================
//�f�X�g���N�^
//===========================
CCamera::~CCamera()
{
}

//===========================
//�J�����̏���������
//===========================
void CCamera::Init(void)
{
	//���_�E�����_�E�������ݒ�
	m_posV = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	m_posR = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	m_vecU = D3DXVECTOR3(0.0f, 1.0f, 0.0f);
	m_rot = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	m_rot.x = atan2f((m_posV.y - m_posR.y), (m_posV.z - m_posR.z));

	m_fDistance = sqrtf(DISTANCE_X + DISTANCE_Y + DISTANCE_Z);
}

//===========================
//�J�����̏I������
//===========================
void  CCamera::Uninit(void)
{

}

//===========================
//�J�����̍X�V����
//===========================
void  CCamera::Update(void)
{
	NormalizeRadian();	//�p�x�̐��K��
#ifdef _DEBUG
	CInput* pInput = CInput::GetKey();
	if ((pInput->Trigger(DIK_0)) == true)		//ENTER�L�[
	{
		m_posV.x++;
	}
	CDebugProc::Print("�J�����̎��_�̊p�x x:%f y:%f z:%f",m_posV.x,m_posV.y,m_posV.z);

#endif // _DEBUG

}

//===========================
//�J�����̐ݒ菈��
//===========================
void  CCamera::Set(void)
{
	//�f�o�C�X�̎擾
	LPDIRECT3DDEVICE9 pDevice;
	pDevice = CApplication::getInstance()->GetRenderer()->GetDevice();

	//�r���[�}�g���b�N�X�̏�����
	D3DXMatrixIdentity(&m_mtxView);

	//�r���[�}�g���b�N�X�̍쐬
	D3DXMatrixLookAtLH(&m_mtxView, &m_posV, &m_posR, &m_vecU);

	//�r���[�}�g���b�N�X�̐ݒ�
	pDevice->SetTransform(D3DTS_VIEW, &m_mtxView);

	//�v���W�F�N�V�����}�g���b�N�X�̏�����
	D3DXMatrixIdentity(&m_mtxProjection);

	//�v���W�F�N�V�����}�g���b�N�X�̍쐬
	D3DXMatrixPerspectiveFovLH(&m_mtxProjection,
		FIELD_OF_VIEW,						// ����p
		(float)SCREEN_WIDTH / (float)SCREEN_HEIGHT,	// �A�X�y�N�g��
		CAMERA_NEAR,								// �ǂ�����
		CAMERA_FAR);								// �ǂ��܂ŕ`�悷�邩�̐ݒ�

	//�v���W�F�N�V�����}�g���b�N�X�̐ݒ�
	pDevice->SetTransform(D3DTS_PROJECTION,&m_mtxProjection);	// �v���W�F�N�V�������W�s��̐ݒ�
}

//===========================
//�p�x�̐��K��
//===========================
void CCamera::NormalizeRadian(void)
{
	//�p�x�̐��K��
	m_rot.x = NormalizeAngle(m_rot.x);
	m_rot.y = NormalizeAngle(m_rot.y);
	m_rot.z = NormalizeAngle(m_rot.z);
}

//===========================
//����
//===========================
CCamera * CCamera::Create(void)
{
	CCamera* pCamera = new CCamera;
	if (pCamera != nullptr)
	{
		pCamera->Init();
	}

	return pCamera;
}
