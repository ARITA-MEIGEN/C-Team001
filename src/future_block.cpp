//=============================================================================
//
// ブロック生成
// Author:arita meigen
//
//=============================================================================

//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include "future_block.h"
#include "Item.h"

//-----------------------------------------------------------------------------
// 定数
//-----------------------------------------------------------------------------
const float CFutureBlock::SINK_LIMIT = -10.0f;	// 沈む下限値
const float CFutureBlock::UP_POWER = 0.5f;		// 沈んだブロックが浮上する時間

//=============================================================================
// コンストラクタ
//=============================================================================
CFutureBlock::CFutureBlock(int priorty) :CObjectX(priorty)
{
	m_number = 0;
}

//=============================================================================
// デストラクタ
//=============================================================================
CFutureBlock::~CFutureBlock()
{

}

//=============================================================================
// 初期化
//=============================================================================
HRESULT  CFutureBlock::Init()
{
	CObjectX::Init();
	m_number = -1;

	return S_OK;
}

//=============================================================================
//終了
//=============================================================================
void  CFutureBlock::Uninit()
{
	CObjectX::Uninit();
}

//=============================================================================
// 更新
//=============================================================================
void  CFutureBlock::Update()
{
	CObjectX::Update();

	D3DXVECTOR3 sizeMag = GetSizeMag();
	sizeMag += D3DXVECTOR3(-0.15f,-0.05f,-0.15f);
	SetSizeMag(sizeMag);

	D3DXVECTOR3 pos = GetPos();
	pos.y += 2.0f;
	SetPos(pos);

	if (sizeMag.y <= 0.0f)
	{
		Uninit();
	}
}

//=============================================================================
// 生成
//=============================================================================
CFutureBlock* CFutureBlock::Create(D3DXVECTOR3 pos)
{
	CFutureBlock* pBlock = new CFutureBlock(5);

	if (pBlock != nullptr)
	{
		pBlock->Init();
		pBlock->BindModel(CObjectXOriginalList::GetInstance()->Load("BLOCK", "data/MODEL/box.x"));
		pBlock->SetPos(pos);
		pBlock->SetRot(D3DXVECTOR3(0.0f, 0.0f, 0.0f));
	}
	return pBlock;
}

//=============================================================================
// プレイヤー設定
//=============================================================================
void CFutureBlock::SetPlayerNumber(int number)
{
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
		SetCol(D3DXCOLOR(1.0f, 1.0f, 0.0f, 1.0f));
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
void CFutureBlock::SetSink(float power)
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
