//=============================================================================
//
// スキル選択
// Author : 髙野馨將
//
//=============================================================================
#ifndef _SKILLSELECT_H_
#define _SKILLSELECT_H_

//インクルード
#include "main.h"
#include "Application.h"
#include "Mode.h"
#include "Object2D.h"

//定義
#define	MAX_PLAYER	(4)		//プレイヤー人数

//前方宣言
class CPlayer;
class CCamera;
class CLight;

class CSkillSelect : public CMode
{
public:
	CSkillSelect();
	~CSkillSelect();

	HRESULT Init();
	void Uninit();
	void Update();
	void Draw();

	//ゲッター
	//static CObject2D*GetBg() { return m_pBg; };
private:
	CCamera*m_pCamera;					// カメラ
	CLight*m_pLight;					// 光源

	CPlayer*m_pPlayer[MAX_PLAYER];		//プレイヤー

};

#endif // !_OBJECT_H_



