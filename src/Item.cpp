//======================================================
//
// Item.cpp
// Author : ����]��
//
//======================================================
#include "Item.h"
#include "Texture.h"

//======================================================
// ��`
//======================================================
const float CItem::BUFF_TIME = 120;	//�A�C�e���o�t�̌��ʎ���
const int CItem::LIMIT_DISPLAY = 120;		//�_�ł��n�߂鎞��

//======================================================
//�R���X�g���N�^
//======================================================
CItem::CItem(int nPriority) : CObject3D(nPriority)
{
}

//======================================================
//�f�X�g���N�^
//======================================================
CItem::~CItem()
{
}

//======================================================
//����������
//======================================================
HRESULT CItem::Init(void)
{
	//������
	m_effect = NONE;
	m_nLife = 0;
	m_bDisplay = true;
	CObject3D::Init();

	return S_OK;
}

//======================================================
//�I������
//======================================================
void CItem::Uninit(void)
{
	//�I��
	CObject3D::Uninit();
}

//======================================================
//�X�V����
//======================================================
void CItem::Update(void)
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

	if (m_sizePlan.x > GetSiz().x)
	{
		D3DXVECTOR3 addSize = GetSiz() + D3DXVECTOR3(1.5f, 0.0f, 1.5f);

		if (addSize.x >= m_sizePlan.x)
		{
			addSize = m_sizePlan;
		}

		SetSiz(addSize);
	}

#if 1	// �㉺�ړ�
	D3DXVECTOR3 pos = GetPos();
	float add = sinf(nLife / 20.0f) * 0.25f;
	pos.y += add;

	SetPos(pos);
#endif // 0

#if 0	// ��]
	D3DXVECTOR3 rot = GetRot();
	rot.y += 0.01f;
	SetRot(rot);
#endif // 0


	//�X�V
	CObject3D::Update();
}

//======================================================
//�`�揈��
//======================================================
void CItem::Draw(void)
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
CItem *CItem::Create(const D3DXVECTOR3 pos, const D3DXVECTOR3 size, const D3DXVECTOR3 rot)
{
	//���I�m��
	CItem *pItem = new CItem;

	if (pItem != nullptr)
	{
		//���̐ݒ�
		pItem->Init();
		pItem->SetPos(pos);
		pItem->m_sizePlan = size;
		pItem->SetRot(rot);
	}

	return pItem;
}