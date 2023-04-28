//=============================================================================
//
// �I�u�W�F�N�g
// Author : �L�c����
//
//=============================================================================
//�C���N���[�h
#include"main.h"
#include"Application.h"
#include"Game.h"
#include"Player.h"
#include"Player.h"
#include"Mesh.h"
#include"CameraGame.h"
#include"Light.h"
#include"Shadow.h"
#include"Fade.h"
#include"sound.h"
#include"input.h"
#include"effect.h"
#include"Time.h"
#include"Map.h"
#include"Item_Speed.h"
#include"SkillGauge.h"

//�ÓI�����o�ϐ�
CPlayer*CGame::m_pPlayer[MAX_PLAYER] = {};
CGame::GAME CGame::m_gamestate;
bool CGame::bDebugCamera = nullptr;

CCamera*CGame::m_pCamera = nullptr;
CLight*CGame::m_pLight = nullptr;
CFloor*CGame::m_pFloor = nullptr;
CTimer*CGame::m_pTimer = nullptr;
CUI*CGame::m_pUI = nullptr;
CMap*CGame::m_pMap = nullptr;

//====================================
//�R���X�g���N�^
//====================================
CGame::CGame()
{
}

//====================================
//�f�X�g���N�^
//====================================
CGame::~CGame()
{

}

//====================================
//������
//====================================
HRESULT CGame::Init()
{
	//�e�N�X�`���̓ǂݍ���
	CShadow::Load();
	CEffect::Load();
	CTimer::Load();
	CShadow::Load();

	//�v���C���[�̐���
	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{
		m_pPlayer[nCnt] = CPlayer::Create(D3DXVECTOR3(-100.0f + (nCnt * 50.0f), 0.0f, 0.0f), D3DXVECTOR3(0.0f, D3DX_PI*0.5f, 0.0f));
	}

	//�A�C�e���̐���
	CSpeed::Create(D3DXVECTOR3(0.0f, 50.0f, 0.0f), D3DXVECTOR3(50.0f, 0.0f, 50.0f), D3DXVECTOR3(-D3DX_PI*0.5f, 0.0f, 0.0f),300);
	
	//�J�����̐ݒ�
	m_pCamera = CCameraGame::Create();

	//���C�g�̐ݒ�
	m_pLight = new CLight;
	m_pLight->Init();

	//�u���b�N����
	m_pMap = CMap::Create(0);

	//�f�o�b�O�p�J�������샂�[�h
	bDebugCamera = false;

	m_pTimer = CTimer::Create();
	m_Timer = 0;


	m_Round = ROUND_1;

	return S_OK;
}

//====================================
//�I��
//====================================
void CGame::Uninit()
{
	//�e�N�X�`���̔j��
	CShadow::Unload();
	CEffect::Unload();
	CTimer::Unload();
	CShadow::Unload();

	//�J�����̐ݒ�
	if (m_pCamera != nullptr)
	{
		m_pCamera->Uninit();
		delete m_pCamera;
	}

	//���C�g�̐ݒ�
	if (m_pLight != nullptr)
	{
		m_pLight->Uninit();
		delete m_pLight;
	}
	
	if (m_pTimer != nullptr)
	{
		m_pTimer->Uninit();
		delete m_pTimer;
	}

	if (m_pMap != nullptr)
	{
		delete m_pMap;
	}

	CSound::GetInstance()->Stop();
}

//====================================
//�X�V
//====================================
void CGame::Update()
{
	CInput* pInput = CInput::GetKey();
	if (CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
	{
		m_pTimer->Update();

#ifdef _DEBUG
		//�w��̃L�[�������ꂽ���ǂ���
		if (CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
		{
			if (pInput->Trigger(DIK_RETURN))
			{
				CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_RESULT);
			}
		}
#endif // !_DEBUG
	}

	m_pCamera->Update();
	m_pLight->Update();

}

//====================================
//�`��
//====================================
void CGame::Draw()
{
	m_pCamera->Set();
}

//====================================
//���E���h�ڍs���̏���
//====================================
void CGame::ResetGame()
{
	for (int i = 0; i < MAX_PLAYER; i++)
	{
		m_pPlayer[i]->Init();
		m_pPlayer[i]->SetPos(D3DXVECTOR3(-50.0f+(100.0f*i), 0.0f, 0.0f));
	}

	m_pTimer->Init();
	m_gamestate = GAME_START;
	m_Timer = 0;
	return;
}
