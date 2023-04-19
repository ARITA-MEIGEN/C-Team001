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
	//��`
	static const int LIMIT_DISPLAY;	//�_�ł��n�߂鎞��

	explicit CSpeed(int nPriority = 3);								//�R���X�g���N�^
	~CSpeed() override;												//�f�X�g���N�^

	HRESULT Init(void) override;									//����������
	void Uninit(void) override;										//�I������
	void Update(void) override;										//�X�V����
	void Draw(void) override;										//�`�揈��

	static CSpeed* Create(const D3DXVECTOR3 pos, const D3DXVECTOR3 size, const D3DXVECTOR3 rot, const int nLife);		//��������

private:
	//�����o�ϐ�
	bool m_bDisplay;			//�\�����邩�ǂ���
};

#endif