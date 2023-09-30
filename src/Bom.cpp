//======================================================
//
// bom.cpp
// Author : ����]��
//
//======================================================
#include "Bom.h"
#include "Block.h"
#include "Game.h"
#include "Map.h"

//======================================================
//�R���X�g���N�^
//======================================================
CCreateBom::CCreateBom(int nPriority) : CObjectX(nPriority)
{
}

//======================================================
//�f�X�g���N�^
//======================================================
CCreateBom::~CCreateBom()
{
}

//======================================================
//����������
//======================================================
HRESULT CCreateBom::Init(void)
{
	//������
	CObjectX::Init();
	
	SetSizeMag(D3DXVECTOR3(1.5f,1.5f,1.5f));

	return S_OK;
}

//======================================================
//�I������
//======================================================
void CCreateBom::Uninit(void)
{
	CObjectX::Uninit();
}

//======================================================
//�X�V����
//======================================================
void CCreateBom::Update(void)
{
	//�X�V
	CObjectX::Update();

	//�����܂ł̎��Ԃ̌��Z
	if (m_nLife > 0)
	{
		m_nLife--;
	}

	if (m_nLife <= 0)
	{//����������
		Explosion();
		Uninit();
	}
}

//======================================================
//���e��������
//======================================================
CCreateBom *CCreateBom::Create(CBlock *pOnBlock, D3DXVECTOR3 pos, int nPlayerNumber, int nLife)
{
	//���I�m��
	CCreateBom *pBom = new CCreateBom;

	if (pBom != nullptr)
	{
		//���̐ݒ�
		pBom->Init();
		pBom->BindModel(CObjectXOriginalList::GetInstance()->GetModelData("BOM"));
		pBom->SetPos(pos);
		pBom->AddPos(D3DXVECTOR3(0.0f,20.0f,0.0f));
		pBom->m_nLife = nLife;
		pBom->m_nPlayerNumber = nPlayerNumber;
		pBom->m_pOnBlock = pOnBlock;
	}

	return pBom;
}

//======================================================
//��������
//======================================================
void CCreateBom::Explosion(void)
{
	D3DXVECTOR3 pos = GetPos();

	for (int i = 0; i < CGame::GetMap()->GetBlockCount(); i++)
	{
		CBlock* pBlock = CGame::GetMap()->GetBlock(i);

		if (pBlock == nullptr)
		{
			continue;
		}

		//3�~3�͈̔͂�h��
		for (int nCntY = 0; nCntY < 3; nCntY++)
		{
			for (int nCntX = 0; nCntX < 3; nCntX++)
			{
				//����Ă���u���b�N�̔ԍ����擾
				D3DXVECTOR2 BlockIdx = CGame::GetMap()->GetBlockIdx(m_pOnBlock);
				//�͈͓��̃u���b�N��h��
				BlockIdx = D3DXVECTOR2(BlockIdx.x - 1.0f, BlockIdx.y - 1.0f);			//����ɐݒ肷��
				D3DXVECTOR2 Idx = D3DXVECTOR2(BlockIdx.x + nCntX, BlockIdx.y + nCntY);
				CBlock* Block = CGame::GetMap()->GetBlock((int)Idx.x, (int)Idx.y);

				if (Block != nullptr)
				{//�u���b�N��h��
				 //Block->SetOnPlayer(this);	//�v���C���[��
					Block->SetPlayerNumber(m_nPlayerNumber);
				}
			}
		}
	}
}