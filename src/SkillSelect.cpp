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

//====================================
// �萔
//====================================
int CSkillSelect::m_nSkill[MAX_PLAYER] = {};

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
	//������
	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{
		m_nSkill[nCnt] = 1;
		m_pObj2D[nCnt] = CObject2D::Create(D3DXVECTOR3(200.0f + (300.0f * nCnt), 600.0f, 0.0f), D3DXVECTOR2(150.0f, 80.0f), 5);
	}

	//�w�i�̐���
	m_pBg = new CObject2D(CObject::OBJTYPE_MAP);
	m_pBg->Init();
	m_pBg->SetPos(D3DXVECTOR3(SCREEN_WIDTH * 0.5f, SCREEN_HEIGHT * 0.5f, 0.0f));
	m_pBg->SetSiz(D3DXVECTOR2((float)SCREEN_WIDTH, (float)SCREEN_HEIGHT));
	m_pBg->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));

	m_pBg->SetTextureKey("TEXT_TITLE");

	return S_OK;
}

//====================================
//�I��
//====================================
void CSkillSelect::Uninit()
{
	CSound::GetInstance()->Stop();
}

//====================================
//�X�V
//====================================
void CSkillSelect::Update()
{
	//���͏���
	Input();

	//�I������
	Select();
}

//====================================
//�`��
//====================================
void CSkillSelect::Draw()
{

}

//====================================
//����
//====================================
void CSkillSelect::Input()
{
	//�C���v�b�g�̏����擾
	CInput* pInput = CInput::GetKey();

	//�t�F�[�h���Ă��Ȃ����
	if (CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
	{
		//�����͂ō���I��
		for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
		{//�v���C���[���Ƃɕ�����
			if (m_nSkill[nCnt] >= 1)
			{//���[�ł͂Ȃ��Ȃ獶��
				if (pInput->Trigger(JOYPAD_LEFT, nCnt))
				{
					m_nSkill[nCnt]--;
				}
			}
		}

		//�E���͂ŉE��I��
		for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
		{//�v���C���[���Ƃɕ�����
			if (m_nSkill[nCnt] <= 2)
			{//�E�[�ł͂Ȃ��Ȃ�E��
				if (pInput->Trigger(JOYPAD_RIGHT, nCnt))
				{
					m_nSkill[nCnt]++;
				}
			}
		}

		if (pInput->Trigger(DIK_O))
		{//���ɓ���
			if (m_nSkill[0] >= 1)
			{//���[�ł͂Ȃ��Ȃ獶��
				m_nSkill[0]--;
			}
		}
		else if (pInput->Trigger(DIK_P))
		{//�E�ɓ���
			if (m_nSkill[0] <= 2)
			{//�E�[�ł͂Ȃ��Ȃ�E��
				m_nSkill[0]++;
			}
		}

		if ((pInput->Trigger(DIK_RETURN)) == true)		//ENTER�L�[
		{//�G���^�[�ŃQ�[����
		 //���[�h�ݒ�
			CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_GAME);
		}
	}
}

//====================================
//�I��
//====================================
void CSkillSelect::Select()
{
	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{
		if (m_nSkill[nCnt] == 0)
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