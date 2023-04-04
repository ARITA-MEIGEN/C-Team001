//=============================================================================
//
// �A�v���P�[�V����
// Author : �L�c����
//
//=============================================================================
#ifndef _APPLICATION_H_
#define _APPLICATION_H_

//*****************************************************************************
// �C���N���[�h
//*****************************************************************************
#include"main.h"

//*****************************************************************************
//�O���錾
//*****************************************************************************
class CRenderer;
class CInputKeyboard;
class CInputJoyPad;
class CInput;
class CDebugProc;
class CTitle;
class CGame;
class CResult;
class CFade;

static const int  MAX_POLYGON = 1920;			//�|���S���̍ő吔
static const int  SCREEN_WIDTH = 1280;			// �X�N���[���̕�
static const int  SCREEN_HEIGHT = 720;		// �X�N���[���̍���

// �v���g�^�C�v�錾
class CApplication
{
public:

	enum MODE
	{//�Q�[�����[�h
		MODE_TITLE = 0,
		MODE_GAME,
		MODE_RESULT,
		MODE_MAX
	};
	// �����ς݂̃C���X�^���X���Ȃ���ΐV�K�쐬:
	static CApplication* getInstance() {
		if (instance == NULL) instance = new CApplication(); return instance;
	}

	//�����o�֐�
	~CApplication() = default;
	HRESULT Init(HWND hWnd, bool bWindow, HINSTANCE hInstance);
	void Uninit();
	void Update();
	void Draw();

	//�Z�b�^�[
	void SetWinner(int win) { m_nWinner = win; };	//�������v���C���[�̔ԍ�
	void SetMode(MODE mode);
	void AddScore(int player) { CApplication::getInstance()->m_nScore[player]++; };	//�X�R�A�̉��_
	void ResetScore() { CApplication::getInstance()->m_nScore[0] = 0, CApplication::getInstance()->m_nScore[1] = 0; };	//�X�R�A��RESET


	//�Q�b�^�[
	CRenderer*GetRenderer() { return CApplication::getInstance()-> m_pRenderer; };
	CInput * GetInput() { return CApplication::getInstance()->m_pInput; };
	CDebugProc * GetDebugProc() { return CApplication::getInstance()->m_pDebugProc; };
	CFade*GetFade() { return CApplication::getInstance()->m_pFade; };
	int GetWinner() { return CApplication::getInstance()->m_nWinner; };
	int GetScore(int player) { return CApplication::getInstance()->m_nScore[player]; };	//�X�R�A�̎擾


private:
	CApplication() = default;

	static CApplication* instance;

	//�����o�ϐ�
	CRenderer*m_pRenderer;
	CInput*m_pInput;
	CDebugProc*m_pDebugProc;
	LPD3DXFONT m_pFont;						//�t�H���g�ւ̃|�C���g
	MODE m_mode;
	CFade* m_pFade;
	int m_nWinner;
	int m_nScore[2];
	//���
	CTitle*m_pTitle;
	CGame*m_pGame;
	CResult*m_pResult;
};

#endif // !_APPLICATION_H_
