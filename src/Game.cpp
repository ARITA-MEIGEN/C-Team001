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
#include"Floor.h"
#include"Player.h"
#include"Mesh.h"
#include"Camera.h"
#include"Light.h"
#include"Shadow.h"
#include"Fade.h"
#include"Life.h"
#include"sound.h"
#include"input.h"
#include"effect.h"
#include"Time.h"
#include"UI.h"

//静的メンバ変数
CPlayer*CGame::m_pPlayer[2] = {};
CLife*CGame::m_Life = nullptr;				//体力ゲージ
CGame::GAME CGame::m_gamestate;
bool CGame::bDebugCamera = nullptr;

CCamera*CGame::m_pCamera = nullptr;
CLight*CGame::m_pLight = nullptr;
CFloor*CGame::m_pFloor = nullptr;
CTimer*CGame::m_pTimer = nullptr;
CUI*CGame::m_pUI = nullptr;

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
	//テクスチャの読み込み
	CShadow::Load();
	CFloor::Load();
	CLife::Load();
	CEffect::Load();
	CTimer::Load();
	CShadow::Load();

	//プレイヤーの生成
	m_pPlayer[0] = CPlayer::Create(D3DXVECTOR3(-50.0f, 0.0f, 0.0f), D3DXVECTOR3(0.0f, -D3DX_PI*0.5f, 0.0f));
	m_pPlayer[1] = CPlayer::Create(D3DXVECTOR3(50.0f, 0.0f, 0.0f), D3DXVECTOR3(0.0f, D3DX_PI*0.5f, 0.0f));
	m_pPlayer[0]->SetEnemy(m_pPlayer[1]);
	m_pPlayer[1]->SetEnemy(m_pPlayer[0]);

	//体力ゲージ
	m_Life = CLife::Create();

	//カメラの設定
	m_pCamera = CCamera::Create();

	//ライトの設定
	m_pLight = new CLight;
	m_pLight->Init();

	//床
	CFloor::Create(D3DXVECTOR3(0.0f, 0.0f, 0.0f), D3DXVECTOR3(500.0f, 500.0f, 500.0f),D3DXVECTOR3(0.0f, D3DX_PI*0.5f, 0.0f));
	CFloor::Create(D3DXVECTOR3(200.0f, 0.0f, 0.0f), D3DXVECTOR3(500.0f, 500.0f, 500.0f), D3DXVECTOR3(0.0f, D3DX_PI*0.5f, 0.0f));
	CFloor::Create(D3DXVECTOR3(-200.0f, 0.0f, 0.0f), D3DXVECTOR3(500.0f, 500.0f, 500.0f), D3DXVECTOR3(0.0f, D3DX_PI*0.5f, 0.0f));

	//奥の壁
	CFloor::Create(D3DXVECTOR3(0.0f, 100.0f, 300.0f), D3DXVECTOR3(500.0f, 500.0f, 500.0f), D3DXVECTOR3(D3DX_PI*-0.5f,0.0f , 0.0f));	
	CFloor::Create(D3DXVECTOR3(200.0f, 100.0f, 300.0f), D3DXVECTOR3(500.0f, 500.0f, 500.0f), D3DXVECTOR3(D3DX_PI*-0.5f, 0.0f, 0.0f));
	CFloor::Create(D3DXVECTOR3(-200.0f, 100.0f, 300.0f), D3DXVECTOR3(500.0f, 500.0f, 500.0f), D3DXVECTOR3(D3DX_PI*-0.5f, 0.0f, 0.0f));

	//横の壁
	CFloor::Create(D3DXVECTOR3(STAGE_WIDTH, 100.0f, 0.0f), D3DXVECTOR3(500.0f, 500.0f, 500.0f), D3DXVECTOR3(D3DX_PI*-0.5f, D3DX_PI*0.5f, 0.0f));
	CFloor::Create(D3DXVECTOR3(-STAGE_WIDTH, 100.0f, 0.0f), D3DXVECTOR3(500.0f, 500.0f, 500.0f), D3DXVECTOR3(D3DX_PI*-0.5f, D3DX_PI*-0.5f, 0.0f));

	//デバッグ用カメラ操作モード
	bDebugCamera = false;

	CSound::GetInstance()->Play(CSound::LABEL_BGM_BATTLE001);

	m_pTimer = CTimer::Create();
	m_Timer = 0;

	//UI生成
	m_pUI = CUI::Create();

	m_Round = ROUND_1;

	return S_OK;
}

//====================================
//終了
//====================================
void CGame::Uninit()
{
	//テクスチャの破棄
	CShadow::Unload();
	CFloor::Unload();
	CLife::Unload();
	CEffect::Unload();
	CTimer::Unload();
	CShadow::Unload();

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

	if (m_Life != nullptr)
	{
		m_Life->Uninit();
		delete m_Life;
	}

	if (m_pUI != nullptr)
	{
		m_pUI->Uninit();
		delete m_pUI;
	}
	
	if (m_pTimer != nullptr)
	{
		m_pTimer->Uninit();
		delete m_pTimer;
	}

	CSound::GetInstance()->Stop();
}

//====================================
//更新
//====================================
void CGame::Update()
{
	CInput* pInput = CInput::GetKey();
	if (CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
	{
		m_pUI->Update();	//UI
		m_pTimer->Update();
		Damagejudge();

#ifdef _DEBUG
		//指定のキーが押されたかどうか
		if (CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
		{
			if (pInput->Trigger(DIK_RETURN))
			{
				CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_RESULT);
			}
		}
#endif // !_DEBUG
	}

	m_pCamera->Update();
	m_pLight->Update();
	m_Life->Update();
	GameJudge();
}

//====================================
//描画
//====================================
void CGame::Draw()
{
	m_pCamera->Set();
}

//====================================
//ダメージ判定
//====================================
void CGame::Damagejudge()
{
	//一回だけ通るようにする
	m_pPlayer[0]->SetDamage(m_pPlayer[0]->Damage());	//ダメージ判定
	m_pPlayer[1]->SetDamage(m_pPlayer[1]->Damage());	//ダメージ判定

	m_pPlayer[0]->DrawCollision();			//プレイヤー1の当たり判定表示
	m_pPlayer[1]->DrawCollision();			//プレイヤー2の当たり判定表示
	m_pPlayer[0]->TransDamageVector();		//プレイヤー1のダメージベクトル設定
	m_pPlayer[1]->TransDamageVector();		//プレイヤー2のダメージベクトル設定
	m_pPlayer[0]->TransDamageMotion();		//プレイヤー1のダメージモーション設定
	m_pPlayer[1]->TransDamageMotion();		//プレイヤー2のダメージモーション設定

	m_pPlayer[0]->Die();					//プレイヤー1死亡処理
	m_pPlayer[1]->Die();					//プレイヤー2死亡処理
	m_pPlayer[0]->MotionManager();			//プレイヤー1モーション再生
	m_pPlayer[1]->MotionManager();			//プレイヤー2モーション再生

	m_pPlayer[0]->SetDamage(false);			//ダメージ判定RESET
	m_pPlayer[1]->SetDamage(false);			//ダメージ判定RESET
}

//====================================
//勝敗判定
//====================================
void CGame::GameJudge()
{
	//終了条件
	for (int i = 0; i < MAX_PLAYER; i++)
	{//体力が0以下
		if (m_pPlayer[i]->GetNowMotion() == CPlayer::PM_DOWN)
		{
			if (m_pPlayer[i]->GetLife() <= 0 || m_pTimer->GetTimer() <= 0)
			{
				m_gamestate = GAME_END;
				break;
			}
		}
	}
	//時間切れ
	if (GetTimer()->GetTimer() <= 0)
	{
		m_gamestate = GAME_END;
	}

	//ラウンド終了条件を満たした場合画面遷移
	if (m_gamestate == GAME_END&&CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
	{
		if (m_Timer == 0)
		{//最初の一回のみ通る
			if (m_pPlayer[1]->GetLife() < m_pPlayer[0]->GetLife())
			{//プレイヤー1勝利
				CApplication::getInstance()->AddScore(0);
			}
			else if (m_pPlayer[0]->GetLife() < m_pPlayer[1]->GetLife())
			{//プレイヤー2勝利
				CApplication::getInstance()->AddScore(1);
			}
			else //引き分け
			{//両方のスコアを加算
				CApplication::getInstance()->AddScore(0);
				CApplication::getInstance()->AddScore(1);
			}
		}
		//タイマーが一定値以上で画面遷移
		m_Timer++;	//タイマー加算
		if (m_Timer >= END_TIMER)
		{
			//一定以上のスコアでリザルトへ移行
			for (int i = 0; i < MAX_PLAYER; i++)
			{
				if (CApplication::getInstance()->GetScore(i) >= END_SCORE)
				{
					if (CApplication::getInstance()->GetScore(i) > CApplication::getInstance()->GetScore(1 - i))
					{
						CApplication::getInstance()->SetWinner(i);
					}
					else
					{//引き分け
						CApplication::getInstance()->SetWinner(2);
					}

					//スコアリセット
					CApplication::getInstance()->ResetScore();

					//ゲームリセット
					CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_RESULT);
				}
			}
			//ラウンド移行
			m_Round = static_cast<ROUND>(m_Round + 1);
			CApplication::getInstance()->GetFade()->SetFade();
		}
	}
	if (m_gamestate == GAME_END&&CApplication::getInstance()->GetFade()->GetFade()==CFade::FADE_IN)
	{
		ResetGame();
	}
}

//ラウンド移行時の処理
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
	m_pUI->Init();
	return;
}
