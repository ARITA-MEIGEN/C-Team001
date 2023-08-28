//=============================================================================
//
// �e���|�[�g�u���b�N����
// Author:takano keisuke
//
//=============================================================================

//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include "teleport.h"
#include "Item.h"
#include "Game.h"
#include "Map.h"
#include "Player.h"

//=============================================================================
// �R���X�g���N�^
//=============================================================================
CTeleport::CTeleport()
{
}

//=============================================================================
// �f�X�g���N�^
//=============================================================================
CTeleport::~CTeleport()
{

}

//=============================================================================
// ������
//=============================================================================
HRESULT  CTeleport::Init()
{
	CBlock::Init();

	return S_OK;
}

//=============================================================================
//�I��
//=============================================================================
void  CTeleport::Uninit()
{
	CBlock::Uninit();
}

//=============================================================================
// �X�V
//=============================================================================
void  CTeleport::Update()
{
	CBlock::Update();

	if (CGame::GetMap() != nullptr)
	{
		for (int i = 0; i < CGame::GetMap()->GetBlockCount(); i++)
		{
			CBlock* pBlock = CGame::GetMap()->GetBlock(i);
			CPlayer* pPlayer = pBlock->GetOnPlayer();

			if (pPlayer != nullptr && pBlock != nullptr)
			{
				if (pBlock->GetTeleport() && pBlock != this && pBlock->GetOnPlayer() && !pPlayer->GetTeleport() && this->GetOnPlayer() == nullptr)
				{//�e���|�[�^�[�u���b�N�Ƀe���|�[�g���Ă��Ȃ��v���C���[���������
					pPlayer->SetPos(this->GetPos());
					pPlayer->SetTeleport(true);
					pPlayer->SetMove(D3DXVECTOR3(0.0f, 0.0f, 0.0f));
				}
				
				if (!pBlock->GetTeleport() && pBlock->GetOnPlayer() && pPlayer->GetTeleport())
				{//���ʂ̃u���b�N�Ƀe���|�[�g������̃v���C���[���������
					pPlayer->SetTeleport(false);
				}
			}
		}
	}
}

//=============================================================================
// �`��
//=============================================================================
void  CTeleport::Draw()
{
	//�f�o�C�X�̎擾
	CBlock::Draw();
}

//=============================================================================
// ����
//=============================================================================
CTeleport* CTeleport::Create(D3DXVECTOR3 pos, int nNumber)
{
	CTeleport*pTeleport = new CTeleport();

	if (pTeleport != nullptr)
	{
		pTeleport->Init();
		pTeleport->BindModel(CObjectXOriginalList::GetInstance()->GetModelData("TELEPORT_BOX"));
		pTeleport->SetPos(pos);
		pTeleport->SetRot(D3DXVECTOR3(0.0f, 0.0f, 0.0f));
		pTeleport->m_nTeleportNmber = nNumber;
	}
	return pTeleport;
}

//=============================================================================
// �v���C���[�ݒ�
//=============================================================================
void CTeleport::TeleportPlayerNumber(int number)
{
	if (IsStop())
	{
		return;
	}

	SetNumber(number);
}