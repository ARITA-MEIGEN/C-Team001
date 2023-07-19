//=============================================================================
//
// XLIð
// Author : ûüì]
//
//=============================================================================
#ifndef _SKILLSELECT_H_
#define _SKILLSELECT_H_

//CN[h
#include "main.h"
#include "Application.h"
#include "Mode.h"
#include "Object2D.h"
#include "Game.h"

//Oûé¾
class CPlayer;
class CCamera;
class CLight;
class CBg;

class CSkillSelect : public CMode
{
public:

	enum SKILL_STATE
	{
		NONE,	// ftHg
		SPEED,	// Á¬
		PAINT,	// hè
		MAX
	};

	CSkillSelect();
	~CSkillSelect();

	HRESULT Init();			// ú»
	void Uninit();			// I¹
	void Update();			// XV
	void Draw();			// `æ

	static bool GetComputer(int nCntPlayer) { return m_isDecision[nCntPlayer]; }
	static int GetSelectSkill(int nCntPlayer) { return m_nSkill[nCntPlayer]; }
	static int GetEntryInput(int nCntPlayer) { return m_inputNumber[nCntPlayer]; }

private:
	void Input();			// üÍ
	void Texture();			// eNX`ðÏ¦é
	void Entry();			// Gg[
private:
	static int m_nSkill[MAX_PLAYER];		// »ÝIð³êÄ¢éXLÌÔ
	static int m_inputNumber[MAX_PLAYER];	// Gg[µ½inputÔ
	static bool m_isDecision[MAX_PLAYER];	// è
	bool m_isPlayerCheck[MAX_PLAYER];		// õ®¹©Ç¤©
	CObject2D* m_pObj2D[MAX_PLAYER];		// XLIðÌg
	CPlayer* m_pPlayer[MAX_PLAYER];			// vC[

	CBg* m_pBg;				// wi
	CCamera* m_pCamera;		// J
	CLight* m_pLight;		// õ¹
	SKILL_STATE m_state;	// óÔ
};

#endif