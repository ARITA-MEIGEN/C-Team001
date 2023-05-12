//=============================================================================
//
// X�t�@�C���ǂݍ���
// Author : �L�c����
//
//=============================================================================

#ifndef _PLAYER_H_
#define _PLAYER_H_

//�C���N���[�h
#include"main.h"
#include"Object.h"
#include"ObjectX.h"
#include"Command.h"

//�O���錾
class CController;
class CShadow;
class CObjectX;
class CBullet;
class CBlock;
class CMotion;

//�}�N����`
#define PLAYER_LEGPARTS	(13)
#define	NUM_PLAYERPARTS	(1+PLAYER_LEGPARTS)
#define MAX_GAUGE		(100)

class CPlayer :public CObject
{
private:
	static const float PLAYER_SPEED;	// �ړ����x
	static const float ITEM_ADD_SPEED;	// �A�C�e���ŉ��Z����X�s�[�h

public:

	enum PLAYER_MOTION
	{
		//�n��
		PM_ST_NEUTRAL,		// �j���[�g����
		PM_ST_MOVE,			// �ړ�(���Ⴊ�݂�������)
		PM_MAX
	};

	enum PLAYER_STATE
	{
		PST_STAND,	// ����
		PST_DIE,	// ��e���
		PST_SPEED,	// �������
		PST_MAX
	};

	explicit CPlayer(int nPriority = 3);
	~CPlayer();
	//�v���g�^�C�v�錾
	HRESULT			Init() override;
	void			Uninit() override;
	void			Update() override;
	void			Draw() override;
	void			Move();										// �ړ�
	static CPlayer*	Create(D3DXVECTOR3 pos, D3DXVECTOR3 rot);	// �v���C���[����

	void Input();				// ���͏���
	void Updatepos();			// ���W�̍X�V
	void Normalization();		// ���K��
	void BlockCollision();		// �u���b�N�Ƃ̔���
	void Skill();				// �X�L������

	// Setter
	void SetController(CController* inOperate);
	void SetPos(D3DXVECTOR3 pos) { m_pos = pos; };			// �ʒu�̐ݒ�
	void SetRot(D3DXVECTOR3 rot) { m_rot = rot; };			// �����̐ݒ�
	void SetSkillGauge(int skill) { m_nSkillGauge = skill; }	// �X�L���Q�[�W�̗ʂ̐ݒ�

	// Getter
	D3DXVECTOR3		GetPos() { return m_pos; };
	PLAYER_MOTION	GetNowMotion() { return m_Motion; };
	D3DXMATRIX		GetMtx() { return m_mtxWorld; };				//�}�g���b�N�X�̎擾
	int				GetSkillGauge() { return m_nSkillGauge; }		//�X�L���Q�[�W�̗ʂ̎擾
	int				GetPlayerNumber() { return m_nPlayerNumber; }	//�v���C���[�̔ԍ��̎擾

private:
	void TurnLookAtMoveing();		// �ړ����������ċȂ���
private:
	CController*	m_controller;					// ���߂��o���l
	CObjectX*		m_apModel[NUM_PLAYERPARTS];		// ���f���̃C���X�^���X
	CMotion*		m_motion;						// ���[�V����
	D3DXMATRIX		m_mtxWorld;						// ���[���h�}�g���b�N�X
	D3DXVECTOR3		m_pos;							// �ʒu
	D3DXVECTOR3		m_rot;							// ����
	D3DXVECTOR3		m_move;							// �ړ���
	D3DXVECTOR3		m_moveVec;						// �ړ��x�N�g��
	D3DXVECTOR3		m_movePlanVec;						// �ړ��\��x�N�g��
	D3DXVECTOR3		m_posold;						// �O��̈ʒu
	D3DXVECTOR3		m_rotDest;						// �ړI�̊p�x�̕ۑ�
	PLAYER_MOTION	m_Motion;						// ���݂̃��[�V����
	static int		m_nNumPlayer;					// �v���C���[�̐�
	int				m_nPlayerNumber;				// �����̃v���C���[�ԍ�
	int				m_nSkillLv;						// �v���C���[�̃X�L��L��
	int				m_nBuffTime;					// �������ʎ���
	int				m_nSkillGauge;					// �X�L���Q�[�W�̗�
	PLAYER_STATE	m_State;						// �v���C���[�̏��
	CShadow*		m_pShadow;						// �e
	CBlock*			m_pOnBlock;						// �v���C���[�̏���Ă���u���b�N�ւ̃|�C���^

	//�����o������֘A
	D3DXVECTOR3		m_aAxisSiz[PST_MAX];			// �����o������̑傫��
};

#endif
