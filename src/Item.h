//=============================================================================
//
// item.h
// Author : ����]��
//
//=============================================================================
#ifndef _ITEM_H_
#define _ITEM_H_

#include "Object3D.h"

//�A�C�e���N���X
class CItem : public CObject3D
{
public:
	explicit CItem(int nPriority = 3);								//�R���X�g���N�^
	~CItem() override;												//�f�X�g���N�^

	HRESULT Init(void) override;																	//����������
	void Uninit(void) override;																		//�I������
	void Update(void) override;																		//�X�V����
	void Draw(void) override;																		//�`�揈��

	void SetLife(int nLife) { m_nLife = nLife; }													//�\�����Ԃ̐ݒ�

	int GetLife(void) { return m_nLife; }															//�\�����Ԃ̎擾

	static CItem* Create(const D3DXVECTOR3 pos, const D3DXVECTOR3 size, const D3DXVECTOR3 rot);		//��������

private:
	//�����o�ϐ�
	int m_nLife;						//�\������

};

#endif