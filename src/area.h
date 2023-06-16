//=============================================================================
//
// �u���b�N����
// Author:arita meigen
//
//=============================================================================
#ifndef _AREA_H_		// ���̃}�N����`������ĂȂ�������
#define _AREA_H_		// ��d�C���N���[�h�h�~�̃}�N����`

//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include"Object.h"
#include <functional>

//-----------------------------------------------------------------------------
// �O���錾
//-----------------------------------------------------------------------------
class CPlayer;
class CItem;

//=============================================================================
// �\���̒�`
//=============================================================================
class CArea : public CObject
{
public:
	explicit CArea(int nPriority = 2);
	~CArea();
	HRESULT Init();
	void Uninit();
	void Update();
	void Draw();
	static CArea* Create(D3DXVECTOR2 index, const unsigned int inRange,const unsigned int inTime);

	void SetFunctionAtDied(std::function<void()> inFunction) { m_functionAtDied = inFunction; }

private:
	//�����o�ϐ�
	D3DXVECTOR2 m_centerIndex;	// ���S�̃u���b�N�ԍ�
	unsigned int m_range;		// �͈�
	unsigned int m_time;		// ����
	std::function<void()> m_functionAtDied;	// ���S���̏���
};

#endif