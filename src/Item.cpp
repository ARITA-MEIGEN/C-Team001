//======================================================
//
// Item.cpp
// Author : ����]��
//
//======================================================
#include "Item.h"
#include "Texture.h"
#include "Application.h"
#include "renderer.h"
#include "ObjectX.h"

//======================================================
// ��`
//======================================================
const float CItem::BUFF_TIME = 300;		// �A�C�e���o�t�̌��ʎ���
const int CItem::LIMIT_DISPLAY = 120;	// �_�ł��n�߂鎞��

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
	OnBillboard();

	//������
	m_effect = NONE;
	m_nLife = 0;
	m_bDisplay = true;
	CObject3D::Init();

	m_box = CObjectX::Create();
	m_box->BindModel(CObjectXOriginalList::GetInstance()->GetModelData("ITEM_BOX"));

	SetSizePlan(D3DXVECTOR3(25.0f,0.0f, 25.0f));
	SetRot(D3DXVECTOR3(-D3DX_PI * 0.5f, 0.0f, 0.0f));
	SetLife(450);
	SetCol(D3DXCOLOR(0.0f,0.0f,0.0f,1.0f));

	return S_OK;
}

//======================================================
//�I������
//======================================================
void CItem::Uninit(void)
{
	//�I��
	CObject3D::Uninit();

	m_box->Uninit();
}

//======================================================
//�X�V����
//======================================================
void CItem::Update(void)
{
	m_box->SetPos(GetPos());
	m_box->AddRot(D3DXVECTOR3(0.01f,0.01f,0.01f));
	m_box->SetCol(D3DXCOLOR(1.0f,0.0f,0.0f,0.65f));

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
		m_box->SetCol(D3DXCOLOR(1.0f, 0.0f, 0.0f, 0.0f));
		if (GetLife() % 10 <= 5)
		{//�_�ł�����
		 //�`��
			m_box->SetCol(D3DXCOLOR(1.0f, 0.0f, 0.0f, 0.65f));
			CObject3D::Draw();
		}
	}
	else
	{
		//�`��
		CObject3D::Draw();
	}
}