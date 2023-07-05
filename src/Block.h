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
	static const float SINK_LIMIT;	// ���ސ���
	static const float UP_POWER;	// ���ސ���
public:
	explicit CBlock(int nPriority = 2);
	~CBlock() override;
	HRESULT Init() override;
	void Uninit() override;
	void Update() override;
	void Draw() override;
	void DeleteItem();
	static CBlock *Create(D3DXVECTOR3 pos);

	// Setter
	void SetPlayerNumber(int number);
	void SetStop(const bool isStop) { m_isStop = isStop; }
	void SetTeleport(const bool bTeleport) { m_bTeleport = bTeleport; }
	void SetOnItem(CItem* onItem) { m_onItem = onItem; }
	void SetOnPlayer(CPlayer* onPlayer) { m_onPlayer = onPlayer; }
	void SetSink(float power);

	// Getter
	int GetNumber() { return m_number; };
	bool GetTeleport() { return m_bTeleport; };
	bool IsStop() { return m_isStop; };

	CPlayer* GetOnPlayer() { return m_onPlayer; };
	CItem* GetOnItem() { return m_onItem; };

private:
	//�����o�ϐ�
	int m_number;	// �v���C���[�̔ԍ�
	bool m_isStop;	// �i�s�s��
	bool m_bTeleport;		// �e���|�[�^�[���ǂ���
	CPlayer* m_onPlayer;	// ����Ă�v���C���[
	CItem* m_onItem;		// ����Ă�A�C�e��
};

#endif
