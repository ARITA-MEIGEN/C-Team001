//=============================================================================
//
// スキル選択
// Author : 髙野馨將
//
//=============================================================================

//インクルード
#include"main.h"
#include"SkillSelect.h"
#include"input.h"
#include"Fade.h"
#include"Application.h"
#include"renderer.h"
#include"sound.h"
#include"Map.h"
#include"Player.h"
#include"CameraGame.h"
#include"Light.h"


//====================================
//コンストラクタ
//====================================
CSkillSelect::CSkillSelect()
{
}

//====================================
//デストラクタ
//====================================
CSkillSelect::~CSkillSelect()
{

}

//====================================
//初期化
//====================================
HRESULT CSkillSelect::Init()
{
	LPDIRECT3DDEVICE9 pDevice;
	pDevice = CApplication::getInstance()->GetRenderer()->GetDevice();
	//テクスチャの読み込み
	std::string textureKey[4];
	textureKey[0] = "RESULET_003";
	textureKey[1] = "RESULET_002";
	textureKey[2] = "RESULET_001";
	textureKey[3] = "RESULET_000";


	//カメラの設定
	m_pCamera = CCameraGame::Create();

	//ライトの設定
	m_pLight = new CLight;
	m_pLight->Init();


	////背景の生成
	//for (int i = 0; i < MAX_PLAYER; i++)
	//{
	//	m_apRank[i] = new CObject2D(CObject::OBJTYPE_UI);
	//	m_apRank[i]->Init();
	//	m_apRank[i]->SetPos(D3DXVECTOR3((float)SCREEN_WIDTH / 2 - 100 + 100 * i, (float)SCREEN_HEIGHT / 2, 0.0f));
	//	m_apRank[i]->SetSiz(D3DXVECTOR2((float)100, (float)50));
	//	m_apRank[i]->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));
	//}

	return S_OK;
}

//====================================
//終了
//====================================
void CSkillSelect::Uninit()
{
	CSound::GetInstance()->Stop();
}

//====================================
//更新
//====================================
void CSkillSelect::Update()
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
void CSkillSelect::Draw()
{

}
