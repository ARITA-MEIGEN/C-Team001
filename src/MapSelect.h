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
#include "Map.h"

//�O���錾
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

	static int GetMapNumber() { return m_nMapNumber; }

private:
	static int m_nMapNumber;						// ���ݑI������Ă���}�b�v�̔ԍ�
	bool m_bMapChange;								// �}�b�v��ύX�������ǂ���
	CObject2D* m_pObj2DPolygon[(CMap::STAGE_MAX)];	// �}�b�v�I��
	CCamera* m_pCamera;								// �J����
	CLight* m_pLight;								// ����
	CMap* m_pMap;									// �}�b�v
};

#endif