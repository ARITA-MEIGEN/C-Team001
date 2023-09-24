//=============================================================================
//
// bom.h
// Author : ����]��
//
//=============================================================================
#ifndef _BOM_H_
#define _BOM_H_

//-----------------------------------------------------------------------------
// �O���錾
//-----------------------------------------------------------------------------
class CBlock;

#include "objectX.h"

//���e�N���X
class CCreateBom : public CObjectX
{
public:
	explicit CCreateBom(int nPriority = 3);	// �R���X�g���N�^
	~CCreateBom() override;					// �f�X�g���N�^

	HRESULT Init() override;		// ����������
	void Uninit() override;			// �I������
	void Update() override;			// �X�V����
	void Explosion();				// ��������

	static CCreateBom* Create(CBlock *pOnBlock, D3DXVECTOR3 pos, int nPlayerNumber, int nLife);			// ���e��������

private:
	CBlock*		m_pOnBlock;			// ����Ă���u���b�N�̏��
	int			m_nPlayerNumber;	// �v���C���[�̔ԍ�
	int			m_nLife;			// �����܂ł̎���
};

#endif