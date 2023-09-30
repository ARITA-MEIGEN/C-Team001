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
const float CBlock::UP_LIMIT = 100.0f;	// ���މ����l
const float CBlock::UP_POWER = 0.5f;		// ���񂾃u���b�N�����シ�鎞��
const float CBlock::DOWN_POWER = 1.25f;		// ���񂾃u���b�N�����シ�鎞��

//=============================================================================
// �R���X�g���N�^
//=============================================================================
CBlock::CBlock() :
	m_isMovePermit(false),
	m_posPlan(0.0f,0.0f,0.0f),
	m_move(0.0f, 0.0f, 0.0f),
	m_isSinkPermit(false)
{
	m_number = 0;
	n_countUpDown = 0;
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

	ModifyRot();

	UpDownMove();

	if (m_onItem != nullptr)
	{
		if (m_onItem->GetLife() <= 0)
		{
			m_onItem->Uninit();
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
	CBlock*pBlock = new CBlock;

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
	case -2:
		SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 0.8f));
		break;
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

	if (UP_LIMIT <= pos.y)
	{
		pos.y = UP_LIMIT;
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

	D3DXVECTOR3 moveLast = m_posPlan - pos;

	D3DXVECTOR3 moveVec;
	D3DXVec3Normalize(&moveVec, &moveLast);

	D3DXVECTOR3 rot(moveVec.z * 0.5f, 0.0f, moveVec.x * -0.5f);

	SetRot(rot);

	m_move = moveLast * 0.0175f;
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
		pos = GetPos();
		pos.y -= 5.0f;
		m_onPlayer->SetPos(pos);
	}
}

//=============================================================================
// �������C������
//=============================================================================
void CBlock::ModifyRot()
{
	if (D3DXVec3Length(&m_move) != 0.0f)
	{
		return;
	}

	D3DXVECTOR3 rot = GetRot();

	auto Modefy = [](const float inRot)
	{
		float angle = inRot;
		if (angle < 0.0f)
		{
			angle += 0.065f;
			if (angle > 0.0f)
			{
				angle = 0.0f;
			}
		}
		if (angle > 0.0f)
		{
			angle -= 0.065f;
			if (angle < 0.0f)
			{
				angle = 0.0f;
			}
		}
		return angle;
	};

	rot.x = Modefy(rot.x);
	rot.y = Modefy(rot.y);
	rot.z = Modefy(rot.z);

	SetRot(rot);
}

void CBlock::UpDownMove()
{
	if (!m_isMoveUpDown)
	{
		return;
	}

	m_isMovePermit = true;

	n_countUpDown++;

	if (n_countUpDown % 60 == 0)
	{
		n_countUpDown = 0;

		m_move.y *= -1.0f;

		if (m_move.y == 0.0f)
		{
			m_move.y = 0.02f;
		}
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