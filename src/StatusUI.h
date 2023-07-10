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
private: /* 定数 */
	static const D3DXVECTOR3 GAUGE_LOCAL_POS;
	static const D3DXVECTOR2 GAUGE_SIZE;
	static const D3DXVECTOR3 CHARACTER_BG_LOCAL_POS;
	static const D3DXVECTOR2 CHARACTER_BG_SIZE;
	static const D3DXVECTOR3 SKILL_ICON_BG_LOCAL_POS;
	static const D3DXVECTOR2 SKILL_ICON_BG_SIZE;
public: /* 静的メンバ関数 */
	static CStatusUI *Create(const D3DXVECTOR3& inPos, int nPlayerNum);

public: /* コンストラクタ・デストラクタ */
	explicit CStatusUI(int nPriority = 4);
	~CStatusUI() override;

public: /* オーバーライド関数 */
	HRESULT Init() override;	//初期化
	void Uninit() override;		//終了
	void Draw() {};		//描画

	void SetPos(const D3DXVECTOR3& inPos);
private: /* メンバ関数 */
	void SetPlayerNum(int nPlayerNum);

private: /* メンバ変数 */
	D3DXVECTOR3 m_pos;
	CGauge* m_pGauge;			//ゲージ
	CObject2D* m_pCharaBg;		//キャラクター背景
	CObject2D* m_pSkillIconBg;	//スキルアイコン背景

	int m_nPlayerNum;	//プレイヤー番号
};

#endif