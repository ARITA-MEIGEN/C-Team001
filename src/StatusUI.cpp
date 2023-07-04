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
// 定数
//======================================================
const D3DXVECTOR3 CStatusUI::GAUGE_LOCAL_POS	(-10.0f,0.0f,0.0f);
const D3DXVECTOR2 CStatusUI::GAUGE_SIZE			(0.0f,0.0f);

const D3DXVECTOR3 CStatusUI::CHARACTER_BG_LOCAL_POS	(-40.0f,-30.0f,0.0f);
const D3DXVECTOR2 CStatusUI::CHARACTER_BG_SIZE		(80.0f, 80.0f);

const D3DXVECTOR3 CStatusUI::SKILL_ICON_BG_LOCAL_POS	(0.0f,0.0f,0.0f);
const D3DXVECTOR2 CStatusUI::SKILL_ICON_BG_SIZE			(45.0f, 45.0f);

//======================================================
//生成
//======================================================
CStatusUI *CStatusUI::Create(const D3DXVECTOR3& inPos,int nPlayerNum)
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
	pStatusUI->SetPos(inPos);

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
	
		//生成
		m_pGauge = CGauge::Create(
			m_pos,
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
		D3DXVECTOR3 pos(0.0f, 0.0f, 0.0f);

		m_pCharaBg = CObject2D::Create(pos, CHARACTER_BG_SIZE, 4);	//生成
		m_pCharaBg->SetTextureKey("CHARACTER_BG");					//テクスチャの設定
	}

	{//スキルアイコン背景
		//生成に必要な要素
		D3DXVECTOR3 pos(0.0f, 0.0f, 0.0f);

		m_pSkillIconBg = CObject2D::Create(pos, SKILL_ICON_BG_SIZE, 4);	//生成
		m_pSkillIconBg->SetTextureKey("SKILL_ICON_BG");					//テクスチャの設定
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
// 位置設定
//======================================================
void CStatusUI::SetPos(const D3DXVECTOR3 & inPos)
{
	m_pos = inPos;
	m_pGauge->SetPos(m_pos + GAUGE_LOCAL_POS);					//スキルゲージ
	m_pCharaBg->SetPos(m_pos + CHARACTER_BG_LOCAL_POS);			//キャラクター背景
	m_pSkillIconBg->SetPos(m_pos + SKILL_ICON_BG_LOCAL_POS);	//スキルアイコン背景
}

//======================================================
//プレイヤー番号の設定
//======================================================
void CStatusUI::SetPlayerNum(int nPlayerNum)
{
	m_nPlayerNum = nPlayerNum;
}