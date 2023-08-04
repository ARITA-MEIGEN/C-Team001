//=============================================================================
//
// オブジェクト
// Author : 有田明玄
//
//=============================================================================
#ifndef _TITLE_H_
#define _TITLE_H_

//インクルード
#include "main.h"
#include "Application.h"
#include "Mode.h"

//前方宣言
class CObject2D;

class CTitle : public CMode
{
public:
	CTitle();
	~CTitle();

	HRESULT Init();
	void Uninit();
	void Update();
	void Draw();
	static CObject2D* GetBg();

private:
	static CObject2D*m_pBg;
};

#endif


