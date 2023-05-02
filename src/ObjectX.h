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
#include <vector>

//前方宣言
class CShadow;

class CObjectX:public CObject
{
public:
	explicit CObjectX(int nPriority = 3);
	~CObjectX();

	//プロトタイプ宣言
	virtual HRESULT Init() override;
	virtual void Uninit() override;
	virtual void Update() override;
	virtual void Draw() override;

	static CObjectX*Create();

	void BindModel(LPD3DXMESH pMesh, LPD3DXBUFFER pBuff, DWORD pNumMat);
	void Shadow();
	void SizeCalculate();
	void SetModel(char* Filename);

	// Setter
	void SetPos(const D3DXVECTOR3& pos) { m_pos = pos; }
	void SetRot(const D3DXVECTOR3& rot) { m_rot = rot; }
	void SetPosDest(const D3DXVECTOR3& pos) { m_posDest = pos; };
	void SetRotDest(const D3DXVECTOR3& rot) { m_rotDest = rot; };
	void SetPosDefault(const D3DXVECTOR3& pos) { m_DefaultPos = pos; };
	void SetRotDefault(const D3DXVECTOR3& rot) { m_DefaultRot = rot; };
	void SetParent(CObjectX* pModel);
	void SetParentMatrix(D3DXMATRIX* inMatrix) { m_mtxParent = inMatrix; }
	void SetChildren(CObjectX* pModel) { m_childrens.push_back(pModel); }
	void SetCol(const D3DXCOLOR& col) { m_col = col; };

	// Getter
	const D3DXVECTOR3 GetPos() { return m_pos; };
	const D3DXVECTOR3 GetRot() { return m_rot; };
	const D3DXVECTOR3 GetPosDest() { return m_posDest; };
	const D3DXVECTOR3 GetRotDest() { return m_rotDest; };
	const D3DXVECTOR3 GetPosDefault() { return m_DefaultPos; };
	const D3DXVECTOR3 GetRotDefault() { return m_DefaultRot; };
	const LPCTSTR GetModelName() { return m_modelname; }
	const D3DXVECTOR3 GetSize() { return m_size; }
	const D3DXCOLOR GetCol() { return m_col; }
	CObjectX* GetParent() { return m_pParent; }
	const D3DXMATRIX& GetMatrix() { return m_mtxWorld; }

private:
	LPD3DXMESH		m_pMesh;			// メッシュへのポインタ
	LPD3DXBUFFER	m_pBuffMat;			// マテリアル情報へのポインタ
	DWORD			m_nNumMat;			// マテリアル情報の数
	D3DXMATRIX		m_mtxWorld;			// ワールドマトリックス
	D3DXVECTOR3		m_size;				// 大きさ
	D3DXVECTOR3		m_vtxMax;			// モデルの最大座標
	D3DXVECTOR3		m_vtxMin;			// モデルの座標の最小値
	int				m_nIdxModelParent;	// 親モデルのインデックスaModelの番号
	LPCTSTR			m_modelname;		// モデルの名前
	D3DXCOLOR		m_col;				// 色
  
	D3DXMATRIX*		m_mtxParent;		// 親のワールドマトリックス

	// 位置
	D3DXVECTOR3 m_pos;			// 位置
	D3DXVECTOR3 m_addPos;		// 加算位置
	D3DXVECTOR3 m_posold;		// 前回位置
	D3DXVECTOR3 m_DefaultPos;	// 初期位置
	D3DXVECTOR3 m_move;			// 移動量
	D3DXVECTOR3 m_posDest;		// 目的の位置

	// 向き	  
	D3DXVECTOR3 m_DefaultRot;	// 初期向き
	D3DXVECTOR3 m_rot;			// 向き
	D3DXVECTOR3 m_addRot;		// 加算向き
	D3DXVECTOR3 m_rotDest;		// 目的の角度

	// 影	   
	CShadow*  m_Shadow;			// 影
	D3DXMATRIX  m_mtxShadow;	// 影用ワールドマトリックス

	// 親子関係
	CObjectX* m_pParent;				// 親モデルへのポインタ
	std::vector<CObjectX*> m_childrens;	// 子モデルへのポインタコンテナ

	int m_nIdx;				// 自身の番号
};
#endif
