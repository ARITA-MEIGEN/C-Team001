//======================================================
//
// item_paint.cpp
// Author : ����]��
//
//======================================================
#include "Item_Paint.h"
#include "Texture.h"

//======================================================
//�R���X�g���N�^
//======================================================
CPaint::CPaint(int nPriority) : CItem(nPriority)
{
}

//======================================================
//�f�X�g���N�^
//======================================================
CPaint::~CPaint()
{
}

//======================================================
//����������
//======================================================
HRESULT CPaint::Init(void)
{
	//������
	CItem::Init();

	//�e�N�X�`���ݒ�
	SetTextureKey("PAINT_UP_ITEM_ICON");

	return S_OK;
}

//======================================================
//�X�V����
//======================================================
void CPaint::Update(void)
{
	//�X�V
	CItem::Update();
}

//======================================================
//��������
//======================================================
CPaint *CPaint::Create(const D3DXVECTOR3 pos, const D3DXVECTOR3 size, const D3DXVECTOR3 rot, const int nLife)
{
	//���I�m��
	CPaint *pPaint = new CPaint;

	if (pPaint != nullptr)
	{
		//���̐ݒ�
		pPaint->Init();
		pPaint->SetPos(pos);
		pPaint->SetSizePlan(size);
		pPaint->SetRot(rot);
		pPaint->SetLife(nLife);
		pPaint->SetEffect(PAINT);
	}

	return pPaint;
}