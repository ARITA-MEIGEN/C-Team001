//=============================================================================
//
// �I�u�W�F�N�g
// Author : �L�c����
//
//=============================================================================
#ifndef _GAME_H_
#define _GAME_H_

//�C���N���[�h
#include "Application.h"
#include "Mode.h"

#define STAGE_WIDTH	(350)	// ��������[�܂ł̒���
#define MAX_PLAYER	(4)
#define END_TIMER	(120)	// �v���C���[������ł���I���܂ł̎���
#define END_SCORE	(2)		// �Q�[���I�����邽�߂̃X�R�A

//�O���錾
class CPlayer;
class CCamera;
class CLight;
class CTimer;
class CUI;
class CMap;
class CSpeed;
class CGauge;
class CStatusUI;
class CObject2D;
class CCountDownUI;

class CGame : public CMode
{
public:
	enum GAME
	{
		GAME_NONE = 0,
		GAME_START,		// �ΐ�O
		GAME_PLAY,		// �ΐ풆
		GAME_END		// �ΐ��
	};

	enum ROUND
	{
		ROUND_1 = 0,
		ROUND_2,
		ROUND_3,
		ROUND_MAX
	};

	CGame();
	~CGame();

	HRESULT Init() override;
	void Uninit() override;
	void Draw() override;

public:
	void Update() override;
private: // �X�V����
	enum UPDATE_STATE
	{
		UPDATE_FADENOW = 0,		// �t�F�[�h��
		UPDATE_COUNTDOWN,		// �J�E���g�_�E��
		UPDATE_GAME_PLAY,		// �Q�[���v���C
		UPDATE_GAME_END,		// �Q�[���I��
		UPDATE_GAME_POUSE,		// �|�[�Y��
		UPDATE_MAX
	};

	using UPDATE_FUNC = void(CGame::*)();
	static const UPDATE_FUNC m_InitFunc[];
	static const UPDATE_FUNC m_UpdateFunc[];
	void SetUpdate(UPDATE_STATE inState) { m_stateNow = inState; m_isStateDirty = false; }

	const UPDATE_FUNC* m_funcInit;
	const UPDATE_FUNC* m_funcUpdate;

	bool m_isStateDirty;

	// �؂�ւ��^�C�~���O�ł̏�����
	void Init_FadeNow();
	void Init_CountDown();
	void Init_GamePlay();
	void Init_GameEnd();
	void Init_GamePouse();

	//�@�X�V�̃X�e�[�g�֐�
	void Update_FadeNow();
	void Update_CountDown();
	void Update_GamePlay();
	void Update_GameEnd();
	void Update_GamePouse();

	UPDATE_STATE	m_stateNow;		// �X�L���X�e�[�g�̏��

public:
	void ResetGame();	// ���E���h�ڍs���̏���

	// �Z�b�^�[
	static void SetGame(GAME gamestate) {m_gamestate = gamestate;};

	// �Q�b�^�[
	static GAME GetGame() {return m_gamestate;};
	static CCamera * GetCamera() { return m_pCamera; };
	static CLight*GetLight() { return m_pLight; };
	static bool GetDebugCamera() { return bDebugCamera; };
	static CPlayer*GetPlayer(int number) { return m_pPlayer[number]; };
	static CTimer*GetTimer() { return m_pTimer; };
	static CMap*GetMap() { return m_pMap; };

private:
	static	CPlayer*m_pPlayer[MAX_PLAYER];
	static	GAME m_gamestate;			// �Q�[���̏��
	static	CCamera*m_pCamera;			// �J����
	static	CLight*m_pLight;			// ����
	static	bool bDebugCamera;			// �f�o�b�O�p�J������ON/OFF
	static	CTimer*m_pTimer;			// �^�C�}�[
	static	CCountDownUI* m_pCountDown;		// �J�E���g�_�E��
	static	CUI*m_pUI;					// UI
	static	CMap*m_pMap;				// �}�b�v
	static CStatusUI* m_apStatusUI[MAX_PLAYER];	// �X�e�[�^�X�\��
	int		m_Timer;					// �t�F�[�h�A�E�g�܂ł̃^�C�}�[
	ROUND	m_Round;					// ���݂̃��E���h

	/* �|�[�Y�@�\ */
	CObject2D* m_pouse_bg;
	CObject2D* m_pouse_exitButton;
	CObject2D* m_pouse_buttonBg;
	CObject2D* m_pouse_backButton;
	CObject2D* m_pouse_replayButton;
	int m_pouse_bottonIndex;
};

#endif