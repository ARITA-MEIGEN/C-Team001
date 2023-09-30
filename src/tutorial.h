//=============================================================================
//
// �I�u�W�F�N�g
// Author : �L�c����
//
//=============================================================================
#ifndef _TUTORIAL_H_
#define _TUTORIAL_H_

//�C���N���[�h
#include "main.h"
#include "Application.h"
#include "Mode.h"
#include <vector>

//�O���錾
class CObject2D;
class CObject3D;
class CCamera;
class CLight;

class CTutorial : public CMode
{
public:
	CTutorial();
	~CTutorial();

	HRESULT Init();
	void Uninit();
	void Update();
	void Draw();

private:
	CObject2D* m_pBg;
	std::vector<CObject3D*> m_tutorialBg;

	CCamera* m_camera;
	CLight* m_light;

	int m_count;
};

#endif


