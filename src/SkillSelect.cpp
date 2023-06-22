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
// 定数
//====================================
int CSkillSelect::m_nSkill[MAX_PLAYER] = {};

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
	//初期化
	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{
		m_nSkill[nCnt] = 1;
		m_pObj2D[nCnt] = CObject2D::Create(D3DXVECTOR3(200.0f + (300.0f * nCnt), 600.0f, 0.0f), D3DXVECTOR2(150.0f, 80.0f), 5);
	}

	//背景の生成
	m_pBg = new CObject2D(CObject::OBJTYPE_MAP);
	m_pBg->Init();
	m_pBg->SetPos(D3DXVECTOR3(SCREEN_WIDTH * 0.5f, SCREEN_HEIGHT * 0.5f, 0.0f));
	m_pBg->SetSiz(D3DXVECTOR2((float)SCREEN_WIDTH, (float)SCREEN_HEIGHT));
	m_pBg->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));

	m_pBg->SetTextureKey("TEXT_TITLE");

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
	//入力処理
	Input();

	//選択処理
	Select();
}

//====================================
//描画
//====================================
void CSkillSelect::Draw()
{

}

//====================================
//入力
//====================================
void CSkillSelect::Input()
{
	//インプットの情報を取得
	CInput* pInput = CInput::GetKey();

	//フェードしていなければ
	if (CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
	{
		//左入力で左を選択
		for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
		{//プレイヤーごとに分ける
			if (m_nSkill[nCnt] >= 1)
			{//左端ではないなら左へ
				if (pInput->Trigger(JOYPAD_LEFT, nCnt))
				{
					m_nSkill[nCnt]--;
				}
			}
		}

		//右入力で右を選択
		for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
		{//プレイヤーごとに分ける
			if (m_nSkill[nCnt] <= 2)
			{//右端ではないなら右へ
				if (pInput->Trigger(JOYPAD_RIGHT, nCnt))
				{
					m_nSkill[nCnt]++;
				}
			}
		}

		if (pInput->Trigger(DIK_O))
		{//左に動く
			if (m_nSkill[0] >= 1)
			{//左端ではないなら左へ
				m_nSkill[0]--;
			}
		}
		else if (pInput->Trigger(DIK_P))
		{//右に動く
			if (m_nSkill[0] <= 2)
			{//右端ではないなら右へ
				m_nSkill[0]++;
			}
		}

		if ((pInput->Trigger(DIK_RETURN)) == true)		//ENTERキー
		{//エンターでゲームに
		 //モード設定
			CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_GAME);
		}
	}
}

//====================================
//選択
//====================================
void CSkillSelect::Select()
{
	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{
		if (m_nSkill[nCnt] == 0)
		{//プレイヤーの能力を表すテクスチャ1
			m_pObj2D[nCnt]->SetTextureKey("RESULET_000");
		}
		else if (m_nSkill[nCnt] == 1)
		{//プレイヤーの能力を表すテクスチャ2
			m_pObj2D[nCnt]->SetTextureKey("RESULET_001");
		}
		else if (m_nSkill[nCnt] == 2)
		{//プレイヤーの能力を表すテクスチャ3
			m_pObj2D[nCnt]->SetTextureKey("RESULET_002");
		}
		else if (m_nSkill[nCnt] == 3)
		{//プレイヤーの能力を表すテクスチャ4
			m_pObj2D[nCnt]->SetTextureKey("RESULET_003");
		}
	}
}