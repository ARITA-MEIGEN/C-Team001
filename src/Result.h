//=============================================================================
//
// �I�u�W�F�N�g
// Author : �L�c����
//
//=============================================================================
#ifndef _RESULT_H_
#define _RESULT_H_

//include
#include "main.h"
#include "Application.h"
#include "Mode.h"
#include "Object2D.h"
#include"ObjectX.h"

#define	MAX_PLAYER	(4)		//�v���C���[�l��

//�O���錾
class CPlayer;
class CCamera;
class CLight;

class CResult : public CMode
{
public:
	CResult();
	~CResult();

	HRESULT Init();
	void Uninit();
	void Update();
	void Draw();
	void ResultCamera();	//���U���g�p�J�������o

	//�Q�b�^�[
	//static CObject2D*GetBg() { return m_pBg; };
private:
	CCamera* m_pCamera;					// �J����
	CLight* m_pLight;					// ����
	CObject2D* m_apRank[MAX_PLAYER];	// ���ʕ\��UI
	CPlayer* m_pPlayer[MAX_PLAYER];		// �v���C���[
	CObjectX* m_pCylinder[MAX_PLAYER];	// �����L���O�p�̒�

	static const float RANK_WIDTH;		// �����L���O��UI�̐ݒu�Ԋu
	static const float RANK_HEIGHT;		// �����L���O��UI�̐ݒu�Ԋu

	static const float PLAYER_WIDTH;	// �v���C���[��UI�̐ݒu�Ԋu
	static const float TOP_HEIGHT;		// 1st�̍���
	static const float PLAYER_HEIGHT;	// �v���C���[�Ԃ̏��ʂ��Ƃ̍����̊Ԋu

};

#endif // !_OBJECT_H_



