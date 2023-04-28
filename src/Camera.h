//=================================================
// Content     (ゲームの設定)(camera.h)
// Author     : 有田明玄
//=================================================
#ifndef _CAMERA_H_		// このマクロ定義がされてなかったら
#define _CAMERA_H_		// 二重インクルード防止のマクロ定義

class CCamera
{
private:
	static const float CAMERA_NEAR;		// 移動速度
	static const float CAMERA_FAR;		// 追従の係数
	static const float FIELD_OF_VIEW;	// 視野角
public:
	CCamera();
	~CCamera();

	//プロトタイプ宣言
	virtual void Init(void);		// 初期化
	virtual void Uninit(void);		// 終了
	virtual void Update(void);		// 更新
	void Set(void);					// 設定
	void NormalizeRadian(void);		// 角度の正規化
	//void LeavingCamera(void);		// カメラの放置処理

	static CCamera* Create(void);	// 生成

protected:
	D3DXVECTOR3 m_posV;				// 視点
	D3DXVECTOR3 m_posVDest;			// 視点の目的地
	D3DXVECTOR3 m_posR;				// 注視点
	D3DXVECTOR3 m_posRDest;			// 注視点の目的地
	D3DXVECTOR3 m_vecU;				// 上方向ベクトル
	D3DXVECTOR3 m_rot;				// 向き
	D3DXVECTOR3 m_rotDest;			// 向きの目的の角度
	float m_fDistance;				// 距離
	D3DXMATRIX m_mtxProjection;		// プロジェクションマトリックス
	D3DXMATRIX m_mtxView;			// ビューマトリックス

};

#endif
