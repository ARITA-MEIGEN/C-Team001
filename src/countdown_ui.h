//=============================================================================
//
// ����
// Author : Yuda Kaito
//
//=============================================================================
#ifndef _COUNTDOWN_UI_H_
#define _COUNTDOWN_UI_H_

//�C���N���[�h
#include"Object2D.h"

class CCountDownUI : public CObject2D
{
public:
	explicit CCountDownUI();
	~CCountDownUI();

	//�v���g�^�C�v�錾
	HRESULT Init();
	void Uninit();
	void Update();

	static CCountDownUI* Create(const int inTimer);

	//�Q�b�^�[
	int GetTimer() { return m_nTimer; };

private:
	void ScaleMoveDecoration();	// ��������x�ɃX�P�[�����ω�����
private:
	int m_nTimer;
	int m_nCreateTimer;
};
#endif

