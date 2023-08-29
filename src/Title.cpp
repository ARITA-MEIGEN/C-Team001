//=============================================================================
//
// オブジェクト
// Author : 有田明玄
//
//=============================================================================
//インクルード
#include"main.h"
#include"Title.h"
#include"Application.h"
#include"input.h"
#include"Fade.h"
#include"Object3D.h"
#include"renderer.h"
#include"sound.h"
#include "camera.h"
#include "sky_bg.h"

#include "Block.h"
#include "Light.h"

//====================================
//コンストラクタ
//====================================
CTitle::CTitle()
{
}

//====================================
//デストラクタ
//====================================
CTitle::~CTitle()
{

}

//====================================
//初期化
//====================================
HRESULT CTitle::Init()
{
	m_camera = CCamera::Create();
	m_camera->SetPosR(D3DXVECTOR3(0.0f,0.0f,0.0f));
	m_camera->SetPosV(D3DXVECTOR3(0.0f,0.0f,-250.0f));

	//ライトの設定
	CLight* light = new CLight;
	light->Init();

	// L
	{
		CBlock* block = CBlock::Create(D3DXVECTOR3(150.0f, -5.0f, 0.0f));
		block->CancelPermitSink();
		block->SetPlanPos(D3DXVECTOR3(-(65.0f * 1.5f) + (30.0f * 0), -5.0f, 0.0f));
		block->SetRot(D3DXVECTOR3(0.0f, 0.0f, D3DX_PI * 0.5f));
	}

	// I
	{
		CBlock* block = CBlock::Create(D3DXVECTOR3(150.0f, -5.0f, 0.0f));
		block->CancelPermitSink();
		block->SetPlanPos(D3DXVECTOR3(-(65.0f * 1.5f) + (30.0f * 1), -5.0f, 0.0f));
		block->SetRot(D3DXVECTOR3(0.0f, 0.0f, D3DX_PI * 0.5f));
	}

	// N
	{
		CBlock* block = CBlock::Create(D3DXVECTOR3(150.0f, -5.0f, 0.0f));
		block->CancelPermitSink();
		block->SetPlanPos(D3DXVECTOR3(-(65.0f * 1.5f) + (30.0f * 2), -5.0f, 0.0f));
		block->SetRot(D3DXVECTOR3(0.0f, 0.0f, D3DX_PI * 0.5f));
	}

	// K
	{
		CBlock* block = CBlock::Create(D3DXVECTOR3(150.0f, -5.0f, 0.0f));
		block->CancelPermitSink();
		block->SetPlanPos(D3DXVECTOR3(-(65.0f * 1.5f) + (30.0f * 3), -5.0f, 0.0f));
		block->SetRot(D3DXVECTOR3(0.0f, 0.0f, D3DX_PI * 0.5f));
	}

	// R
	{
		CBlock* block = CBlock::Create(D3DXVECTOR3(150.0f, -5.0f, 0.0f));
		block->CancelPermitSink();
		block->SetPlanPos(D3DXVECTOR3(-(65.0f * 1.5f) + (30.0f * 4), -5.0f, 0.0f));
		block->SetRot(D3DXVECTOR3(0.0f, 0.0f, D3DX_PI * 0.5f));
	}

	// O
	{
		CBlock* block = CBlock::Create(D3DXVECTOR3(150.0f, -5.0f, 0.0f));
		block->CancelPermitSink();
		block->SetPlanPos(D3DXVECTOR3(-(65.0f * 1.5f) + (30.0f * 5), -5.0f, 0.0f));
		block->SetRot(D3DXVECTOR3(0.0f, 0.0f, D3DX_PI * 0.5f));
	}

	// I
	{
		CBlock* block = CBlock::Create(D3DXVECTOR3(150.0f, -5.0f, 0.0f));
		block->CancelPermitSink();
		block->SetPlanPos(D3DXVECTOR3(-(65.0f * 1.5f) + (30.0f * 6), -5.0f, 0.0f));
		block->SetRot(D3DXVECTOR3(0.0f, 0.0f, D3DX_PI * 0.5f));
	}

	// D
	{
		CBlock* block = CBlock::Create(D3DXVECTOR3(150.0f, -5.0f, 0.0f));
		block->CancelPermitSink();
		block->SetPlanPos(D3DXVECTOR3(-(65.0f * 1.5f) + (30.0f * 7), -5.0f, 0.0f));
		block->SetRot(D3DXVECTOR3(0.0f, 0.0f, D3DX_PI * 0.5f));
	}

	//背景の生成
	{
		CSkyBg::Create();

		CObject3D* pori = CObject3D::Create(D3DXVECTOR3(0.0f, -50.0f, 0.0f), D3DXVECTOR3(4000.0f, 0.0f, 2000.0f), 2);
		pori->SetUV(0.0f, 20.0f, 0.0f, 20.0f);
		pori->SetTextureKey("TEST_FLOOR");
	}

	return S_OK;
}

//====================================
//終了
//====================================
void CTitle::Uninit()
{
}

//====================================
//更新
//====================================
void CTitle::Update()
{
	CInput* pInput = CInput::GetKey();

		//指定のキーが押されたかどうか
	if (CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
	{
		if (pInput->Trigger(KEY_ALL))
		{
			CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_MAP);
		}
	}
}

//====================================
//描画
//====================================
void CTitle::Draw()
{
	m_camera->Set();
}
