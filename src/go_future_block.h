//=============================================================================
//
// �u���b�N����
// Author:arita meigen
//
//=============================================================================
#ifndef _GO_FUTURE_BLOCK_H_			// ���̃}�N����`������ĂȂ�������
#define _GO_FUTURE_BLOCK_H_			// ��d�C���N���[�h�h�~�̃}�N����`

//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include"ObjectX.h"

//=============================================================================
// �\���̒�`
//=============================================================================
class CGoFutureBlock : public CObjectX
{
private:
	static const float SINK_LIMIT;	// ���ސ���
	static const float UP_POWER;	// ���ސ���
public:
	explicit CGoFutureBlock(int nPriority = 2);
	~CGoFutureBlock() override;
	HRESULT Init() override;
	void Uninit() override;
	void Update() override;
	static CGoFutureBlock *Create(D3DXVECTOR3 pos);

	// Setter
	void SetPlayerNumber(int number);
	void SetSink(float power);

	// Getter
	int GetNumber() { return m_number; };

private:
	//�����o�ϐ�
	int m_number;	// �v���C���[�̔ԍ�
};
#endif