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
#define MAX_BLOCK	(16)	//ブロックの最大数
#define BLOCK_X		(4)		//ブロックの数X
#define BLOCK_Y		(4)		//ブロックの数Y

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
	void Uninit();
	void Update();
	static CMap *Create(int stgnumber);
	void Load();

	//ゲッター
	CBlock* GetBlock(const int number) { return (int)m_pBlock.size() > number ? m_pBlock[number] : nullptr; };
	CBlock* GetBlock(const int x, const int y);
	D3DXVECTOR2 GetBlockIdx(CBlock* block);
	CBlock* GetPlayerSpawnBlock(const int index) { return GetBlock((int)m_playerSpawnIdx[index].x, (int)m_playerSpawnIdx[index].y); }
	int GetBlockCount() { return (int)m_pBlock.size(); };
	int CMap::GetCountBlockType(int nType);


private:
	//メンバ関数
	STAGE m_StageNumber;
	std::vector<CBlock*> m_pBlock;
	int m_nAllBlock[5];
	std::vector<D3DXVECTOR2> m_playerSpawnIdx;
	int m_axisSizeX;

	// Item関連
	int m_nPopCnt;
};

#endif