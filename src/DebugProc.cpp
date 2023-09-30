//=============================================================================
//
// 3D�I�u�W�F�N�g
// Author : �L�c����
//
//=============================================================================

//�C���N���[�h
#include"DebugProc.h"
#include <stdio.h>
#include <stdarg.h>
#include <assert.h>
#include"Application.h"
#include"renderer.h"

//�ÓI�����o�ϐ�
LPD3DXFONT CDebugProc::m_pFont = nullptr;
std::string CDebugProc::m_aStr = {};

//=============================================================================
// �R���X�g���N�^
//=============================================================================
CDebugProc::CDebugProc()
{

}

//=============================================================================
// �f�X�g���N�^
//=============================================================================
CDebugProc::~CDebugProc()
{

}

//=============================================================================
// ������
//=============================================================================
void CDebugProc::Init()
{
	//�f�o�C�X�̎擾
	LPDIRECT3DDEVICE9 pDevice;
	pDevice = CApplication::getInstance()->GetRenderer()->GetDevice();

	// �f�o�b�O���\���p�t�H���g�̐���
	D3DXCreateFont(pDevice, 18, 0, 0, 0, FALSE, SHIFTJIS_CHARSET,
		OUT_DEFAULT_PRECIS, DEFAULT_QUALITY, DEFAULT_PITCH, _T("Terminal"), &m_pFont);
}

//=============================================================================
// �I��
//=============================================================================
void CDebugProc::Uninit()
{
	// �f�o�b�O���\���p�t�H���g�̔j��
	if (m_pFont != nullptr)
	{
		m_pFont->Release();
		m_pFont = nullptr;
	}
}

//=============================================================================
// ������ǂݍ���
//=============================================================================
void CDebugProc::Print(const char * pFormat, ...)
{
	// �ϐ�
	char aStrCpy[0xfff] = {};

	// ���X�g�̍쐬
	va_list args;
	va_start(args, pFormat);
	vsprintf(&aStrCpy[0], pFormat, args);
	va_end(args);

	m_aStr += aStrCpy;
}

//=============================================================================
// �`��
//=============================================================================
void CDebugProc::Draw()
{
#ifndef _DEBUG
	RECT rect = { 0,0,SCREEN_WIDTH,SCREEN_HEIGHT };
	D3DXCOLOR col = {1.0f,0.0f,0.0f,1.0f};

	// �e�L�X�g�`��
	m_pFont->DrawText(NULL, m_aStr.c_str(), -1, &rect, DT_LEFT, col);

	//�e�L�X�g���Z�b�g
	m_aStr.clear();
#endif // _DEBUG

}
