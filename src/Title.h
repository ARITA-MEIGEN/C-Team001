//=============================================================================
//
// �I�u�W�F�N�g
// Author : �L�c����
//
//=============================================================================
#ifndef _TITLE_H_
#define _TITLE_H_

//�C���N���[�h
#include "main.h"
#include "Application.h"
#include "Mode.h"

//�O���錾
class CObject2D;
class CCamera;
class CLight;

class CTitle : public CMode
{
public:
	CTitle();
	~CTitle();

	HRESULT Init();
	void Uninit();
	void Update();
	void Draw();

private:
	CObject2D*m_pBg;
	CCamera* m_camera;
	CLight* m_light;
};

#endif


