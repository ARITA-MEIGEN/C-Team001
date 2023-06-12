//=============================================================================
//
// スキル選択
// Author : 髙野馨將
//
//=============================================================================

//インクルード
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
//静的メンバ変数
//====================================
//CObject2D* CSkillSelect::m_pBg = nullptr;

//====================================
//コンストラクタ
//====================================
CSkillSelect::CSkillSelect()
{
}

//====================================
//デストラクタ
//====================================
CSkillSelect::~CSkillSelect()
{
}

//====================================
//初期化
//====================================
HRESULT CSkillSelect::Init()
{
	LPDIRECT3DDEVICE9 pDevice;
	pDevice = CApplication::getInstance()->GetRenderer()->GetDevice();

	//初期化
	m_state = NONE;
	m_nSkill[MAX_PLAYER] = {};

	//背景の生成
	m_pBg = new CObject2D(CObject::OBJTYPE_UI);
	m_pBg->Init();
	m_pBg->SetPos(D3DXVECTOR3(SCREEN_WIDTH * 0.5f, SCREEN_HEIGHT * 0.5f, 0.0f));
	m_pBg->SetSiz(D3DXVECTOR2(SCREEN_WIDTH, SCREEN_HEIGHT));
	m_pBg->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));

	m_pBg->SetTextureKey("TEXT_TITLE");

	//スキル選択の部分の生成
	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{
		m_pObj2D[nCnt] = CObject2D::Create(D3DXVECTOR3(200.0f + (300.0f * nCnt), 600.0f, 0.0f), D3DXVECTOR2(150.0f, 80.0f), 5);
	}

	return S_OK;
}

//====================================
//終了
//====================================
void CSkillSelect::Uninit()
{
	CSound::GetInstance()->Stop();
}

//====================================
//更新
//====================================
void CSkillSelect::Update()
{
	//インプットの情報を取得
	CInput* pInput = CInput::GetKey();

	if (CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
	{
		//if (pInput->Press(JOYPAD_LEFT, 0))
		//{
		//	m_nSkill[0]--;
		//}
		//if (pInput->Press(JOYPAD_LEFT, 1))
		//{
		//	m_nSkill[1]--;
		//}
		//if (pInput->Press(JOYPAD_LEFT, 2))
		//{
		//	m_nSkill[2]--;
		//}
		//if (pInput->Press(JOYPAD_LEFT, 3))
		//{
		//	m_nSkill[3]--;
		//}

		if ((pInput->Trigger(DIK_RETURN)) == true)		//ENTERキー
		{//エンターでゲームに
		 //モード設定
			CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_GAME);
		}
	}
}

//====================================
//描画
//====================================
void CSkillSelect::Draw()
{

}
