//=============================================================================
//
// Xファイル読み込み
// Author : 有田明玄
//
//=============================================================================

#ifndef _PLAYER_H_
#define _PLAYER_H_

//インクルード
#include"main.h"
#include"Object.h"
#include"Command.h"
#include <vector>

//前方宣言
class CController;
class CShadow;
class CObjectX;
class CBullet;
class CBlock;
class CMotion;

//マクロ定義
#define MAX_GAUGE		(10)

class CPlayer :public CObject
{
private:
	static const std::string MOTION_PATH;	// モーションデータパス
	static const float PLAYER_SPEED;	// 移動速度
	static const float ADD_SPEED;	// アイテムで加算するスピード
	static const float SKILL_BUFF_TIME;	// バフの効果時間(Lv1基準)

public:

	enum PLAYER_MOTION
	{
		//地上
		PM_ST_NEUTRAL,		// ニュートラル
		PM_ST_MOVE,			// 移動(しゃがみだけ無し)
		PM_MAX
	};

	enum PLAYER_STATE
	{
		PST_STAND,		// 立ち
		PST_DIE,		// 被弾状態
		PST_SPEED,		// 加速状態
		PST_PAINT,		// 塗り強化状態
		PST_KNOCKBACK,	// ノックバック強化状態
		PST_AREA,		// エリア生成状態
		PST_MAX
	};

	enum ITEM_STATE
	{
		ITEM_NONE,	// 無し
		ITEM_SPEED,	// 加速
		ITEM_PAINT,	// 塗り強化
		ITEM_MAX
	};

private:
	enum EState
	{
		STATE_IDLE = 0,
		STATE_WALK,
		STATE_JUMP,
		STATE_MAX,
		STATE_INVALID = -1,
	};

public:
	explicit CPlayer(int nPriority = 3);
	~CPlayer();
	//プロトタイプ宣言
	HRESULT			Init() override;
	void			Uninit() override;
	void			Update() override;
	void			Draw() override;

	//　プレイヤーのステート関数
	void Update_Idle();
	void Update_Walk();
	void Update_Jump();

	void			Move();										// 移動
	static CPlayer*	Create(D3DXVECTOR3 pos, D3DXVECTOR3 rot);	// プレイヤー生成

	// Setter
	void SetController(CController* inOperate);
	void SetPos(D3DXVECTOR3 pos) { m_pos = pos; };				// 位置の設定
	void SetRot(D3DXVECTOR3 rot) { m_rot = rot; };				// 向きの設定
	void SetSkillGauge(float skill) { m_fSkillGauge = skill; }	// スキルゲージの量の設定

	// Getter
	D3DXVECTOR3		GetPos() { return m_pos; };
	PLAYER_MOTION	GetNowMotion() { return m_Motion; };
	D3DXMATRIX		GetMtx() { return m_mtxWorld; };				//マトリックスの取得
	float			GetSkillGauge() { return m_fSkillGauge; }		//スキルゲージの量の取得
	int				GetPlayerNumber() { return m_nPlayerNumber; }	//プレイヤーの番号の取得

private:
	void Updatepos();			// 座標の更新
	void Normalization();		// 正規化
	void BlockCollision();		// ブロックとの判定
	void TurnLookAtMoveing();	// 移動方向を見て曲がる
	void StopNoBlock();			// ブロックがない場所で停まる
	void TurnCenterBlock();		// ブロックの真ん中で曲がるようになる
private:	// 静的メンバー変数
	static const UPDATE_FUNC mUpdateFunc[];
	static int		m_nNumPlayer;			// プレイヤーの数

private:	// メンバー変数
	CController*	m_controller;			// 命令を出す人
	std::vector<CObjectX*>	m_apModel;		// モデルのインスタンス
	CMotion*		m_motion;				// モーション
	D3DXMATRIX		m_mtxWorld;				// ワールドマトリックス
	D3DXVECTOR3		m_pos;					// 位置
	D3DXVECTOR3		m_rot;					// 向き
	D3DXVECTOR3		m_move;					// 移動量
	D3DXVECTOR3		m_moveVec;				// 移動ベクトル
	D3DXVECTOR3		m_movePlanVec;			// 移動予定ベクトル
	D3DXVECTOR3		m_posold;				// 前回の位置
	D3DXVECTOR3		m_rotDest;				// 目的の角度の保存
	PLAYER_MOTION	m_Motion;				// 現在のモーション
	int				m_nPlayerNumber;		// 自分のプレイヤー番号
	int				m_nItemBuffTime;		// アイテム強化効果時間
	PLAYER_STATE	m_State;				// プレイヤーの状態
	ITEM_STATE		m_ItemState;			// アイテムの状態
	CShadow*		m_pShadow;				// 影
	CBlock*			m_pOnBlock;				// プレイヤーの乗っているブロックへのポインタ

	//押し出し判定関連
	D3DXVECTOR3		m_aAxisSiz[PST_MAX];	// 押し出し判定の大きさ

private:	// スキル処理一覧
	void Skill();			// スキル処理

	enum SKILL_STATE
	{
		SKILL_IDLE = 0,
		SKILL_SPEED,		// 加速
		SKILL_PAINT,		// 塗範囲拡大
		SKILL_KNOCKBACK,	// ノックバック
		SKILL_AREA,			// エリア生成
		SKILL_MAX
	};

	using SKILL_FUNC = void(CObject::*)();
	static const SKILL_FUNC m_SkillFunc[];
	void InitSkillFunc(const SKILL_FUNC *funcList, int numFunc);
	void SetSkill(SKILL_STATE inState) { m_SkillStateNow = inState; }

	const SKILL_FUNC* m_funcSkill;

	//　スキルのステート関数
	void Skill_Idel();
	void Skill_Speed();
	void Skill_Paint();
	void Skill_Knockback();

	SKILL_STATE		m_SkillStateNow;		// 使えるスキルの状態
	SKILL_STATE		m_SkillState;			// 使えるスキルの状態
	int				m_nSkillLv;				// プレイヤーのスキルLｖ
	int				m_nSkillBuffTime;		// スキル強化効果時間
	float			m_fSkillGauge;			// スキルゲージの量
	float			m_fSubGauge;			// スキルゲージを減算させる
};

#endif
