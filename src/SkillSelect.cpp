//=============================================================================
//
// �X�L���I��
// Author : ����]��
//
//=============================================================================

//�C���N���[�h
#include"main.h"
#include"SkillSelect.h"
#include"input.h"
#include"Fade.h"
#include"Application.h"
#include"renderer.h"
#include"sound.h"
#include"Map.h"
#include"Game.h"
#include"Player.h"
#include"CameraGame.h"
#include"Light.h"
#include"Bg.h"

#include "Object3D.h"

//====================================
// �萔
//====================================
int CSkillSelect::m_nSkill[MAX_PLAYER] = {};
std::vector<int> CSkillSelect::m_inputNumber = {};
bool CSkillSelect::m_isDecision[MAX_PLAYER] = {};

//====================================
//�R���X�g���N�^
//====================================
CSkillSelect::CSkillSelect()
{
}

//====================================
//�f�X�g���N�^
//====================================
CSkillSelect::~CSkillSelect()
{
}

//====================================
//������
//====================================
HRESULT CSkillSelect::Init()
{
	{
		CObject3D* pori = CObject3D::Create(D3DXVECTOR3(0.0f, 0.0f, 500.0f), D3DXVECTOR3(5000.0f, 0.0f, 5000.0f), 2);
		pori->SetTextureKey("TEST_FLOOR");
		pori->SetRot(D3DXVECTOR3(-1.5f,0.0f,0.0f));
	}

	//�J�����̐ݒ�
	CCamera* camera = AttachCamera(CCamera::Create());
	camera->SetPosV(D3DXVECTOR3(0.0f, 250.0f, -400.0f));
	camera->SetPosR(D3DXVECTOR3(0.0f, 250.0f, 200.0f));

	//���C�g�̐ݒ�
	m_pLight = new CLight;
	m_pLight->Init();

	m_inputNumber.resize(4);

	//������
	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{
		m_isPlayerCheck[nCnt] = false;
		m_isDecision[nCnt] = false;
		m_inputNumber[nCnt] = 99;		// ��΂ɗL�蓾�Ȃ���������
		m_nSkill[nCnt] = 1;
		m_pObj2D[nCnt] = CObject2D::Create(D3DXVECTOR3(200.0f + (300.0f * nCnt), 600.0f, 0.0f), D3DXVECTOR2(150.0f, 80.0f), 5);
		m_pPlayer[nCnt] = CPlayer::Create(D3DXVECTOR3(-(130.0f * 1.5f) + (150.0f * nCnt), 250.0f, 0.0f), D3DXVECTOR3(0.0f, D3DX_PI, 0.0f));
	}

	return S_OK;
}

//====================================
//�I��
//====================================
void CSkillSelect::Uninit()
{
	CSound::GetInstance()->Stop();

	//���C�g�̐ݒ�
	if (m_pLight != nullptr)
	{
		m_pLight->Uninit();
		delete m_pLight;
	}

	//�w�i
	if (m_pBg != nullptr)
	{
		m_pBg = nullptr;
	}
}

//====================================
//�X�V
//====================================
void CSkillSelect::Update()
{
	//�X�V����
	CMode::Update();
	m_pLight->Update();

	//�t�F�[�h���Ă��Ȃ����
	if (CApplication::getInstance()->GetFade()->GetFade() != CFade::FADE_NONE)
	{
		return;
	}

	//���͏���
	Input();

	// �G���g���[����
	Entry();

	//�I������
	Texture();
}

//====================================
//����
//====================================
void CSkillSelect::Input()
{
	//�C���v�b�g�̏����擾
	CInput* pInput = CInput::GetKey();
	
	// �v���C���[���S���I�𒆂�������
	if (m_isPlayerCheck[0] && m_isPlayerCheck[1] && m_isPlayerCheck[2] && m_isPlayerCheck[3])
	{
		if (m_inputNumber[0] != 99)
		{
			if (pInput->Trigger(KEY_DECISION, m_inputNumber[0]))		//ENTER�L�[
			{//�G���^�[�ŃQ�[����
			 //���[�h�ݒ�
				CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_GAME);
			}
		}
	}

	//�����͂ō���I��
	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{//�v���C���[���Ƃɕ�����
		if (m_inputNumber[nCnt] == 99)
		{
			continue;
		}

		if (m_nSkill[nCnt] >= 1)
		{//���[�ł͂Ȃ��Ȃ獶��
			if (pInput->Trigger(KEY_LEFT, m_inputNumber[nCnt]) && !m_isPlayerCheck[nCnt])
			{
				m_nSkill[nCnt]--;
			}
		}

		if (m_nSkill[nCnt] <= 2)
		{//�E�[�ł͂Ȃ��Ȃ�E��
			if (pInput->Trigger(KEY_RIGHT, m_inputNumber[nCnt]) && !m_isPlayerCheck[nCnt])
			{
				m_nSkill[nCnt]++;
			}
		}

		if (m_inputNumber[nCnt] != -1 && !m_isPlayerCheck[nCnt] && pInput->Trigger(JOYPAD_B, m_inputNumber[nCnt]) || m_inputNumber[nCnt] == -1 && !m_isPlayerCheck[nCnt] && pInput->Trigger(DIK_RETURN, m_inputNumber[nCnt]))
		{//�p�b�h��B�{�^���Ō��肷��(�L�[�{�[�h��V)
			m_isPlayerCheck[nCnt] = true;
		}
		else if (m_inputNumber[nCnt] != -1 && m_isPlayerCheck[nCnt] &&  pInput->Trigger(JOYPAD_A, m_inputNumber[nCnt]) || m_inputNumber[nCnt] == -1 && m_isPlayerCheck[nCnt] && pInput->Trigger(DIK_B, m_inputNumber[nCnt]))
		{//�p�b�h��A�{�^���ŉ�������(�L�[�{�[�h��B)
			m_isPlayerCheck[nCnt] = false;
		}
	}

#ifdef _DEBUG
	CDebugProc::Print("\n�L�[�{�[�h��V�Ō���AB�ŉ���");
	CDebugProc::Print("\nPlayerCheck : %d %d %d %d", m_isPlayerCheck[0], m_isPlayerCheck[1], m_isPlayerCheck[2], m_isPlayerCheck[3]);
#endif // _DEBUG
}

//====================================
//�I��
//====================================
void CSkillSelect::Texture()
{
	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{
		if (m_inputNumber[nCnt] == 99)
		{
			continue;
		}

		if (m_isPlayerCheck[nCnt])
		{//�v���C���[�̔\�͂�\���e�N�X�`��1
			m_pObj2D[nCnt]->SetTextureKey("CHECK_MARK");
		}
		else if (m_nSkill[nCnt] == 0)
		{//�v���C���[�̔\�͂�\���e�N�X�`��1
			m_pObj2D[nCnt]->SetTextureKey("RESULET_000");
		}
		else if (m_nSkill[nCnt] == 1)
		{//�v���C���[�̔\�͂�\���e�N�X�`��2
			m_pObj2D[nCnt]->SetTextureKey("RESULET_001");
		}
		else if (m_nSkill[nCnt] == 2)
		{//�v���C���[�̔\�͂�\���e�N�X�`��3
			m_pObj2D[nCnt]->SetTextureKey("RESULET_002");
		}
		else if (m_nSkill[nCnt] == 3)
		{//�v���C���[�̔\�͂�\���e�N�X�`��4
			m_pObj2D[nCnt]->SetTextureKey("RESULET_003");
		}
	}
}

//====================================
//�G���g���[
//====================================
void CSkillSelect::Entry()
{
	CInput* pInput = CInput::GetKey();
	std::vector<int> inputNumber = pInput->TriggerDevice(KEY_DECISION);

	for (size_t i = 0;i < inputNumber.size();i++)
	{
		if (std::find(m_inputNumber.begin(), m_inputNumber.end(), inputNumber[i]) == m_inputNumber.end())
		{
			for (int j = 0; j < m_inputNumber.size(); j++)
			{
				if (m_inputNumber[j] == 99)
				{
					m_inputNumber[j] = inputNumber[i];
					break;
				}
			}
		}
	}
	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{
		if (m_inputNumber[nCnt] == 99)
		{
			//�R���g���[���[���o�^����Ă��Ȃ�������true�ɂ��Ă���
			m_isPlayerCheck[nCnt] = true;

			continue;
		}
		else if (m_inputNumber[nCnt] != 99 && !m_isDecision[nCnt])
		{
			//�R���g���[���[���o�^���ꂽ���x�̂�false�ɖ߂�
			m_isPlayerCheck[nCnt] = false;
			m_isDecision[nCnt] = true;
		}
	}

#ifdef _DEBUG
	CDebugProc::Print("\nNumber : %d %d %d %d", m_inputNumber[0], m_inputNumber[1], m_inputNumber[2], m_inputNumber[3]);
#endif // _DEBUG
}