//=============================================================================
//
// ブロック生成
// Author:arita meigen
//
//=============================================================================


//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include"Block.h"

//静的メンバ変数
//=============================================================================
// コンストラクタ
//=============================================================================
CBlock::CBlock(int priorty) :CObjectX(priorty)
{

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
}

//=============================================================================
// 描画
//=============================================================================
void  CBlock::Draw()
{
	//デバイスの取得
	CObjectX::Draw();
}

//=============================================================================
// 生成
//=============================================================================
CBlock* CBlock::Create(D3DXVECTOR3 pos, float lot)
{
	CBlock*pBlock;
	pBlock = new CBlock(5);
	if (pBlock != nullptr)
	{// ポリゴンの初期化処理
		pBlock->SetModel("data\MODEL\box.x");
		pBlock->Init();
		pBlock->SetPos(pos);
		pBlock->SetRot(D3DXVECTOR3(lot, D3DX_PI*-0.5f, D3DX_PI*0.5f));
	}
	return pBlock;
}
