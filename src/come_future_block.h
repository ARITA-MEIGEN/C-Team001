//=============================================================================
//
// �u���b�N����
// Author:arita meigen
//
//=============================================================================
#ifndef _COME_FUTURE_BLOCK_H_			// ���̃}�N����`������ĂȂ�������
#define _COME_FUTURE_BLOCK_H_			// ��d�C���N���[�h�h�~�̃}�N����`

//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include"ObjectX.h"

//=============================================================================
// �\���̒�`
//=============================================================================
class CComeFutureBlock : public CObjectX
{
private:
public:
	explicit CComeFutureBlock(int nPriority = 2);
	~CComeFutureBlock() override;
	HRESULT Init() override;
	void Uninit() override;
	void Update() override;
	static CComeFutureBlock *Create(D3DXVECTOR3 pos);

	// Setter
	void SetPlayerNumber(int number);

	// Getter
	int GetNumber() { return m_number; };

private:
	//�����o�ϐ�
	int m_number;	// �v���C���[�̔ԍ�
};
#endif
