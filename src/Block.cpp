//=============================================================================
//
// ブロック生成
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
// 定数
//-----------------------------------------------------------------------------
const float CBlock::SINK_LIMIT = -10.0f;	// 沈む下限値
const float CBlock::UP_POWER = 0.5f;		// 沈んだブロックが浮上する時間
const float CBlock::DOWN_POWER = 1.25f;		// 沈んだブロックが浮上する時間

//=============================================================================
// コンストラクタ
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
// デストラクタ
//=============================================================================
CBlock::~CBlock()
{

}

//=============================================================================
// 初期化
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
//終了
//=============================================================================
void  CBlock::Uninit()
{
	CObjectX::Uninit();
}

//=============================================================================
// 更新
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

	// プレイヤーが乗ってないなら元の位置に戻る
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
// 生成
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
// プレイヤー設定
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
// 沈む
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
// 移動演出
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
// 移動
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
	{ // 目標地点の到着
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
// アイテムを消す処理
//=============================================================================
void CBlock::DeleteItem(void)
{
	if (m_onItem != nullptr)
	{
		m_onItem->Uninit();
		m_onItem = nullptr;
	}
}