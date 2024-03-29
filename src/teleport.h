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
	explicit CTeleport();
	~CTeleport();
	HRESULT Init();
	void Uninit();
	void Update();
	void Draw();

	static CTeleport *Create(D3DXVECTOR3 pos,int nNumber);

	// Setter
	void TeleportPlayerNumber(int number);

private:
	//メンバ変数
	int m_nTeleportNmber;	// テレポーターの番号
	bool m_bTeleport;		// テレポートしたかどうか
};

#endif
