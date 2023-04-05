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
#include"Floor.h"
#include"Player.h"
#include"Mesh.h"
#include"Camera.h"
#include"Light.h"
#include"Shadow.h"
#include"Fade.h"
#include"Life.h"
#include"sound.h"
#include"input.h"
#include"effect.h"
#include"Time.h"
#include"UI.h"

//�ÓI�����o�ϐ�
CPlayer*CGame::m_pPlayer[2] = {};
CLife*CGame::m_Life = nullptr;				//�̗̓Q�[�W
CGame::GAME CGame::m_gamestate;
bool CGame::bDebugCamera = nullptr;

CCamera*CGame::m_pCamera = nullptr;
CLight*CGame::m_pLight = nullptr;
CFloor*CGame::m_pFloor = nullptr;
CTimer*CGame::m_pTimer = nullptr;
CUI*CGame::m_pUI = nullptr;

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
	CFloor::Load();
	CLife::Load();
	CEffect::Load();
	CTimer::Load();
	CShadow::Load();

	//�v���C���[�̐���
	m_pPlayer[0] = CPlayer::Create(D3DXVECTOR3(-50.0f, 0.0f, 0.0f), D3DXVECTOR3(0.0f, -D3DX_PI*0.5f, 0.0f));
	m_pPlayer[1] = CPlayer::Create(D3DXVECTOR3(50.0f, 0.0f, 0.0f), D3DXVECTOR3(0.0f, D3DX_PI*0.5f, 0.0f));
	m_pPlayer[0]->SetEnemy(m_pPlayer[1]);
	m_pPlayer[1]->SetEnemy(m_pPlayer[0]);

	//�̗̓Q�[�W
	m_Life = CLife::Create();

	//�J�����̐ݒ�
	m_pCamera = CCamera::Create();

	//���C�g�̐ݒ�
	m_pLight = new CLight;
	m_pLight->Init();

	//��
	CFloor::Create(D3DXVECTOR3(0.0f, 0.0f, 0.0f), D3DXVECTOR3(500.0f, 500.0f, 500.0f),D3DXVECTOR3(0.0f, D3DX_PI*0.5f, 0.0f));
	CFloor::Create(D3DXVECTOR3(200.0f, 0.0f, 0.0f), D3DXVECTOR3(500.0f, 500.0f, 500.0f), D3DXVECTOR3(0.0f, D3DX_PI*0.5f, 0.0f));
	CFloor::Create(D3DXVECTOR3(-200.0f, 0.0f, 0.0f), D3DXVECTOR3(500.0f, 500.0f, 500.0f), D3DXVECTOR3(0.0f, D3DX_PI*0.5f, 0.0f));

	//���̕�
	CFloor::Create(D3DXVECTOR3(0.0f, 100.0f, 300.0f), D3DXVECTOR3(500.0f, 500.0f, 500.0f), D3DXVECTOR3(D3DX_PI*-0.5f,0.0f , 0.0f));	
	CFloor::Create(D3DXVECTOR3(200.0f, 100.0f, 300.0f), D3DXVECTOR3(500.0f, 500.0f, 500.0f), D3DXVECTOR3(D3DX_PI*-0.5f, 0.0f, 0.0f));
	CFloor::Create(D3DXVECTOR3(-200.0f, 100.0f, 300.0f), D3DXVECTOR3(500.0f, 500.0f, 500.0f), D3DXVECTOR3(D3DX_PI*-0.5f, 0.0f, 0.0f));

	//���̕�
	CFloor::Create(D3DXVECTOR3(STAGE_WIDTH, 100.0f, 0.0f), D3DXVECTOR3(500.0f, 500.0f, 500.0f), D3DXVECTOR3(D3DX_PI*-0.5f, D3DX_PI*0.5f, 0.0f));
	CFloor::Create(D3DXVECTOR3(-STAGE_WIDTH, 100.0f, 0.0f), D3DXVECTOR3(500.0f, 500.0f, 500.0f), D3DXVECTOR3(D3DX_PI*-0.5f, D3DX_PI*-0.5f, 0.0f));

	//�f�o�b�O�p�J�������샂�[�h
	bDebugCamera = false;

	CSound::GetInstance()->Play(CSound::LABEL_BGM_BATTLE001);

	m_pTimer = CTimer::Create();
	m_Timer = 0;

	//UI����
	m_pUI = CUI::Create();

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
	CFloor::Unload();
	CLife::Unload();
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

	if (m_Life != nullptr)
	{
		m_Life->Uninit();
		delete m_Life;
	}

	if (m_pUI != nullptr)
	{
		m_pUI->Uninit();
		delete m_pUI;
	}
	
	if (m_pTimer != nullptr)
	{
		m_pTimer->Uninit();
		delete m_pTimer;
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
		m_pUI->Update();	//UI
		m_pTimer->Update();
		Damagejudge();

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
	m_Life->Update();
	GameJudge();
}

//====================================
//�`��
//====================================
void CGame::Draw()
{
	m_pCamera->Set();
}

//====================================
//�_���[�W����
//====================================
void CGame::Damagejudge()
{
	//��񂾂��ʂ�悤�ɂ���
	m_pPlayer[0]->SetDamage(m_pPlayer[0]->Damage());	//�_���[�W����
	m_pPlayer[1]->SetDamage(m_pPlayer[1]->Damage());	//�_���[�W����

	m_pPlayer[0]->DrawCollision();			//�v���C���[1�̓����蔻��\��
	m_pPlayer[1]->DrawCollision();			//�v���C���[2�̓����蔻��\��
	m_pPlayer[0]->TransDamageVector();		//�v���C���[1�̃_���[�W�x�N�g���ݒ�
	m_pPlayer[1]->TransDamageVector();		//�v���C���[2�̃_���[�W�x�N�g���ݒ�
	m_pPlayer[0]->TransDamageMotion();		//�v���C���[1�̃_���[�W���[�V�����ݒ�
	m_pPlayer[1]->TransDamageMotion();		//�v���C���[2�̃_���[�W���[�V�����ݒ�

	m_pPlayer[0]->Die();					//�v���C���[1���S����
	m_pPlayer[1]->Die();					//�v���C���[2���S����
	m_pPlayer[0]->MotionManager();			//�v���C���[1���[�V�����Đ�
	m_pPlayer[1]->MotionManager();			//�v���C���[2���[�V�����Đ�

	m_pPlayer[0]->SetDamage(false);			//�_���[�W����RESET
	m_pPlayer[1]->SetDamage(false);			//�_���[�W����RESET
}

//====================================
//���s����
//====================================
void CGame::GameJudge()
{
	//�I������
	for (int i = 0; i < MAX_PLAYER; i++)
	{//�̗͂�0�ȉ�
		if (m_pPlayer[i]->GetNowMotion() == CPlayer::PM_DOWN)
		{
			if (m_pPlayer[i]->GetLife() <= 0 || m_pTimer->GetTimer() <= 0)
			{
				m_gamestate = GAME_END;
				break;
			}
		}
	}
	//���Ԑ؂�
	if (GetTimer()->GetTimer() <= 0)
	{
		m_gamestate = GAME_END;
	}

	//���E���h�I�������𖞂������ꍇ��ʑJ��
	if (m_gamestate == GAME_END&&CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
	{
		if (m_Timer == 0)
		{//�ŏ��̈��̂ݒʂ�
			if (m_pPlayer[1]->GetLife() < m_pPlayer[0]->GetLife())
			{//�v���C���[1����
				CApplication::getInstance()->AddScore(0);
			}
			else if (m_pPlayer[0]->GetLife() < m_pPlayer[1]->GetLife())
			{//�v���C���[2����
				CApplication::getInstance()->AddScore(1);
			}
			else //��������
			{//�����̃X�R�A�����Z
				CApplication::getInstance()->AddScore(0);
				CApplication::getInstance()->AddScore(1);
			}
		}
		//�^�C�}�[�����l�ȏ�ŉ�ʑJ��
		m_Timer++;	//�^�C�}�[���Z
		if (m_Timer >= END_TIMER)
		{
			//���ȏ�̃X�R�A�Ń��U���g�ֈڍs
			for (int i = 0; i < MAX_PLAYER; i++)
			{
				if (CApplication::getInstance()->GetScore(i) >= END_SCORE)
				{
					if (CApplication::getInstance()->GetScore(i) > CApplication::getInstance()->GetScore(1 - i))
					{
						CApplication::getInstance()->SetWinner(i);
					}
					else
					{//��������
						CApplication::getInstance()->SetWinner(2);
					}

					//�X�R�A���Z�b�g
					CApplication::getInstance()->ResetScore();

					//�Q�[�����Z�b�g
					CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_RESULT);
				}
			}
			//���E���h�ڍs
			m_Round = static_cast<ROUND>(m_Round + 1);
			CApplication::getInstance()->GetFade()->SetFade();
		}
	}
	if (m_gamestate == GAME_END&&CApplication::getInstance()->GetFade()->GetFade()==CFade::FADE_IN)
	{
		ResetGame();
	}
}

//���E���h�ڍs���̏���
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
	m_pUI->Init();
	return;
}
