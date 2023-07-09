//=============================================================================
//
// �X�L���I��
// Author : ����]��
//
//=============================================================================
#ifndef _SKILLSELECT_H_
#define _SKILLSELECT_H_

//�C���N���[�h
#include "main.h"
#include "Application.h"
#include "Mode.h"
#include "Object2D.h"
#include "Game.h"

//�O���錾
class CPlayer;
class CCamera;
class CLight;
class CBg;

class CSkillSelect : public CMode
{
public:

	enum SKILL_STATE
	{
		NONE,	// �f�t�H���g
		SPEED,	// ����
		PAINT,	// �h��
		MAX
	};

	CSkillSelect();
	~CSkillSelect();

	HRESULT Init();			// ������
	void Uninit();			// �I��
	void Update();			// �X�V
	void Draw();			// �`��

	static int GetSelectSkill(int nCntPlayer) { return m_nSkill[nCntPlayer]; }

private:
	void Input();			// ����
	void Select();			// �I������
	void Entry();			// �G���g���[
private:
	static int m_nSkill[MAX_PLAYER];	// ���ݑI������Ă���X�L���̔ԍ�
	bool m_isDecision[MAX_PLAYER];		// ���蒆
	int m_inputNumber[MAX_PLAYER];		// �G���g���[����input�ԍ�
	CObject2D* m_pObj2D[MAX_PLAYER];	// �X�L���I���̘g
	CPlayer* m_pPlayer[MAX_PLAYER];		// �v���C���[

	CBg* m_pBg;							// �w�i
	CCamera* m_pCamera;					// �J����
	CLight* m_pLight;					// ����
	SKILL_STATE m_state;				// ���
};

#endif