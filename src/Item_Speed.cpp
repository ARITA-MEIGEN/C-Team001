//======================================================
//
// item_speed.cpp
// Author : ����]��
//
//======================================================
#include "Item_Speed.h"
#include "Texture.h"

//======================================================
// ��`
//======================================================
const int CSpeed::LIMIT_DISPLAY = 120;		//�_�ł��n�߂鎞��

//======================================================
//�R���X�g���N�^
//======================================================
CSpeed::CSpeed(int nPriority) : CItem(nPriority)
{
}

//======================================================
//�f�X�g���N�^
//======================================================
CSpeed::~CSpeed()
{
}

//======================================================
//����������
//======================================================
HRESULT CSpeed::Init(void)
{
	//������
	CItem::Init();
	m_bDisplay = true;

	//�e�N�X�`���ݒ�
	CTexture::GetInstance()->SetTexture("TEXT_TITLE");

	return S_OK;
}

//======================================================
//�I������
//======================================================
void CSpeed::Uninit(void)
{
	//�I��
	CObject3D::Uninit();
}

//======================================================
//�X�V����
//======================================================
void CSpeed::Update(void)
{
	//�\�����Ԃ̎擾
	int nLife = GetLife();

	//�\�����Ԃ̌��Z
	if (nLife >= 0)
	{
		nLife--;
	}

	if (nLife <= LIMIT_DISPLAY)
	{//�\�����Ԃ����ȉ��ɂȂ�����_�ł�����
		m_bDisplay = false;
	}

	//�\�����Ԃ̐ݒ�
	SetLife(nLife);

	//�X�V
	CObject3D::Update();

	//if (nLife <= 0)
	//{//�\�����Ԃ�0�ȉ��ɂȂ��������
	//	Uninit();
	//}
}

//======================================================
//�`�揈��
//======================================================
void CSpeed::Draw(void)
{
	if (!m_bDisplay)
	{
		if (GetLife() % 10 <= 5)
		{//�_�ł�����
			//�`��
			CObject3D::Draw();
		}
	}
	else
	{
		//�`��
		CObject3D::Draw();
	}
}

//======================================================
//��������
//======================================================
CSpeed *CSpeed::Create(const D3DXVECTOR3 pos, const D3DXVECTOR3 size, const D3DXVECTOR3 rot, const int nLife)
{
	//���I�m��
	CSpeed *pSpeed = new CSpeed;

	if (pSpeed != nullptr)
	{
		//���̐ݒ�
		pSpeed->Init();
		pSpeed->SetPos(pos);
		pSpeed->SetSiz(size);
		pSpeed->SetRot(rot);
		pSpeed->SetLife(nLife);
		pSpeed->SetEffect(SPEED);
	}

	return pSpeed;
}