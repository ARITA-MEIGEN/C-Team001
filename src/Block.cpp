//=============================================================================
//
// �u���b�N����
// Author:arita meigen
//
//=============================================================================


//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include "Block.h"
#include "Item.h"
#include "Player.h"

//-----------------------------------------------------------------------------
// �萔
//-----------------------------------------------------------------------------
const float CBlock::SINK_LIMIT = -10.0f;	// ���މ����l
const float CBlock::UP_POWER = 0.5f;		// ���񂾃u���b�N�����シ�鎞��
const float CBlock::DOWN_POWER = 1.25f;		// ���񂾃u���b�N�����シ�鎞��

//=============================================================================
// �R���X�g���N�^
//=============================================================================
CBlock::CBlock(int priorty) :
	CObjectX(priorty),
	m_isMovePermit(false),
	m_posPlan(0.0f,0.0f,0.0f),
	m_move(0.0f, 0.0f, 0.0f),
	m_isSinkPermit(false)
{
	m_number = 0;
	m_isStop = false;
	m_onItem = nullptr;
	m_onPlayer = nullptr;
}

//=============================================================================
// �f�X�g���N�^
//=============================================================================
CBlock::~CBlock()
{

}

//=============================================================================
// ������
//=============================================================================
HRESULT  CBlock::Init()
{
	CObjectX::Init();
	m_bTeleport = false;
	m_isSinkPermit = true;
	m_number = -1;

	return S_OK;
}

//=============================================================================
//�I��
//=============================================================================
void  CBlock::Uninit()
{
	CObjectX::Uninit();
}

//=============================================================================
// �X�V
//=============================================================================
void  CBlock::Update()
{
	CObjectX::Update();

	Move();

	if (m_onItem != nullptr)
	{
		if (m_onItem->GetLife() <= 0)
		{
			m_onItem->Release();
			m_onItem = nullptr;
		}
	}

	// �v���C���[������ĂȂ��Ȃ猳�̈ʒu�ɖ߂�
	if(m_isSinkPermit)
	{
		D3DXVECTOR3 pos = GetPos();
		if (0.0f > pos.y)
		{
			pos.y += UP_POWER;

			if (pos.y > 0.0f)
			{
				pos.y = 0.0f;
			}

			SetPos(pos);
		}

		if (0.0f < pos.y)
		{
			pos.y -= DOWN_POWER;

			if (pos.y < 0.0f)
			{
				pos.y = 0.0f;
			}

			SetPos(pos);
		}
	}
}

//=============================================================================
// ����
//=============================================================================
CBlock* CBlock::Create(D3DXVECTOR3 pos)
{
	CBlock*pBlock = new CBlock(5);

	if (pBlock != nullptr)
	{
		pBlock->Init();
		pBlock->BindModel(CObjectXOriginalList::GetInstance()->GetModelData("BOX"));
		pBlock->SetPos(pos);
		pBlock->SetRot(D3DXVECTOR3(0.0f, 0.0f, 0.0f));
	}
	return pBlock;
}

//=============================================================================
// �v���C���[�ݒ�
//=============================================================================
void CBlock::SetPlayerNumber(int number)
{
	if (m_isStop || m_bTeleport)
	{
		return;
	}

	m_number = number;

	switch (m_number)
	{
	case -1:
		SetCol(D3DXCOLOR(0.0f, 0.0f, 0.0f, 1.0f));
		break;
	case 0:
		SetCol(D3DXCOLOR(1.0f, 0.0f, 0.0f, 1.0f));
		break;
	case 1:
		SetCol(D3DXCOLOR(0.0f, 0.0f, 1.0f, 1.0f));
		break;
	case 2:
		SetCol(D3DXCOLOR(0.55f, 0.55f, 0.0f, 1.0f));
		break;
	case 3:
		SetCol(D3DXCOLOR(0.0f, 1.0f, 0.0f, 1.0f));
		break;
	default:
		break;
	}
}

//=============================================================================
// ����
//=============================================================================
void CBlock::SetSink(float power)
{
	D3DXVECTOR3 pos = GetPos();
	pos.y -= power;

	if (SINK_LIMIT >= pos.y)
	{
		pos.y = SINK_LIMIT;
		return;
	}

	SetPos(pos);
}

//=============================================================================
// �ړ����o
//=============================================================================
void CBlock::SetPlanPos(D3DXVECTOR3 inPos)
{
	m_isMovePermit = true;
	m_posPlan = inPos;
	D3DXVECTOR3 pos = GetPos();

	D3DXVECTOR3 moveVec = m_posPlan - pos;

	m_move = moveVec * 0.0175f;
}

//=============================================================================
// �ړ�
//=============================================================================
void CBlock::Move()
{
	if (!m_isMovePermit)
	{
		return;
	}

	AddPos(m_move);

	D3DXVECTOR3 pos = GetPos();
	pos -= m_posPlan;

	float length = D3DXVec3Length(&pos);

	if (length >= -10.0f && length <= 10.0f)
	{ // �ڕW�n�_�̓���
		SetPos(m_posPlan);
		m_move = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
		m_isMovePermit = false;
	}

	if (m_onPlayer != nullptr)
	{
		m_onPlayer->SetPos(GetPos());
	}
}

//=============================================================================
// �A�C�e������������
//=============================================================================
void CBlock::DeleteItem(void)
{
	if (m_onItem != nullptr)
	{
		m_onItem->Uninit();
		m_onItem = nullptr;
	}
}