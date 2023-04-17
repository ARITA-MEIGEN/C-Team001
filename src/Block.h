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
private:
	//�����o�֐�
};

#endif
