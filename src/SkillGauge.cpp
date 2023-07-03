//======================================================
//
//skill_gage.cpp
//Author:����]��
//
//======================================================
#include "SkillGauge.h"
#include "texture.h"
#include "game.h"
#include "Player.h"

//======================================================
// ��`
//======================================================
const D3DXVECTOR2 CGauge::GAUGE_SIZE = D3DXVECTOR2(CGauge::MAX_SIZE / MAX_GAUGE, 50.0f);	//�Q�[�W����̑傫��
const float CGauge::MAX_SIZE = 250.0f;														//�Q�[�W�̍ő�l
const float CGauge::SPACE_SIZE = (SCREEN_WIDTH - (MAX_SIZE * 4.0f)) / 5.0f;					//�Q�[�W���m�̊Ԋu�̑傫��

//======================================================
//�R���X�g���N�^
//======================================================
CGauge::CGauge(int nPriority) : CObject2D(nPriority)
{
}

//======================================================
//�f�X�g���N�^
//======================================================
CGauge::~CGauge()
{//���������Ȃ�
}

//======================================================
//����������
//======================================================
HRESULT CGauge::Init(void)
{
	//����������
	CObject2D::Init();

	//�e�N�X�`���̐ݒ�
	CObject2D::SetTextureKey("SKILL_GAUGE");

	return S_OK;
}

//======================================================
//�I������
//======================================================
void CGauge::Uninit()
{
	//�I��
	CObject2D::Uninit();
}

//======================================================
//�X�V����
//======================================================
void CGauge::Update()
{
	//�v���C���[�̏��̎擾
	CPlayer * pPlayer = CGame::GetPlayer(m_nSkillNumber);

	//�傫���̐ݒ�
	SetSiz(GAUGE_SIZE);

	//�X�V����
	CObject2D::Update();

	if (pPlayer != nullptr)
	{//�v���C���[�̃X�L���Q�[�W������

		SetSkillPos(pPlayer->GetSkillGauge());
		float gaugeRatio =  pPlayer->GetSkillGauge() / MAX_GAUGE;
		SetUV(0.0f, gaugeRatio,0.0f, 1.0f);
	}
}

//======================================================
//�`�揈��
//======================================================
void CGauge::Draw()
{
	//�`�揈��
	CObject2D::Draw();
}

//======================================================
//��������
//======================================================
CGauge *CGauge::Create(const D3DXVECTOR3 pos, const D3DXVECTOR2 size, const D3DXCOLOR col, const int number)
{
	//���I�m��
	CGauge *pGauge = new CGauge;

	if (pGauge != nullptr)
	{
		//������
		pGauge->Init();
		pGauge->SetPos(pos);
		pGauge->SetSiz(size);
		pGauge->SetCol(col);
		pGauge->m_nSkillNumber = number;
	}

	return pGauge;
}