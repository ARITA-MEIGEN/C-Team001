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
std::vector<int> CSkillSelect::m_inputNumber = {};
bool CSkillSelect::m_isDecision[MAX_PLAYER] = {};

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
	CCamera* camera = AttachCamera(CCamera::Create());
	camera->SetPosV(D3DXVECTOR3(0.0f, 250.0f, -400.0f));
	camera->SetPosR(D3DXVECTOR3(0.0f, 250.0f, 200.0f));

	//ライトの設定
	m_pLight = new CLight;
	m_pLight->Init();

	m_inputNumber.resize(4);

	//初期化
	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{
		m_isPlayerCheck[nCnt] = false;
		m_isDecision[nCnt] = false;
		m_inputNumber[nCnt] = 99;		// 絶対に有り得ない数字を代入
		m_nSkill[nCnt] = 1;
		m_pObj2D[nCnt] = CObject2D::Create(D3DXVECTOR3(200.0f + (300.0f * nCnt), 600.0f, 0.0f), D3DXVECTOR2(150.0f, 80.0f), 5);
		m_pPlayer[nCnt] = CPlayer::Create(D3DXVECTOR3(-(130.0f * 1.5f) + (150.0f * nCnt), 250.0f, 0.0f), D3DXVECTOR3(0.0f, D3DX_PI, 0.0f));
	}

	return S_OK;
}

//====================================
//終了
//====================================
void CSkillSelect::Uninit()
{
	CSound::GetInstance()->Stop();

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
	CMode::Update();
	m_pLight->Update();

	//フェードしていなければ
	if (CApplication::getInstance()->GetFade()->GetFade() != CFade::FADE_NONE)
	{
		return;
	}

	//入力処理
	Input();

	// エントリー処理
	Entry();

	//選択処理
	Texture();
}

//====================================
//入力
//====================================
void CSkillSelect::Input()
{
	//インプットの情報を取得
	CInput* pInput = CInput::GetKey();
	
	// プレイヤーが全員選択中だったら
	if (m_isPlayerCheck[0] && m_isPlayerCheck[1] && m_isPlayerCheck[2] && m_isPlayerCheck[3])
	{
		if (m_inputNumber[0] != 99)
		{
			if (pInput->Trigger(KEY_DECISION, m_inputNumber[0]))		//ENTERキー
			{//エンターでゲームに
			 //モード設定
				CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_GAME);
			}
		}
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
			if (pInput->Trigger(KEY_LEFT, m_inputNumber[nCnt]) && !m_isPlayerCheck[nCnt])
			{
				m_nSkill[nCnt]--;
			}
		}

		if (m_nSkill[nCnt] <= 2)
		{//右端ではないなら右へ
			if (pInput->Trigger(KEY_RIGHT, m_inputNumber[nCnt]) && !m_isPlayerCheck[nCnt])
			{
				m_nSkill[nCnt]++;
			}
		}

		if (m_inputNumber[nCnt] != -1 && !m_isPlayerCheck[nCnt] && pInput->Trigger(JOYPAD_B, m_inputNumber[nCnt]) || m_inputNumber[nCnt] == -1 && !m_isPlayerCheck[nCnt] && pInput->Trigger(DIK_RETURN, m_inputNumber[nCnt]))
		{//パッドのBボタンで決定する(キーボードはV)
			m_isPlayerCheck[nCnt] = true;
		}
		else if (m_inputNumber[nCnt] != -1 && m_isPlayerCheck[nCnt] &&  pInput->Trigger(JOYPAD_A, m_inputNumber[nCnt]) || m_inputNumber[nCnt] == -1 && m_isPlayerCheck[nCnt] && pInput->Trigger(DIK_B, m_inputNumber[nCnt]))
		{//パッドのAボタンで解除する(キーボードはB)
			m_isPlayerCheck[nCnt] = false;
		}
	}

#ifdef _DEBUG
	CDebugProc::Print("\nキーボードはVで決定、Bで解除");
	CDebugProc::Print("\nPlayerCheck : %d %d %d %d", m_isPlayerCheck[0], m_isPlayerCheck[1], m_isPlayerCheck[2], m_isPlayerCheck[3]);
#endif // _DEBUG
}

//====================================
//選択
//====================================
void CSkillSelect::Texture()
{
	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{
		if (m_inputNumber[nCnt] == 99)
		{
			continue;
		}

		if (m_isPlayerCheck[nCnt])
		{//プレイヤーの能力を表すテクスチャ1
			m_pObj2D[nCnt]->SetTextureKey("CHECK_MARK");
		}
		else if (m_nSkill[nCnt] == 0)
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

	for (size_t i = 0;i < inputNumber.size();i++)
	{
		if (std::find(m_inputNumber.begin(), m_inputNumber.end(), inputNumber[i]) == m_inputNumber.end())
		{
			for (int j = 0; j < m_inputNumber.size(); j++)
			{
				if (m_inputNumber[j] == 99)
				{
					m_inputNumber[j] = inputNumber[i];
					break;
				}
			}
		}
	}
	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{
		if (m_inputNumber[nCnt] == 99)
		{
			//コントローラーが登録されていなかったらtrueにしておく
			m_isPlayerCheck[nCnt] = true;

			continue;
		}
		else if (m_inputNumber[nCnt] != 99 && !m_isDecision[nCnt])
		{
			//コントローラーが登録されたら一度のみfalseに戻す
			m_isPlayerCheck[nCnt] = false;
			m_isDecision[nCnt] = true;
		}
	}

#ifdef _DEBUG
	CDebugProc::Print("\nNumber : %d %d %d %d", m_inputNumber[0], m_inputNumber[1], m_inputNumber[2], m_inputNumber[3]);
#endif // _DEBUG
}