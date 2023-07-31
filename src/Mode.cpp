#include "Mode.h"
#include "Camera.h"

CMode::CMode() :
	m_cameraCount(0)
{
}

void CMode::Uninit()
{
	for (int i = 0; i < m_cameraCount; i++)
	{
		//�J�����̏I��
		if (m_pCamera[i] != nullptr)
		{
			m_pCamera[i]->Uninit();
			delete m_pCamera[i];
		}
	}
}

void CMode::Update()
{
	for (int i = 0; i < m_cameraCount; i++)
	{
		//�J�����̏I��
		m_pCamera[i]->Update();
	}
}