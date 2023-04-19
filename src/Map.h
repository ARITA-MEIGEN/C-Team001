//=============================================================================
//
// マップ生成
// Author:arita meigen
//
//=============================================================================
#ifndef _MAP_H_				// このマクロ定義がされてなかったら
#define _MAP_H_				// 二重インクルード防止のマクロ定義

//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include"Block.h"

//-----------------------------------------------------------------------------
// マクロ定義
//-----------------------------------------------------------------------------
#define MAX_BLOCK	(16)	//ブロックの最大数
#define BLOCK_X		(4)		//ブロックの数X
#define BLOCK_Y		(4)		//ブロックの数Y



//-----------------------------------------------------------------------------
// プロトタイプ宣言
//-----------------------------------------------------------------------------
class CMap
{
public:
	enum STAGE
	{
		STAGE_01=0,
		STAGE_MAX
	};

	explicit CMap();
	~CMap();
	HRESULT Init();
	void Uninit();
	void Update();
	void Draw();
	static CMap *Create(int stgnumber);
	void Load();

private:
	//メンバ関数
	STAGE m_StageNumber;
	CBlock*m_pBlock[MAX_BLOCK];
};

#endif