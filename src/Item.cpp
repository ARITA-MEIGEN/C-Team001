//======================================================
//
// Item.cpp
// Author : ����]��
//
//======================================================
#include "Item.h"
#include "Texture.h"

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
	//�X�V
	CObject3D::Update();
}

//======================================================
//�`�揈��
//======================================================
void CItem::Draw(void)
{
	//�`��
	CObject3D::Draw();
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
		pItem->SetSiz(size);
		pItem->SetRot(rot);
	}

	return pItem;
}