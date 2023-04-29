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
#include"ObjectX.h"
#include"Model.h"
#include"Command.h"

//前方宣言
class CController;
class CShadow;
class CModel;
class CBullet;
class CBlock;

//マクロ定義
#define MAX_KEY				(60)			//キーの総数
#define MAX_FRAME			(120)			//フレームの最大数
#define NUM_PARTS			(14)			//パーツの数
#define MAX_WORD			(255)			//パスの最大文字数

class CPlayer :public CObject
{
private:
	static const float PLAYER_SPEED;	// 移動速度
	static const float ITEM_ADD_SPEED;	// アイテムで加算するスピード

public:
	//キー要素
	struct KEY
	{
		D3DXVECTOR3 fPos;
		D3DXVECTOR3 fRot;
	};

	//キー情報
	struct KEY_SET 
	{
		KEY aKey[NUM_PARTS];	// モデルの数分座標を持つ
		int nFrame;				// 再生時間
	};

	struct MOTION_SET
	{
		KEY_SET		aKey[MAX_KEY];	// キーの総数分持つ
		int			nNumKey;		// キーの総数(ファイルで読み込む)
		bool		bLoop;			// ループするかどうか
	};

	enum PLAYER_MOTION
	{
		//地上
		PM_ST_NEUTRAL,		// ニュートラル
		PM_ST_MOVE,			// 移動(しゃがみだけ無し)
		PM_MAX
	};

	enum PLAYER_STATE
	{
		PST_STAND,	// 立ち
		PST_DIE,	// 被弾状態
		PST_SPEED,	// 加速状態
		PST_MAX
	};

	explicit CPlayer(int nPriority = 3);
	~CPlayer();
	//プロトタイプ宣言
	HRESULT			Init()override;
	void			Uninit(void)override;
	void			Update(void)override;
	void			Draw(void)override;
	void			Move();										// 移動
	static CPlayer*	Create(D3DXVECTOR3 pos, D3DXVECTOR3 rot);	// プレイヤー生成

	// Motion
	void			ReadMotion();								// モーション読み込み
	void			MotionPlayer();								// モーションの再生　引数は再生するモーションの番号
	void			MotionManager();							// 状態に合わせてモーション再生する
	void			PlayFirstMotion();							// 前と状態が違う場合のみ最初のモーションを設定する

	void			Input();									// 入力処理
	void			Updatepos();								// 座標の更新
	void			Normalization();							// 正規化
	void			BlockCollision();							// ブロックとの判定

	//セッター
	void			SetController(CController* inOperate);
	void			SetPos(D3DXVECTOR3 pos) { m_pos = pos; };	// 位置の設定
	void			SetRot(D3DXVECTOR3 rot) { m_rot = rot; };	// 向きの設定

	//ゲッター
	D3DXVECTOR3		GetPos() { return m_pos; };
	PLAYER_MOTION	GetNowMotion() { return m_Motion; };
	D3DXMATRIX		GetMtx() { return m_mtxWorld; };			// マトリックスの取得

private:
	CController*	m_controller;					// 命令を出す人
	CModel*			m_apModel[NUM_PLAYERPARTS];		// モデルのインスタンス
	MOTION_SET		m_apMotion[PM_MAX];				// モーションの数だけ生成モーションの数->キーの総数->モデルの数
	D3DXMATRIX		m_mtxWorld;						// ワールドマトリックス
	D3DXVECTOR3		m_pos;							// 位置
	D3DXVECTOR3		m_rot;							// 向き
	D3DXVECTOR3		m_move;							// 移動量
	D3DXVECTOR3		m_posold;						// 前回の位置
	D3DXVECTOR3		m_rotDest;						// 目的の角度の保存
	int				m_MotionCnt;					// モーションカウンター
	int				m_nNumKey;						// キーの総数
	int				m_nCurKey;						// 現在のキー番号
	int				m_nNumModel;					// 読み込むモデルの数
	char			m_nModelpass[MAX_WORD];			// 読み込むモデルのパス
	PLAYER_MOTION	m_Motion;						// 現在のモーション
	PLAYER_MOTION	m_MotionOld;					// ひとつ前のモーション
	static int		m_nNumPlayer;					// プレイヤーの数
	int				m_nPlayerNumber;				// 自分のプレイヤー番号
	int				m_nBuffTime;					// 強化効果時間
	PLAYER_STATE	m_State;						// プレイヤーの状態
	bool			m_bLeftSide;					// どっちを向いてるか(trueなら←)
	int				m_nNowKey;						// キー保存用
	CShadow*		m_pShadow;						// 影
	CBlock*			m_pOnBlock;						// プレイヤーの乗っているブロックへのポインタ

	//押し出し判定関連
	D3DXVECTOR3		m_aAxisSiz[PST_MAX];			// 押し出し判定の大きさ
};

#endif
