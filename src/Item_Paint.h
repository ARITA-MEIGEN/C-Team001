//=============================================================================
//
// item_paint.h
// Author : ����]��
//
//=============================================================================
#ifndef _ITEM_PAINT_H_
#define _ITEM_PAINT_H_

#include "item.h"

//�����N���X
class CPaint : public CItem
{
public:
	explicit CPaint(int nPriority = 3);		// �R���X�g���N�^
	~CPaint() override;						// �f�X�g���N�^

	HRESULT Init(void) override;			// ����������
	void Uninit(void) override;				// �I������
	void Update(void) override;				// �X�V����

	static CPaint* Create(const D3DXVECTOR3 pos, const D3DXVECTOR3 size, const D3DXVECTOR3 rot, const int nLife);	// ��������

private:
};

#endif