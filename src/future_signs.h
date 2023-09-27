//=============================================================================
//
// �u���b�N����
// Author:arita meigen
//
//=============================================================================
#ifndef _FUTURE_SIGNS_H_			// ���̃}�N����`������ĂȂ�������
#define _FUTURE_SIGNS_H_			// ��d�C���N���[�h�h�~�̃}�N����`

//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include"ObjectX.h"

//=============================================================================
// �\���̒�`
//=============================================================================
class CFutureSigns : public CObjectX
{
private:
public:
	explicit CFutureSigns(int nPriority = 2);
	~CFutureSigns() override;
	HRESULT Init() override;
	void Uninit() override;
	void Update() override;
	static CFutureSigns *Create(D3DXVECTOR3 pos);

	// Setter
	void SetPlayerNumber(int number);

	// Getter
	int GetNumber() { return m_number; };

private:
	//�����o�ϐ�
	int m_number;	// �v���C���[�̔ԍ�
	int m_time;
};
#endif
