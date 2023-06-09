//=============================================================================
//
// }bvIπ
// Author : ϋόμ]
//
//=============================================================================

//CN[h
#include"main.h"
#include"MapSelect.h"
#include"input.h"
#include"Fade.h"
#include"Application.h"
#include"renderer.h"
#include"sound.h"
#include"Map.h"
#include"Game.h"
#include"Player.h"
#include"CameraGame.h"
#include"Light.h"

//====================================
// θ
//====================================
int CMapSelect::m_nMapNumber = 0;

//====================================
//RXgN^
//====================================
CMapSelect::CMapSelect()
{
}

//====================================
//fXgN^
//====================================
CMapSelect::~CMapSelect()
{
}

//====================================
//ϊ»
//====================================
HRESULT CMapSelect::Init()
{
	//ϊ»
	m_bMapChange = false;

	//2DObjectΜΆ¬
	m_pObj2D = CObject2D::Create(D3DXVECTOR3(640.0f, 600.0f, 0.0f), D3DXVECTOR2(400.0f, 100.0f), 4);
	m_pObj2D->SetTextureKey("RESULET_000");
	//ϊ»
	for (int nCnt = 0; nCnt < CMap::STAGE_MAX; nCnt++)
	{
		m_pObj2DPolygon[nCnt] = CObject2D::Create(D3DXVECTOR3(500.0f + (100.0f * nCnt), 550.0f, 0.0f), D3DXVECTOR2(25.0f, 25.0f), 5);
	}

	//JΜέθ
	m_pCamera = CCameraGame::Create();

	//CgΜέθ
	m_pLight = new CLight;
	m_pLight->Init();

	//}bvΆ¬
	m_pMap = CMap::Create(m_nMapNumber);

	return S_OK;
}

//====================================
//IΉ
//====================================
void CMapSelect::Uninit()
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

	//}bvΜIΉ
	if (m_pMap != nullptr)
	{
		delete m_pMap;
	}
}

//====================================
//XV
//====================================
void CMapSelect::Update()
{
	//XV
	m_pCamera->Update();
	m_pLight->Update();

	//όΝ
	Input();

	if (m_bMapChange)
	{
		//Iπ
		Select();
	}

	for (int nCnt = 0; nCnt < CMap::STAGE_MAX; nCnt++)
	{//‘Iπ΅Δι}bvΖ―ΆΤΜ|Sπ­·ι
		if (nCnt == m_nMapNumber)
		{
			m_pObj2DPolygon[nCnt]->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));
		}
		else
		{
			m_pObj2DPolygon[nCnt]->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 0.5f));
		}
	}
}

//====================================
//`ζ
//====================================
void CMapSelect::Draw()
{
	m_pCamera->Set();
}

//====================================
//όΝ
//====================================
void CMapSelect::Input()
{
	//CvbgΜξρπζΎ
	CInput* pInput = CInput::GetKey();

	//tF[h΅Δ’Θ―κΞ
	if (CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
	{
		//ΆόΝΕΆπIπ
		if (m_nMapNumber >= (CMap::STAGE_01 + 1))
		{//Ά[ΕΝΘ’ΘηΆΦ
			if (pInput->Trigger(JOYPAD_LEFT) || pInput->Trigger(DIK_O))
			{
				m_nMapNumber--;
				m_bMapChange = true;
			}
		}

		//EόΝΕEπIπ
		if (m_nMapNumber <= (CMap::STAGE_MAX - 2))
		{//E[ΕΝΘ’ΘηEΦ
			if (pInput->Trigger(JOYPAD_RIGHT) || pInput->Trigger(DIK_P))
			{
				m_nMapNumber++;
				m_bMapChange = true;
			}
		}

		if ((pInput->Trigger(DIK_RETURN)) == true || (pInput->Trigger(JOYPAD_B)))		//ENTERL[
		{//G^[ΕXLIπΙ
		 //[hέθ
			CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_SKILL);
		}
	}
}

//====================================
//Iπ
//====================================
void CMapSelect::Select()
{
	//}bvΜIΉ
	if (m_pMap != nullptr)
	{
		m_pMap->Uninit();
		delete m_pMap;
		m_pMap = nullptr;
	}
	//\¦³κΔ’ι}bvπΟ¦ι
	m_pMap = CMap::Create(m_nMapNumber);

	if (m_pObj2D != nullptr)
	{
		switch (m_nMapNumber)
		{
		case 0:
			m_pObj2D->SetTextureKey("RESULET_000");
			break;

		case 1:
			m_pObj2D->SetTextureKey("RESULET_001");
			break;

		case 2:
			m_pObj2D->SetTextureKey("RESULET_002");
			break;

		default:
			break;
		}
	}

	//}bvΜΟXπ~ίι
	m_bMapChange = false;
}