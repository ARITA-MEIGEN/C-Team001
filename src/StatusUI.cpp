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
// �萔
//======================================================
const D3DXVECTOR3 CStatusUI::GAUGE_LOCAL_POS	(-10.0f,0.0f,0.0f);
const D3DXVECTOR2 CStatusUI::GAUGE_SIZE			(0.0f,0.0f);

const D3DXVECTOR3 CStatusUI::CHARACTER_BG_LOCAL_POS	(-40.0f,-30.0f,0.0f);
const D3DXVECTOR2 CStatusUI::CHARACTER_BG_SIZE		(80.0f, 80.0f);

const D3DXVECTOR3 CStatusUI::SKILL_ICON_BG_LOCAL_POS	(0.0f,0.0f,0.0f);
const D3DXVECTOR2 CStatusUI::SKILL_ICON_BG_SIZE			(45.0f, 45.0f);

//======================================================
//����
//======================================================
CStatusUI *CStatusUI::Create(const D3DXVECTOR3& inPos,int nPlayerNum)
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
	pStatusUI->SetPos(inPos);

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
	
		//����
		m_pGauge = CGauge::Create(
			m_pos,
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
		D3DXVECTOR3 pos(0.0f, 0.0f, 0.0f);

		m_pCharaBg = CObject2D::Create(pos, CHARACTER_BG_SIZE, 4);	//����
		m_pCharaBg->SetTextureKey("CHARACTER_BG");					//�e�N�X�`���̐ݒ�
	}

	{//�X�L���A�C�R���w�i
		//�����ɕK�v�ȗv�f
		D3DXVECTOR3 pos(0.0f, 0.0f, 0.0f);

		m_pSkillIconBg = CObject2D::Create(pos, SKILL_ICON_BG_SIZE, 4);	//����
		m_pSkillIconBg->SetTextureKey("SKILL_ICON_BG");					//�e�N�X�`���̐ݒ�
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
// �ʒu�ݒ�
//======================================================
void CStatusUI::SetPos(const D3DXVECTOR3 & inPos)
{
	m_pos = inPos;
	m_pGauge->SetPos(m_pos + GAUGE_LOCAL_POS);					//�X�L���Q�[�W
	m_pCharaBg->SetPos(m_pos + CHARACTER_BG_LOCAL_POS);			//�L�����N�^�[�w�i
	m_pSkillIconBg->SetPos(m_pos + SKILL_ICON_BG_LOCAL_POS);	//�X�L���A�C�R���w�i
}

//======================================================
//�v���C���[�ԍ��̐ݒ�
//======================================================
void CStatusUI::SetPlayerNum(int nPlayerNum)
{
	m_nPlayerNum = nPlayerNum;
}