//=============================================================================
//
// タイマー
// Author : 有田明玄
//
//=============================================================================

//インクルード
#include"renderer.h"
#include"Application.h"
#include"Object.h"
#include"Game.h"
#include"Player.h"
#include "Time.h"
#include"sound.h"

//=============================================================================
// コンストラクタ
//=============================================================================
CTimer::CTimer(int /*nPriority*/)
{
}

//=============================================================================
// デストラクタ
//=============================================================================
CTimer::~CTimer()
{

}

//=============================================================================
// 初期化
//=============================================================================
HRESULT CTimer::Init()
{
	m_pObject2D = new CObject2D(CObject::OBJTYPE_UI);
	m_pObject2D->Init();
	m_pObject2D->SetSiz(D3DXVECTOR2(100.0f, 100.0f));
	m_pObject2D->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));
	m_pObject2D->SetTextureKey("TIMER");
	m_pObject2D->SetPos(D3DXVECTOR3(SCREEN_WIDTH/2, 60.0f, 0.0f));

	for (int i = 0; i < 2; i++)
	{
		m_apNumber[i] = new CObject2D(CObject::OBJTYPE_UI);
		m_apNumber[i]->Init();
		m_apNumber[i]->SetSiz(D3DXVECTOR2(40.0f, 80.0f));
		m_apNumber[i]->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));
		m_apNumber[i]->SetTextureKey("NUMBER");
	}
	m_apNumber[0]->SetPos(D3DXVECTOR3(SCREEN_WIDTH * 0.5f - 17.0f, 70.0f, 0.0f));
	m_apNumber[1]->SetPos(D3DXVECTOR3(SCREEN_WIDTH * 0.5f + 17.0f, 70.0f, 0.0f));
	m_nTimer = DEFAULT_TIME;
	m_apNumber[0]->SetUV(0.1f*(m_nTimer / 10), 0.1f*((m_nTimer / 10) + 1), 0.0f, 1.0f);
	m_apNumber[1]->SetUV(0.1f*(m_nTimer % 10), 0.1f*((m_nTimer % 10) + 1), 0.0f, 1.0f);

	return S_OK;
}

//=============================================================================
//終了
//=============================================================================
void CTimer::Uninit()
{

}

//=============================================================================
// 更新
//=============================================================================
void CTimer::Update()
{
	m_nCreateTimer++;
	if (m_nCreateTimer % 60 == 0)
	{
		m_nTimer--;
		if (m_nTimer < 0)
		{
			m_nTimer++;
		}
		m_apNumber[0]->SetUV(0.1f*(m_nTimer / 10), 0.1f*((m_nTimer / 10) + 1),0.0f, 1.0f);
		m_apNumber[1]->SetUV(0.1f*(m_nTimer % 10), 0.1f*((m_nTimer % 10) + 1), 0.0f, 1.0f);
	}
}

//=============================================================================
// 描画
//=============================================================================
void CTimer::Draw()
{

}

//=============================================================================
// 背景生成
//=============================================================================
CTimer * CTimer::Create()
{
	CTimer*pLife;
	pLife = new CTimer;
	if (pLife != nullptr)
	{// ポリゴンの初期化処理
		pLife->Init();
	}
	return pLife;
}
