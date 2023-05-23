//=============================================================================
//
// オブジェクト
// Author : 有田明玄
//
//=============================================================================
//インクルード
#include"main.h"
#include"Result.h"
#include"input.h"
#include"Fade.h"
#include"Application.h"
#include"renderer.h"
#include"sound.h"
#include"Map.h"

//静的メンバ変数
CObject2D*CResult::m_pBg = nullptr;
//====================================
//コンストラクタ
//====================================
CResult::CResult()
{
}

//====================================
//デストラクタ
//====================================
CResult::~CResult()
{

}

//====================================
//初期化
//====================================
HRESULT CResult::Init()
{
	LPDIRECT3DDEVICE9 pDevice;
	pDevice = CApplication::getInstance()->GetRenderer()->GetDevice();

	//テクスチャの読み込み
	LPDIRECT3DTEXTURE9 tex[3];

	//背景の生成
	m_pBg = new CObject2D(CObject::OBJTYPE_UI);
	m_pBg->Init();
	m_pBg->SetPos(D3DXVECTOR3((float)SCREEN_WIDTH / 2, (float)SCREEN_HEIGHT / 2, 0.0f));
	m_pBg->SetSiz(D3DXVECTOR2((float)SCREEN_WIDTH, (float)SCREEN_HEIGHT));
	m_pBg->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));

	std::string textureKey[4];
	textureKey[0] = "RESULET_000";
	textureKey[1] = "RESULET_001";
	textureKey[2] = "RESULET_002";
	textureKey[3] = "RESULET_003";

	m_pBg->SetTextureKey(textureKey[CApplication::getInstance()->GetWinner()]);

	for (int i = 0; i < MAX_PLAYER; i++)
	{
		int Ranking = CMap::GetRanking(i);	//
	}

	return S_OK;
}

//====================================
//終了
//====================================
void CResult::Uninit()
{
	CSound::GetInstance()->Stop();
}

//====================================
//更新
//====================================
void CResult::Update()
{
	CInput* pInput = CInput::GetKey();

	if (CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
	{
		if ((pInput->Trigger(KEY_ALL)) == true)		//ENTERキー
		{//エンターでランキングに
		 //モード設定
			CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_TITLE);
		}
	}
}

//====================================
//描画
//====================================
void CResult::Draw()
{

}
