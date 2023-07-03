//================================================
//
//ステータス表示 [StatusUI.cpp]
//Author : Kishimoto Eiji
//
//================================================
#include "StatusUI.h"
#include "SkillGauge.h"
#include "texture.h"
#include "game.h"
#include "Player.h"

//======================================================
//生成
//======================================================
CStatusUI *CStatusUI::Create(int nPlayerNum)
{
	CStatusUI* pStatusUI = nullptr;	//ポインタ

	if (pStatusUI != nullptr)
	{//NULLチェック
		assert(false);
	}

	/* nullptrの場合 */

	pStatusUI = new CStatusUI;	//動的確保

	pStatusUI->SetPlayerNum(nPlayerNum);	//プレイヤー番号の設定

	pStatusUI->Init();	//初期化

	return pStatusUI;
}

//======================================================
//コンストラクタ
//======================================================
CStatusUI::CStatusUI(int nPriority) :
	CObject(nPriority),
	m_pGauge(nullptr),
	m_pCharaBg(nullptr),
	m_pSkillIconBg(nullptr),
	m_nPlayerNum(0)
{
}

//======================================================
//デストラクタ
//======================================================
CStatusUI::~CStatusUI()
{
}

//======================================================
//初期化
//======================================================
HRESULT CStatusUI::Init()
{
	{//ゲージ
		//座標の算出(X:間隔に1つ分のゲージサイズを足している,Y:画面の下端に合わせている)
		D3DXVECTOR3 pos = D3DXVECTOR3(
			(CGauge::SPACE_SIZE * (m_nPlayerNum + 1 + 1)) + (CGauge::MAX_SIZE * m_nPlayerNum + 1),
			SCREEN_HEIGHT - (CGauge::GAUGE_SIZE.y * 0.5f),
			0.0f);

		//生成
		m_pGauge = CGauge::Create(
			pos, 
			D3DXVECTOR2(0.0f, 0.0f),
			D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f),
			m_nPlayerNum);

		switch (m_nPlayerNum)
		{//プレイヤー番号に応じたゲージの色を設定
		case 0:
			m_pGauge->SetCol(D3DXCOLOR(1.0f, 0.0f, 0.0f, 1.0f));	//赤
			break;

		case 1:
			m_pGauge->SetCol(D3DXCOLOR(0.0f, 0.0f, 1.0f, 1.0f));	//青
			break;

		case 2:
			m_pGauge->SetCol(D3DXCOLOR(1.0f, 1.0f, 0.0f, 1.0f));	//黄
			break;

		case 3:
			m_pGauge->SetCol(D3DXCOLOR(0.0f, 1.0f, 0.0f, 1.0f));	//緑
			break;

		default:
			break;
		}
	}

	{//キャラクター背景
		//生成に必要な要素
		D3DXVECTOR3 pos = m_pGauge->GetPos() + D3DXVECTOR3(-40.0f, 0.0f, 0.0f);
		D3DXVECTOR2 size = D3DXVECTOR2(80.0f, 80.0f);

		//生成
		m_pCharaBg = CObject2D::Create(pos, size, 4);

		//テクスチャの設定
		m_pCharaBg->SetTextureKey("CHARACTER_BG");
	}

	{//スキルアイコン背景
		//生成に必要な要素
		D3DXVECTOR3 pos = m_pGauge->GetPos();
		D3DXVECTOR2 size = D3DXVECTOR2(45.0f, 45.0f);

		//生成
		m_pSkillIconBg = CObject2D::Create(pos, size, 4);

		//テクスチャの設定
		m_pSkillIconBg->SetTextureKey("SKILL_ICON_BG");
	}

	return S_OK;
}

//======================================================
//終了
//======================================================
void CStatusUI::Uninit()
{
	//ゲージ
	if (m_pGauge != nullptr)
	{
		m_pGauge->Uninit();
		m_pGauge = nullptr;
	}

	//キャラクター背景
	if (m_pCharaBg != nullptr)
	{
		m_pCharaBg->Uninit();
		m_pCharaBg = nullptr;
	}

	//スキルアイコン背景
	if (m_pSkillIconBg != nullptr)
	{
		m_pSkillIconBg->Uninit();
		m_pSkillIconBg = nullptr;
	}
}

//======================================================
//更新
//======================================================
void CStatusUI::Update()
{
	m_pGauge->Update();	//ゲージ

	m_pCharaBg->Update();	//キャラクター背景

	m_pSkillIconBg->Update();	//スキルアイコン背景
}

//======================================================
//描画
//======================================================
void CStatusUI::Draw()
{
	m_pGauge->Draw();	//ゲージ

	m_pCharaBg->Draw();	//キャラクター背景

	m_pSkillIconBg->Draw();	//スキルアイコン背景
}

//======================================================
//プレイヤー番号の設定
//======================================================
void CStatusUI::SetPlayerNum(int nPlayerNum)
{
	m_nPlayerNum = nPlayerNum;
}