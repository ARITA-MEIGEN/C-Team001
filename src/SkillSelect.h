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

	HRESULT Init();			//������
	void Uninit();			//�I��
	void Update();			//�X�V
	void Draw();			//�`��

	void Input();			//����
	void Select();			//�I������

	static int GetSelectSkill(int nCntPlayer) { return m_nSkill[nCntPlayer]; }
private:
	static int m_nSkill[MAX_PLAYER];			//���ݑI������Ă���X�L���̔ԍ�
	CObject2D*m_pBg;					//�w�i
	CObject2D*m_pObj2D[MAX_PLAYER];		//�X�L���I���̘g
	SKILL_STATE m_state;				//���
	
};

#endif // !_OBJECT_H_



