//=============================================================================
//
// オブジェクト
// Author : 有田明玄
//
//=============================================================================
#ifndef _RESULT_H_
#define _RESULT_H_

//インクルード
#include "main.h"
#include "Application.h"
#include "Mode.h"
#include "Object2D.h"

#define	MAX_PLAYER	(4)		//プレイヤー人数

//前方宣言
class CPlayer;
class CCamera;
class CLight;

class CResult : public CMode
{
public:
	CResult();
	~CResult();

	HRESULT Init();
	void Uninit();
	void Update();
	void Draw();

	//ゲッター
	//static CObject2D*GetBg() { return m_pBg; };
private:
	CCamera*m_pCamera;					// カメラ
	CLight*m_pLight;					// 光源
	CObject2D*m_apRank[MAX_PLAYER];		//順位表示UI
	CPlayer*m_pPlayer[MAX_PLAYER];		//プレイヤー
	
};

#endif // !_OBJECT_H_



