//======================================================
//
// item_bom.cpp
// Author : ����]��
//
//======================================================
#include "Item_Bom.h"
#include "Texture.h"
#include "Block.h"
#include "Game.h"
#include "Map.h"

//======================================================
//�R���X�g���N�^
//======================================================
CBom::CBom(int nPriority) : CItem(nPriority)
{
}

//======================================================
//�f�X�g���N�^
//======================================================
CBom::~CBom()
{
}

//======================================================
//����������
//======================================================
HRESULT CBom::Init(void)
{
	//������
	CItem::Init();

	//�e�N�X�`���ݒ�
	if (!m_bExplosion)
	{
		SetTextureKey("SPEED_UP_ITEM_ICON");
	}
	else if (m_bExplosion)
	{//3D���f���̐���
		
	}

	return S_OK;
}

//======================================================
//�X�V����
//======================================================
void CBom::Update(void)
{
	//�X�V
	if (!m_bExplosion)
	{//�A�C�e�����
		CItem::Update();
	}
	else if(m_bExplosion)
	{//���e���
		CObject3D::Update();

		//�����܂ł̎��Ԃ̎擾
		int nLife = GetLife();

		//�����܂ł̎��Ԃ̌��Z
		if (nLife > 0)
		{
			nLife--;
		}

		//�����܂ł̎���
		SetLife(nLife);

		if (nLife <= 0)
		{//����������
			Explosion();
			Uninit();
		}
	}
}

//======================================================
//�A�C�e����������
//======================================================
CBom *CBom::Create(const D3DXVECTOR3 pos, const int nLife)
{
	//���I�m��
	CBom *pBom = new CBom;

	if (pBom != nullptr)
	{
		//���̐ݒ�
		pBom->m_bExplosion = false;
		pBom->Init();
		pBom->SetPos(pos);
		pBom->SetEffect(BOM);
	}

	return pBom;
}

//======================================================
//���e��������
//======================================================
CBom *CBom::Create(CBlock *pOnBlock, int nPlayerNumber, const int nLife, const bool bExplosion)
{
	//���I�m��
	CBom *pBom = new CBom;

	if (pBom != nullptr)
	{
		//���̐ݒ�
		pBom->m_bExplosion = bExplosion;
		pBom->Init();
		pBom->SetLife(nLife);
		pBom->m_nPlayerNumber = nPlayerNumber;
		pBom->m_pOnBlock = pOnBlock;
	}

	return pBom;
}

//======================================================
//��������
//======================================================
void CBom::Explosion(void)
{
	D3DXVECTOR3 pos = GetPos();

	for (int i = 0; i < CGame::GetMap()->GetBlockCount(); i++)
	{
		CBlock* pBlock = CGame::GetMap()->GetBlock(i);

		if (pBlock == nullptr)
		{
			continue;
		}

		//�\��(���Əc)�͈̔͂�h��
		//�c�͈̔�
		for (int nCntY = 0; nCntY < 3; nCntY++)
		{
			//����Ă���u���b�N�̔ԍ����擾
			D3DXVECTOR2 BlockIdx = CGame::GetMap()->GetBlockIdx(m_pOnBlock);
			//�͈͓��̃u���b�N��h��
			BlockIdx = D3DXVECTOR2(BlockIdx.x, BlockIdx.y - 1.0f);			//���S�ɐݒ肷��
			D3DXVECTOR2 Idx = D3DXVECTOR2(BlockIdx.x, BlockIdx.y + nCntY);
			CBlock* Block = CGame::GetMap()->GetBlock((int)Idx.x, (int)Idx.y);

			if (Block != nullptr)
			{//�u���b�N��h��
				Block->SetPlayerNumber(m_nPlayerNumber);
			}
		}
		//���͈̔�
		for (int nCntX = 0; nCntX < 3; nCntX++)
		{
			//����Ă���u���b�N�̔ԍ����擾
			D3DXVECTOR2 BlockIdx = CGame::GetMap()->GetBlockIdx(m_pOnBlock);
			//�͈͓��̃u���b�N��h��
			BlockIdx = D3DXVECTOR2(BlockIdx.x - 1.0f, BlockIdx.y);			//�������ɐݒ肷��
			D3DXVECTOR2 Idx = D3DXVECTOR2(BlockIdx.x + nCntX, BlockIdx.y);
			CBlock* Block = CGame::GetMap()->GetBlock((int)Idx.x, (int)Idx.y);

			if (Block != nullptr)
			{//�u���b�N��h��
				Block->SetPlayerNumber(m_nPlayerNumber);
			}
		}
	}
}