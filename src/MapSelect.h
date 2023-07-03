//=============================================================================
//
// �}�b�v�I��
// Author : ����]��
//
//=============================================================================
#ifndef _MAPSELECT_H_
#define _MAPSELECT_H_

//�C���N���[�h
#include "main.h"
#include "Application.h"
#include "Mode.h"
#include "Object2D.h"
#include "Game.h"

//�O���錾
class CMap;
class CCamera;
class CLight;

class CMapSelect : public CMode
{
public:

	CMapSelect();
	~CMapSelect();

	HRESULT Init();			// ������
	void Uninit();			// �I��
	void Update();			// �X�V
	void Draw();			// �`��

	void Input();			// ����
	void Select();			// �I������

	//static int GetSelectSkill(int nCntPlayer) { return m_nSkill[nCntPlayer]; }

private:
	bool m_bMapChange;					// �}�b�v��ύX�������ǂ���
	int m_nMapNumber;					// ���ݑI������Ă���}�b�v�̔ԍ�
	CObject2D*m_pObj2D[MAX_PLAYER];		// �X�L���I���̘g
	CCamera*m_pCamera;					// �J����
	CLight*m_pLight;					// ����
	CMap*m_pMap;						// �}�b�v
};

#endif