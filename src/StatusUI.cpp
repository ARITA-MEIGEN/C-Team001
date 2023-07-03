//================================================
//
//�X�e�[�^�X�\�� [StatusUI.cpp]
//Author : Kishimoto Eiji
//
//================================================
#include "StatusUI.h"
#include "SkillGauge.h"
#include "texture.h"
#include "game.h"
#include "Player.h"

//======================================================
//����
//======================================================
CStatusUI *CStatusUI::Create(int nPlayerNum)
{
	CStatusUI* pStatusUI = nullptr;	//�|�C���^

	if (pStatusUI != nullptr)
	{//NULL�`�F�b�N
		assert(false);
	}

	/* nullptr�̏ꍇ */

	pStatusUI = new CStatusUI;	//���I�m��

	pStatusUI->SetPlayerNum(nPlayerNum);	//�v���C���[�ԍ��̐ݒ�

	pStatusUI->Init();	//������

	return pStatusUI;
}

//======================================================
//�R���X�g���N�^
//======================================================
CStatusUI::CStatusUI(int nPriority) :
	CObject(nPriority),
	m_pGauge(nullptr),
	m_pCharaBg(nullptr),
	m_pSkillIconBg(nullptr),
	m_nPlayerNum(0)
{
}

//======================================================
//�f�X�g���N�^
//======================================================
CStatusUI::~CStatusUI()
{
}

//======================================================
//������
//======================================================
HRESULT CStatusUI::Init()
{
	{//�Q�[�W
		//���W�̎Z�o(X:�Ԋu��1���̃Q�[�W�T�C�Y�𑫂��Ă���,Y:��ʂ̉��[�ɍ��킹�Ă���)
		D3DXVECTOR3 pos = D3DXVECTOR3(
			(CGauge::SPACE_SIZE * (m_nPlayerNum + 1 + 1)) + (CGauge::MAX_SIZE * m_nPlayerNum + 1),
			SCREEN_HEIGHT - (CGauge::GAUGE_SIZE.y * 0.5f),
			0.0f);

		//����
		m_pGauge = CGauge::Create(
			pos, 
			D3DXVECTOR2(0.0f, 0.0f),
			D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f),
			m_nPlayerNum);

		switch (m_nPlayerNum)
		{//�v���C���[�ԍ��ɉ������Q�[�W�̐F��ݒ�
		case 0:
			m_pGauge->SetCol(D3DXCOLOR(1.0f, 0.0f, 0.0f, 1.0f));	//��
			break;

		case 1:
			m_pGauge->SetCol(D3DXCOLOR(0.0f, 0.0f, 1.0f, 1.0f));	//��
			break;

		case 2:
			m_pGauge->SetCol(D3DXCOLOR(1.0f, 1.0f, 0.0f, 1.0f));	//��
			break;

		case 3:
			m_pGauge->SetCol(D3DXCOLOR(0.0f, 1.0f, 0.0f, 1.0f));	//��
			break;

		default:
			break;
		}
	}

	{//�L�����N�^�[�w�i
		//�����ɕK�v�ȗv�f
		D3DXVECTOR3 pos = m_pGauge->GetPos() + D3DXVECTOR3(-40.0f, 0.0f, 0.0f);
		D3DXVECTOR2 size = D3DXVECTOR2(80.0f, 80.0f);

		//����
		m_pCharaBg = CObject2D::Create(pos, size, 4);

		//�e�N�X�`���̐ݒ�
		m_pCharaBg->SetTextureKey("CHARACTER_BG");
	}

	{//�X�L���A�C�R���w�i
		//�����ɕK�v�ȗv�f
		D3DXVECTOR3 pos = m_pGauge->GetPos();
		D3DXVECTOR2 size = D3DXVECTOR2(45.0f, 45.0f);

		//����
		m_pSkillIconBg = CObject2D::Create(pos, size, 4);

		//�e�N�X�`���̐ݒ�
		m_pSkillIconBg->SetTextureKey("SKILL_ICON_BG");
	}

	return S_OK;
}

//======================================================
//�I��
//======================================================
void CStatusUI::Uninit()
{
	//�Q�[�W
	if (m_pGauge != nullptr)
	{
		m_pGauge->Uninit();
		m_pGauge = nullptr;
	}

	//�L�����N�^�[�w�i
	if (m_pCharaBg != nullptr)
	{
		m_pCharaBg->Uninit();
		m_pCharaBg = nullptr;
	}

	//�X�L���A�C�R���w�i
	if (m_pSkillIconBg != nullptr)
	{
		m_pSkillIconBg->Uninit();
		m_pSkillIconBg = nullptr;
	}
}

//======================================================
//�X�V
//======================================================
void CStatusUI::Update()
{
	m_pGauge->Update();	//�Q�[�W

	m_pCharaBg->Update();	//�L�����N�^�[�w�i

	m_pSkillIconBg->Update();	//�X�L���A�C�R���w�i
}

//======================================================
//�`��
//======================================================
void CStatusUI::Draw()
{
	m_pGauge->Draw();	//�Q�[�W

	m_pCharaBg->Draw();	//�L�����N�^�[�w�i

	m_pSkillIconBg->Draw();	//�X�L���A�C�R���w�i
}

//======================================================
//�v���C���[�ԍ��̐ݒ�
//======================================================
void CStatusUI::SetPlayerNum(int nPlayerNum)
{
	m_nPlayerNum = nPlayerNum;
}