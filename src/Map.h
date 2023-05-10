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
#include <vector>

//-----------------------------------------------------------------------------
// プロトタイプ宣言
//-----------------------------------------------------------------------------
class CMap
{
private:
	static const float BLOCK_WIDTH;	// ブロック同士の幅
public:
	enum STAGE
	{
		STAGE_01=0,
		STAGE_MAX
	};

	explicit CMap();
	~CMap();
	HRESULT Init();
	static CMap *Create(int stgnumber);
	void Load();

	//ゲッター
	CBlock* GetBlock(const int number) { return (int)m_pBlock.size() > number ? m_pBlock[number] : nullptr; };
	CBlock* GetBlock(const int x, const int y);
	CBlock* GetPlayerSpawnBlock(const int index) { return GetBlock((int)m_playerSpawnIdx[index].x, (int)m_playerSpawnIdx[index].y); }
	int GetBlockCount() { return (int)m_pBlock.size(); };

private:
	//メンバ関数
	STAGE m_StageNumber;
	std::vector<CBlock*> m_pBlock;
	std::vector<D3DXVECTOR2> m_playerSpawnIdx;
	int m_axisSizeX;
};

#endif