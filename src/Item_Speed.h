//=============================================================================
//
// item_speed.h
// Author : ����]��
//
//=============================================================================
#ifndef _ITEM_SPEED_H_
#define _ITEM_SPEED_H_

#include "item.h"

//�����N���X
class CSpeed : public CItem
{
public:
	explicit CSpeed(int nPriority = 3);		// �R���X�g���N�^
	~CSpeed() override;						// �f�X�g���N�^

	HRESULT Init(void) override;			// ����������
	void Update(void) override;				// �X�V����

	static CSpeed* Create(const D3DXVECTOR3 pos);	// ��������

private:
};

#endif