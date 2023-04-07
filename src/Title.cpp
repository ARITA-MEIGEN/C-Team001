//=============================================================================
//
// オブジェクト
// Author : 有田明玄
//
//=============================================================================
//インクルード
#include"main.h"
#include"Title.h"
#include"Application.h"
#include"input.h"
#include"Fade.h"
#include"Object2D.h"
#include"renderer.h"
#include"sound.h"

//静的メンバ変数
CObject2D* CTitle::m_pBg = nullptr;

//====================================
//コンストラクタ
//====================================
CTitle::CTitle()
{
}

//====================================
//デストラクタ
//====================================
CTitle::~CTitle()
{

}

//====================================
//初期化
//====================================
HRESULT CTitle::Init()
{
	LPDIRECT3DDEVICE9 pDevice;
	pDevice = CApplication::getInstance()->GetRenderer()->GetDevice();

	//テクスチャの読み込み
	LPDIRECT3DTEXTURE9 tex = nullptr;

	//背景の生成
	m_pBg = new CObject2D(CObject::OBJTYPE_UI);
	m_pBg->Init();
	m_pBg->SetPos(D3DXVECTOR3(SCREEN_WIDTH * 0.5f, SCREEN_HEIGHT * 0.5f, 0.0f));
	m_pBg->SetSiz(D3DXVECTOR2(SCREEN_WIDTH, SCREEN_HEIGHT));
	m_pBg->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));

	m_pBg->SetTextureKey("LOGO_TITLE");

	return S_OK;
}

//====================================
//終了
//====================================
void CTitle::Uninit()
{
	CSound::GetInstance()->Stop();
}

//====================================
//更新
//====================================
void CTitle::Update()
{
	CInput* pInput = CInput::GetKey();

		//指定のキーが押されたかどうか
	if (CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
	{
		if (pInput->Trigger(KEY_ALL))
		{
			CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_GAME);
		}
	}
}

//====================================
//描画
//====================================
void CTitle::Draw()
{

}

//====================================
//背景の取得
//====================================
CObject2D* CTitle::GetBg()
{
	return m_pBg;
}