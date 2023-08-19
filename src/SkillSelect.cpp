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
#include"Camera.h"
#include"Light.h"
#include"Bg.h"
#include "Block.h"

#include "Object3D.h"
#include "sky_bg.h"

//====================================
// θ
//====================================
int CSkillSelect::m_nSkill[MAX_PLAYER] = {};
std::vector<int> CSkillSelect::m_inputNumber = {};
bool CSkillSelect::m_isDecision[MAX_PLAYER] = {};

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
	// wi
	CSkyBg::Create();

	// nΚ
	{
		CObject3D* pori = CObject3D::Create(D3DXVECTOR3(0.0f, -200.0f, 0.0f), D3DXVECTOR3(5000.0f, 0.0f, 5000.0f), 2);
		pori->SetUV(0.0f, 10.0f, 0.0f, 10.0f);
		pori->SetTextureKey("FLOOR");
	}

	{
		CObjectX* object = CObjectX::Create();
		object->BindModel(CObjectXOriginalList::GetInstance()->GetModelData("ENVIRONMENT_FUTURE1"));
		object->SetPos(D3DXVECTOR3(-120.0f, -200.0f, 2500.0f));
	}
	{
		CObjectX* object = CObjectX::Create();
		object->BindModel(CObjectXOriginalList::GetInstance()->GetModelData("ENVIRONMENT_FUTURE5"));
		object->SetPos(D3DXVECTOR3(-1520.0f, -200.0f, 2000.0f));
	}

	{
		CObjectX* object = CObjectX::Create();
		object->BindModel(CObjectXOriginalList::GetInstance()->GetModelData("ELEVATEDLINE_FC"));
		object->SetPos(D3DXVECTOR3(120.0f, -200.0f, 1800.0f));
	}

	{
		CObjectX* object = CObjectX::Create();
		object->BindModel(CObjectXOriginalList::GetInstance()->GetModelData("TOWERHIGH"));
		object->SetPos(D3DXVECTOR3(710.0f, -200.0f, 1550.0f));
	}

	{
		CObjectX* object = CObjectX::Create();
		object->BindModel(CObjectXOriginalList::GetInstance()->GetModelData("AIRSHIP"));
		object->SetPos(D3DXVECTOR3(-720.0f, -200.0f, 1650.0f));
		object->SetRot(D3DXVECTOR3(0.0f, D3DX_PI * 0.5f, 0.0f));
	}

	//JΜέθ
	m_pCamera = CCamera::Create();
	m_pCamera->SetPosV(D3DXVECTOR3(0.0f, 24.0f, -200.0f));
	m_pCamera->SetPosR(D3DXVECTOR3(0.0f, 20.0f, 0.0f));

	//CgΜέθ
	m_pLight = new CLight;
	m_pLight->Init();

	m_inputNumber.resize(4);

	//ϊ»
	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{
		m_isPlayerCheck[nCnt] = false;
		m_isDecision[nCnt] = false;
		m_inputNumber[nCnt] = 99;		// βΞΙLθΎΘ’πγό
		m_nSkill[nCnt] = 1;

		SetUpSelectUI(nCnt);
	}

	return S_OK;
}

//====================================
//IΉ
//====================================
void CSkillSelect::Uninit()
{
	CSound::GetInstance()->Stop();

	//JΜέθ
	if (m_pCamera != nullptr)
	{
		m_pCamera->Uninit();
		delete m_pCamera;
	}

	//CgΜέθ
	if (m_pLight != nullptr)
	{
		m_pLight->Uninit();
		delete m_pLight;
	}

	//wi
	if (m_pBg != nullptr)
	{
		m_pBg = nullptr;
	}
}

//====================================
//XV
//====================================
void CSkillSelect::Update()
{
	//XV
	m_pCamera->Update();
	m_pLight->Update();

	//tF[h΅Δ’Θ―κΞ
	if (CApplication::getInstance()->GetFade()->GetFade() != CFade::FADE_NONE)
	{
		return;
	}

	//όΝ
	Input();

	// Gg[
	Entry();

	//Iπ
	Texture();
}

//====================================
//`ζ
//====================================
void CSkillSelect::Draw()
{
	m_pCamera->Set();
}

void CSkillSelect::SetUpSelectUI(int inPlayerCnt)
{
	float x = 200.0f + (300.0f * inPlayerCnt);
	m_pObj2D[inPlayerCnt] = CObject2D::Create(D3DXVECTOR3(x, 600.0f, 0.0f), D3DXVECTOR2(150.0f, 80.0f), 5);

	// Iπ΅Υ’ζ€Ιξσ
	{
		m_pSelectArrow[inPlayerCnt][0][1] = CObject2D::Create(D3DXVECTOR3(x - 150.0f * 0.5f - 45.0f - 1.0f, 300.0f, 0.0f), D3DXVECTOR2(40.0f, 40.0f), 5);
		m_pSelectArrow[inPlayerCnt][0][1]->SetTextureKey("SERECT_LEFT");
		m_pSelectArrow[inPlayerCnt][0][1]->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 0.0f));
		m_pSelectArrow[inPlayerCnt][1][1] = CObject2D::Create(D3DXVECTOR3(x + 150.0f * 0.5f + 45.0f + 1.0f, 300.0f, 0.0f), D3DXVECTOR2(40.0f, 40.0f), 5);
		m_pSelectArrow[inPlayerCnt][1][1]->SetTextureKey("SERECT_RIGHT");
		m_pSelectArrow[inPlayerCnt][1][1]->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 0.0f));

		m_pSelectArrow[inPlayerCnt][0][0] = CObject2D::Create(D3DXVECTOR3(x - 150.0f * 0.5f - 45.0f, 300.0f, 0.0f), D3DXVECTOR2(30.0f, 30.0f), 5);
		m_pSelectArrow[inPlayerCnt][0][0]->SetTextureKey("SERECT_LEFT");
		m_pSelectArrow[inPlayerCnt][0][0]->SetCol(D3DXCOLOR(0.0f, 0.0f, 1.0f, 0.0f));
		m_pSelectArrow[inPlayerCnt][1][0] = CObject2D::Create(D3DXVECTOR3(x + 150.0f * 0.5f + 45.0f, 300.0f, 0.0f), D3DXVECTOR2(30.0f, 30.0f), 5);
		m_pSelectArrow[inPlayerCnt][1][0]->SetTextureKey("SERECT_RIGHT");
		m_pSelectArrow[inPlayerCnt][1][0]->SetCol(D3DXCOLOR(0.0f, 0.0f, 1.0f, 0.0f));
	}

	// 3DfΜέu
	{
		CBlock* block = CBlock::Create(D3DXVECTOR3(-(65.0f * 1.5f) + (65.0f * inPlayerCnt), -5.0f, 0.0f));
		block->CancelPermitSink();
		block->OnUpDownMove();
		m_pPlayer[inPlayerCnt] = CPlayer::Create(block, D3DXVECTOR3(0.0f, D3DX_PI, 0.0f));

		// Jπό­
		m_pPlayer[inPlayerCnt]->SetRot(m_pCamera->CalculateRotFromPos(m_pPlayer[inPlayerCnt]->GetPos()));
		block->SetRot(m_pCamera->CalculateRotFromPos(block->GetPos()));
	}
}

//====================================
//όΝ
//====================================
void CSkillSelect::Input()
{
	//CvbgΜξρπζΎ
	CInput* pInput = CInput::GetKey();
	
	// vC[ͺSυIπΎΑ½η
	if (m_isPlayerCheck[0] && m_isPlayerCheck[1] && m_isPlayerCheck[2] && m_isPlayerCheck[3])
	{
		if (m_inputNumber[0] != 99)
		{
			if (pInput->Trigger(KEY_DECISION, m_inputNumber[0]))		//ENTERL[
			{//G^[ΕQ[Ι
			 //[hέθ
				CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_GAME);
			}
		}
	}

	//ΆόΝΕΆπIπ
	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{//vC[²ΖΙͺ―ι
		if (m_inputNumber[nCnt] == 99)
		{
			continue;
		}

		if (!m_isPlayerCheck[nCnt])
		{
			if (m_nSkill[nCnt] >= 1)
			{//Ά[ΕΝΘ’ΘηΆΦ
				if (pInput->Trigger(KEY_LEFT, m_inputNumber[nCnt]) && !m_isPlayerCheck[nCnt])
				{
					m_nSkill[nCnt]--;
				}
				m_pSelectArrow[nCnt][0][0]->SetColAlpha(1.0f);
				m_pSelectArrow[nCnt][0][1]->SetColAlpha(1.0f);
			}
			else
			{
				m_pSelectArrow[nCnt][0][0]->SetColAlpha(0.25f);
				m_pSelectArrow[nCnt][0][1]->SetColAlpha(0.25f);
			}

			if (m_nSkill[nCnt] <= 2)
			{//E[ΕΝΘ’ΘηEΦ
				if (pInput->Trigger(KEY_RIGHT, m_inputNumber[nCnt]) && !m_isPlayerCheck[nCnt])
				{
					m_nSkill[nCnt]++;
				}
				m_pSelectArrow[nCnt][1][0]->SetColAlpha(1.0f);
				m_pSelectArrow[nCnt][1][1]->SetColAlpha(1.0f);
			}
			else
			{
				m_pSelectArrow[nCnt][1][0]->SetColAlpha(0.25f);
				m_pSelectArrow[nCnt][1][1]->SetColAlpha(0.25f);
			}
		}

		if (m_inputNumber[nCnt] != -1 && !m_isPlayerCheck[nCnt] && pInput->Trigger(JOYPAD_B, m_inputNumber[nCnt]) || m_inputNumber[nCnt] == -1 && !m_isPlayerCheck[nCnt] && pInput->Trigger(DIK_RETURN, m_inputNumber[nCnt]))
		{//pbhΜB{^Εθ·ι(L[{[hΝV)
			m_isPlayerCheck[nCnt] = true;
			m_pSelectArrow[nCnt][0][0]->SetColAlpha(0.0f);
			m_pSelectArrow[nCnt][1][0]->SetColAlpha(0.0f);
			m_pSelectArrow[nCnt][0][1]->SetColAlpha(0.0f);
			m_pSelectArrow[nCnt][1][1]->SetColAlpha(0.0f);
		}
		else if (m_inputNumber[nCnt] != -1 && m_isPlayerCheck[nCnt] &&  pInput->Trigger(JOYPAD_A, m_inputNumber[nCnt]) || m_inputNumber[nCnt] == -1 && m_isPlayerCheck[nCnt] && pInput->Trigger(DIK_B, m_inputNumber[nCnt]))
		{//pbhΜA{^Επ·ι(L[{[hΝB)
			m_isPlayerCheck[nCnt] = false;
			m_pSelectArrow[nCnt][0][0]->SetColAlpha(1.0f);
			m_pSelectArrow[nCnt][1][0]->SetColAlpha(1.0f);
			m_pSelectArrow[nCnt][0][1]->SetColAlpha(1.0f);
			m_pSelectArrow[nCnt][1][1]->SetColAlpha(1.0f);
		}
	}

#ifdef _DEBUG
	CDebugProc::Print("\nL[{[hΝVΕθABΕπ");
	CDebugProc::Print("\nPlayerCheck : %d %d %d %d", m_isPlayerCheck[0], m_isPlayerCheck[1], m_isPlayerCheck[2], m_isPlayerCheck[3]);
#endif // _DEBUG
}

//====================================
//Iπ
//====================================
void CSkillSelect::Texture()
{
	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{
		if (m_inputNumber[nCnt] == 99)
		{
			continue;
		}

		if (m_isPlayerCheck[nCnt])
		{//vC[Μ\Νπ\·eNX`1
			m_pObj2D[nCnt]->SetTextureKey("CHECK_MARK");
		}
		else if (m_nSkill[nCnt] == 0)
		{//vC[Μ\Νπ\·eNX`1
			m_pObj2D[nCnt]->SetTextureKey("SKILL_ICON_PAWER");
		}
		else if (m_nSkill[nCnt] == 1)
		{//vC[Μ\Νπ\·eNX`2
			m_pObj2D[nCnt]->SetTextureKey("RESULET_001");
		}
		else if (m_nSkill[nCnt] == 2)
		{//vC[Μ\Νπ\·eNX`3
			m_pObj2D[nCnt]->SetTextureKey("RESULET_002");
		}
		else if (m_nSkill[nCnt] == 3)
		{//vC[Μ\Νπ\·eNX`4
			m_pObj2D[nCnt]->SetTextureKey("RESULET_003");
		}
	}
}

//====================================
//Gg[
//====================================
void CSkillSelect::Entry()
{
	CInput* pInput = CInput::GetKey();
	std::vector<int> inputNumber = pInput->TriggerDevice(KEY_DECISION);

	for (size_t i = 0;i < inputNumber.size();i++)
	{
		if (std::find(m_inputNumber.begin(), m_inputNumber.end(), inputNumber[i]) == m_inputNumber.end())
		{
			for (int j = 0; j < m_inputNumber.size(); j++)
			{
				if (m_inputNumber[j] == 99)
				{
					m_inputNumber[j] = inputNumber[i];
					break;
				}
			}
		}
	}

	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{
		if (m_inputNumber[nCnt] == 99)
		{
			//Rg[[ͺo^³κΔ’Θ©Α½ηtrueΙ΅Δ¨­
			m_isPlayerCheck[nCnt] = true;

			continue;
		}
		else if (m_inputNumber[nCnt] != 99 && !m_isDecision[nCnt])
		{
			//Rg[[ͺo^³κ½ηκxΜέfalseΙί·
			m_isPlayerCheck[nCnt] = false;
			m_isDecision[nCnt] = true;

			if (m_isDecision[nCnt])
			{

				m_pSelectArrow[nCnt][0][0]->SetColAlpha(1.0f);
				m_pSelectArrow[nCnt][1][0]->SetColAlpha(1.0f);
				m_pSelectArrow[nCnt][0][1]->SetColAlpha(1.0f);
				m_pSelectArrow[nCnt][1][1]->SetColAlpha(1.0f);
			}
		}
	}

#ifdef _DEBUG
	CDebugProc::Print("\nNumber : %d %d %d %d", m_inputNumber[0], m_inputNumber[1], m_inputNumber[2], m_inputNumber[3]);
#endif // _DEBUG
}