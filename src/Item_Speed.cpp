//======================================================
//
// item_speed.cpp
// Author : ����]��
//
//======================================================
#include "Item_Speed.h"
#include "Texture.h"

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

	//�e�N�X�`���ݒ�
	SetTextureKey("SPEED_UP_ITEM_ICON");

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
	//�X�V
	CItem::Update();
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
		pSpeed->SetSizePlan(size);
		pSpeed->SetRot(rot);
		pSpeed->SetLife(nLife);
		pSpeed->SetEffect(SPEED);
	}

	return pSpeed;
}