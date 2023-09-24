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
class CObject3D;
class CAreaWarning;

//=============================================================================
// �\���̒�`
//=============================================================================
class CArea : public CObject
{
public:
	explicit CArea(int nPriority = 3);
	~CArea();
	HRESULT Init();
	void Uninit();
	void Update();
	void Draw() {}
	static CArea* Create(D3DXVECTOR2 index, const unsigned int inRange, const unsigned int inSignsTime, const unsigned int inDiedTime);

	void SetFunctionAtSignsBegin(std::function<void()> inFunction) { m_functionAtSignsBegin = inFunction; }
	void SetFunctionAtSignsEnd(std::function<void()> inFunction) { m_functionAtSignsEnd = inFunction; }
	void SetFunctionAtDied(std::function<void()> inFunction) { m_functionAtDied = inFunction; }

private:
	//�����o�ϐ�
	D3DXVECTOR2 m_centerIndex;	// ���S�̃u���b�N�ԍ�
	unsigned int m_range;		// �͈�
	unsigned int m_time;		// ����
	unsigned int m_signsTime;	// �\������

	std::function<void()> m_functionAtDied;			// ���S���̏���
	std::function<void()> m_functionAtSignsBegin;	// �\���n�����̏���
	std::function<void()> m_functionAtSignsEnd;		// �\���I�����̏���

	CObject3D* m_floar;
	float m_length;
	D3DXVECTOR3 m_pos;

	CAreaWarning* m_warning;
	bool isBeginUpdate;
};

#endif
