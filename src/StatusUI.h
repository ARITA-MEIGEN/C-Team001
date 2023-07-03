//================================================
//
//ステータス表示 [StatusUI.h]
//Author : Kishimoto Eiji
//
//================================================
#ifndef _STATUS_UI_H_
#define _STATUS_UI_H_

//***************************
//インクルード
//***************************
#include "Object.h"

//***************************
//前方宣言
//***************************
class CGauge;
class CObject2D;

//***************************
//ステータス表示クラスの定義
//***************************
class CStatusUI : public CObject
{
public: /* 静的メンバ関数 */
	/*
		生成
		int nPlayerNum ---> プレイヤー番号
	*/
	static CStatusUI *Create(int nPlayerNum);

public: /* コンストラクタ・デストラクタ */
	explicit CStatusUI(int nPriority = 4);
	~CStatusUI() override;

public: /* オーバーライド関数 */
	HRESULT Init() override;	//初期化
	void Uninit() override;		//終了
	void Update() override;		//更新
	void Draw() override;		//描画

private: /* メンバ関数 */
	/*
		プレイヤー番号の設定
		int nPlayerNum ---> プレイヤー番号
	*/
	void SetPlayerNum(int nPlayerNum);

private: /* メンバ変数 */
	CGauge* m_pGauge;			//ゲージ
	CObject2D* m_pCharaBg;		//キャラクター背景
	CObject2D* m_pSkillIconBg;	//スキルアイコン背景

	int m_nPlayerNum;	//プレイヤー番号
};

#endif