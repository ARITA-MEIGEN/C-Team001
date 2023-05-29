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
#include"Player.h"
#include"CameraGame.h"
#include"Light.h"


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
	LPDIRECT3DDEVICE9 pDevice;
	pDevice = CApplication::getInstance()->GetRenderer()->GetDevice();
	//eNX`ΜΗέέ
	std::string textureKey[4];
	textureKey[0] = "RESULET_003";
	textureKey[1] = "RESULET_002";
	textureKey[2] = "RESULET_001";
	textureKey[3] = "RESULET_000";


	//JΜέθ
	m_pCamera = CCameraGame::Create();

	//CgΜέθ
	m_pLight = new CLight;
	m_pLight->Init();


	////wiΜΆ¬
	//for (int i = 0; i < MAX_PLAYER; i++)
	//{
	//	m_apRank[i] = new CObject2D(CObject::OBJTYPE_UI);
	//	m_apRank[i]->Init();
	//	m_apRank[i]->SetPos(D3DXVECTOR3((float)SCREEN_WIDTH / 2 - 100 + 100 * i, (float)SCREEN_HEIGHT / 2, 0.0f));
	//	m_apRank[i]->SetSiz(D3DXVECTOR2((float)100, (float)50));
	//	m_apRank[i]->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));
	//}

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
	CInput* pInput = CInput::GetKey();

	if (CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
	{
		if ((pInput->Trigger(KEY_ALL)) == true)		//ENTERL[
		{//G^[ΕLOΙ
		 //[hέθ
			CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_TITLE);
		}
	}
}

//====================================
//`ζ
//====================================
void CSkillSelect::Draw()
{

}
