//=============================================================================
//
// オブジェクト
// Author : 有田明玄
//
//=============================================================================
//インクルード
#include"main.h"
#include"Application.h"
#include"Game.h"
#include"Player.h"
#include"Player.h"
#include"Mesh.h"
#include"CameraGame.h"
#include"Light.h"
#include"Shadow.h"
#include"Fade.h"
#include"sound.h"
#include"input.h"
#include"effect.h"
#include"Time.h"
#include"Map.h"
#include"Item_Speed.h"
#include"SkillGauge.h"

//静的メンバ変数
CPlayer*CGame::m_pPlayer[MAX_PLAYER] = {};
CGame::GAME CGame::m_gamestate;
bool CGame::bDebugCamera = nullptr;

CCamera* CGame::m_pCamera = nullptr;
CLight* CGame::m_pLight = nullptr;
CFloor* CGame::m_pFloor = nullptr;
CTimer* CGame::m_pTimer = nullptr;
CUI* CGame::m_pUI = nullptr;
CMap* CGame::m_pMap = nullptr;

//====================================
//コンストラクタ
//====================================
CGame::CGame()
{
}

//====================================
//デストラクタ
//====================================
CGame::~CGame()
{

}

//====================================
//初期化
//====================================
HRESULT CGame::Init()
{
	//カメラの設定
	m_pCamera = CCameraGame::Create();

	//ライトの設定
	m_pLight = new CLight;
	m_pLight->Init();

	//プレイヤーの生成
	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{
		m_pPlayer[nCnt] = CPlayer::Create(D3DXVECTOR3(-100.0f + (nCnt * 50.0f), 0.0f, 0.0f), D3DXVECTOR3(0.0f, D3DX_PI * 0.5f, 0.0f));
	}

	//アイテムの生成
	CSpeed::Create(D3DXVECTOR3(0.0f, 50.0f, 0.0f), D3DXVECTOR3(50.0f, 0.0f, 50.0f), D3DXVECTOR3(-D3DX_PI * 0.5f, 0.0f, 0.0f), 300);
	
	//ブロック生成
	m_pMap = CMap::Create(0);

	//デバッグ用カメラ操作モード
	bDebugCamera = false;

	m_pTimer = CTimer::Create();
	m_Timer = 0;

	m_Round = ROUND_1;

	return S_OK;
}

//====================================
//終了
//====================================
void CGame::Uninit()
{
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
	
	if (m_pTimer != nullptr)
	{
		m_pTimer->Uninit();
		delete m_pTimer;
	}

	if (m_pMap != nullptr)
	{
		delete m_pMap;
	}

	CSound::GetInstance()->Stop();
}

//====================================
//更新
//====================================
void CGame::Update()
{
	m_pCamera->Update();
	m_pLight->Update();

	CInput* pInput = CInput::GetKey();
	if (CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
	{
		m_pTimer->Update();

#ifdef _DEBUG
		//指定のキーが押されたかどうか
		if (CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
		{
			if (pInput->Trigger(DIK_RETURN))
			{
				CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_RESULT);
				BlockCount();
			}
		}
#endif // !_DEBUG
	}
}

//====================================
//描画
//====================================
void CGame::Draw()
{
	m_pCamera->Set();
}

//====================================
//ラウンド移行時の処理
//====================================
void CGame::ResetGame()
{
	for (int i = 0; i < MAX_PLAYER; i++)
	{
		m_pPlayer[i]->Init();
		m_pPlayer[i]->SetPos(D3DXVECTOR3(-50.0f+(100.0f*i), 0.0f, 0.0f));
	}

	m_pTimer->Init();
	m_gamestate = GAME_START;
	m_Timer = 0;
	return;
}

//====================================
//勝敗判定(ブロック数のカウント)
//====================================
void CGame::BlockCount()
{
	int Score[4];
	int Rank[4];
	for (int i = 0; i < 4; i++)
	{
		Score[i] = m_pMap->GetCountBlockType(i);
	}

	//昇順に並び変える
	std::vector<int> rank = { Score[0], Score[1], Score[2],Score[3] };
	std::sort(rank.begin(), rank.end());
	for (int i = 0; i < 4; i++)
	{//並び変えたやつを代入
		for (int j = 0; j < 4; j++)
		{
			if (rank[i] == j)
			{//順位順にプレイヤー番号を並び変える
				Rank[i] = j;
			}
		}
	}
}
