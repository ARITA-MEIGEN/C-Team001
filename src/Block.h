//=============================================================================
//
// �u���b�N����
// Author:arita meigen
//
//=============================================================================
#ifndef _BLOCK_H_			// ���̃}�N����`������ĂȂ�������
#define _BLOCK_H_			// ��d�C���N���[�h�h�~�̃}�N����`

//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include"ObjectX.h"
#include"Application.h"

//=============================================================================
// �\���̒�`
//=============================================================================
// ���_�f�[�^
class CBlock : public CObjectX
{
public:
	explicit CBlock(int nPriority = 2);
	~CBlock()override;
	HRESULT Init()override;
	void Uninit()override;
	void Update()override;
	void Draw()override;
	static CBlock *Create(D3DXVECTOR3 pos, float lot);

	//�Z�b�^�[
	void SetPlayerNumber(int number);

	//�Q�b�^�[
	int GetNumber() { return m_number; };	//0�`3�̓v���C���[4�̓j���[�g����

private:
	//�����o�ϐ�
	int m_number;//�v���C���[�̔ԍ�
};

#endif
