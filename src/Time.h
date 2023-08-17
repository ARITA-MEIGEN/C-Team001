//=============================================================================
//
// ����
// Author : �L�c����
//
//=============================================================================

#ifndef _TIME_H_
#define _TIME_H_

//�C���N���[�h
#include"main.h"
#include"Object2D.h"

//�}�N����`
#define	DEFAULT_TIME (3)

class CTimer
{
public:
	explicit CTimer(int nPriority = 3);
	~CTimer();
	//�v���g�^�C�v�錾
	HRESULT			Init();
	void			Uninit();
	void			Update();
	void			Draw();
	static CTimer* Create(const int inTimer);

	void SetPos(const D3DXVECTOR3& inPos);

	//�Q�b�^�[
	int GetTimer() { return m_nTimer; };

private:

	D3DXVECTOR3 m_pos;
	CObject2D* m_apNumber[2];

	int m_nTimer;
	int m_nCreateTimer;
};
#endif

