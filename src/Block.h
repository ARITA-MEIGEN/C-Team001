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

//-----------------------------------------------------------------------------
// 前方宣言
//-----------------------------------------------------------------------------
class CPlayer;
class CItem;

//=============================================================================
// 構造体定義
//=============================================================================
class CBlock : public CObjectX
{
private:
	static const float SINK_LIMIT;	// 沈む制限
	static const float UP_POWER;	// 沈む制限
public:
	explicit CBlock(int nPriority = 2);
	~CBlock() override;
	HRESULT Init() override;
	void Uninit() override;
	void Update() override;
	void Draw() override;
	void DeleteItem();
	static CBlock *Create(D3DXVECTOR3 pos);

	// Setter
	void SetPlayerNumber(int number);
	void SetStop(const bool isStop) { m_isStop = isStop; }
	void SetTeleport(const bool bTeleport) { m_bTeleport = bTeleport; }
	void SetOnItem(CItem* onItem) { m_onItem = onItem; }
	void SetOnPlayer(CPlayer* onPlayer) { m_onPlayer = onPlayer; }
	void SetSink(float power);

	// Getter
	int GetNumber() { return m_number; };
	bool GetTeleport() { return m_bTeleport; };
	bool IsStop() { return m_isStop; };

	CPlayer* GetOnPlayer() { return m_onPlayer; };
	CItem* GetOnItem() { return m_onItem; };

private:
	//メンバ変数
	int m_number;	// プレイヤーの番号
	bool m_isStop;	// 進行不可
	bool m_bTeleport;		// テレポーターかどうか
	CPlayer* m_onPlayer;	// 乗ってるプレイヤー
	CItem* m_onItem;		// 乗ってるアイテム
};

#endif
