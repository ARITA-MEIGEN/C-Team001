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
#include "SkillSelect.h"
#include "PlayerController.h"
#include "computerController.h"
#include"StatusUI.h"
#include "MapSelect.h"
#include "ObjectList.h"

#include "File.h"

//静的メンバ変数
CPlayer*CGame::m_pPlayer[MAX_PLAYER] = {};
CGame::GAME CGame::m_gamestate;
bool CGame::bDebugCamera = nullptr;

CCamera* CGame::m_pCamera = nullptr;
CLight* CGame::m_pLight = nullptr;
CFloor* CGame::m_pFloor = nullptr;
CTimer* CGame::m_pTimer = nullptr;
CTimer* CGame::m_pCountDown = nullptr;
CUI* CGame::m_pUI = nullptr;
CMap* CGame::m_pMap = nullptr;

CStatusUI* CGame::m_apStatusUI[MAX_PLAYER] = {};

//====================================
// ステートマシンの宣言
//====================================
const CGame::UPDATE_FUNC CGame::m_UpdateFunc[] =
{
	static_cast<void(CGame::*)()>(&(Update_FadeNow)),
	static_cast<void(CGame::*)()>(&(Update_CountDown)),
	static_cast<void(CGame::*)()>(&(Update_GamePlay)),
	static_cast<void(CGame::*)()>(&(Update_GameEnd)),
	static_cast<void(CGame::*)()>(&(Update_GamePouse)),
};

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

	//ブロック生成
	m_pMap = CMap::Create(CMapSelect::GetMapNumber());

	//プレイヤーの生成
	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{
		CBlock* spawnBlock = m_pMap->GetPlayerSpawnBlock(nCnt);
		m_pPlayer[nCnt] = CPlayer::Create(spawnBlock->GetPos(), D3DXVECTOR3(0.0f, D3DX_PI * 0.5f, 0.0f));

		//ステータス表示の生成
		D3DXVECTOR3 pos((CGauge::SPACE_SIZE * (nCnt + 1 + 1)) + (CGauge::MAX_SIZE * nCnt + 1), SCREEN_HEIGHT - (CGauge::GAUGE_SIZE.y * 0.5f) - 10.0f, 0.0f);
		m_apStatusUI[nCnt] = CStatusUI::Create(pos,nCnt);
	}
	
	//デバッグ用カメラ操作モード
	bDebugCamera = false;

	m_pTimer = CTimer::Create(60);
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

	{
		CObject3D* pori = CObject3D::Create(D3DXVECTOR3(0.0f, -50.0f, 0.0f), D3DXVECTOR3(5000.0f, 0.0f, 5000.0f), 2);
		pori->SetTextureKey("TEST_FLOOR");
	}

	m_funcUpdate = m_UpdateFunc;
	SetUpdate(UPDATE_FADENOW);

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

	// 更新処理
	assert((m_stateNow >= 0) && (m_stateNow < UPDATE_MAX));
	(this->*(m_funcUpdate[m_stateNow]))();

#ifdef _DEBUG

	// 遷移デバッグ
	{
		CFade* fade = CApplication::getInstance()->GetFade();
		if (fade->GetFade() == CFade::FADE_NONE)
		{
			CInput* pInput = CInput::GetKey();

			if (pInput->Trigger(DIK_RETURN))
			{
				fade->SetFade(CApplication::MODE_RESULT);
				m_pMap->Ranking();
			}
		}
	}
#endif // !_DEBUG
}

//====================================
// フェード中に初期化
//====================================
void CGame::Init_FadeNow()
{
	if (isDirty)
	{
		return;
	}
	isDirty = true;
}

//====================================
// カウントダウン前に初期化
//====================================
void CGame::Init_CountDown()
{
	if (isDirty)
	{
		return;
	}

	m_pCountDown = CTimer::Create(3);
	m_pCountDown->SetPos(D3DXVECTOR3(500.0f,500.0f,0.0f));
	isDirty = true;
}

//====================================
// ゲーム開始前に初期化
//====================================
void CGame::Init_GamePlay()
{
	if (isDirty)
	{
		return;
	}

	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{
		if (CSkillSelect::GetComputer(nCnt))
		{
			m_pPlayer[nCnt]->SetController(new CPlayerController(nCnt));
		}
		else
		{
			m_pPlayer[nCnt]->SetController(new CComputerController);
		}
	}

	isDirty = true;
}

//====================================
// ゲーム終了前に初期化
//====================================
void CGame::Init_GameEnd()
{
	if (isDirty)
	{
		return;
	}
	isDirty = true;
}

//====================================
// ゲームポーズ前に初期化
//====================================
void CGame::Init_GamePouse()
{
	if (isDirty)
	{
		return;
	}
	isDirty = true;

	CObjectList::GetInstance()->Pause(true);
}

//====================================
// フェード中何も処理を通さない
//====================================
void CGame::Update_FadeNow()
{
	Init_FadeNow();

	if (CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
	{
		SetUpdate(UPDATE_COUNTDOWN);
	}
}

//====================================
// カウントダウン中
//====================================
void CGame::Update_CountDown()
{
	Init_CountDown();

	m_pCountDown->Update();

	if (m_pCountDown->GetTimer() == 0)
	{
		// カウントダウンの終了
		if (m_pCountDown != nullptr)
		{
			m_pCountDown->Uninit();
			delete m_pCountDown;
			m_pCountDown = nullptr;
		}

		SetUpdate(UPDATE_GAME_PLAY);
	}
}

//====================================
// ゲーム本編
//====================================
void CGame::Update_GamePlay()
{
	Init_GamePlay();
	m_pMap->Update();

	m_pTimer->Update();

	if (m_pTimer->GetTimer() <= 0)
	{
		SetUpdate(UPDATE_GAME_END);
	}

	if (CInput::GetKey()->Trigger(DIK_5))
	{
		SetUpdate(UPDATE_GAME_POUSE);
	}
}

//====================================
// ゲームエンド時
//====================================
void CGame::Update_GameEnd()
{
	Init_GameEnd();
	CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_RESULT);
	m_pMap->Ranking();
}

//====================================
// ゲームポーズ時
//====================================
void CGame::Update_GamePouse()
{
	Init_GamePouse();

	if (CInput::GetKey()->Trigger(DIK_5))
	{
		SetUpdate(UPDATE_GAME_PLAY);
		isDirty = true;
		CObjectList::GetInstance()->Pause(false);
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
		m_pPlayer[i]->SetPos(D3DXVECTOR3(-50.0f + (100.0f*i), 0.0f, 0.0f));
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
