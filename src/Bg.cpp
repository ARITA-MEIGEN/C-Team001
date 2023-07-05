//================================================
//
//�w�i [Bg.cpp]
//Author : Kishimoto Eiji
//
//================================================
#include "Bg.h"
#include "Object2D.h"
#include "Application.h"
#include "texture.h"

//***************************
//�萔�̒�`
//***************************
namespace
{
const D3DXVECTOR2 SIZEUP_SPEED = D3DXVECTOR2(4.0f, 4.0f);	//�T�C�Y�����̃X�s�[�h
const D3DXVECTOR2 CIRCLE_SIZE = D3DXVECTOR2(30.0f, 30.0f);	//�T�[�N���̃T�C�Y
const float ALPHA_SPEED = 0.01f;	//���l�����̃X�s�[�h
}

//======================================================
//����
//======================================================
CBg *CBg::Create()
{
	CBg* pBg = nullptr;	//�|�C���^

	if (pBg != nullptr)
	{//NULL�`�F�b�N
		assert(false);
	}

	/* nullptr�̏ꍇ */

	pBg = new CBg;	//���I�m��

	pBg->Init();	//������

	return pBg;
}

//======================================================
//�R���X�g���N�^
//======================================================
CBg::CBg(int nPriority) : CObject(nPriority),
m_pBg(nullptr),
m_pCircle(nullptr),
m_bPop(false)
{
}

//======================================================
//�f�X�g���N�^
//======================================================
CBg::~CBg()
{
}

//======================================================
//������
//======================================================
HRESULT CBg::Init()
{
	{//�w�i
		//�����ɕK�v�ȗv�f
		D3DXVECTOR3 pos = D3DXVECTOR3(SCREEN_WIDTH * 0.5f, SCREEN_HEIGHT * 0.5f, 0.0f);
		D3DXVECTOR2 size = D3DXVECTOR2((float)SCREEN_WIDTH, (float)SCREEN_HEIGHT);

		//����
		m_pBg = CObject2D::Create(pos, size, 4);

		//�e�N�X�`���̐ݒ�
		m_pBg->SetTextureKey("SKILL_SELECT_BG");
	}

	{//�T�[�N��
		//�����ɕK�v�ȗv�f
		D3DXVECTOR3 pos = D3DXVECTOR3(
			(float)SCREEN_WIDTH * 0.5f,
			(float)SCREEN_HEIGHT * 0.5f,
			0.0f);

		//����
		m_pCircle = CObject2D::Create(pos, CIRCLE_SIZE, 4);

		//�e�N�X�`���̐ݒ�
		m_pCircle->SetTextureKey("CIRCLE");
	}

	//�����o�ϐ��̏�����
	m_bPop = true;

	return S_OK;
}

//======================================================
//�I��
//======================================================
void CBg::Uninit()
{
	//�w�i
	if (m_pBg != nullptr)
	{
		m_pBg->Uninit();
		m_pBg = nullptr;
	}

	//�T�[�N��
	if (m_pCircle != nullptr)
	{
		m_pCircle->Uninit();
		m_pCircle = nullptr;
	}
}

//======================================================
//�X�V
//======================================================
void CBg::Update()
{
	m_pBg->Update();	//�w�i

	if (m_bPop)
	{
		Circle_Pop();	//�o�����̃T�[�N��
	}
	else
	{
		Circle_Move();	//�ړ����̃T�[�N��
	}

	m_pCircle->Update();	//�T�[�N��
}

//======================================================
//�`��
//======================================================
void CBg::Draw()
{
	m_pBg->Draw();	//�w�i

	m_pCircle->Draw();	//�T�[�N��
}

//======================================================
//�o�����̃T�[�N��
//======================================================
void CBg::Circle_Pop()
{
	//���݂̃T�C�Y���擾
	D3DXVECTOR2 size = m_pCircle->GetSiz();

	//�T�C�Y��傫������
	size += SIZEUP_SPEED;

	//�T�C�Y�̐ݒ�
	m_pCircle->SetSiz(size);

	//���݂̐F���擾
	D3DXCOLOR col = m_pCircle->GetCol();

	if (col.a <= 0.0f)
	{
		//���l��0.0f�ɂ���
		col.a = 0.0f;

		//�F�̐ݒ�
		m_pCircle->SetCol(col);

		m_bPop = false;	//������
		return;
	}

	/* ���l��0.0f�ȉ��ł͂Ȃ��ꍇ */

	//���X�ɓ����ɂ���
	col.a -= ALPHA_SPEED;

	//�F�̐ݒ�
	m_pCircle->SetCol(col);
}

//======================================================
//�ړ����̃T�[�N��
//======================================================
void CBg::Circle_Move()
{
	//�����_��
	int nRandX = rand() % 7 + 3;
	int nRandY = rand() % 7 + 3;

	//�ʒu
	D3DXVECTOR3 pos = D3DXVECTOR3(
		SCREEN_WIDTH * (0.1f * nRandX),
		SCREEN_HEIGHT * (0.1f * nRandY),
		0.0f);

	//�ʒu��ݒ�
	m_pCircle->SetPos(pos);

	//�T�C�Y��ݒ�(0�ɂ���)
	m_pCircle->SetSiz(D3DXVECTOR2(0.0f, 0.0f));

	//�F��ݒ�(���l��1,0f�ɂ���)
	m_pCircle->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));

	//�o������
	m_bPop = true;
}