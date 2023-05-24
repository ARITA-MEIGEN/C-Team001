//=============================================================================
//
// �I�u�W�F�N�g
// Author : �L�c����
//
//=============================================================================
#ifndef _RESULT_H_
#define _RESULT_H_

//�C���N���[�h
#include "main.h"
#include "Application.h"
#include "Mode.h"
#include "Object2D.h"

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

	//�Q�b�^�[
	//static CObject2D*GetBg() { return m_pBg; };
private:
	CCamera*m_pCamera;					// �J����
	CLight*m_pLight;					// ����
	CObject2D*m_apRank[MAX_PLAYER];		//���ʕ\��UI
	CPlayer*m_pPlayer[MAX_PLAYER];		//�v���C���[
	
};

#endif // !_OBJECT_H_



