//=============================================================================
//
// �f�o�b�O�\��
// Author : �L�c����
//
//=============================================================================

#ifndef _DEBUGPROC_H_
#define _DEBUGPROC_H_

//�C���N���[�h
#include "main.h"
#include <string>

//*****************************************************************************
//�O���錾
//*****************************************************************************
class CApplication;

class CDebugProc
{
public:
	CDebugProc();
	~CDebugProc();
	void Init();
	void Uninit();
	static void Print(const char *pFormat, /*�ψ���*/...);
	static void Draw();
private:
	static LPD3DXFONT m_pFont;
	static std::string m_aStr;	//�z��T�C�Y�����Ȃ��悤�ɋC��t���ā@std::string�g���Ă�����
};

#endif

