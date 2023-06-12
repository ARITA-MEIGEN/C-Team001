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

private:
	CObject2D*m_pBg;				//�w�i
	CObject2D*m_pObj2D[MAX_PLAYER];		//�X�L���I���̘g
	SKILL_STATE m_state;				//���
	int m_nSkill[MAX_PLAYER];			//���ݑI������Ă���X�L���̔ԍ�
};

#endif // !_OBJECT_H_



