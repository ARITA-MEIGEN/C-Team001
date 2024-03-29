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
#include"Object3D.h"

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
	CSound::GetInstance()->Play(CSound::ELabel::LABEL_BGM_TITLE);

	//ϊ»
	m_bMapChange = false;

	//ϊ»
	for (int nCnt = 0; nCnt < CMap::STAGE_MAX; nCnt++)
	{
		D3DXVECTOR3 pos(SCREEN_WIDTH * 0.5f + (100.0f * nCnt) - (100.0f * CMap::STAGE_MAX * 0.5f), 600.0f, 0.0f);
		m_pObj2DPolygon[nCnt] = CObject2D::Create(pos, D3DXVECTOR2(75.0f, 75.0f), 6);
		CObject2D* main = CObject2D::Create(pos, D3DXVECTOR2(60.0f, 60.0f), 6);
		main->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));
	}

	//JΜέθ
	m_pCamera = CCameraGame::Create();

	//CgΜέθ
	m_pLight = new CLight;
	m_pLight->Init();

	//wi
	CObject3D* pori = CObject3D::Create(D3DXVECTOR3(0.0f, -50.0f, 0.0f), D3DXVECTOR3(4000.0f, 0.0f, 2000.0f), 2);
	pori->SetUV(0.0f,20.0f,0.0f,20.0f);
	pori->SetTextureKey("TEST_FLOOR");

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
			m_pObj2DPolygon[nCnt]->SetCol(D3DXCOLOR(1.0f, 0.0f, 0.0f, 1.0f));
		}
		else
		{
			m_pObj2DPolygon[nCnt]->SetCol(D3DXCOLOR(0.0f, 0.0f, 0.0f, 0.5f));
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

		if ((pInput->Trigger(DIK_RETURN)) || (pInput->Trigger(JOYPAD_B)))		//ENTERL[
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

	//}bvΜΟXπ~ίι
	m_bMapChange = false;
}