//=============================================================================
//
// テレポートブロック生成
// Author:takano keisuke
//
//=============================================================================
#ifndef _TELEPORT_H_			// このマクロ定義がされてなかったら
#define _TELEPORT_H_			// 二重インクルード防止のマクロ定義

//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include"block.h"

//-----------------------------------------------------------------------------
// 前方宣言
//-----------------------------------------------------------------------------
class CPlayer;
class CItem;

//=============================================================================
// 構造体定義
//=============================================================================
class CTeleport : public CBlock
{
public:
	explicit CTeleport(int nPriority = 2);
	~CTeleport();
	HRESULT Init();
	void Uninit();
	void Update();
	void Draw();

	static CTeleport *Create(D3DXVECTOR3 pos,int nNumber);

	// Setter
	void TeleportPlayerNumber(int number);
	void SetStop(const bool isStop) { m_isStop = isStop; }
	void SetOnPlayer(CPlayer* onPlayer) { m_onPlayer = onPlayer; }

	// Getter
	int GetNumber() { return m_number; };
	bool IsStop() { return m_isStop; };

	CPlayer* GetOnPlayer() { return m_onPlayer; };

private:
	//メンバ変数
	int m_number;			// プレイヤーの番号
	int m_nTeleportNmber;	// テレポーターの番号
	bool m_bTeleport;		// テレポートしたかどうか
	bool m_isStop;			// 進行不可
	CPlayer* m_onPlayer;	// 乗ってるプレイヤー
};

#endif
