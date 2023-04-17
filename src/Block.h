//=============================================================================
//
// ブロック生成
// Author:arita meigen
//
//=============================================================================
#ifndef _BLOCK_H_			// このマクロ定義がされてなかったら
#define _BLOCK_H_			// 二重インクルード防止のマクロ定義

//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include"ObjectX.h"
#include"Application.h"

//=============================================================================
// 構造体定義
//=============================================================================
// 頂点データ
class CBlock : public CObjectX
{
public:
	explicit CBlock(int nPriority = 2);
	~CBlock()override;
	HRESULT Init()override;
	void Uninit()override;
	void Update()override;
	void Draw()override;
	static CBlock *Create(D3DXVECTOR3 pos, float lot);
private:
	//メンバ関数
};

#endif
