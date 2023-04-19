//=============================================================================
//
// item.h
// Author : 髙野馨將
//
//=============================================================================
#ifndef _ITEM_H_
#define _ITEM_H_

#include "Object3D.h"

//アイテムクラス
class CItem : public CObject3D
{
public:
	explicit CItem(int nPriority = 3);								//コンストラクタ
	~CItem() override;												//デストラクタ

	HRESULT Init(void) override;																	//初期化処理
	void Uninit(void) override;																		//終了処理
	void Update(void) override;																		//更新処理
	void Draw(void) override;																		//描画処理

	void SetLife(int nLife) { m_nLife = nLife; }													//表示時間の設定

	int GetLife(void) { return m_nLife; }															//表示時間の取得

	static CItem* Create(const D3DXVECTOR3 pos, const D3DXVECTOR3 size, const D3DXVECTOR3 rot);		//生成処理

private:
	//メンバ変数
	int m_nLife;						//表示時間

};

#endif