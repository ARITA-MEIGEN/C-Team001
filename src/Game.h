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

#define MAX_PLAYER	(4)
#define STAGE_WIDTH	(350)	// 中央から端までの長さ
#define END_TIMER	(120)	// プレイヤーが死んでから終わるまでの時間
#define END_SCORE	(2)		// ゲーム終了するためのスコア

//前方宣言
class CPlayer;
class CCamera;
class CLight;
class CFloor;
class CTimer;
class CUI;
class CMap;
class CSpeed;
class CGauge;

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
	void Update() override;
	void Draw() override;
	void ResetGame();	// ラウンド移行時の処理
	void BlockCount();

	// セッター
	static void SetGame(GAME gamestate) {m_gamestate = gamestate;};

	// ゲッター
	static GAME GetGame() {return m_gamestate;};
	static CCamera * GetCamera() { return m_pCamera; };
	static CFloor*GetFloor() { return m_pFloor; };
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
	static	CFloor*m_pFloor;			// 床
	static	bool bDebugCamera;			// デバッグ用カメラのON/OFF
	static	CTimer*m_pTimer;			// タイマー
	static	CUI*m_pUI;					// UI
	static	CMap*m_pMap;				// マップ
	int		m_Timer;					// フェードアウトまでのタイマー
	ROUND	m_Round;					// 現在のラウンド
};

#endif