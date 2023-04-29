//=============================================================================
//
// Xファイル読み込み
// Author : 有田明玄
//
//=============================================================================

#ifndef _OBJECTX_H_
#define _OBJECTX_H_

//インクルード
#include"main.h"
#include"Object.h"

//前方宣言
class CShadow;

class CObjectX:public CObject
{
public:
	explicit CObjectX(int nPriority = 3);
	~CObjectX();
	//プロトタイプ宣言
	virtual HRESULT Init()override;
	virtual void Uninit(void)override;
	virtual void Update(void)override;
	virtual void Draw(void)override;
	static CObjectX*Create(D3DXVECTOR3 pos, int Priority, LPCTSTR name);
	void BindModel(LPD3DXMESH pMesh, LPD3DXBUFFER pBuff, DWORD pNumMat);
	void Shadow();

	// Setter
	void SetPos(D3DXVECTOR3 pos) { m_pos = pos; }
	void SetRot(D3DXVECTOR3 rot) { m_rot = rot; }
	void SetModel(LPCTSTR name) { m_modelname = name; }
	void SetCol(D3DXCOLOR col) { m_col = col; };

	// Getter
	D3DXVECTOR3 GetPos() { return m_pos; };
	D3DXVECTOR3 GetRot() { return m_rot; };
	LPCTSTR GetModelName() { return m_modelname; }
	D3DXVECTOR3	GetSize() { return m_size; }
	D3DXCOLOR GetCol() { return m_col; }

private:
	LPD3DXMESH		m_pMesh;			// メッシュへのポインタ
	LPD3DXBUFFER	m_pBuffMat;			// マテリアル情報へのポインタ
	DWORD			m_nNumMat;			// マテリアル情報の数
	D3DXMATRIX		m_mtxWorld;			// ワールドマトリックス
	D3DXVECTOR3		m_size;				// 大きさ
	D3DXVECTOR3		m_vtxMax;			// モデルの最大座標
	D3DXVECTOR3		m_vtxMin;			// モデルの座標の最小値
	D3DXVECTOR3		m_posold;			// 前回の位置
	int				m_nIdxModelParent;	// 親モデルのインデックスaModelの番号
	D3DXVECTOR3		m_rotDest;			// 目的の角度の保存
	LPCTSTR			m_modelname;		// モデルの名前
	D3DXCOLOR		m_col;				// 色
  
	D3DXMATRIX		m_mtxParent;		// 親のワールドマトリックス

	// 位置
	D3DXVECTOR3 m_pos;			// 位置
	D3DXVECTOR3 m_addPos;		// 加算位置
	D3DXVECTOR3 m_posold;		// 前回位置
	D3DXVECTOR3 m_DefaultPos;	// 初期位置
	D3DXVECTOR3 m_move;				// 移動量

	// 向き	  
	D3DXVECTOR3 m_DefaultRot;	// 初期向き
	D3DXVECTOR3 m_rot;			// 向き
	D3DXVECTOR3 m_addRot;		// 加算向き
	D3DXVECTOR3 m_rotDest;		// 目的の角度の保存

	// 影	   
	CShadow*  m_Shadow;			// 影
	D3DXMATRIX  m_mtxShadow;	// 影用ワールドマトリックス

	// 親子関係
	CModel* m_pParent;					// 親モデルへのポインタ
	std::vector<CModel*> m_childrens;	// 子モデルへのポインタコンテナ

	int m_nIdx;				// 自身の番号
};
#endif



