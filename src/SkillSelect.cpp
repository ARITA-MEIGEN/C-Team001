//=============================================================================
//
// �X�L���I��
// Author : ����]��
//
//=============================================================================

//�C���N���[�h
#include "main.h"
#include "SkillSelect.h"
#include "input.h"
#include "Fade.h"
#include "Application.h"
#include "renderer.h"
#include "sound.h"
#include "Map.h"
#include "Game.h"
#include "Player.h"
#include "Camera.h"
#include "Light.h"
#include "Bg.h"
#include "Block.h"

#include "Object3D.h"
#include "sky_bg.h"

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
	CSound::GetInstance()->Play(CSound::ELabel::LABEL_BGM_TITLE);

	// �w�i
	CSkyBg::Create();

	// �n��
	{
		CObject3D* pori = CObject3D::Create(D3DXVECTOR3(0.0f, -200.0f, 0.0f), D3DXVECTOR3(5000.0f, 0.0f, 5000.0f), 2);
		pori->SetUV(0.0f, 20.0f, 0.0f, 20.0f);
		pori->SetTextureKey("FLOOR");
	}

	{
		CObjectX* object = CObjectX::Create();
		object->BindModel(CObjectXOriginalList::GetInstance()->GetModelData("ENVIRONMENT_FUTURE1"));
		object->SetPos(D3DXVECTOR3(-120.0f, -200.0f, 2500.0f));
	}
	{
		CObjectX* object = CObjectX::Create();
		object->BindModel(CObjectXOriginalList::GetInstance()->GetModelData("ENVIRONMENT_FUTURE5"));
		object->SetPos(D3DXVECTOR3(-1520.0f, -200.0f, 2000.0f));
	}

	{
		CObjectX* object = CObjectX::Create();
		object->BindModel(CObjectXOriginalList::GetInstance()->GetModelData("ELEVATEDLINE_FC"));
		object->SetPos(D3DXVECTOR3(120.0f, -200.0f, 1800.0f));
	}

	{
		CObjectX* object = CObjectX::Create();
		object->BindModel(CObjectXOriginalList::GetInstance()->GetModelData("TOWERHIGH"));
		object->SetPos(D3DXVECTOR3(710.0f, -200.0f, 1550.0f));
	}

	{
		CObjectX* object = CObjectX::Create();
		object->BindModel(CObjectXOriginalList::GetInstance()->GetModelData("AIRSHIP"));
		object->SetPos(D3DXVECTOR3(-720.0f, -200.0f, 1650.0f));
		object->SetRot(D3DXVECTOR3(0.0f, D3DX_PI * 0.5f, 0.0f));
	}

	//�J�����̐ݒ�
	m_pCamera = CCamera::Create();
	m_pCamera->SetPosV(D3DXVECTOR3(0.0f, 24.0f, -200.0f));
	m_pCamera->SetPosR(D3DXVECTOR3(0.0f, 20.0f, 0.0f));

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

		SetUpSelectUI(nCnt);
	}

	return S_OK;
}

//====================================
//�I��
//====================================
void CSkillSelect::Uninit()
{
	CSound::GetInstance()->Stop();

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
	m_pCamera->Update();
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

	//�C���v�b�g�̏����擾
	CInput* pInput = CInput::GetKey();

	if (pInput->Trigger(DIK_BACKSPACE))
	{
		CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_MAP);
	}
}

//====================================
//�`��
//====================================
void CSkillSelect::Draw()
{
	m_pCamera->Set();
}

void CSkillSelect::SetUpSelectUI(int inPlayerCnt)
{
	float x = 200.0f + (300.0f * inPlayerCnt);
	m_pObj2D[inPlayerCnt] = CObject2D::Create(D3DXVECTOR3(x, 600.0f, 0.0f), D3DXVECTOR2(150.0f, 80.0f), 5);
	m_pObj2D[inPlayerCnt]->SetTextureKey("ADD_PLAY");

	// �I�����Ղ��悤�ɖ��
	{
		m_pSelectArrow[inPlayerCnt][0][1] = CObject2D::Create(D3DXVECTOR3(x - 150.0f * 0.5f - 45.0f - 1.0f, 300.0f, 0.0f), D3DXVECTOR2(40.0f, 40.0f), 5);
		m_pSelectArrow[inPlayerCnt][0][1]->SetTextureKey("SERECT_LEFT");
		m_pSelectArrow[inPlayerCnt][0][1]->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 0.0f));
		m_pSelectArrow[inPlayerCnt][1][1] = CObject2D::Create(D3DXVECTOR3(x + 150.0f * 0.5f + 45.0f + 1.0f, 300.0f, 0.0f), D3DXVECTOR2(40.0f, 40.0f), 5);
		m_pSelectArrow[inPlayerCnt][1][1]->SetTextureKey("SERECT_RIGHT");
		m_pSelectArrow[inPlayerCnt][1][1]->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 0.0f));

		m_pSelectArrow[inPlayerCnt][0][0] = CObject2D::Create(D3DXVECTOR3(x - 150.0f * 0.5f - 45.0f, 300.0f, 0.0f), D3DXVECTOR2(30.0f, 30.0f), 5);
		m_pSelectArrow[inPlayerCnt][0][0]->SetTextureKey("SERECT_LEFT");
		m_pSelectArrow[inPlayerCnt][0][0]->SetCol(D3DXCOLOR(0.0f, 0.0f, 1.0f, 0.0f));
		m_pSelectArrow[inPlayerCnt][1][0] = CObject2D::Create(D3DXVECTOR3(x + 150.0f * 0.5f + 45.0f, 300.0f, 0.0f), D3DXVECTOR2(30.0f, 30.0f), 5);
		m_pSelectArrow[inPlayerCnt][1][0]->SetTextureKey("SERECT_RIGHT");
		m_pSelectArrow[inPlayerCnt][1][0]->SetCol(D3DXCOLOR(0.0f, 0.0f, 1.0f, 0.0f));
	}

	// 3D���f���̐ݒu
	{
		CBlock* block = CBlock::Create(D3DXVECTOR3(-(65.0f * 1.5f) + (65.0f * inPlayerCnt), -5.0f, 0.0f));
		block->CancelPermitSink();
		block->OnUpDownMove();
		m_pPlayer[inPlayerCnt] = CPlayer::Create(block, D3DXVECTOR3(0.0f, 0.0f, 0.0f));
	}

	CObject3D* object = CObject3D::Create(D3DXVECTOR3(-(65.0f * 1.5f) + (65.0f * inPlayerCnt), 20.0f, 5.0f),D3DXVECTOR3(50.0f,0.0f,140.0),2);
	object->SetRot(D3DXVECTOR3(-1.57f, 0.0f, 0.0f));
	object->SetCol(D3DXCOLOR(0.2f, 0.2f, 0.2f, 0.75f));
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
			if (pInput->Trigger(JOYPAD_B))		//ENTER�L�[
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

		if (!m_isPlayerCheck[nCnt])
		{
			if (m_nSkill[nCnt] > 1)
			{//���[�ł͂Ȃ��Ȃ獶��
				if (pInput->Trigger(KEY_LEFT, m_inputNumber[nCnt]) && !m_isPlayerCheck[nCnt])
				{
					m_nSkill[nCnt]--;
				}
				m_pSelectArrow[nCnt][0][0]->SetColAlpha(1.0f);
				m_pSelectArrow[nCnt][0][1]->SetColAlpha(1.0f);
			}
			else
			{
				m_pSelectArrow[nCnt][0][0]->SetColAlpha(0.25f);
				m_pSelectArrow[nCnt][0][1]->SetColAlpha(0.25f);
			}

			if (m_nSkill[nCnt] < CPlayer::SKILL_MAX - 1)
			{//�E�[�ł͂Ȃ��Ȃ�E��
				if (pInput->Trigger(KEY_RIGHT, m_inputNumber[nCnt]) && !m_isPlayerCheck[nCnt])
				{
					m_nSkill[nCnt]++;
				}
				m_pSelectArrow[nCnt][1][0]->SetColAlpha(1.0f);
				m_pSelectArrow[nCnt][1][1]->SetColAlpha(1.0f);
			}
			else
			{
				m_pSelectArrow[nCnt][1][0]->SetColAlpha(0.25f);
				m_pSelectArrow[nCnt][1][1]->SetColAlpha(0.25f);
			}
		}

		if (m_inputNumber[nCnt] != -1 && !m_isPlayerCheck[nCnt] && pInput->Trigger(JOYPAD_B, m_inputNumber[nCnt]) || m_inputNumber[nCnt] == -1 && !m_isPlayerCheck[nCnt] && pInput->Trigger(DIK_RETURN, m_inputNumber[nCnt]))
		{//�p�b�h��B�{�^���Ō��肷��(�L�[�{�[�h��V)
			m_isPlayerCheck[nCnt] = true;
			m_pSelectArrow[nCnt][0][0]->SetColAlpha(0.0f);
			m_pSelectArrow[nCnt][1][0]->SetColAlpha(0.0f);
			m_pSelectArrow[nCnt][0][1]->SetColAlpha(0.0f);
			m_pSelectArrow[nCnt][1][1]->SetColAlpha(0.0f);
		}
		else if (m_inputNumber[nCnt] != -1 && m_isPlayerCheck[nCnt] &&  pInput->Trigger(JOYPAD_A, m_inputNumber[nCnt]) || m_inputNumber[nCnt] == -1 && m_isPlayerCheck[nCnt] && pInput->Trigger(DIK_B, m_inputNumber[nCnt]))
		{//�p�b�h��A�{�^���ŉ�������(�L�[�{�[�h��B)
			m_isPlayerCheck[nCnt] = false;
			m_pSelectArrow[nCnt][0][0]->SetColAlpha(1.0f);
			m_pSelectArrow[nCnt][1][0]->SetColAlpha(1.0f);
			m_pSelectArrow[nCnt][0][1]->SetColAlpha(1.0f);
			m_pSelectArrow[nCnt][1][1]->SetColAlpha(1.0f);
		}
	}

#ifdef _DEBUG
	CDebugProc::Print("\n�L�[�{�[�h��Enter�Ō���AB�ŉ���");
	CDebugProc::Print("\nPlayerCheck : %d %d %d %d", m_isPlayerCheck[0], m_isPlayerCheck[1], m_isPlayerCheck[2], m_isPlayerCheck[3]);
	CDebugProc::Print("\nm_nSkill : %d %d %d %d", m_nSkill[0], m_nSkill[1], m_nSkill[2], m_nSkill[3]);
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
		else
		{
			switch (m_nSkill[nCnt])
			{
			case CPlayer::SKILL_IDLE:
				break;
			case CPlayer::SKILL_RUSH:
				m_pObj2D[nCnt]->SetTextureKey("SKILL_ICON_PAWER");
				break;
			case CPlayer::SKILL_SPEED:
				m_pObj2D[nCnt]->SetTextureKey("SKILL_ICON_PEINT");
				break;
			case CPlayer::SKILL_BOM:
				m_pObj2D[nCnt]->SetTextureKey("SKILL_ICON_BOMB");
				break;
			case CPlayer::SKILL_WAVE:
				m_pObj2D[nCnt]->SetTextureKey("SKILL_ICON_SKILL11");
				break;
			case CPlayer::SKILL_MAX:
				break;
			default:
				break;
			}
		}
	}
}

//====================================
//�G���g���[
//====================================
void CSkillSelect::Entry()
{
	CInput* pInput = CInput::GetKey();
	std::vector<int> inputNumber = pInput->TriggerDevice(JOYPAD_B);

	for (size_t i = 0;i < inputNumber.size();i++)
	{
		if (std::find(m_inputNumber.begin(), m_inputNumber.end(), inputNumber[i]) == m_inputNumber.end())
		{
			for (size_t j = 0; j < m_inputNumber.size(); j++)
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

			if (m_isDecision[nCnt])
			{

				m_pSelectArrow[nCnt][0][0]->SetColAlpha(1.0f);
				m_pSelectArrow[nCnt][1][0]->SetColAlpha(1.0f);
				m_pSelectArrow[nCnt][0][1]->SetColAlpha(1.0f);
				m_pSelectArrow[nCnt][1][1]->SetColAlpha(1.0f);
			}
		}
	}

#ifdef _DEBUG
	CDebugProc::Print("\nNumber : %d %d %d %d", m_inputNumber[0], m_inputNumber[1], m_inputNumber[2], m_inputNumber[3]);
#endif // _DEBUG
}