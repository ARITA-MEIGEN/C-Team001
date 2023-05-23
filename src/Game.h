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

#define MAX_PLAYER	(4)
#define STAGE_WIDTH	(350)	// ��������[�܂ł̒���
#define END_TIMER	(120)	// �v���C���[������ł���I���܂ł̎���
#define END_SCORE	(2)		// �Q�[���I�����邽�߂̃X�R�A

//�O���錾
class CPlayer;
class CCamera;
class CLight;
class CFloor;
class CTimer;
class CUI;
class CMap;
class CSpeed;
class CGauge;

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
	void Update() override;
	void Draw() override;
	void ResetGame();	// ���E���h�ڍs���̏���
	void BlockCount();

	// �Z�b�^�[
	static void SetGame(GAME gamestate) {m_gamestate = gamestate;};

	// �Q�b�^�[
	static GAME GetGame() {return m_gamestate;};
	static CCamera * GetCamera() { return m_pCamera; };
	static CFloor*GetFloor() { return m_pFloor; };
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
	static	CFloor*m_pFloor;			// ��
	static	bool bDebugCamera;			// �f�o�b�O�p�J������ON/OFF
	static	CTimer*m_pTimer;			// �^�C�}�[
	static	CUI*m_pUI;					// UI
	static	CMap*m_pMap;				// �}�b�v
	int		m_Timer;					// �t�F�[�h�A�E�g�܂ł̃^�C�}�[
	ROUND	m_Round;					// ���݂̃��E���h
};

#endif