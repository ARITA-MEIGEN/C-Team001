//=============================================================================
//
// item.h
// Author : ����]��
//
//=============================================================================
#ifndef _ITEM_H_
#define _ITEM_H_

#include "Object3D.h"

class CObjectX;

//�A�C�e���N���X
class CItem : public CObject3D
{
public:
	static const float BUFF_TIME;	// �A�C�e���o�t�̌��ʎ���
private:
	static const int LIMIT_DISPLAY;	// �_�ł��n�߂鎞��

public:
	enum ITEM_EFFECT
	{
		NONE,	// ����
		SPEED,	// ����
		PAINT,	// �h�苭��
		BOM,	// �{���������Ă�����
		MAX
	};

	explicit CItem(int nPriority = 3);	// �R���X�g���N�^
	~CItem() override;					// �f�X�g���N�^

	HRESULT Init(void) override;		// ����������
	void Uninit(void) override;			// �I������
	void Update(void) override;			// �X�V����
	void Draw(void) override;			// �`�揈��

	void SetSizePlan(const D3DXVECTOR3& inSize) { m_sizePlan = inSize; }	// �傫���\��̐ݒ�
	void SetLife(int nLife) { m_nLife = nLife; }							// �\�����Ԃ̐ݒ�
	void SetEffect(ITEM_EFFECT effect) { m_effect = effect; }				// �G�t�F�N�g�̐ݒ�

	int GetLife(void) { return m_nLife; }							// �\�����Ԃ̎擾
	ITEM_EFFECT GetEffect(void) { return m_effect; }				// �G�t�F�N�g�̎擾

private:
	//�����o�ϐ�
	bool m_bDisplay;		// �\�����邩�ǂ���
	int m_nLife;			// �\������
	ITEM_EFFECT m_effect;	// ����

	// �o�����o�p
	D3DXVECTOR3 m_sizePlan;	// �傫���\��
	CObjectX* m_box;
};

#endif