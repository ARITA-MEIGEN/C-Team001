//=============================================================================
//
// マップ選択
// Author : 髙野馨將
//
//=============================================================================
#ifndef _MAPSELECT_H_
#define _MAPSELECT_H_

//インクルード
#include "main.h"
#include "Application.h"
#include "Mode.h"
#include "Object2D.h"
#include "Game.h"

//前方宣言
class CMap;
class CCamera;
class CLight;

class CMapSelect : public CMode
{
public:

	CMapSelect();
	~CMapSelect();

	HRESULT Init();			// 初期化
	void Uninit();			// 終了
	void Update();			// 更新
	void Draw();			// 描画

	void Input();			// 入力
	void Select();			// 選択処理

	//static int GetSelectSkill(int nCntPlayer) { return m_nSkill[nCntPlayer]; }

private:
	bool m_bMapChange;					// マップを変更したかどうか
	int m_nMapNumber;					// 現在選択されているマップの番号
	CObject2D*m_pObj2D[MAX_PLAYER];		// スキル選択の枠
	CCamera*m_pCamera;					// カメラ
	CLight*m_pLight;					// 光源
	CMap*m_pMap;						// マップ
};

#endif