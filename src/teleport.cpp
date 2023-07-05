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
CTeleport::CTeleport(int priorty)
{
	m_number = 0;
	m_isStop = false;
	m_onPlayer = nullptr;
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
	CObjectX::Init();
	m_number = -1;

	return S_OK;
}

//=============================================================================
//�I��
//=============================================================================
void  CTeleport::Uninit()
{
	CObjectX::Uninit();
}

//=============================================================================
// �X�V
//=============================================================================
void  CTeleport::Update()
{
	CObjectX::Update();

	if (CGame::GetMap() != nullptr)
	{
		for (int i = 0; i < CGame::GetMap()->GetBlockCount(); i++)
		{
			CBlock* pBlock = CGame::GetMap()->GetBlock(i);
			CPlayer* pPlayer = pBlock->GetOnPlayer();

			if (pPlayer != nullptr && pBlock != nullptr)
			{
				if (pBlock->GetTeleport() && pBlock != this && pBlock->GetOnPlayer() && !pPlayer->GetTeleport())
				{//�e���|�[�^�[�u���b�N�Ƀe���|�[�g���Ă��Ȃ��v���C���[���������
					pPlayer->SetPos(this->GetPos());
					pPlayer->SetTeleport(true);
					pPlayer->SetMove(D3DXVECTOR3(0.0f,0.0f,0.0f));
				}
				if(!pBlock->GetTeleport() && pBlock->GetOnPlayer() && pPlayer->GetTeleport())
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
	CObjectX::Draw();
}

//=============================================================================
// ����
//=============================================================================
CTeleport* CTeleport::Create(D3DXVECTOR3 pos, int nNumber)
{
	CTeleport*pTeleport = new CTeleport(5);

	if (pTeleport != nullptr)
	{
		pTeleport->Init();
		pTeleport->BindModel(CObjectXOriginalList::GetInstance()->Load("BLOCK", "data/MODEL/box.x"));
		pTeleport->SetCol(D3DXCOLOR(1.0f,0.0f,1.0f,1.0f));
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
	if (m_isStop)
	{
		return;
	}

	m_number = number;
}