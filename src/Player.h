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
#include"Command.h"
#include <vector>

//�O���錾
class CController;
class CShadow;
class CObjectX;
class CBullet;
class CBlock;
class CMotion;

//�}�N����`
#define MAX_GAUGE		(10)

class CPlayer :public CObject
{
private:
	static const std::string MOTION_PATH;	// ���[�V�����f�[�^�p�X
	static const float PLAYER_SPEED;		// �ړ����x
	static const float ADD_SPEED;			// �A�C�e���ŉ��Z����X�s�[�h
	static const float SKILL_BUFF_TIME;		// �o�t�̌��ʎ���(Lv1�)

public:
	enum PLAYER_STATE
	{
		PST_STAND,		// ����
		PST_DIE,		// ��e���
		PST_SPEED,		// �������
		PST_PAINT,		// �h�苭�����
		PST_KNOCKBACK,	// �m�b�N�o�b�N�������
		PST_AREA,		// �G���A�������
		PST_MAX
	};

	enum ITEM_STATE
	{
		ITEM_NONE,	// ����
		ITEM_SPEED,	// ����
		ITEM_PAINT,	// �h�苭��
		ITEM_MAX
	};

private:
	enum EState
	{
		STATE_IDLE = 0,
		STATE_WALK,
		STATE_JUMP,
		STATE_MAX,
		STATE_INVALID = -1,
	};

	enum PLAYER_MOTION
	{
		//�n��
		PM_NEUTRAL,		// �j���[�g����
		PM_WALK,		// �ړ�
		PM_STAN,		// �X�^��
		PM_WIN,			// ����
		PM_LOSE,		// �s�k
		PM_SELECT,		// �X�L���I��
		PM_MAX,	
		PM_INVALID = -1
	};


public:
	explicit CPlayer(int nPriority = 3);
	~CPlayer();
	//�v���g�^�C�v�錾
	HRESULT	Init() override;
	void	Uninit() override;
	void	Update() override;
	void	Draw() override;

	//�@�v���C���[�̃X�e�[�g�֐�
	void Update_Idle();
	void Update_Walk();
	void Update_Jump();

	static CPlayer*	Create(D3DXVECTOR3 pos, D3DXVECTOR3 rot);	// �v���C���[����

	// Setter
	void SetController(CController* inOperate);
	void SetPos(D3DXVECTOR3 pos) { m_pos = pos; };					// �ʒu�̐ݒ�
	void SetRot(D3DXVECTOR3 rot) { m_rot = rot; };					// �����̐ݒ�
	void SetMove(D3DXVECTOR3 move) { m_move = move; };				// �����̐ݒ�
	void SetSkillGauge(float skill) { m_fSkillGauge = skill; }		// �X�L���Q�[�W�̗ʂ̐ݒ�
	void SetTeleport(bool bTeleport) { m_bTeleport = bTeleport; }
	void SetResultMotion(int Rank);								// ���U���g���̃��[�V�����Đ�

	// Getter
	D3DXVECTOR3		GetPos() { return m_pos; };
	PLAYER_MOTION	GetNowMotion() { return m_Motion; };
	D3DXMATRIX		GetMtx() { return m_mtxWorld; };				//�}�g���b�N�X�̎擾
	float			GetSkillGauge() { return m_fSkillGauge; }		//�X�L���Q�[�W�̗ʂ̎擾
	int				GetPlayerNumber() { return m_nPlayerNumber; }	//�v���C���[�̔ԍ��̎擾
	bool			GetTeleport() { return m_bTeleport; }

private:
	void Updatepos();			// ���W�̍X�V
	void Normalization();		// ���K��
	void BlockCollision();		// �u���b�N�Ƃ̔���
	void TakeItem();			// �A�C�e�����E��
private:	// �ÓI�����o�[�ϐ�
	static const UPDATE_FUNC mUpdateFunc[];
	static int		m_nNumPlayer;			// �v���C���[�̐�

private:	// ���ړ������ꗗ��
	void Move();	// �ړ�

	void TurnLookAtMoveing();	// �ړ����������ċȂ���
	void StopNoBlock();			// �u���b�N���Ȃ��ꏊ�Œ�܂�
	void TurnCenterBlock();		// �u���b�N�̐^�񒆂ŋȂ���悤�ɂȂ�
	void KnockBack(CPlayer *pFastPlayer, CPlayer *pLatePlayer);			// �m�b�N�o�b�N����

private:	// ���X�L�������ꗗ��
	void Skill();			// �X�L������

	enum SKILL_STATE
	{
		SKILL_IDLE = 0,
		SKILL_SPEED,		// ����
		SKILL_PAINT,		// �h�͈͊g��
		SKILL_KNOCKBACK,	// �m�b�N�o�b�N
		SKILL_AREA,			// �G���A����
		SKILL_MAX
	};

	using SKILL_FUNC = void(CObject::*)();
	static const SKILL_FUNC m_SkillFunc[];
	void SetSkill(SKILL_STATE inState) { m_skillStateNow = inState; }

	const SKILL_FUNC* m_funcSkill;

	//�@�X�L���̃X�e�[�g�֐�
	void Skill_Idel();
	void Skill_Speed();
	void Skill_Paint();
	void Skill_Knockback();

	SKILL_STATE		m_skill;			// ���̃L�����N�^�[���d�l����X�L��
	SKILL_STATE		m_skillStateNow;	// �X�L���X�e�[�g�̏��
	int				m_nSkillLv;			// �v���C���[�̃X�L��L��
	int				m_nSkillBuffTime;	// �X�L���������ʎ���
	float			m_fSkillGauge;		// �X�L���Q�[�W�̗�
	float			m_fSubGauge;		// �X�L���Q�[�W�����Z������

private:	// �����o�[�ϐ�
	CController*	m_controller;			// ���߂��o���l
	std::vector<CObjectX*>	m_apModel;		// ���f���̃C���X�^���X
	CMotion*		m_motion;				// ���[�V����
	D3DXMATRIX		m_mtxWorld;				// ���[���h�}�g���b�N�X
	D3DXVECTOR3		m_pos;					// �ʒu
	D3DXVECTOR3		m_rot;					// ����
	D3DXVECTOR3		m_move;					// �ړ���
	D3DXVECTOR3		m_moveVec;				// �ړ��x�N�g��
	D3DXVECTOR3		m_movePlanVec;			// �ړ��\��x�N�g��
	D3DXVECTOR3		m_posold;				// �O��̈ʒu
	D3DXVECTOR3		m_rotDest;				// �ړI�̊p�x�̕ۑ�
	PLAYER_MOTION	m_Motion;				// ���݂̃��[�V����
	int				m_nPlayerNumber;		// �����̃v���C���[�ԍ�
	int				m_nItemBuffTime;		// �A�C�e���������ʎ���
	int				m_nStunTime;			// �X�^��(����s�\)����
	bool			m_bKnockBack;			// �m�b�N�o�b�N���Ă��邩�ǂ���
	bool			m_bTeleport;			// �e���|�[�g�������ǂ���
	PLAYER_STATE	m_State;				// �v���C���[�̏��
	ITEM_STATE		m_ItemState;			// �A�C�e���̏��
	CShadow*		m_pShadow;				// �e
	CBlock*			m_pOnBlock;				// �v���C���[�̏���Ă���u���b�N�ւ̃|�C���^

	//�����o������֘A
	D3DXVECTOR3		m_aAxisSiz[PST_MAX];	// �����o������̑傫��

};

#endif
