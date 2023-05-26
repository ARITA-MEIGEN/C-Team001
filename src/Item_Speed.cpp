//======================================================
//
// item_speed.cpp
// Author : 髙野馨將
//
//======================================================
#include "Item_Speed.h"
#include "Texture.h"

//======================================================
// 定義
//======================================================
const int CSpeed::LIMIT_DISPLAY = 120;		//点滅を始める時間

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
	m_bDisplay = true;

	//テクスチャ設定
	CTexture::GetInstance()->SetTexture("TEXT_TITLE");

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
	//表示時間の取得
	int nLife = GetLife();

	//表示時間の減算
	if (nLife >= 0)
	{
		nLife--;
	}

	if (nLife <= LIMIT_DISPLAY)
	{//表示時間が一定以下になったら点滅させる
		m_bDisplay = false;
	}

	//表示時間の設定
	SetLife(nLife);

	//更新
	CObject3D::Update();

	//if (nLife <= 0)
	//{//表示時間が0以下になったら消す
	//	Uninit();
	//}
}

//======================================================
//描画処理
//======================================================
void CSpeed::Draw(void)
{
	if (!m_bDisplay)
	{
		if (GetLife() % 10 <= 5)
		{//点滅させる
			//描画
			CObject3D::Draw();
		}
	}
	else
	{
		//描画
		CObject3D::Draw();
	}
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
		pSpeed->SetSiz(size);
		pSpeed->SetRot(rot);
		pSpeed->SetLife(nLife);
		pSpeed->SetEffect(SPEED);
	}

	return pSpeed;
}