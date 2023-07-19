//=============================================================================
//
// item_bom.h
// Author : ����]��
//
//=============================================================================
#ifndef _ITEM_BOM_H_
#define _ITEM_BOM_H_

#include "item.h"

//���e�N���X
class CBom : public CItem
{
public:
	explicit CBom(int nPriority = 3);		// �R���X�g���N�^
	~CBom() override;						// �f�X�g���N�^

	HRESULT Init(void) override;			// ����������
	void Uninit(void) override;				// �I������
	void Update(void) override;				// �X�V����

	void Explosion(void);						// ��������

	static CBom* Create(const D3DXVECTOR3 pos, const D3DXVECTOR3 size, const D3DXVECTOR3 rot, const int nLife);	// ��������

private:
};

#endif