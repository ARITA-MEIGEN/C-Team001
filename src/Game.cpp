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
#include "countdown_ui.h"

#include "File.h"

//静的メンバ変数
CPlayer*CGame::m_pPlayer[MAX_PLAYER] = {};
CGame::GAME CGame::m_gamestate;
bool CGame::bDebugCamera = nullptr;

CCamera* CGame::m_pCamera = nullptr;
CLight* CGame::m_pLight = nullptr;
CTimer* CGame::m_pTimer = nullptr;
CCountDownUI* CGame::m_pCountDown = nullptr;
CUI* CGame::m_pUI = nullptr;
CMap* CGame::m_pMap = nullptr;

CStatusUI* CGame::m_apStatusUI[MAX_PLAYER] = {};

//====================================
// ステートマシンの宣言
//====================================
const CGame::UPDATE_FUNC CGame::m_InitFunc[] =
{
	static_cast<void(CGame::*)()>(&(Init_FadeNow)),
	static_cast<void(CGame::*)()>(&(Init_CountDown)),
	static_cast<void(CGame::*)()>(&(Init_GamePlay)),
	static_cast<void(CGame::*)()>(&(Init_GameEnd)),
	static_cast<void(CGame::*)()>(&(Init_GamePouse)),
};

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
		m_pPlayer[nCnt] = CPlayer::Create(spawnBlock, D3DXVECTOR3(0.0f, D3DX_PI * 0.5f, 0.0f));

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

	// 仮背景の設置
	{
		CObject3D* pori = CObject3D::Create(D3DXVECTOR3(0.0f, -50.0f, 0.0f), D3DXVECTOR3(5000.0f, 0.0f, 5000.0f), 2);
		pori->SetTextureKey("TEST_FLOOR");
	}

	// 更新のステート管理
	m_funcInit = m_InitFunc;
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

	// ステート処理
	assert((m_stateNow >= 0) && (m_stateNow < UPDATE_MAX));
	(this->*(m_funcInit[m_stateNow]))();	// 初期化処理
	(this->*(m_funcUpdate[m_stateNow]))();	// 更新処理

#ifdef _DEBUG
	// 遷移デバッグ
	CFade* fade = CApplication::getInstance()->GetFade();
	if (fade->GetFade() == CFade::FADE_NONE)
	{
		CInput* pInput = CInput::GetKey();

		if (pInput->Trigger(DIK_BACKSPACE))
		{
			fade->SetFade(CApplication::MODE_RESULT);
			m_pMap->Ranking();
		}
	}
#endif // !_DEBUG
}

//====================================
// フェード中に初期化
//====================================
void CGame::Init_FadeNow()
{
	if (m_isStateDirty)
	{
		return;
	}
	m_isStateDirty = true;
}

//====================================
// フェード中何も処理を通さない
//====================================
void CGame::Update_FadeNow()
{
	if (CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
	{
		SetUpdate(UPDATE_COUNTDOWN);
	}
}

//====================================
// カウントダウン前に初期化
//====================================
void CGame::Init_CountDown()
{
	if (m_isStateDirty)
	{
		return;
	}
	m_isStateDirty = true;

	m_pCountDown = CCountDownUI::Create(5);
}

//====================================
// カウントダウン中
//====================================
void CGame::Update_CountDown()
{
	m_pCountDown->Update();

	if (m_pCountDown->GetTimer() == 0)
	{
		// カウントダウンの終了
		if (m_pCountDown != nullptr)
		{
			m_pCountDown->Uninit();
			m_pCountDown = nullptr;
		}

		SetUpdate(UPDATE_GAME_PLAY);
	}
}

//====================================
// ゲーム開始前に初期化
//====================================
void CGame::Init_GamePlay()
{
	if (m_isStateDirty)
	{
		return;
	}
	m_isStateDirty = true;

	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{
		if (CSkillSelect::GetComputer(nCnt))
		{
			m_pPlayer[nCnt]->SetController(new CPlayerController(CSkillSelect::GetEntryInput(nCnt)));
		}
		else
		{
			m_pPlayer[nCnt]->SetController(new CComputerController);
		}
	}
}

//====================================
// ゲーム本編
//====================================
void CGame::Update_GamePlay()
{
	m_pMap->Update();

	m_pTimer->Update();

	/* ↓ステート切り替え↓ */

	// 制限時間が過ぎたら
	if (m_pTimer->GetTimer() <= 0)
	{
		SetUpdate(UPDATE_GAME_END);
	}

	// ポーズ用のbuttonを押したら
	if (CInput::GetKey()->Trigger(DIK_P))
	{
		SetUpdate(UPDATE_GAME_POUSE);
	}
}

//====================================
// ゲーム終了前に初期化
//====================================
void CGame::Init_GameEnd()
{
	if (m_isStateDirty)
	{
		return;
	}
	m_isStateDirty = true;
}


//====================================
// ゲームエンド時
//====================================
void CGame::Update_GameEnd()
{
	CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_RESULT);
	m_pMap->Ranking();
}

//====================================
// ゲームポーズ前に初期化
//====================================
void CGame::Init_GamePouse()
{
	if (m_isStateDirty)
	{
		return;
	}
	m_isStateDirty = true;

	CObjectList::GetInstance()->Pause(true);

	m_pouse_bg = nullptr;
	m_pouse_backButton = nullptr;
	m_pouse_exitButton = nullptr;
	m_pouse_replayButton = nullptr;
	m_pouse_bottonIndex = 0;

	{
		m_pouse_bg = CObject2D::Create(D3DXVECTOR3(SCREEN_WIDTH * 0.5f, SCREEN_HEIGHT * 0.5f, 0.0f), D3DXVECTOR2(SCREEN_WIDTH, SCREEN_HEIGHT), 6);
		m_pouse_bg->SetCol(D3DXCOLOR(0.0f, 0.0f, 0.0f, 0.75f));
		m_pouse_bg->AttachActivityAtPouse();
	}

	D3DXVECTOR3 buttonShiftPos(300.0f, 100.0f, 0.0f);

	{
		m_pouse_buttonBg = CObject2D::Create(D3DXVECTOR3(SCREEN_WIDTH * 0.5f, SCREEN_HEIGHT * 0.5f, 0.0f) + buttonShiftPos, D3DXVECTOR2(550.0f, 500.0f), 6);
		m_pouse_buttonBg->AttachActivityAtPouse();
	}
	{
		m_pouse_backButton = CObject2D::Create(D3DXVECTOR3(SCREEN_WIDTH * 0.5f, SCREEN_HEIGHT * 0.25f, 0.0f) + buttonShiftPos, D3DXVECTOR2(500.0f, 100.0f), 6);
		m_pouse_backButton->SetTextureKey("TEXT_BACK");
		m_pouse_backButton->AttachActivityAtPouse();
	}
	{
		m_pouse_exitButton = CObject2D::Create(D3DXVECTOR3(SCREEN_WIDTH * 0.5f, SCREEN_HEIGHT * 0.5f, 0.0f) + buttonShiftPos, D3DXVECTOR2(500.0f, 100.0f), 6);
		m_pouse_exitButton->SetTextureKey("TEXT_TITLE");
		m_pouse_exitButton->AttachActivityAtPouse();
	}
	{
		m_pouse_replayButton = CObject2D::Create(D3DXVECTOR3(SCREEN_WIDTH * 0.5f, SCREEN_HEIGHT * 0.75f, 0.0f) + buttonShiftPos, D3DXVECTOR2(500.0f, 100.0f), 6);
		m_pouse_replayButton->SetTextureKey("TEXT_RETRY");
		m_pouse_replayButton->AttachActivityAtPouse();
	}

}

//====================================
// ゲームポーズ時
//====================================
void CGame::Update_GamePouse()
{
	bool exit = false;

	// 上下移動で項目の選択
	if (CInput::GetKey()->Trigger(DIK_UP))
	{
		m_pouse_bottonIndex--;

		if (m_pouse_bottonIndex < 0)
		{
			m_pouse_bottonIndex = 2;
		}
	}
	if (CInput::GetKey()->Trigger(DIK_DOWN))
	{
		m_pouse_bottonIndex++;

		if (m_pouse_bottonIndex > 2)
		{
			m_pouse_bottonIndex = 0;
		}
	}

	// 選択してない項目のα値を下げる。
	if (m_pouse_bg != nullptr)
	{
		switch (m_pouse_bottonIndex)
		{
		case 0:
			m_pouse_backButton->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));
			m_pouse_exitButton->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 0.4f));
			m_pouse_replayButton->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 0.4f));
			break;
		case 1:
			m_pouse_backButton->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 0.4f));
			m_pouse_exitButton->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));
			m_pouse_replayButton->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 0.4f));
			break;
		case 2:
			m_pouse_backButton->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 0.4f));
			m_pouse_exitButton->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 0.4f));
			m_pouse_replayButton->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));
			break;
		default:
			break;
		}
	}

	// 項目の決定
	if (CInput::GetKey()->Trigger(DIK_RETURN))
	{
		exit = true;

		switch (m_pouse_bottonIndex)
		{
		case 0:
			SetUpdate(UPDATE_GAME_PLAY);
			break;
		case 1:
			CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_GAME);
			break;
		case 2:
			CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_TITLE);
			break;
		default:
			break;
		}
	}
	if (CInput::GetKey()->Trigger(DIK_P))
	{
		exit = true;
		SetUpdate(UPDATE_GAME_PLAY);
	}

	// 遷移する時に生成したものの破棄を行なう
	if (exit)
	{
		if (m_pouse_bg != nullptr)
		{
			m_pouse_bg->Release();
			m_pouse_bg = nullptr;
		}
		if (m_pouse_backButton != nullptr)
		{
			m_pouse_backButton->Release();
			m_pouse_backButton = nullptr;
		}
		if (m_pouse_exitButton != nullptr)
		{
			m_pouse_exitButton->Release();
			m_pouse_exitButton = nullptr;
		}
		if (m_pouse_replayButton != nullptr)
		{
			m_pouse_replayButton->Release();
			m_pouse_replayButton = nullptr;
		}
		if (m_pouse_buttonBg != nullptr)
		{
			m_pouse_buttonBg->Release();
			m_pouse_buttonBg = nullptr;
		}

		m_isStateDirty = true;
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
