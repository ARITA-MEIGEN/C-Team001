//=============================================================================
//
// ����
// Author : Yuda Kaito
//
//=============================================================================
#ifndef _POUSE_UI_H_
#define _POUSE_UI_H_

//�C���N���[�h
#include"Object.h"

// �O���錾
class CObject2D;

class CPouseUI : public CObject
{
private:
	static const D3DXVECTOR2 BUTTON_SIZE;	//�{�^���̃T�C�Y

public:
	explicit CPouseUI();
	~CPouseUI();

	//�v���g�^�C�v�錾
	HRESULT Init();
	void Uninit();
	void Update();
	void Draw() { }

	static CPouseUI* Create();

	void NextBotton();
	void BackBotton();

	int Exit();
	int AnySelectIndex() { m_bottonIndex; }

private:

	CObject2D* m_bg;
	CObject2D* m_buttonBg;		// button�w�i
	CObject2D* m_exitButton;	// �o��button
	CObject2D* m_backButton;	// �߂�button
	CObject2D* m_replayButton;	// ���v���Cbutton
	int m_bottonIndex;
};
#endif

