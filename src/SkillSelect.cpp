//=============================================================================
//
// XLIπ
// Author : ϋόμ]
//
//=============================================================================

//CN[h
#include"main.h"
#include"SkillSelect.h"
#include"input.h"
#include"Fade.h"
#include"Application.h"
#include"renderer.h"
#include"sound.h"
#include"Map.h"
#include"Game.h"
#include"Player.h"

//====================================
// θ
//====================================
int CSkillSelect::m_nSkill[MAX_PLAYER] = {};

//====================================
//RXgN^
//====================================
CSkillSelect::CSkillSelect()
{
}

//====================================
//fXgN^
//====================================
CSkillSelect::~CSkillSelect()
{
}

//====================================
//ϊ»
//====================================
HRESULT CSkillSelect::Init()
{
	//ϊ»
	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{
		m_nSkill[nCnt] = 1;
		m_pObj2D[nCnt] = CObject2D::Create(D3DXVECTOR3(200.0f + (300.0f * nCnt), 600.0f, 0.0f), D3DXVECTOR2(150.0f, 80.0f), 5);
	}

	//wiΜΆ¬
	m_pBg = new CObject2D(CObject::OBJTYPE_UI);
	m_pBg->Init();
	m_pBg->SetPos(D3DXVECTOR3(SCREEN_WIDTH * 0.5f, SCREEN_HEIGHT * 0.5f, 0.0f));
	m_pBg->SetSiz(D3DXVECTOR2((float)SCREEN_WIDTH, (float)SCREEN_HEIGHT));
	m_pBg->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));

	m_pBg->SetTextureKey("TEXT_TITLE");

	return S_OK;
}

//====================================
//IΉ
//====================================
void CSkillSelect::Uninit()
{
	CSound::GetInstance()->Stop();
}

//====================================
//XV
//====================================
void CSkillSelect::Update()
{
	//όΝ
	Input();

	//Iπ
	Select();
}

//====================================
//`ζ
//====================================
void CSkillSelect::Draw()
{

}

//====================================
//όΝ
//====================================
void CSkillSelect::Input()
{
	//CvbgΜξρπζΎ
	CInput* pInput = CInput::GetKey();

	if (CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
	{
		//ΆόΝΕΆπIπ
		for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
		{
			if (m_nSkill[nCnt] >= 1)
			{
				if (pInput->Press(JOYPAD_LEFT, nCnt))
				{
					m_nSkill[nCnt]--;
				}
			}
		}

		//EόΝΕEπIπ
		for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
		{
			if (m_nSkill[nCnt] <= 2)
			{
				if (pInput->Press(JOYPAD_RIGHT, nCnt))
				{
					m_nSkill[nCnt]++;
				}
			}
		}

		if (pInput->Trigger(DIK_O))
		{
			if (m_nSkill[0] >= 1)
			{
				m_nSkill[0]--;
			}
		}
		else if (pInput->Trigger(DIK_P))
		{
			if (m_nSkill[0] <= 2)
			{
				m_nSkill[0]++;
			}
		}

		if ((pInput->Trigger(DIK_RETURN)) == true)		//ENTERL[
		{//G^[ΕQ[Ι
		 //[hέθ
			CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_GAME);
		}
	}
}

//====================================
//Iπ
//====================================
void CSkillSelect::Select()
{
	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{
		if (m_nSkill[nCnt] == 0)
		{
			m_pObj2D[nCnt]->SetTextureKey("RESULET_000");
		}
		else if (m_nSkill[nCnt] == 1)
		{
			m_pObj2D[nCnt]->SetTextureKey("RESULET_001");
		}
		else if (m_nSkill[nCnt] == 2)
		{
			m_pObj2D[nCnt]->SetTextureKey("RESULET_002");
		}
		else if (m_nSkill[nCnt] == 3)
		{
			m_pObj2D[nCnt]->SetTextureKey("RESULET_003");
		}
	}
}