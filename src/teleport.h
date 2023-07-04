//=============================================================================
//
// �e���|�[�g�u���b�N����
// Author:takano keisuke
//
//=============================================================================
#ifndef _TELEPORT_H_			// ���̃}�N����`������ĂȂ�������
#define _TELEPORT_H_			// ��d�C���N���[�h�h�~�̃}�N����`

//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include"block.h"

//-----------------------------------------------------------------------------
// �O���錾
//-----------------------------------------------------------------------------
class CPlayer;
class CItem;

//=============================================================================
// �\���̒�`
//=============================================================================
class CTeleport : public CBlock
{
public:
	explicit CTeleport(int nPriority = 2);
	~CTeleport();
	HRESULT Init();
	void Uninit();
	void Update();
	void Draw();

	static CTeleport *Create(D3DXVECTOR3 pos,int nNumber);

	// Setter
	void TeleportPlayerNumber(int number);
	void SetStop(const bool isStop) { m_isStop = isStop; }
	void SetOnPlayer(CPlayer* onPlayer) { m_onPlayer = onPlayer; }

	// Getter
	int GetNumber() { return m_number; };
	bool IsStop() { return m_isStop; };

	CPlayer* GetOnPlayer() { return m_onPlayer; };

private:
	//�����o�ϐ�
	int m_number;			// �v���C���[�̔ԍ�
	int m_nTeleportNmber;	// �e���|�[�^�[�̔ԍ�
	bool m_bTeleport;		// �e���|�[�g�������ǂ���
	bool m_isStop;			// �i�s�s��
	CPlayer* m_onPlayer;	// ����Ă�v���C���[
};

#endif
