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
const float CCamera::CAMERA_FAR = 3500.0f;	// �t�@�[
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

	m_viewPort.MinZ = 0.0f;
	m_viewPort.MaxZ = 1.0f;

	//��������
	m_viewPort.X = 0;
	m_viewPort.Y = 0;
	m_viewPort.Width = SCREEN_WIDTH;
	m_viewPort.Height = SCREEN_HEIGHT;

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

	CDebugProc::Print("�J�����̎��_�̊p�x x:%f y:%f z:%f\n",m_posV.x,m_posV.y,m_posV.z);
	CDebugProc::Print("�J�����̒����_�̊p�x x:%f y:%f z:%f", m_posR.x, m_posR.y, m_posR.z);

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

	// �r���[�|�[�g�̐ݒ�
	pDevice->SetViewport(&m_viewPort);

	//�r���[�}�g���b�N�X�̏�����
	D3DXMatrixIdentity(&m_mtxView);

	//�r���[�}�g���b�N�X�̍쐬
	D3DXMatrixLookAtLH(&m_mtxView, &m_posV, &m_posR, &m_vecU);

	//�r���[�}�g���b�N�X�̐ݒ�
	pDevice->SetTransform(D3DTS_VIEW, &m_mtxView);

	//�v���W�F�N�V�����}�g���b�N�X�̏�����
	D3DXMatrixIdentity(&m_mtxProjection);

	//�v���W�F�N�V�����}�g���b�N�X�̍쐬
	//float width = (float)SCREEN_WIDTH * 0.25f;
	//float height = (float)SCREEN_HEIGHT * 0.25f;
	//D3DXMatrixOrthoLH(&m_mtxProjection, width, height, CAMERA_NEAR, CAMERA_FAR);

	D3DXMatrixPerspectiveFovLH(&m_mtxProjection,
		FIELD_OF_VIEW,						// ����p
		(float)m_viewPort.Width / (float)m_viewPort.Height,	// �A�X�y�N�g��
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

void CCamera::AddPos(D3DXVECTOR3 move)
{
	m_posV += move;
	m_posR += move;
}

D3DXVECTOR3 CCamera::CalculateRotFromPos(const D3DXVECTOR3 & inPos)
{
	D3DXVECTOR3 rot;

	rot.y = atan2(inPos.x - m_posV.x, inPos.z - m_posV.z);
	rot.x = atan2(inPos.y - m_posV.y, inPos.z - m_posV.z);
	rot.z = 0.0f;

	//D3DXVECTOR3 vec = m_posV - inPos;

	//D3DXVec3Normalize(&vec,&vec);

	return rot;
}
