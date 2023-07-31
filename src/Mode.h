//=============================================================================
//
// モード
// Author : Yuda Kaito
//
//=============================================================================
#ifndef _MODE_H_
#define _MODE_H_

#include <vector>

class CCamera;

//-----------------------------------------------------------------------------
// モード
//-----------------------------------------------------------------------------
class CMode
{
public:
	explicit CMode();
	virtual ~CMode() {};

	virtual HRESULT Init() = 0;
	virtual void Uninit();
	virtual void Update();

	int GetCameraCount() { return m_cameraCount; }
	CCamera* GetCamera(int index) { return m_pCamera[index]; }

	CCamera* AttachCamera(CCamera* camera) { m_pCamera.push_back(camera); m_cameraCount++; return camera; }
private:
	int m_cameraCount;
	std::vector<CCamera*> m_pCamera;
};

#endif