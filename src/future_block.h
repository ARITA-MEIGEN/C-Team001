//=============================================================================
//
// ブロック生成
// Author:arita meigen
//
//=============================================================================
#ifndef _FUTURE_BLOCK_H_			// このマクロ定義がされてなかったら
#define _FUTURE_BLOCK_H_			// 二重インクルード防止のマクロ定義

//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include"ObjectX.h"

//=============================================================================
// 構造体定義
//=============================================================================
class CFutureBlock : public CObjectX
{
private:
	static const float SINK_LIMIT;	// 沈む制限
	static const float UP_POWER;	// 沈む制限
public:
	explicit CFutureBlock(int nPriority = 2);
	~CFutureBlock() override;
	HRESULT Init() override;
	void Uninit() override;
	void Update() override;
	static CFutureBlock *Create(D3DXVECTOR3 pos);

	// Setter
	void SetPlayerNumber(int number);
	void SetSink(float power);

	// Getter
	int GetNumber() { return m_number; };

private:
	//メンバ変数
	int m_number;	// プレイヤーの番号
};
#endif
