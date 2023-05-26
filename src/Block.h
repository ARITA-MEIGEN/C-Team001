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

//-----------------------------------------------------------------------------
// �O���錾
//-----------------------------------------------------------------------------
class CPlayer;
class CItem;

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
	void DeleteItem();
	static CBlock *Create(D3DXVECTOR3 pos, float lot);

	//�Z�b�^�[
	void SetPlayerNumber(int number);
	void SetStop(const bool isStop) { m_isStop = isStop; }
	void SetOnItem(CItem* onItem) { m_onItem = onItem; }

	//�Q�b�^�[
	int GetNumber() { return m_number; };
	bool IsStop() { return m_isStop; };

	CPlayer* GetOnPlayer() { return m_onPlayer; };
	CItem* GetOnItem() { return m_onItem; };

private:
	//�����o�ϐ�
	int m_number;	// �v���C���[�̔ԍ�
	bool m_isStop;	// �i�s�s��
	CPlayer* m_onPlayer;	// ����Ă�v���C���[
	CItem* m_onItem;		// ����Ă�A�C�e��
};

#endif
