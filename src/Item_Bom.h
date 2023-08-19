//=============================================================================
//
// item_bom.h
// Author : 髙野馨將
//
//=============================================================================
#ifndef _ITEM_BOM_H_
#define _ITEM_BOM_H_

//-----------------------------------------------------------------------------
// 前方宣言
//-----------------------------------------------------------------------------
class CBlock;

#include "item.h"

//爆弾クラス
class CBom : public CItem
{
public:
	explicit CBom(int nPriority = 3);		// コンストラクタ
	~CBom() override;						// デストラクタ

	HRESULT Init(void) override;			// 初期化処理
	void Update(void) override;				// 更新処理

	void Explosion(void);					// 爆発処理

	static CBom* Create(const D3DXVECTOR3 pos, const int nLife);	// アイテム生成処理
	static CBom* Create(CBlock *pOnBlock, int nPlayerNumber,const int nLife, const bool bExplosion);			// 爆弾生成処理

private:
	CBlock *m_pOnBlock;
	int m_nPlayerNumber;
	bool m_bExplosion;
};

#endif