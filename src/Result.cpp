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
#include"Player.h"
#include"CameraGame.h"
#include"Light.h"

//-----------------------------------------------------------------------------
//静的変数宣言
//-----------------------------------------------------------------------------
const float CResult::RANK_WIDTH = 270.0f;	// ランキングの設置間隔
const float CResult::PLAYER_WIDTH = 120.0f;	// プレイヤーの設置間隔

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
	std::string textureKey[4];
	textureKey[0] = "RESULET_003";
	textureKey[1] = "RESULET_002";
	textureKey[2] = "RESULET_001";
	textureKey[3] = "RESULET_000";


	//カメラの設定
	m_pCamera = CCameraGame::Create();
	m_pCamera->SetPosV(D3DXVECTOR3(0.0f, 250.0f, -400.0f));
	m_pCamera->SetPosR(D3DXVECTOR3(0.0f,250.0f, 200.0f));

	//ライトの設定
	m_pLight = new CLight;
	m_pLight->Init();


	//背景の生成
	for (int i = 0; i < MAX_PLAYER; i++)
	{
		//ランキング
		m_apRank[i] = new CObject2D(CObject::OBJTYPE_UI);
		m_apRank[i]->Init();
		m_apRank[i]->SetSiz(D3DXVECTOR2((float)100, (float)50));
		m_apRank[i]->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 0.0f));
	
		//プレイヤー生成
		m_pPlayer[i] = CPlayer::Create({ -(PLAYER_WIDTH*1.5f) + (PLAYER_WIDTH * i),0.0f,0.0f }, D3DXVECTOR3(0.0f, D3DX_PI * 0.5f, 0.0f));

		//土台生成
		m_pCylinder[i]= CObjectX::Create();
		m_pCylinder[i]->BindModel(CObjectXOriginalList::GetInstance()->Load("ENTYU", "data/MODEL/entyu000.x"));
		m_pCylinder[i]->SetPos(D3DXVECTOR3{m_pPlayer[i]->GetPos().x,m_pPlayer[i]->GetPos().y - 250.0f,m_pPlayer[i]->GetPos().z });
	}

	for (int i = 0; i < MAX_PLAYER; i++)
	{//プレイヤーの番号から順位を獲得
		m_apRank[CMap::GetRanking(i)]->SetTextureKey(textureKey[i]);
	}

	return S_OK;
}

//====================================
//終了
//====================================
void CResult::Uninit()
{
	CSound::GetInstance()->Stop();
	//カメラの設定
	if (m_pCamera != nullptr)
	{
		m_pCamera->Uninit();
		delete m_pCamera;
	}

	//ライトの設定
	if (m_pLight != nullptr)
	{
		m_pLight->Uninit();
		delete m_pLight;
	}
}

//====================================
//更新
//====================================
void CResult::Update()
{
	CInput* pInput = CInput::GetKey();

	m_pCamera->Update();
	m_pLight->Update();

	if (CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
	{
		if ((pInput->Trigger(DIK_RETURN)) == true)		//ENTERキー
		{//エンターでランキングに
		 //モード設定
			CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_TITLE);
		}
	}


	for (int i = 0; i < MAX_PLAYER; i++)
	{
		if (m_pCylinder[i]->GetPos().y < CMap::GetRanking(i) * 20 - 150)
		{
			m_pCylinder[i]->SetPos(D3DXVECTOR3{ m_pCylinder[i]->GetPos().x, m_pCylinder[i]->GetPos().y + 1.0f , m_pCylinder[i]->GetPos().z });
			m_pPlayer[i]->SetPos({ m_pPlayer[i]->GetPos().x,  m_pCylinder[i]->GetPos().y + m_pCylinder[i]->GetSize().y ,m_pPlayer[i]->GetPos().z });

		}
		else
		{
			m_apRank[i]->SetPos(D3DXVECTOR3((float)SCREEN_WIDTH / 2 - (RANK_WIDTH * 1.5f) + RANK_WIDTH * i, (float)SCREEN_HEIGHT / 2- CMap::GetRanking(i) * 40.0f, 0.0f));
			m_apRank[i]->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));
		}
	}

}

//====================================
//描画
//====================================
void CResult::Draw()
{
	m_pCamera->Set();
}
