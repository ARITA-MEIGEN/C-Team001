//=============================================================================
//
// テレポートブロック生成
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
// コンストラクタ
//=============================================================================
CTeleport::CTeleport(int priorty)
{
	m_number = 0;
	m_isStop = false;
	m_onPlayer = nullptr;
}

//=============================================================================
// デストラクタ
//=============================================================================
CTeleport::~CTeleport()
{

}

//=============================================================================
// 初期化
//=============================================================================
HRESULT  CTeleport::Init()
{
	CObjectX::Init();
	m_number = -1;

	return S_OK;
}

//=============================================================================
//終了
//=============================================================================
void  CTeleport::Uninit()
{
	CObjectX::Uninit();
}

//=============================================================================
// 更新
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
				{//テレポーターブロックにテレポートしていないプレイヤーが乗ったら
					pPlayer->SetPos(this->GetPos());
					pPlayer->SetTeleport(true);
					pPlayer->SetMove(D3DXVECTOR3(0.0f,0.0f,0.0f));
				}
				if(!pBlock->GetTeleport() && pBlock->GetOnPlayer() && pPlayer->GetTeleport())
				{//普通のブロックにテレポートした後のプレイヤーが乗ったら
					pPlayer->SetTeleport(false);
				}
			}
		}
	}
}

//=============================================================================
// 描画
//=============================================================================
void  CTeleport::Draw()
{
	//デバイスの取得
	CObjectX::Draw();
}

//=============================================================================
// 生成
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
// プレイヤー設定
//=============================================================================
void CTeleport::TeleportPlayerNumber(int number)
{
	if (m_isStop)
	{
		return;
	}

	m_number = number;
}