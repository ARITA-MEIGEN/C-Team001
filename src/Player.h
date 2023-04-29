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
#include"Model.h"
#include"Command.h"

//�O���錾
class CController;
class CShadow;
class CModel;
class CBullet;
class CBlock;

//�}�N����`
#define MAX_KEY				(60)			//�L�[�̑���
#define MAX_FRAME			(120)			//�t���[���̍ő吔
#define NUM_PARTS			(14)			//�p�[�c�̐�
#define MAX_WORD			(255)			//�p�X�̍ő啶����

class CPlayer :public CObject
{
private:
	static const float PLAYER_SPEED;	// �ړ����x
	static const float ITEM_ADD_SPEED;	// �A�C�e���ŉ��Z����X�s�[�h

public:
	//�L�[�v�f
	struct KEY
	{
		D3DXVECTOR3 fPos;
		D3DXVECTOR3 fRot;
	};

	//�L�[���
	struct KEY_SET 
	{
		KEY aKey[NUM_PARTS];	// ���f���̐������W������
		int nFrame;				// �Đ�����
	};

	struct MOTION_SET
	{
		KEY_SET		aKey[MAX_KEY];	// �L�[�̑���������
		int			nNumKey;		// �L�[�̑���(�t�@�C���œǂݍ���)
		bool		bLoop;			// ���[�v���邩�ǂ���
	};

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
	HRESULT			Init()override;
	void			Uninit(void)override;
	void			Update(void)override;
	void			Draw(void)override;
	void			Move();										// �ړ�
	static CPlayer*	Create(D3DXVECTOR3 pos, D3DXVECTOR3 rot);	// �v���C���[����

	// Motion
	void			ReadMotion();								// ���[�V�����ǂݍ���
	void			MotionPlayer();								// ���[�V�����̍Đ��@�����͍Đ����郂�[�V�����̔ԍ�
	void			MotionManager();							// ��Ԃɍ��킹�ă��[�V�����Đ�����
	void			PlayFirstMotion();							// �O�Ə�Ԃ��Ⴄ�ꍇ�̂ݍŏ��̃��[�V������ݒ肷��

	void			Input();									// ���͏���
	void			Updatepos();								// ���W�̍X�V
	void			Normalization();							// ���K��
	void			BlockCollision();							// �u���b�N�Ƃ̔���

	//�Z�b�^�[
	void			SetController(CController* inOperate);
	void			SetPos(D3DXVECTOR3 pos) { m_pos = pos; };	// �ʒu�̐ݒ�
	void			SetRot(D3DXVECTOR3 rot) { m_rot = rot; };	// �����̐ݒ�

	//�Q�b�^�[
	D3DXVECTOR3		GetPos() { return m_pos; };
	PLAYER_MOTION	GetNowMotion() { return m_Motion; };
	D3DXMATRIX		GetMtx() { return m_mtxWorld; };			// �}�g���b�N�X�̎擾

private:
	CController*	m_controller;					// ���߂��o���l
	CModel*			m_apModel[NUM_PLAYERPARTS];		// ���f���̃C���X�^���X
	MOTION_SET		m_apMotion[PM_MAX];				// ���[�V�����̐������������[�V�����̐�->�L�[�̑���->���f���̐�
	D3DXMATRIX		m_mtxWorld;						// ���[���h�}�g���b�N�X
	D3DXVECTOR3		m_pos;							// �ʒu
	D3DXVECTOR3		m_rot;							// ����
	D3DXVECTOR3		m_move;							// �ړ���
	D3DXVECTOR3		m_posold;						// �O��̈ʒu
	D3DXVECTOR3		m_rotDest;						// �ړI�̊p�x�̕ۑ�
	int				m_MotionCnt;					// ���[�V�����J�E���^�[
	int				m_nNumKey;						// �L�[�̑���
	int				m_nCurKey;						// ���݂̃L�[�ԍ�
	int				m_nNumModel;					// �ǂݍ��ރ��f���̐�
	char			m_nModelpass[MAX_WORD];			// �ǂݍ��ރ��f���̃p�X
	PLAYER_MOTION	m_Motion;						// ���݂̃��[�V����
	PLAYER_MOTION	m_MotionOld;					// �ЂƂO�̃��[�V����
	static int		m_nNumPlayer;					// �v���C���[�̐�
	int				m_nPlayerNumber;				// �����̃v���C���[�ԍ�
	int				m_nBuffTime;					// �������ʎ���
	PLAYER_STATE	m_State;						// �v���C���[�̏��
	bool			m_bLeftSide;					// �ǂ����������Ă邩(true�Ȃ灩)
	int				m_nNowKey;						// �L�[�ۑ��p
	CShadow*		m_pShadow;						// �e
	CBlock*			m_pOnBlock;						// �v���C���[�̏���Ă���u���b�N�ւ̃|�C���^

	//�����o������֘A
	D3DXVECTOR3		m_aAxisSiz[PST_MAX];			// �����o������̑傫��
};

#endif
