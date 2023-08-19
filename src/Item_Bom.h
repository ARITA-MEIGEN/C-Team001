//=============================================================================
//
// item_bom.h
// Author : ����]��
//
//=============================================================================
#ifndef _ITEM_BOM_H_
#define _ITEM_BOM_H_

//-----------------------------------------------------------------------------
// �O���錾
//-----------------------------------------------------------------------------
class CBlock;

#include "item.h"

//���e�N���X
class CBom : public CItem
{
public:
	explicit CBom(int nPriority = 3);		// �R���X�g���N�^
	~CBom() override;						// �f�X�g���N�^

	HRESULT Init(void) override;			// ����������
	void Update(void) override;				// �X�V����

	void Explosion(void);					// ��������

	static CBom* Create(const D3DXVECTOR3 pos, const int nLife);	// �A�C�e����������
	static CBom* Create(CBlock *pOnBlock, int nPlayerNumber,const int nLife, const bool bExplosion);			// ���e��������

private:
	CBlock *m_pOnBlock;
	int m_nPlayerNumber;
	bool m_bExplosion;
};

#endif