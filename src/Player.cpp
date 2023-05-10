//=============================================================================
// Content     (ゲームの設定)(player.cpp)
// Author     : 有田明玄
//=============================================================================

//-----------------------------------------------------------------------------
//インクルード
//-----------------------------------------------------------------------------
#include"Player.h"
#include"Application.h"
#include"renderer.h"
#include"Camera.h"
#include"input.h"
#include"Shadow.h"
#include"Mesh.h"
#include"ObjectX.h"
#include"Game.h"
#include"PlayerController.h"
#include"sound.h"
#include"Time.h"
#include"effect.h"
#include"Particle.h"
#include"Map.h"
#include "SkillGauge.h"
#include "motion.h"

//-----------------------------------------------------------------------------
//静的メンバ変数
//-----------------------------------------------------------------------------
const float CPlayer::PLAYER_SPEED = 5.0f; 		// 移動速度
const float CPlayer::ITEM_ADD_SPEED = 1.5f;		// アイテムで加算するスピード
int CPlayer::m_nNumPlayer = 0;					// プレイヤーの数

//-----------------------------------------------------------------------------
// コンストラクタ
//-----------------------------------------------------------------------------
CPlayer::CPlayer(int nPriority) :CObject(nPriority)
{
	m_nPlayerNumber = m_nNumPlayer;
	m_nNumPlayer++;

	m_pShadow = CShadow::Create(m_pos, D3DXVECTOR3(80.0f, 0.0f, 80.0f));	// 影
}

//-----------------------------------------------------------------------------
// デストラクタ
//-----------------------------------------------------------------------------
CPlayer::~CPlayer()
{
	m_nNumPlayer--;
}

//-----------------------------------------------------------------------------
// 初期化処理
//-----------------------------------------------------------------------------
HRESULT CPlayer::Init()
{
	//モデルとモーションの読み込み
	for (int i = 0; i < 14; i++)
	{//プレイヤーの生成
		m_apModel[i] = CObjectX::Create();
	}

	m_motion = new CMotion("data/TXT/Player01/Player01.txt");
	m_motion->Update();
	m_Motion = PM_ST_NEUTRAL;	//ニュートラルモーションに変更

	for (int i = 0; i < 14; i++)
	{
		m_apModel[i] = m_motion->GetParts(i);

		//色指定
		if (m_nPlayerNumber == 0)
		{
			m_apModel[i]->SetCol(D3DXCOLOR(1.0f, 0.0f, 0.0f, 1.0f));
		}
		else
		{
			m_apModel[i]->SetCol(D3DXCOLOR(0.0f, 0.0f, 1.0f, 1.0f));
		}
	}

	//初期化
	m_nSkillGauge = 0;
	m_nSkillLv = 0;

	//動的確保
	m_controller = new CPlayerController(m_nPlayerNumber);

	//スキルゲージの座標の算出(X:間隔に1つ分のゲージサイズを足している,Y:画面の下端に合わせている)
	D3DXVECTOR3 SkillPos = D3DXVECTOR3((CGauge::SPACE_SIZE * (m_nPlayerNumber + 1)) + (CGauge::MAX_SIZE * m_nPlayerNumber), SCREEN_HEIGHT - (CGauge::GAUGE_SIZE.y / 2.0f), 0.0f);
	
	//スキルゲージの生成
	switch (m_nPlayerNumber)
	{
		case 0:
			CGauge::Create(SkillPos, D3DXVECTOR2(0.0f, 0.0f), D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f), m_nPlayerNumber);
			break;

		case 1:
			CGauge::Create(SkillPos, D3DXVECTOR2(0.0f, 0.0f), D3DXCOLOR(0.0f, 1.0f, 1.0f, 1.0f), m_nPlayerNumber);
			break;

		case 2:
			CGauge::Create(SkillPos, D3DXVECTOR2(0.0f, 0.0f), D3DXCOLOR(0.0f, 0.0f, 1.0f, 1.0f), m_nPlayerNumber);
			break;

		case 3:
			CGauge::Create(SkillPos, D3DXVECTOR2(0.0f, 0.0f), D3DXCOLOR(1.0f, 1.0f, 1.0f, 0.5f), m_nPlayerNumber);
			break;

	default:
		break;
	}
	

	return S_OK;
}

//-----------------------------------------------------------------------------
// 終了処理
//-----------------------------------------------------------------------------
void CPlayer::Uninit(void)
{
	if (m_pShadow != nullptr)
	{
		m_pShadow = nullptr;
	}	

	if (m_controller != nullptr)
	{
		delete m_controller;
		m_controller = nullptr;
	}

	if (m_motion != nullptr)
	{
		m_motion->Uninit();
		delete m_motion;
		m_motion = nullptr;
	}
	
	CObject::Release();
}

//-----------------------------------------------------------------------------
// 更新処理
//-----------------------------------------------------------------------------
void CPlayer::Update(void)
{
	if ((CGame::GetGame() != CGame::GAME_END) && (CGame::GetGame() != CGame::GAME_START))
	{
		//Input();				//入力処理
		CInput* pInput = CInput::GetKey();
		
		if (m_nBuffTime > 0)
		{//強化効果の時間を減算する
			m_nBuffTime--;
		}

		if (m_nBuffTime <= 0 && m_State != PST_STAND)
		{//デフォルトに戻す
			m_State = PST_STAND;
		}

		Updatepos();			// 座標更新

		//移動
		Move();

		//スキル処理
		Skill();

		m_motion->Update();

		Normalization();		// 角度の正規化
		m_pShadow->SetPos({ m_pos.x, 1.0f, m_pos.z });

		BlockCollision();

#ifdef _DEBUG
		CDebugProc::Print("現在のプレイヤーの座標:%f %f %f\n", m_pos.x, m_pos.y, m_pos.z);
		CDebugProc::Print("現在のモーション:%d\n", (int)m_Motion);
		CDebugProc::Print("現在の状態:%d\n", (int)m_State);
		CDebugProc::Print("現在のフレーム:%d\n", m_frame);

		if (pInput->Trigger(DIK_U))
		{
			m_nBuffTime = 120;
			m_State = PST_SPEED;
		}
		if (pInput->Trigger(DIK_T))
		{
			m_Motion == PM_ST_NEUTRAL ? m_Motion = PM_ST_MOVE : m_Motion = PM_ST_NEUTRAL;
			m_motion->SetNumMotion(m_Motion);
		}
#endif // _DEBUG
	}
}

//-----------------------------------------------------------------------------
// 描画処理
//-----------------------------------------------------------------------------
void CPlayer::Draw(void)
{
	//デバイスへのポインタ
	LPDIRECT3DDEVICE9 pDevice = CApplication::getInstance()->GetRenderer()->GetDevice();

	D3DXMATRIX mtxRot, mtxTrans;	//計算用マトリックス
	D3DMATERIAL9 matDef;			//現在のマテリアル保存用

	//現在のマテリアルを維持
	pDevice->GetMaterial(&matDef);

	//パーツのワールドマトリックスの初期化
	D3DXMatrixIdentity(&m_mtxWorld);

	//パーツのモデルの向きを反映
	D3DXMatrixRotationYawPitchRoll(&mtxRot, m_rot.y, m_rot.x, m_rot.z);
	D3DXMatrixMultiply(&m_mtxWorld, &m_mtxWorld, &mtxRot);

	//パーツのモデルの位置を反映
	D3DXMatrixTranslation(&mtxTrans, m_pos.x, m_pos.y, m_pos.z);
	D3DXMatrixMultiply(&m_mtxWorld, &m_mtxWorld, &mtxTrans);

	//ワールドマトリックスの設定
	pDevice->SetTransform(D3DTS_WORLD, &m_mtxWorld);

	for (int i = 0; i < 14; i++)
	{
		if (m_apModel[i]->GetParent() == nullptr)
		{
			m_apModel[i]->SetParentMatrix(&m_mtxWorld);
		}
	}
}

//-----------------------------------------------------------------------------
// 生成
//-----------------------------------------------------------------------------
CPlayer * CPlayer::Create(D3DXVECTOR3 pos, D3DXVECTOR3 rot)
{
	CPlayer*pPlayer;
	pPlayer = new CPlayer(CObject::OBJTYPE_MODEL);
	pPlayer->m_pos = pos;
	pPlayer->m_rot = rot;
	pPlayer->Init();

	return pPlayer;
}

//-----------------------------------------------------------------------------
// 入力設定
//-----------------------------------------------------------------------------
void CPlayer::Input()
{
	CInput* pInput = CInput::GetKey();
	int Key = 0;
	pInput->PressDevice(KEY_DOWN_RIGHT);
	//レバー
	{
		//下
		Key |= pInput->Press(DIK_S) || pInput->Press(JOYPAD_DOWN, m_nPlayerNumber)|| pInput->Press(JOYPAD_DOWN_LEFT, m_nPlayerNumber) || pInput->Press(JOYPAD_DOWN_RIGHT, m_nPlayerNumber) ? INPUT2 : INPUT_NOT2;
		//左
		Key |= pInput->Press(DIK_A) || pInput->Press(JOYPAD_LEFT, m_nPlayerNumber) || pInput->Press(JOYPAD_DOWN_LEFT, m_nPlayerNumber) || (pInput->Press(JOYPAD_UP_LEFT, m_nPlayerNumber)) ? INPUT4 : INPUT_NOT4;
		//右
		Key |= pInput->Press(DIK_D) || pInput->Press(JOYPAD_RIGHT, m_nPlayerNumber) || (pInput->Press(JOYPAD_UP_RIGHT, m_nPlayerNumber)) || pInput->Press(JOYPAD_DOWN_RIGHT, m_nPlayerNumber) ? INPUT6 : INPUT_NOT6;
		//上
		Key |= pInput->Press(DIK_W) || pInput->Press(JOYPAD_UP, m_nPlayerNumber) || (pInput->Press(JOYPAD_UP_RIGHT, m_nPlayerNumber)) || (pInput->Press(JOYPAD_UP_LEFT, m_nPlayerNumber)) ? INPUT8 : INPUT_NOT8;

		//ニュートラル
		Key |= (Key & INPUT_NOT6) == INPUT_NOT6 && (Key & INPUT_NOT2) == INPUT_NOT2 && (Key & INPUT_NOT4) == INPUT_NOT4 && (Key & INPUT_NOT8) == INPUT_NOT8 ? INPUT5 : INPUT_NOT5;
	}
}

//-----------------------------------------------------------------------------
// 移動
//-----------------------------------------------------------------------------
void CPlayer::Move()
{
	if (m_controller == nullptr)
	{
		assert(false);
		return;
	}

	// 方向ベクトル掛ける移動量
	if (m_State == PST_SPEED)
	{
		m_move = m_controller->Move() * PLAYER_SPEED * ITEM_ADD_SPEED;
	}
	else
	{
		m_move = m_controller->Move() * PLAYER_SPEED;
	}
}

//-----------------------------------------------------------------------------
// コントローラーの設定
//-----------------------------------------------------------------------------
void CPlayer::SetController(CController * inOperate)
{
	m_controller = inOperate;
	m_controller->SetToOrder(this);
}

//-----------------------------------------------------------------------------
// 座標の更新
//-----------------------------------------------------------------------------
void CPlayer::Updatepos()
{
	m_posold = m_pos;		//前回の位置の保存
	m_pos += m_move;		//位置の更新
}

//-----------------------------------------------------------------------------
// 角度の正規化
//-----------------------------------------------------------------------------
void CPlayer::Normalization()
{
	//角度の正規化
	if (m_rot.y >= D3DX_PI)
	{
		m_rot.y -= D3DX_PI * 2;
	}
	else if (m_rot.y <= -D3DX_PI)
	{
		m_rot.y += D3DX_PI * 2;
	}
}

//-----------------------------------------------------------------------------
// ブロックとの判定
//-----------------------------------------------------------------------------
void CPlayer::BlockCollision()
{
	for (int i = 0; i < CGame::GetMap()->GetBlockCount(); i++)
	{
		CBlock* pBlock = CGame::GetMap()->GetBlock(i);

		if (pBlock == nullptr)
		{
			continue;
		}

		if (m_pos.x <= pBlock->GetPos().x + (pBlock->GetSize().x * 0.5f) && m_pos.x >= pBlock->GetPos().x - (pBlock->GetSize().x * 0.5f))
		{//X軸
			if (m_pos.z <= pBlock->GetPos().z + (pBlock->GetSize().z * 0.5f) && m_pos.z >= pBlock->GetPos().z - (pBlock->GetSize().z * 0.5f))
			{//Z軸
				if(pBlock->GetNumber() != m_nPlayerNumber && m_nSkillGauge < MAX_GAUGE)
				{//自分以外の色を塗り替えていたらゲージの加算
					m_nSkillGauge++;
				}
					pBlock->SetPlayerNumber(m_nPlayerNumber);	//プレイヤーの
					m_pOnBlock = pBlock;						//乗っているブロックを設定
			}
		}
	}
}

//-----------------------------------------------------------------------------
// スキル処理
//-----------------------------------------------------------------------------
void CPlayer::Skill()
{
	//インプットの取得
	CInput* pInput = CInput::GetKey();

	//ゲージの量によってスキルLvを決める
	if (m_nSkillGauge == MAX_GAUGE)
	{
		m_nSkillLv = 3;
	}
	else if(m_nSkillGauge >= 7)
	{
		m_nSkillLv = 2;
	}
	else if(m_nSkillGauge >= 3)
	{
		m_nSkillLv = 1;
	}
	else
	{
		m_nSkillLv = 0;
	}

	switch (m_nSkillLv)
	{
	case 1:
		if(pInput->Trigger(DIK_K))
		{
			m_nSkillGauge -= 3;
			m_nBuffTime = 60;
			m_State = PST_SPEED;
		}
		break;

	case 2:
		if (pInput->Trigger(DIK_K))
		{
			m_nSkillGauge -= 7;
			m_nBuffTime = 120;
			m_State = PST_SPEED;
		}
		break;

	case 3:
		if (pInput->Trigger(DIK_K))
		{
			m_nSkillGauge -= 10;
			m_nBuffTime = 300;
			m_State = PST_SPEED;
		}
		break;

	default:
		break;
	}
}