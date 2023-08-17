//=============================================================================
//
// オブジェクト
// Author : 有田明玄
//
//=============================================================================
#ifndef _GAME_H_
#define _GAME_H_

//インクルード
#include "Application.h"
#include "Mode.h"

#define STAGE_WIDTH	(350)	// 中央から端までの長さ
#define MAX_PLAYER	(4)
#define END_TIMER	(120)	// プレイヤーが死んでから終わるまでの時間
#define END_SCORE	(2)		// ゲーム終了するためのスコア

//前方宣言
class CPlayer;
class CCamera;
class CLight;
class CTimer;
class CUI;
class CMap;
class CSpeed;
class CGauge;
class CStatusUI;
class CObject2D;
class CCountDownUI;

class CGame : public CMode
{
public:
	enum GAME
	{
		GAME_NONE = 0,
		GAME_START,		// 対戦前
		GAME_PLAY,		// 対戦中
		GAME_END		// 対戦後
	};

	enum ROUND
	{
		ROUND_1 = 0,
		ROUND_2,
		ROUND_3,
		ROUND_MAX
	};

	CGame();
	~CGame();

	HRESULT Init() override;
	void Uninit() override;
	void Draw() override;

public:
	void Update() override;
private: // 更新処理
	enum UPDATE_STATE
	{
		UPDATE_FADENOW = 0,		// フェード中
		UPDATE_COUNTDOWN,		// カウントダウン
		UPDATE_GAME_PLAY,		// ゲームプレイ
		UPDATE_GAME_END,		// ゲーム終了
		UPDATE_GAME_POUSE,		// ポーズ中
		UPDATE_MAX
	};

	using UPDATE_FUNC = void(CGame::*)();
	static const UPDATE_FUNC m_InitFunc[];
	static const UPDATE_FUNC m_UpdateFunc[];
	void SetUpdate(UPDATE_STATE inState) { m_stateNow = inState; m_isStateDirty = false; }

	const UPDATE_FUNC* m_funcInit;
	const UPDATE_FUNC* m_funcUpdate;

	bool m_isStateDirty;

	// 切り替えタイミングでの初期化
	void Init_FadeNow();
	void Init_CountDown();
	void Init_GamePlay();
	void Init_GameEnd();
	void Init_GamePouse();

	//　更新のステート関数
	void Update_FadeNow();
	void Update_CountDown();
	void Update_GamePlay();
	void Update_GameEnd();
	void Update_GamePouse();

	UPDATE_STATE	m_stateNow;		// スキルステートの状態

public:
	void ResetGame();	// ラウンド移行時の処理

	// セッター
	static void SetGame(GAME gamestate) {m_gamestate = gamestate;};

	// ゲッター
	static GAME GetGame() {return m_gamestate;};
	static CCamera * GetCamera() { return m_pCamera; };
	static CLight*GetLight() { return m_pLight; };
	static bool GetDebugCamera() { return bDebugCamera; };
	static CPlayer*GetPlayer(int number) { return m_pPlayer[number]; };
	static CTimer*GetTimer() { return m_pTimer; };
	static CMap*GetMap() { return m_pMap; };

private:
	static	CPlayer*m_pPlayer[MAX_PLAYER];
	static	GAME m_gamestate;			// ゲームの状態
	static	CCamera*m_pCamera;			// カメラ
	static	CLight*m_pLight;			// 光源
	static	bool bDebugCamera;			// デバッグ用カメラのON/OFF
	static	CTimer*m_pTimer;			// タイマー
	static	CCountDownUI* m_pCountDown;		// カウントダウン
	static	CUI*m_pUI;					// UI
	static	CMap*m_pMap;				// マップ
	static CStatusUI* m_apStatusUI[MAX_PLAYER];	// ステータス表示
	int		m_Timer;					// フェードアウトまでのタイマー
	ROUND	m_Round;					// 現在のラウンド

	/* ポーズ機能 */
	CObject2D* m_pouse_bg;
	CObject2D* m_pouse_exitButton;
	CObject2D* m_pouse_buttonBg;
	CObject2D* m_pouse_backButton;
	CObject2D* m_pouse_replayButton;
	int m_pouse_bottonIndex;
};

#endif