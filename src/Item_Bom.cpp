//======================================================
//
// item_bom.cpp
// Author : 髙野馨將
//
//======================================================
#include "Item_Bom.h"
#include "Texture.h"
#include "Block.h"
#include "Game.h"
#include "Map.h"

//======================================================
//コンストラクタ
//======================================================
CBom::CBom(int nPriority) : CItem(nPriority)
{
}

//======================================================
//デストラクタ
//======================================================
CBom::~CBom()
{
}

//======================================================
//初期化処理
//======================================================
HRESULT CBom::Init(void)
{
	//初期化
	CItem::Init();

	//テクスチャ設定
	if (!m_bExplosion)
	{
		SetTextureKey("SPEED_UP_ITEM_ICON");
	}
	else if (m_bExplosion)
	{//3Dモデルの生成
		
	}

	return S_OK;
}

//======================================================
//更新処理
//======================================================
void CBom::Update(void)
{
	//更新
	if (!m_bExplosion)
	{//アイテム状態
		CItem::Update();
	}
	else if(m_bExplosion)
	{//爆弾状態
		CObject3D::Update();

		//爆発までの時間の取得
		int nLife = GetLife();

		//爆発までの時間の減算
		if (nLife > 0)
		{
			nLife--;
		}

		//爆発までの時間
		SetLife(nLife);

		if (nLife <= 0)
		{//爆発させる
			Explosion();
			Uninit();
		}
	}
}

//======================================================
//アイテム生成処理
//======================================================
CBom *CBom::Create(const D3DXVECTOR3 pos, const int nLife)
{
	//動的確保
	CBom *pBom = new CBom;

	if (pBom != nullptr)
	{
		//情報の設定
		pBom->m_bExplosion = false;
		pBom->Init();
		pBom->SetPos(pos);
		pBom->SetEffect(BOM);
	}

	return pBom;
}

//======================================================
//爆弾生成処理
//======================================================
CBom *CBom::Create(CBlock *pOnBlock, int nPlayerNumber, const int nLife, const bool bExplosion)
{
	//動的確保
	CBom *pBom = new CBom;

	if (pBom != nullptr)
	{
		//情報の設定
		pBom->m_bExplosion = bExplosion;
		pBom->Init();
		pBom->SetLife(nLife);
		pBom->m_nPlayerNumber = nPlayerNumber;
		pBom->m_pOnBlock = pOnBlock;
	}

	return pBom;
}

//======================================================
//爆発処理
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

		//十字(横と縦)の範囲を塗る
		//縦の範囲
		for (int nCntY = 0; nCntY < 3; nCntY++)
		{
			//乗っているブロックの番号を取得
			D3DXVECTOR2 BlockIdx = CGame::GetMap()->GetBlockIdx(m_pOnBlock);
			//範囲内のブロックを塗る
			BlockIdx = D3DXVECTOR2(BlockIdx.x, BlockIdx.y - 1.0f);			//中心に設定する
			D3DXVECTOR2 Idx = D3DXVECTOR2(BlockIdx.x, BlockIdx.y + nCntY);
			CBlock* Block = CGame::GetMap()->GetBlock((int)Idx.x, (int)Idx.y);

			if (Block != nullptr)
			{//ブロックを塗る
				Block->SetPlayerNumber(m_nPlayerNumber);
			}
		}
		//横の範囲
		for (int nCntX = 0; nCntX < 3; nCntX++)
		{
			//乗っているブロックの番号を取得
			D3DXVECTOR2 BlockIdx = CGame::GetMap()->GetBlockIdx(m_pOnBlock);
			//範囲内のブロックを塗る
			BlockIdx = D3DXVECTOR2(BlockIdx.x - 1.0f, BlockIdx.y);			//中央左に設定する
			D3DXVECTOR2 Idx = D3DXVECTOR2(BlockIdx.x + nCntX, BlockIdx.y);
			CBlock* Block = CGame::GetMap()->GetBlock((int)Idx.x, (int)Idx.y);

			if (Block != nullptr)
			{//ブロックを塗る
				Block->SetPlayerNumber(m_nPlayerNumber);
			}
		}
	}
}