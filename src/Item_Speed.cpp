//======================================================
//
// item_speed.cpp
// Author : 髙野馨將
//
//======================================================
#include "Item_Speed.h"
#include "Texture.h"

//======================================================
//コンストラクタ
//======================================================
CSpeed::CSpeed(int nPriority) : CItem(nPriority)
{
}

//======================================================
//デストラクタ
//======================================================
CSpeed::~CSpeed()
{
}

//======================================================
//初期化処理
//======================================================
HRESULT CSpeed::Init(void)
{
	//初期化
	CItem::Init();

	//テクスチャ設定
	SetTextureKey("SPEED_UP_ITEM_ICON");

	return S_OK;
}

//======================================================
//終了処理
//======================================================
void CSpeed::Uninit(void)
{
	//終了
	CObject3D::Uninit();
}

//======================================================
//更新処理
//======================================================
void CSpeed::Update(void)
{
	//更新
	CItem::Update();
}

//======================================================
//生成処理
//======================================================
CSpeed *CSpeed::Create(const D3DXVECTOR3 pos, const D3DXVECTOR3 size, const D3DXVECTOR3 rot, const int nLife)
{
	//動的確保
	CSpeed *pSpeed = new CSpeed;

	if (pSpeed != nullptr)
	{
		//情報の設定
		pSpeed->Init();
		pSpeed->SetPos(pos);
		pSpeed->SetSizePlan(size);
		pSpeed->SetRot(rot);
		pSpeed->SetLife(nLife);
		pSpeed->SetEffect(SPEED);
	}

	return pSpeed;
}