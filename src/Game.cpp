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
#include"StatusUI.h"

#include "File.h"

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
CStatusUI* CGame::m_apStatusUI[MAX_PLAYER] = {};

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
	CObjectXOriginalList::GetInstance()->LoadAll();

	//カメラの設定
	m_pCamera = CCameraGame::Create();

	//ライトの設定
	m_pLight = new CLight;
	m_pLight->Init();

	//ブロック生成
	m_pMap = CMap::Create(0);

	//プレイヤーの生成
	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{
		CBlock* spawnBlock = m_pMap->GetPlayerSpawnBlock(nCnt);
		m_pPlayer[nCnt] = CPlayer::Create(spawnBlock->GetPos(), D3DXVECTOR3(0.0f, D3DX_PI * 0.5f, 0.0f));

		//ステータス表示の生成
		m_apStatusUI[nCnt] = CStatusUI::Create(nCnt);
	}
	
	//デバッグ用カメラ操作モード
	bDebugCamera = false;

	m_pTimer = CTimer::Create();
	m_Timer = 0;

	m_Round = ROUND_1;

	// 背景モデルの設置
	{
		nlohmann::json loadData = LoadJson("test.json");

		int loadDataSize = loadData["MODEL"].size();

		for (int i = 0; i < loadDataSize; i++)
		{
			std::string tag = loadData["MODEL"][i]["TAG"];
			D3DXVECTOR3 pos = { loadData["MODEL"][i]["POS"][0],loadData["MODEL"][i]["POS"][1] ,loadData["MODEL"][i]["POS"][2] };
			D3DXVECTOR3 rot = { loadData["MODEL"][i]["ROT"][0],loadData["MODEL"][i]["ROT"][1] ,loadData["MODEL"][i]["ROT"][2] };

			CObjectX* object = CObjectX::Create();
			CObjectXOriginalList* original = CObjectXOriginalList::GetInstance();
			object->BindModel(original->GetModelData(tag));
			object->SetModelTag(tag);
			object->SetPos(pos + D3DXVECTOR3(0.0f, -500.0f, 0.0f));
			object->SetRot(rot);
		}
	}

	return S_OK;
}

//====================================
//終了
//====================================
void CGame::Uninit()
{
	//カメラの終了
	if (m_pCamera != nullptr)
	{
		m_pCamera->Uninit();
		delete m_pCamera;
	}

	// ライトの終了
	if (m_pLight != nullptr)
	{
		m_pLight->Uninit();
		delete m_pLight;
	}
	
	// タイマーの終了
	if (m_pTimer != nullptr)
	{
		m_pTimer->Uninit();
		delete m_pTimer;
	}

	// マップの終了
	if (m_pMap != nullptr)
	{
		delete m_pMap;
	}

	for (int i = 0; i < MAX_PLAYER; i++)
	{//ステータス表示
		if (m_apStatusUI[i] == nullptr)
		{//NULLチェック
			continue;
		}

		/* nullptrではない場合 */

		m_apStatusUI[i] = nullptr;
	}

	// 音楽の停止
	CSound::GetInstance()->Stop();
}

//====================================
//更新
//====================================
void CGame::Update()
{
	m_pCamera->Update();
	m_pLight->Update();

	m_pMap->Update();

	for (int i = 0; i < MAX_PLAYER; i++)
	{//ステータス表示
		if (m_apStatusUI[i] == nullptr)
		{//NULLチェック
			continue;
		}

		/* nullptrではない場合 */

		m_apStatusUI[i]->Update();
	}

	CInput* pInput = CInput::GetKey();
	if (CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
	{
		m_pTimer->Update();

		if (m_pTimer->GetTimer() <= 0)
		{
			CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_RESULT);
			m_pMap->Ranking();
		}

#ifdef _DEBUG
		//指定のキーが押されたかどうか
		if (CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
		{
			if (pInput->Trigger(DIK_RETURN))
			{
				CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_RESULT);
				m_pMap->Ranking();
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

	for (int i = 0; i < MAX_PLAYER; i++)
	{//ステータス表示
		if (m_apStatusUI[i] == nullptr)
		{//NULLチェック
			continue;
		}

		/* nullptrではない場合 */

		m_apStatusUI[i]->Draw();
	}
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
	
}
