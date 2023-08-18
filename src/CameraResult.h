//=================================================
// Content     (ゲームの設定)(camera.h)
// Author     : 有田明玄
//=================================================
#ifndef _CAMERA_RESULT_H_		// このマクロ定義がされてなかったら
#define _CAMERA_RESULT_H_		// 二重インクルード防止のマクロ定義

#include "Camera.h"

class CCameraResult : public CCamera
{
private:
	static const float SPEED;		// 移動速度
	static const float FACTOR;		// 追従の係数
	static const float ROTSPEED;	// 旋回速度
	static const float ZPOS;		// Z座標
public:
	CCameraResult();
	~CCameraResult();

	//プロトタイプ宣言
	void Init() override;		// 初期化
	void Update() override;		// 更新

	static CCameraResult* Create();	// 生成

private:
};

#endif
