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
class CBlock : public CObjectX
{
private:
	static const float m_sinkLimit;	// ���ސ���
public:
	explicit CBlock(int nPriority = 2);
	~CBlock() override;
	HRESULT Init() override;
	void Uninit() override;
	void Update() override;
	void Draw() override;
	void DeleteItem();
	static CBlock *Create(D3DXVECTOR3 pos, float lot);

	// Setter
	void SetPlayerNumber(int number);
	void SetStop(const bool isStop) { m_isStop = isStop; }
	void SetOnItem(CItem* onItem) { m_onItem = onItem; }
	void SetOnPlayer(CPlayer* onPlayer) { m_onPlayer = onPlayer; }
	void SetSink(float power);

	// Getter
	int GetNumber() { return m_number; };
	bool IsStop() { return m_isStop; };

	CPlayer* GetOnPlayer() { return m_onPlayer; };
	CItem* GetOnItem() { return m_onItem; };

private:
	void Sink();		// ����
private:
	//�����o�ϐ�
	int m_number;	// �v���C���[�̔ԍ�
	bool m_isStop;	// �i�s�s��
	CPlayer* m_onPlayer;	// ����Ă�v���C���[
	CItem* m_onItem;		// ����Ă�A�C�e��

	// ���މ��o
	float m_sinkPower;	// ���ޗ�
	float m_upPower;	// ������
	bool m_isSink;		// ���ޏ󋵂��H
};

#endif
