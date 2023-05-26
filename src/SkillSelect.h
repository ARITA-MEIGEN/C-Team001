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

//��`
#define	MAX_PLAYER	(4)		//�v���C���[�l��

//�O���錾
class CPlayer;
class CCamera;
class CLight;

class CSkillSelect : public CMode
{
public:
	CSkillSelect();
	~CSkillSelect();

	HRESULT Init();
	void Uninit();
	void Update();
	void Draw();

	//�Q�b�^�[
	//static CObject2D*GetBg() { return m_pBg; };
private:
	CCamera*m_pCamera;					// �J����
	CLight*m_pLight;					// ����

	CPlayer*m_pPlayer[MAX_PLAYER];		//�v���C���[

};

#endif // !_OBJECT_H_



