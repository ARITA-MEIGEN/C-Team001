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
class CTexture;
class CDebugProc;
class CMode;
class CFade;

static const int MAX_POLYGON = 1920;	// �|���S���̍ő吔
static const int SCREEN_WIDTH = 1280;	// �X�N���[���̕�
static const int SCREEN_HEIGHT = 720;	// �X�N���[���̍���

// �v���g�^�C�v�錾
class CApplication
{
public:

	enum MODE
	{//�Q�[�����[�h
		MODE_TITLE = 0,
		MODE_TUTORIAL,
		MODE_MAP,
		MODE_SKILL,
		MODE_GAME,
		MODE_RESULT,
		MODE_MAX
	};

	// �����ς݂̃C���X�^���X���Ȃ���ΐV�K�쐬:
	static CApplication* getInstance()
	{
		if (instance == nullptr) instance = new CApplication(); return instance;
	}

	//�����o�֐�
	~CApplication() = default;
	HRESULT Init(HWND hWnd, bool bWindow, HINSTANCE hInstance);
	void Uninit();
	void Update();
	void Draw();

	// Setter
	void SetMode(MODE mode);

	// Getter
	CRenderer*GetRenderer() { return m_pRenderer; };
	CDebugProc* GetDebugProc() { return m_pDebugProc; };
	CFade* GetFade() { return m_pFade; }

	// �ύX�\��
	void SetWinner(int win) { m_nWinner = win; };	// �������v���C���[�̔ԍ�
	void AddScore(int player) { CApplication::getInstance()->m_nScore[player]++; };	// �X�R�A�̉��_
	void ResetScore() { CApplication::getInstance()->m_nScore[0] = 0, CApplication::getInstance()->m_nScore[1] = 0; };	// �X�R�A��RESET
	int GetWinner() { return m_nWinner; };
	int GetScore(int player) { return CApplication::getInstance()->m_nScore[player]; };	// �X�R�A�̎擾
	MODE GetModeState() { return m_mode; }

private:
	CApplication() = default;

	static CApplication* instance;

	//�����o�ϐ�
	CRenderer* m_pRenderer;
	CTexture* m_pTexture;		// �e�N�X�`�����
	CDebugProc* m_pDebugProc;	// �f�o�b�O�\��
	MODE m_mode;
	CFade* m_pFade;
	int m_nWinner;
	int m_nScore[2];

	//���
	CMode* m_pMode;
};
#endif // !_APPLICATION_H_
