//=============================================================================
// Content     (ゲームの設定)(player.cpp)
// Author     : 有田明玄
//=============================================================================

//-----------------------------------------------------------------------------
//インクルード
//-----------------------------------------------------------------------------
#include "Player.h"
#include "PlayerController.h"
#include "Application.h"
#include "sound.h"
#include "renderer.h"
#include "input.h"

#include "Item.h"
#include "Shadow.h"
#include "Mesh.h"
#include "Game.h"
#include "Time.h"
#include "effect.h"
#include "Particle.h"
#include "Map.h"
#include "SkillGauge.h"
#include "motion.h"

//-----------------------------------------------------------------------------
// 定数
//-----------------------------------------------------------------------------
const std::string CPlayer::MOTION_PATH = "data/TXT/Player01/Player01.txt";	// モーションデータパス
const float CPlayer::PLAYER_SPEED = 2.0f; 		// 移動速度
const float CPlayer::ADD_SPEED = 1.5f;			// アイテムで加算するスピード
const float CPlayer::SKILL_BUFF_TIME = 60.0f;	// バフの効果時間

//-----------------------------------------------------------------------------
// 静的メンバ変数
//-----------------------------------------------------------------------------
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
	// モーションの読込み
	m_motion = new CMotion(MOTION_PATH.data());
	m_Motion = PM_ST_NEUTRAL;	//ニュートラルモーションに変更

	//モデルとモーションの読み込み
	m_apModel = m_motion->GetParts();

	for (int i = 0; i < m_apModel.size(); i++)
	{
		//色指定
		switch (m_nPlayerNumber)
		{
		case 0:
			m_apModel[i]->SetCol(D3DXCOLOR(1.0f, 0.0f, 0.0f, 1.0f));
			break;
		case 1:
			m_apModel[i]->SetCol(D3DXCOLOR(0.0f, 0.0f, 1.0f, 1.0f));
			break;
		case 2:
			m_apModel[i]->SetCol(D3DXCOLOR(1.0f, 1.0f, 0.0f, 1.0f));
			break;
		case 3:
			m_apModel[i]->SetCol(D3DXCOLOR(0.0f, 1.0f, 0.0f, 1.0f));
			break;
		default:
			break;
		}
	}

	//動的確保
	m_nSkillGauge = 0;
	m_nSkillLv = 0;

	//動的確保
	m_controller = new CPlayerController(m_nPlayerNumber);

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
	if (!(CGame::GetGame() != CGame::GAME_END) && !(CGame::GetGame() != CGame::GAME_START))
	{
		return;
	}

	CInput* pInput = CInput::GetKey();

	// スキル処理
	Skill();

	if (m_nSkillBuffTime > 0)
	{// スキル強化効果の時間を減算する
		m_nSkillBuffTime--;
	}
	if (m_nItemBuffTime > 0)
	{// アイテム強化効果の時間を減算する
		m_nItemBuffTime--;
	}

	if (m_nSkillBuffTime <= 0 && m_State != PST_STAND)
	{// スキルを使った後に効果時間が切れたらデフォルトに戻す
		m_State = PST_STAND;
	}
	if (m_nItemBuffTime <= 0 && m_ItemState != ITEM_NONE)
	{// アイテムを拾った後に効果時間が切れたらデフォルトに戻す
		m_ItemState = ITEM_NONE;
	}

	// 座標更新
	Updatepos();

	// モーション
	m_motion->Update();

	// 移動
	Move();

	// 回転
	TurnLookAtMoveing();

	Normalization();		// 角度の正規化
	m_pShadow->SetPos({ m_pos.x, 1.0f, m_pos.z });

	BlockCollision();

	// ブロックがない空間で停まる
	StopNoBlock();

	// ブロックの中心で曲がる
	TurnCenterBlock();

#ifdef _DEBUG
	CDebugProc::Print("現在のプレイヤーの座標:%f %f %f\n", m_pos.x, m_pos.y, m_pos.z);
	CDebugProc::Print("現在のプレイヤーの角度:%f %f %f\n", m_rot.x, m_rot.y, m_rot.z);
	CDebugProc::Print("現在のモーション:%d\n", (int)m_Motion);
	CDebugProc::Print("現在の状態:%d\n", (int)m_State);
	CDebugProc::Print("現在のフレーム:%d\n", m_frame);

	if (pInput->Trigger(DIK_U))
	{
		m_nSkillBuffTime = 120;
		m_State = PST_SPEED;
	}

	if (pInput->Trigger(DIK_I))
	{
		m_nSkillBuffTime = 120;
		m_State = PST_PAINT;
	}

	if (pInput->Trigger(DIK_T))
	{
		m_Motion == PM_ST_NEUTRAL ? m_Motion = PM_ST_MOVE : m_Motion = PM_ST_NEUTRAL;
		m_motion->SetNumMotion(m_Motion);
	}
#endif // _DEBUG
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
// 移動
//-----------------------------------------------------------------------------
void CPlayer::Move()
{
	if (m_controller == nullptr)
	{
		assert(false);
		return;
	}

	if (D3DXVec3Length(&m_controller->Move()) == 0.0f)
	{
		//	return;
	}

	D3DXVECTOR3 move = m_controller->Move();

	// 斜め入力があった場合
	if (move.z != 0.0f && move.x != 0.0)
	{
		if (m_moveVec.x != 0.0f)
		{ // X軸に進んでた場合
			move.z = 0.0f;
			move.x = 1.0f;
		}
		else if (m_moveVec.z != 0.0f)
		{ // Z軸に進んでた場合
			move.x = 0.0f;
			move.z = 1.0f;
		}
		else
		{ // 止まってた場合
			move = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
		}
	}

	D3DXVec3Normalize(&m_movePlanVec, &move);	// 入力ベクトルを用意する
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
// 移動方向を見て曲がる
//-----------------------------------------------------------------------------
void CPlayer::TurnLookAtMoveing()
{
	if (m_moveVec.z > 0.0f)
	{
		SetRot(D3DXVECTOR3(0.0f, -D3DX_PI, 0.0f));
	}
	if (m_moveVec.z < 0.0f)
	{
		SetRot(D3DXVECTOR3(0.0f, 0.0f, 0.0f));
	}
	if (m_moveVec.x > 0.0f)
	{
		SetRot(D3DXVECTOR3(0.0f, -D3DX_PI * 0.5f, 0.0f));
	}
	if (m_moveVec.x < 0.0f)
	{
		SetRot(D3DXVECTOR3(0.0f, D3DX_PI * 0.5f, 0.0f));
	}
}

//-----------------------------------------------------------------------------
// ブロックがない場所で停まる
//-----------------------------------------------------------------------------
void CPlayer::StopNoBlock()
{
	D3DXVECTOR2 BlockIdx = CGame::GetMap()->GetBlockIdx(m_pOnBlock);
	D3DXVECTOR2 moveNowVec;

	moveNowVec.x = m_movePlanVec.x;
	moveNowVec.y = -m_movePlanVec.z;

	D3DXVec2Normalize(&moveNowVec, &moveNowVec);

	CDebugProc::Print("moveNowVec : %.1f,%.1f\n", moveNowVec.x, moveNowVec.y);

	BlockIdx += moveNowVec;

	CDebugProc::Print("BlockIdx : %.1f,%.1f\n", BlockIdx.x, BlockIdx.y);

	CBlock* moveBlock = CGame::GetMap()->GetBlock((int)BlockIdx.x, (int)BlockIdx.y);	// 進行方向にあるブロック

	if (moveBlock->IsStop())
	{
		m_movePlanVec = D3DXVECTOR3(0.0f, 0.0f, 0.0f);	// 停止
	}
}

//-----------------------------------------------------------------------------
// ブロックの中心付近で曲がる
//-----------------------------------------------------------------------------
void CPlayer::TurnCenterBlock()
{
	bool XMin = m_pos.x <= m_pOnBlock->GetPos().x + (m_pOnBlock->GetSize().x * 0.05f);
	bool XMax = m_pos.x >= m_pOnBlock->GetPos().x - (m_pOnBlock->GetSize().x * 0.05f);
	bool ZMin = m_pos.z <= m_pOnBlock->GetPos().z + (m_pOnBlock->GetSize().z * 0.05f);
	bool ZMax = m_pos.z >= m_pOnBlock->GetPos().z - (m_pOnBlock->GetSize().z * 0.05f);

	// ブロック内に収まっているか
	if (XMin && XMax && ZMin && ZMax)
	{
		 // 方向ベクトル掛ける移動量
		m_move = m_movePlanVec * PLAYER_SPEED;

		if (m_State == PST_SPEED || m_ItemState == ITEM_SPEED)
		{
			m_move *= ADD_SPEED;
		}

		D3DXVec3Normalize(&m_moveVec, &m_move);
	}
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
				if (pBlock->GetNumber() != m_nPlayerNumber && m_nSkillGauge < MAX_GAUGE && m_State == PST_STAND)
				{//自分以外の色を塗り替えていたらゲージの加算(ゲージがマックではなく、無強化の場合)
					m_nSkillGauge++;
				}
				pBlock->SetPlayerNumber(m_nPlayerNumber);	//プレイヤーの
				m_pOnBlock = pBlock;						//乗っているブロックを設定
			}
		}
	}

	if (m_State == PST_PAINT && m_pOnBlock != nullptr)
	{
		switch (m_nSkillLv)
		{
		case 1:
			//縦の範囲を塗る
			for (int nCntX = 0; nCntX < 3; nCntX++)
			{
				//乗っているブロックの番号を取得
				D3DXVECTOR2 BlockIdx = CGame::GetMap()->GetBlockIdx(m_pOnBlock);
				//範囲内のブロックを塗る
				BlockIdx = D3DXVECTOR2(BlockIdx.x - 1.0f, BlockIdx.y);			//中央左に設定する
				D3DXVECTOR2 Idx = D3DXVECTOR2(BlockIdx.x + nCntX, BlockIdx.y);
				CBlock* Block = CGame::GetMap()->GetBlock((int)Idx.x, (int)Idx.y);

				if (Block != nullptr)
				{
					Block->SetPlayerNumber(m_nPlayerNumber);
				}
			}
			break;

		case 2:
			//十字(横と縦)の範囲を塗る
			//縦の範囲
			for (int nCntY = 0; nCntY < 3; nCntY++)
			{
				//乗っているブロックの番号を取得
				D3DXVECTOR2 BlockIdx = CGame::GetMap()->GetBlockIdx(m_pOnBlock);
				//範囲内のブロックを塗る
				BlockIdx = D3DXVECTOR2(BlockIdx.x, BlockIdx.y - 1.0f);			//中心に設定する
				D3DXVECTOR2 Idx = D3DXVECTOR2(BlockIdx.x, BlockIdx.y + nCntY);
				CBlock* Block = CGame::GetMap()->GetBlock((int)Idx.x, (int)Idx.y);

				if (Block != nullptr)
				{//ブロックを塗る
					Block->SetPlayerNumber(m_nPlayerNumber);
				}
			}
			//横の範囲
			for (int nCntX = 0; nCntX < 3; nCntX++)
			{
				//乗っているブロックの番号を取得
				D3DXVECTOR2 BlockIdx = CGame::GetMap()->GetBlockIdx(m_pOnBlock);
				//範囲内のブロックを塗る
				BlockIdx = D3DXVECTOR2(BlockIdx.x - 1.0f, BlockIdx.y);			//中央左に設定する
				D3DXVECTOR2 Idx = D3DXVECTOR2(BlockIdx.x + nCntX, BlockIdx.y);
				CBlock* Block = CGame::GetMap()->GetBlock((int)Idx.x, (int)Idx.y);

				if (Block != nullptr)
				{//ブロックを塗る
					Block->SetPlayerNumber(m_nPlayerNumber);
				}
			}
			break;

		case 3:
			//3×3の範囲を塗る
			for (int nCntY = 0; nCntY < 3; nCntY++)
			{
				for (int nCntX = 0; nCntX < 3; nCntX++)
				{
					//乗っているブロックの番号を取得
					D3DXVECTOR2 BlockIdx = CGame::GetMap()->GetBlockIdx(m_pOnBlock);
					//範囲内のブロックを塗る
					BlockIdx = D3DXVECTOR2(BlockIdx.x - 1.0f, BlockIdx.y - 1.0f);			//左上に設定する
					D3DXVECTOR2 Idx = D3DXVECTOR2(BlockIdx.x + nCntX, BlockIdx.y + nCntY);
					CBlock* Block = CGame::GetMap()->GetBlock((int)Idx.x, (int)Idx.y);

					if (Block != nullptr)
					{//ブロックを塗る
						Block->SetPlayerNumber(m_nPlayerNumber);
					}
				}
			}
			break;

		default:
			break;
		}
	}

	//乗っているブロックの番号を取得
	D3DXVECTOR2 BlockIdx = CGame::GetMap()->GetBlockIdx(m_pOnBlock);
	//乗っているブロックの情報を取得
	CBlock* Block = CGame::GetMap()->GetBlock((int)BlockIdx.x, (int)BlockIdx.y);

	if (Block != nullptr)
	{//アイテムの情報を取得する
		CItem *pItem = Block->GetOnItem();

		if (pItem != nullptr)
		{//アイテムを拾った場合
			m_nItemBuffTime = (int)CItem::BUFF_TIME;
			if (pItem->GetEffect() == CItem::SPEED)
			{
				m_ItemState = ITEM_SPEED;
			}
			//ブロックの上のアイテムを消去
			Block->DeleteItem();
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
	else if (m_nSkillGauge >= MAX_GAUGE * 0.7)
	{
		m_nSkillLv = 2;
	}
	else if (m_nSkillGauge >= MAX_GAUGE * 0.3)
	{
		m_nSkillLv = 1;
	}
	else
	{
		m_nSkillLv = 0;
	}

	//現在のスキルLvによって効果量を変える
	switch (m_nSkillLv)
	{
	case 1:
		if (pInput->Trigger(DIK_K))
		{
			m_nSkillGauge -= (int)(MAX_GAUGE * 0.3f);
			m_nSkillBuffTime = (int)(SKILL_BUFF_TIME);
			m_State = PST_SPEED;
		}
		else if (pInput->Trigger(DIK_L))
		{
			m_nSkillGauge -= (int)(MAX_GAUGE * 0.3f);
			m_nSkillBuffTime = (int)(SKILL_BUFF_TIME);
			m_State = PST_PAINT;
		}
		break;

	case 2:
		if (pInput->Trigger(DIK_K))
		{
			m_nSkillGauge -= (int)(MAX_GAUGE * 0.7f);
			m_nSkillBuffTime = (int)(SKILL_BUFF_TIME * 2.0f);
			m_State = PST_SPEED;
		}
		else if (pInput->Trigger(DIK_L))
		{
			m_nSkillGauge -= (int)(MAX_GAUGE * 0.7f);
			m_nSkillBuffTime = (int)(SKILL_BUFF_TIME * 2.0f);
			m_State = PST_PAINT;
		}
		break;

	case 3:
		if (pInput->Trigger(DIK_K))
		{
			m_nSkillGauge -= MAX_GAUGE;
			m_nSkillBuffTime = (int)(SKILL_BUFF_TIME * 5.0f);
			m_State = PST_SPEED;
		}
		else if (pInput->Trigger(DIK_L))
		{
			m_nSkillGauge -= MAX_GAUGE;
			m_nSkillBuffTime = (int)(SKILL_BUFF_TIME * 5.0f);
			m_State = PST_PAINT;
		}
		break;

	default:
		break;
	}
}