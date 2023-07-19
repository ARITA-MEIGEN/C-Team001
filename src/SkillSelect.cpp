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
#include"CameraGame.h"
#include"Light.h"
#include"Bg.h"

#include "Object3D.h"

//====================================
// 定数
//====================================
int CSkillSelect::m_nSkill[MAX_PLAYER] = {};
int CSkillSelect::m_inputNumber[MAX_PLAYER] = {};

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
	{
		CObject3D* pori = CObject3D::Create(D3DXVECTOR3(0.0f, 0.0f, 500.0f), D3DXVECTOR3(5000.0f, 0.0f, 5000.0f), 2);
		pori->SetTextureKey("TEST_FLOOR");
		pori->SetRot(D3DXVECTOR3(-1.5f,0.0f,0.0f));
	}

	//カメラの設定
	m_pCamera = CCameraGame::Create();
	m_pCamera->SetPosV(D3DXVECTOR3(0.0f, 250.0f, -400.0f));
	m_pCamera->SetPosR(D3DXVECTOR3(0.0f, 250.0f, 200.0f));

	//ライトの設定
	m_pLight = new CLight;
	m_pLight->Init();

	//初期化
	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{
		m_inputNumber[nCnt] = 99;		// 絶対に有り得ない数字を代入
		m_nSkill[nCnt] = 1;
		m_pObj2D[nCnt] = CObject2D::Create(D3DXVECTOR3(200.0f + (300.0f * nCnt), 600.0f, 0.0f), D3DXVECTOR2(150.0f, 80.0f), 5);
		m_pPlayer[nCnt] = CPlayer::Create(D3DXVECTOR3(-(130.0f * 1.5f) + (150.0f * nCnt), 250.0f, 0.0f), D3DXVECTOR3(0.0f, D3DX_PI, 0.0f));
	}

	//背景
	//m_pBg = CBg::Create();	//生成

	return S_OK;
}

//====================================
//終了
//====================================
void CSkillSelect::Uninit()
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

	//背景
	if (m_pBg != nullptr)
	{
		m_pBg = nullptr;
	}
}

//====================================
//更新
//====================================
void CSkillSelect::Update()
{
	//更新処理
	m_pCamera->Update();
	m_pLight->Update();

	// エントリー処理
	Entry();

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
	m_pCamera->Set();
}

//====================================
//入力
//====================================
void CSkillSelect::Input()
{
	//インプットの情報を取得
	CInput* pInput = CInput::GetKey();

	//フェードしていなければ
	if (CApplication::getInstance()->GetFade()->GetFade() != CFade::FADE_NONE)
	{
		return;
	}
	
	//左入力で左を選択
	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{//プレイヤーごとに分ける

		if (m_inputNumber[nCnt] == 99)
		{
			continue;
		}

		if (m_nSkill[nCnt] >= 1)
		{//左端ではないなら左へ
			if (pInput->Trigger(KEY_LEFT, m_inputNumber[nCnt]))
			{
				m_nSkill[nCnt]--;
			}
		}
	}

	//右入力で右を選択
	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{//プレイヤーごとに分ける

		if (m_inputNumber[nCnt] == 99)
		{
			continue;
		}

		if (m_nSkill[nCnt] <= 2)
		{//右端ではないなら右へ
			if (pInput->Trigger(KEY_RIGHT, m_inputNumber[nCnt]))
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

	if ((pInput->Trigger(KEY_DECISION)))	// ENTERキー
	{//エンターでゲームに
	 //モード設定
		CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_GAME);
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

//====================================
//エントリー
//====================================
void CSkillSelect::Entry()
{
	CInput* pInput = CInput::GetKey();
	std::vector<int> inputNumber = pInput->TriggerDevice(KEY_DECISION);

	// 入力デバイスが設定したデバイスか否か検出。既に設定されていたらコンテナから削除
	for (auto it = inputNumber.begin(); it != inputNumber.end();)
	{
		bool isErase = false;

		for (int j = 0; j < 4; j++)
		{
			if (m_inputNumber[j] == *it)
			{
				isErase = true;
				break;
			}
		}

		// 条件一致した要素を削除する
		if (isErase)
		{
			// 削除された要素の次を指すイテレータが返される。
			it = inputNumber.erase(it);
		}
		else
		{
			++it;
		}
	}

	// 値を代入。
	for (size_t i = 0; i < inputNumber.size(); i++)
	{
		for (int j = 0; j < 4; j++)
		{
			if (m_inputNumber[j] == 99)
			{
				m_inputNumber[j] = inputNumber[i];
				break;
			}
		}
	}

	CDebugProc::Print("\nNumber : %d %d %d %d", m_inputNumber[0], m_inputNumber[1], m_inputNumber[2], m_inputNumber[3]);
}
