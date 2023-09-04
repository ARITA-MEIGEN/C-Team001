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
	static const float UP_LIMIT;	// ���ސ���
	static const float UP_POWER;	// �オ���
	static const float DOWN_POWER;	// �������
public:
	explicit CBlock();
	~CBlock() override;
	HRESULT Init() override;
	void Uninit() override;
	void Update() override;
	void DeleteItem();
	static CBlock *Create(D3DXVECTOR3 pos);

	// Setter
	void SetPlayerNumber(int number);
	void SetStop(const bool isStop) { m_isStop = isStop; }
	void SetTeleport(const bool bTeleport) { m_bTeleport = bTeleport; }
	void SetOnItem(CItem* onItem) { m_onItem = onItem; }
	void SetOnPlayer(CPlayer* onPlayer) { m_onPlayer = onPlayer; }
	void SetSink(float power);
	void SetNumber(int inNumber) { m_number = inNumber; }

	void SetPlanPos(D3DXVECTOR3 inPos);

	void CancelPermitSink() { m_isSinkPermit = false; }

	void OnUpDownMove() { m_isMoveUpDown = true; m_move.y = 0.02f; }

	// Getter
	int GetNumber() { return m_number; };
	bool GetTeleport() { return m_bTeleport; };
	bool IsStop() { return m_isStop; };
	bool IsMovePermit() { return m_isMovePermit; }

	CPlayer* GetOnPlayer() { return m_onPlayer; };
	CItem* GetOnItem() { return m_onItem; };

private:
	void Move();	// �ړ��M�~�b�N
	void ModifyRot();
	void UpDownMove();

private:
	//�����o�ϐ�
	int m_number;	// �v���C���[�̔ԍ�
	bool m_isStop;	// �i�s�s��
	bool m_bTeleport;		// �e���|�[�^�[���ǂ���
	CPlayer* m_onPlayer;	// ����Ă�v���C���[
	CItem* m_onItem;		// ����Ă�A�C�e��

	// �������݊֌W
	bool m_isSinkPermit;	// ���ނ��Ƃ������邩

	// �ړ�����
	bool m_isMovePermit;	// �ړ������~��Ă邩
	bool m_isMoveUpDown;	// �㉺�ړ����s�Ȃ����ۂ�
	int n_countUpDown;
	D3DXVECTOR3 m_posPlan;	// �ړ��\��
	D3DXVECTOR3 m_move;		// �ړ��x�N�g��
};

#endif
