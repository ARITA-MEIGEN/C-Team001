//=============================================================================
//
// item_bom.h
// Author : 髙野馨將
//
//=============================================================================
#ifndef _ITEM_BOM_H_
#define _ITEM_BOM_H_

#include "item.h"

//爆弾クラス
class CBom : public CItem
{
public:
	explicit CBom(int nPriority = 3);		// コンストラクタ
	~CBom() override;						// デストラクタ

	HRESULT Init(void) override;			// 初期化処理
	void Uninit(void) override;				// 終了処理
	void Update(void) override;				// 更新処理

	void Explosion(void);						// 投擲処理

	static CBom* Create(const D3DXVECTOR3 pos, const D3DXVECTOR3 size, const D3DXVECTOR3 rot, const int nLife);	// 生成処理

private:
};

#endif