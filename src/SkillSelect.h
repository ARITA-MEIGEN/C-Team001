//=============================================================================
//
// XLIπ
// Author : ϋόμ]
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

//OϋιΎ
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
		SPEED,	// Α¬
		PAINT,	// hθ
		MAX
	};

	CSkillSelect();
	~CSkillSelect();

	HRESULT Init();			// ϊ»
	void Uninit();			// IΉ
	void Update();			// XV
	void Draw();			// `ζ

	static int GetSelectSkill(int nCntPlayer) { return m_nSkill[nCntPlayer]; }
	static int GetEntryInput(int nCntPlayer) { return m_inputNumber[nCntPlayer]; }

private:
	void Input();			// όΝ
	void Select();			// Iπ
	void Entry();			// Gg[
private:
	static int m_nSkill[MAX_PLAYER];		// »έIπ³κΔ’ιXLΜΤ
	static int m_inputNumber[MAX_PLAYER];	// Gg[΅½inputΤ
	bool m_isDecision[MAX_PLAYER];			// θ
	CObject2D* m_pObj2D[MAX_PLAYER];		// XLIπΜg
	CPlayer* m_pPlayer[MAX_PLAYER];			// vC[

	CBg* m_pBg;				// wi
	CCamera* m_pCamera;		// J
	CLight* m_pLight;		// υΉ
	SKILL_STATE m_state;	// σΤ
};

#endif