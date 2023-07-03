//=============================================================================
//
// マップ選択
// Author : 髙野馨將
//
//=============================================================================

//インクルード
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
//コンストラクタ
//====================================
CMapSelect::CMapSelect()
{
}

//====================================
//デストラクタ
//====================================
CMapSelect::~CMapSelect()
{
}

//====================================
//初期化
//====================================
HRESULT CMapSelect::Init()
{
	//初期化
	m_nMapNumber = 0;
	m_bMapChange = false;

	//カメラの設定
	m_pCamera = CCameraGame::Create();

	//ライトの設定
	m_pLight = new CLight;
	m_pLight->Init();

	//マップ生成
	m_pMap = CMap::Create(m_nMapNumber);

	return S_OK;
}

//====================================
//終了
//====================================
void CMapSelect::Uninit()
{
	CSound::GetInstance()->Stop();

	//カメラの設定
	if (m_pCamera != nullptr)
	{
		m_pCamera->Uninit();
		delete m_pCamera;
	}

	//ライトの設定
	if (m_pLight != nullptr)
	{
		m_pLight->Uninit();
		delete m_pLight;
	}

	//マップの終了
	if (m_pMap != nullptr)
	{
		delete m_pMap;
	}
}

//====================================
//更新
//====================================
void CMapSelect::Update()
{
	//更新処理
	m_pCamera->Update();
	m_pLight->Update();

	//入力処理
	Input();

	if (m_bMapChange)
	{
		//選択処理
		Select();
	}
}

//====================================
//描画
//====================================
void CMapSelect::Draw()
{
	m_pCamera->Set();
}

//====================================
//入力
//====================================
void CMapSelect::Input()
{
	//インプットの情報を取得
	CInput* pInput = CInput::GetKey();

	//フェードしていなければ
	if (CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
	{
		//左入力で左を選択
		if (m_nMapNumber >= (CMap::STAGE_01 + 1))
		{//左端ではないなら左へ
			if (pInput->Trigger(JOYPAD_LEFT)|| pInput->Trigger(DIK_O))
			{
				m_nMapNumber--;
				m_bMapChange = true;
			}
		}

		//右入力で右を選択
		if (m_nMapNumber <= (CMap::STAGE_MAX - 2))
		{//右端ではないなら右へ
			if (pInput->Trigger(JOYPAD_RIGHT) || pInput->Trigger(DIK_P))
			{
				m_nMapNumber++;
				m_bMapChange = true;
			}
		}

		if ((pInput->Trigger(DIK_RETURN)) == true || (pInput->Trigger(JOYPAD_B)))		//ENTERキー
		{//エンターでスキル選択に
		 //モード設定
			CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_SKILL);
		}
	}
}

//====================================
//選択
//====================================
void CMapSelect::Select()
{
	//マップの終了
	if (m_pMap != nullptr)
	{
		m_pMap->Uninit();
		delete m_pMap;
		m_pMap = nullptr;
	}
	//表示されているマップを変える
	m_pMap = CMap::Create(m_nMapNumber);

	//マップの変更を止める
	m_bMapChange = false;
}