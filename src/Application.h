//=============================================================================
//
// アプリケーション
// Author : 有田明玄
//
//=============================================================================
#ifndef _APPLICATION_H_
#define _APPLICATION_H_

//*****************************************************************************
// インクルード
//*****************************************************************************
#include"main.h"

//*****************************************************************************
//前方宣言
//*****************************************************************************
class CRenderer;
class CInputKeyboard;
class CInputJoyPad;
class CInput;
class CDebugProc;
class CTitle;
class CGame;
class CResult;
class CFade;

static const int  MAX_POLYGON = 1920;			//ポリゴンの最大数
static const int  SCREEN_WIDTH = 1280;			// スクリーンの幅
static const int  SCREEN_HEIGHT = 720;		// スクリーンの高さ

// プロトタイプ宣言
class CApplication
{
public:

	enum MODE
	{//ゲームモード
		MODE_TITLE = 0,
		MODE_GAME,
		MODE_RESULT,
		MODE_MAX
	};
	// 生成済みのインスタンスがなければ新規作成:
	static CApplication* getInstance() {
		if (instance == NULL) instance = new CApplication(); return instance;
	}

	//メンバ関数
	~CApplication() = default;
	HRESULT Init(HWND hWnd, bool bWindow, HINSTANCE hInstance);
	void Uninit();
	void Update();
	void Draw();

	//セッター
	void SetWinner(int win) { m_nWinner = win; };	//勝ったプレイヤーの番号
	void SetMode(MODE mode);
	void AddScore(int player) { CApplication::getInstance()->m_nScore[player]++; };	//スコアの加点
	void ResetScore() { CApplication::getInstance()->m_nScore[0] = 0, CApplication::getInstance()->m_nScore[1] = 0; };	//スコアのRESET


	//ゲッター
	CRenderer*GetRenderer() { return CApplication::getInstance()-> m_pRenderer; };
	CInput * GetInput() { return CApplication::getInstance()->m_pInput; };
	CDebugProc * GetDebugProc() { return CApplication::getInstance()->m_pDebugProc; };
	CFade*GetFade() { return CApplication::getInstance()->m_pFade; };
	int GetWinner() { return CApplication::getInstance()->m_nWinner; };
	int GetScore(int player) { return CApplication::getInstance()->m_nScore[player]; };	//スコアの取得


private:
	CApplication() = default;

	static CApplication* instance;

	//メンバ変数
	CRenderer*m_pRenderer;
	CInput*m_pInput;
	CDebugProc*m_pDebugProc;
	LPD3DXFONT m_pFont;						//フォントへのポイント
	MODE m_mode;
	CFade* m_pFade;
	int m_nWinner;
	int m_nScore[2];
	//画面
	CTitle*m_pTitle;
	CGame*m_pGame;
	CResult*m_pResult;
};

#endif // !_APPLICATION_H_
