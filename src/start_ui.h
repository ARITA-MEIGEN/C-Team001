//=============================================================================
//
// ����
// Author : Yuda Kaito
//
//=============================================================================
#ifndef _START_UI_H_
#define _START_UI_H_

//�C���N���[�h
#include"Object2D.h"

class CStartUI : public CObject2D
{
public:
	explicit CStartUI();
	~CStartUI();

	//�v���g�^�C�v�錾
	HRESULT Init();
	void Update();

	static CStartUI* Create();

private:
private:
	int m_nDisplayTimer;
};
#endif

