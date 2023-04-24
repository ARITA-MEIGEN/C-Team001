//=============================================================================
//
// ゲーム中のカメラ
// Author : Yuda Kaito
//
//=============================================================================
//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include "CameraGame.h"

//-----------------------------------------------------------------------------
//マクロ定義
//-----------------------------------------------------------------------------
#define	DISTANCE_X	((m_posV.x - m_posR.x)*(m_posV.x - m_posR.x))		//距離の計算用X
#define	DISTANCE_Y	((m_posV.y - m_posR.y)*(m_posV.y - m_posR.y))		//距離の計算用Y
#define DISTANCE_Z	((m_posV.z - m_posR.z)*(m_posV.z - m_posR.z))		//距離の計算用Z

//-----------------------------------------------------------------------------
//静的変数宣言
//-----------------------------------------------------------------------------
const float CCameraGame::SPEED = 5.0f;		// 移動速度
const float CCameraGame::FACTOR = 0.01f;	// 追従の係数
const float CCameraGame::ROTSPEED = 0.05f;	// 旋回速度
const float CCameraGame::ZPOS = -300.0f;	// Z座標

//-----------------------------------------------------------------------------
// コンストラクタ
//-----------------------------------------------------------------------------
CCameraGame::CCameraGame()
{
}

//-----------------------------------------------------------------------------
// デストラクタ
//-----------------------------------------------------------------------------
CCameraGame::~CCameraGame()
{
}

//-----------------------------------------------------------------------------
// 初期化
//-----------------------------------------------------------------------------
void CCameraGame::Init()
{
	//視点・注視点・上方向を設定
	m_posV = D3DXVECTOR3(0.0f, 50.0f, ZPOS);
	m_posR = D3DXVECTOR3(0.0f, -50.0f, ZPOS);
	m_vecU = D3DXVECTOR3(0.0f, 1.0f, 0.0f);
	m_rot = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	m_rot.x = atan2f((m_posV.y - m_posR.y), (m_posV.z - m_posR.z));
	//m_fDistance=sqrtf(m_fDistance*m_fDistance+DISTANCE_Y);	
	m_fDistance = sqrtf(DISTANCE_X + DISTANCE_Y + DISTANCE_Z);
}

void CCameraGame::Update()
{
	//ControlPos();		//視点操作
	//RadianPosR();		//注視点の旋回
	//RadianPosV();		//視点の旋回
	DestPos();			//カメラの追従
	NormalizeRadian();	//角度の正規化
#ifdef _DEBUG
	CDebugProc::Print("カメラの視点の角度 x:%f y:%f z:%f", m_posV.x, m_posV.y, m_posV.z);
#endif // _DEBUG

}

CCameraGame * CCameraGame::Create()
{
	CCameraGame* pCamera = new CCameraGame;

	if (pCamera == nullptr)
	{
		return nullptr;
	}

	pCamera->Init();
	return pCamera;
}
