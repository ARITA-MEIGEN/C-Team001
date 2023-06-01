//=============================================================================
// Content     (�Q�[���̐ݒ�)(player.cpp)
// Author     : �L�c����
//=============================================================================

//-----------------------------------------------------------------------------
//�C���N���[�h
//-----------------------------------------------------------------------------
#include "Player.h"
#include "PlayerController.h"
#include "Application.h"
#include "sound.h"
#include "renderer.h"
#include "input.h"

#include "Item.h"
#include "Shadow.h"
#include "Mesh.h"
#include "Game.h"
#include "Time.h"
#include "effect.h"
#include "Particle.h"
#include "Map.h"
#include "SkillGauge.h"
#include "motion.h"

//-----------------------------------------------------------------------------
// �萔
//-----------------------------------------------------------------------------
const std::string CPlayer::MOTION_PATH = "data/TXT/Player01/Player01.txt";	// ���[�V�����f�[�^�p�X
const float CPlayer::PLAYER_SPEED = 2.0f; 		// �ړ����x
const float CPlayer::ADD_SPEED = 1.5f;			// �A�C�e���ŉ��Z����X�s�[�h
const float CPlayer::SKILL_BUFF_TIME = 60.0f;	// �o�t�̌��ʎ���

//-----------------------------------------------------------------------------
// �ÓI�����o�ϐ�
//-----------------------------------------------------------------------------
int CPlayer::m_nNumPlayer = 0;					// �v���C���[�̐�

//-----------------------------------------------------------------------------
// �R���X�g���N�^
//-----------------------------------------------------------------------------
CPlayer::CPlayer(int nPriority) :CObject(nPriority)
{
	m_nPlayerNumber = m_nNumPlayer;
	m_nNumPlayer++;

	m_pShadow = CShadow::Create(m_pos, D3DXVECTOR3(80.0f, 0.0f, 80.0f));	// �e
}

//-----------------------------------------------------------------------------
// �f�X�g���N�^
//-----------------------------------------------------------------------------
CPlayer::~CPlayer()
{
	m_nNumPlayer--;
}

//-----------------------------------------------------------------------------
// ����������
//-----------------------------------------------------------------------------
HRESULT CPlayer::Init()
{
	// ���[�V�����̓Ǎ���
	m_motion = new CMotion(MOTION_PATH.data());
	m_Motion = PM_ST_NEUTRAL;	//�j���[�g�������[�V�����ɕύX

	//���f���ƃ��[�V�����̓ǂݍ���
	m_apModel = m_motion->GetParts();

	for (int i = 0; i < m_apModel.size(); i++)
	{
		//�F�w��
		switch (m_nPlayerNumber)
		{
		case 0:
			m_apModel[i]->SetCol(D3DXCOLOR(1.0f, 0.0f, 0.0f, 1.0f));
			break;
		case 1:
			m_apModel[i]->SetCol(D3DXCOLOR(0.0f, 0.0f, 1.0f, 1.0f));
			break;
		case 2:
			m_apModel[i]->SetCol(D3DXCOLOR(1.0f, 1.0f, 0.0f, 1.0f));
			break;
		case 3:
			m_apModel[i]->SetCol(D3DXCOLOR(0.0f, 1.0f, 0.0f, 1.0f));
			break;
		default:
			break;
		}
	}

	//���I�m��
	m_nSkillGauge = 0;
	m_nSkillLv = 0;

	//���I�m��
	m_controller = new CPlayerController(m_nPlayerNumber);

	return S_OK;
}

//-----------------------------------------------------------------------------
// �I������
//-----------------------------------------------------------------------------
void CPlayer::Uninit(void)
{
	if (m_pShadow != nullptr)
	{
		m_pShadow = nullptr;
	}

	if (m_controller != nullptr)
	{
		delete m_controller;
		m_controller = nullptr;
	}

	if (m_motion != nullptr)
	{
		m_motion->Uninit();
		delete m_motion;
		m_motion = nullptr;
	}

	CObject::Release();
}

//-----------------------------------------------------------------------------
// �X�V����
//-----------------------------------------------------------------------------
void CPlayer::Update(void)
{
	if (!(CGame::GetGame() != CGame::GAME_END) && !(CGame::GetGame() != CGame::GAME_START))
	{
		return;
	}

	CInput* pInput = CInput::GetKey();

	// �X�L������
	Skill();

	if (m_nSkillBuffTime > 0)
	{// �X�L���������ʂ̎��Ԃ����Z����
		m_nSkillBuffTime--;
	}
	if (m_nItemBuffTime > 0)
	{// �A�C�e���������ʂ̎��Ԃ����Z����
		m_nItemBuffTime--;
	}

	if (m_nSkillBuffTime <= 0 && m_State != PST_STAND)
	{// �X�L�����g������Ɍ��ʎ��Ԃ��؂ꂽ��f�t�H���g�ɖ߂�
		m_State = PST_STAND;
	}
	if (m_nItemBuffTime <= 0 && m_ItemState != ITEM_NONE)
	{// �A�C�e�����E������Ɍ��ʎ��Ԃ��؂ꂽ��f�t�H���g�ɖ߂�
		m_ItemState = ITEM_NONE;
	}

	// ���W�X�V
	Updatepos();

	// ���[�V����
	m_motion->Update();

	// �ړ�
	Move();

	// ��]
	TurnLookAtMoveing();

	Normalization();		// �p�x�̐��K��
	m_pShadow->SetPos({ m_pos.x, 1.0f, m_pos.z });

	BlockCollision();

	// �u���b�N���Ȃ���ԂŒ�܂�
	StopNoBlock();

	// �u���b�N�̒��S�ŋȂ���
	TurnCenterBlock();

#ifdef _DEBUG
	CDebugProc::Print("���݂̃v���C���[�̍��W:%f %f %f\n", m_pos.x, m_pos.y, m_pos.z);
	CDebugProc::Print("���݂̃v���C���[�̊p�x:%f %f %f\n", m_rot.x, m_rot.y, m_rot.z);
	CDebugProc::Print("���݂̃��[�V����:%d\n", (int)m_Motion);
	CDebugProc::Print("���݂̏��:%d\n", (int)m_State);
	CDebugProc::Print("���݂̃t���[��:%d\n", m_frame);

	if (pInput->Trigger(DIK_U))
	{
		m_nSkillBuffTime = 120;
		m_State = PST_SPEED;
	}

	if (pInput->Trigger(DIK_I))
	{
		m_nSkillBuffTime = 120;
		m_State = PST_PAINT;
	}

	if (pInput->Trigger(DIK_T))
	{
		m_Motion == PM_ST_NEUTRAL ? m_Motion = PM_ST_MOVE : m_Motion = PM_ST_NEUTRAL;
		m_motion->SetNumMotion(m_Motion);
	}
#endif // _DEBUG
}

//-----------------------------------------------------------------------------
// �`�揈��
//-----------------------------------------------------------------------------
void CPlayer::Draw(void)
{
	//�f�o�C�X�ւ̃|�C���^
	LPDIRECT3DDEVICE9 pDevice = CApplication::getInstance()->GetRenderer()->GetDevice();

	D3DXMATRIX mtxRot, mtxTrans;	//�v�Z�p�}�g���b�N�X
	D3DMATERIAL9 matDef;			//���݂̃}�e���A���ۑ��p

	//���݂̃}�e���A�����ێ�
	pDevice->GetMaterial(&matDef);

	//�p�[�c�̃��[���h�}�g���b�N�X�̏�����
	D3DXMatrixIdentity(&m_mtxWorld);

	//�p�[�c�̃��f���̌����𔽉f
	D3DXMatrixRotationYawPitchRoll(&mtxRot, m_rot.y, m_rot.x, m_rot.z);
	D3DXMatrixMultiply(&m_mtxWorld, &m_mtxWorld, &mtxRot);

	//�p�[�c�̃��f���̈ʒu�𔽉f
	D3DXMatrixTranslation(&mtxTrans, m_pos.x, m_pos.y, m_pos.z);
	D3DXMatrixMultiply(&m_mtxWorld, &m_mtxWorld, &mtxTrans);

	//���[���h�}�g���b�N�X�̐ݒ�
	pDevice->SetTransform(D3DTS_WORLD, &m_mtxWorld);

	for (int i = 0; i < 14; i++)
	{
		if (m_apModel[i]->GetParent() == nullptr)
		{
			m_apModel[i]->SetParentMatrix(&m_mtxWorld);
		}
	}
}

//-----------------------------------------------------------------------------
// ����
//-----------------------------------------------------------------------------
CPlayer * CPlayer::Create(D3DXVECTOR3 pos, D3DXVECTOR3 rot)
{
	CPlayer*pPlayer;
	pPlayer = new CPlayer(CObject::OBJTYPE_MODEL);
	pPlayer->m_pos = pos;
	pPlayer->m_rot = rot;
	pPlayer->Init();

	return pPlayer;
}

//-----------------------------------------------------------------------------
// �ړ�
//-----------------------------------------------------------------------------
void CPlayer::Move()
{
	if (m_controller == nullptr)
	{
		assert(false);
		return;
	}

	if (D3DXVec3Length(&m_controller->Move()) == 0.0f)
	{
		//	return;
	}

	D3DXVECTOR3 move = m_controller->Move();

	// �΂ߓ��͂��������ꍇ
	if (move.z != 0.0f && move.x != 0.0)
	{
		if (m_moveVec.x != 0.0f)
		{ // X���ɐi��ł��ꍇ
			move.z = 0.0f;
			move.x = 1.0f;
		}
		else if (m_moveVec.z != 0.0f)
		{ // Z���ɐi��ł��ꍇ
			move.x = 0.0f;
			move.z = 1.0f;
		}
		else
		{ // �~�܂��Ă��ꍇ
			move = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
		}
	}

	D3DXVec3Normalize(&m_movePlanVec, &move);	// ���̓x�N�g����p�ӂ���
}

//-----------------------------------------------------------------------------
// �R���g���[���[�̐ݒ�
//-----------------------------------------------------------------------------
void CPlayer::SetController(CController * inOperate)
{
	m_controller = inOperate;
	m_controller->SetToOrder(this);
}

//-----------------------------------------------------------------------------
// �ړ����������ċȂ���
//-----------------------------------------------------------------------------
void CPlayer::TurnLookAtMoveing()
{
	if (m_moveVec.z > 0.0f)
	{
		SetRot(D3DXVECTOR3(0.0f, -D3DX_PI, 0.0f));
	}
	if (m_moveVec.z < 0.0f)
	{
		SetRot(D3DXVECTOR3(0.0f, 0.0f, 0.0f));
	}
	if (m_moveVec.x > 0.0f)
	{
		SetRot(D3DXVECTOR3(0.0f, -D3DX_PI * 0.5f, 0.0f));
	}
	if (m_moveVec.x < 0.0f)
	{
		SetRot(D3DXVECTOR3(0.0f, D3DX_PI * 0.5f, 0.0f));
	}
}

//-----------------------------------------------------------------------------
// �u���b�N���Ȃ��ꏊ�Œ�܂�
//-----------------------------------------------------------------------------
void CPlayer::StopNoBlock()
{
	D3DXVECTOR2 BlockIdx = CGame::GetMap()->GetBlockIdx(m_pOnBlock);
	D3DXVECTOR2 moveNowVec;

	moveNowVec.x = m_movePlanVec.x;
	moveNowVec.y = -m_movePlanVec.z;

	D3DXVec2Normalize(&moveNowVec, &moveNowVec);

	CDebugProc::Print("moveNowVec : %.1f,%.1f\n", moveNowVec.x, moveNowVec.y);

	BlockIdx += moveNowVec;

	CDebugProc::Print("BlockIdx : %.1f,%.1f\n", BlockIdx.x, BlockIdx.y);

	CBlock* moveBlock = CGame::GetMap()->GetBlock((int)BlockIdx.x, (int)BlockIdx.y);	// �i�s�����ɂ���u���b�N

	if (moveBlock->IsStop())
	{
		m_movePlanVec = D3DXVECTOR3(0.0f, 0.0f, 0.0f);	// ��~
	}
}

//-----------------------------------------------------------------------------
// �u���b�N�̒��S�t�߂ŋȂ���
//-----------------------------------------------------------------------------
void CPlayer::TurnCenterBlock()
{
	bool XMin = m_pos.x <= m_pOnBlock->GetPos().x + (m_pOnBlock->GetSize().x * 0.05f);
	bool XMax = m_pos.x >= m_pOnBlock->GetPos().x - (m_pOnBlock->GetSize().x * 0.05f);
	bool ZMin = m_pos.z <= m_pOnBlock->GetPos().z + (m_pOnBlock->GetSize().z * 0.05f);
	bool ZMax = m_pos.z >= m_pOnBlock->GetPos().z - (m_pOnBlock->GetSize().z * 0.05f);

	// �u���b�N���Ɏ��܂��Ă��邩
	if (XMin && XMax && ZMin && ZMax)
	{
		 // �����x�N�g���|����ړ���
		m_move = m_movePlanVec * PLAYER_SPEED;

		if (m_State == PST_SPEED || m_ItemState == ITEM_SPEED)
		{
			m_move *= ADD_SPEED;
		}

		D3DXVec3Normalize(&m_moveVec, &m_move);
	}
}

//-----------------------------------------------------------------------------
// ���W�̍X�V
//-----------------------------------------------------------------------------
void CPlayer::Updatepos()
{
	m_posold = m_pos;		//�O��̈ʒu�̕ۑ�
	m_pos += m_move;		//�ʒu�̍X�V
}

//-----------------------------------------------------------------------------
// �p�x�̐��K��
//-----------------------------------------------------------------------------
void CPlayer::Normalization()
{
	//�p�x�̐��K��
	if (m_rot.y >= D3DX_PI)
	{
		m_rot.y -= D3DX_PI * 2;
	}
	else if (m_rot.y <= -D3DX_PI)
	{
		m_rot.y += D3DX_PI * 2;
	}
}

//-----------------------------------------------------------------------------
// �u���b�N�Ƃ̔���
//-----------------------------------------------------------------------------
void CPlayer::BlockCollision()
{
	for (int i = 0; i < CGame::GetMap()->GetBlockCount(); i++)
	{
		CBlock* pBlock = CGame::GetMap()->GetBlock(i);

		if (pBlock == nullptr)
		{
			continue;
		}

		if (m_pos.x <= pBlock->GetPos().x + (pBlock->GetSize().x * 0.5f) && m_pos.x >= pBlock->GetPos().x - (pBlock->GetSize().x * 0.5f))
		{//X��
			if (m_pos.z <= pBlock->GetPos().z + (pBlock->GetSize().z * 0.5f) && m_pos.z >= pBlock->GetPos().z - (pBlock->GetSize().z * 0.5f))
			{//Z��
				if (pBlock->GetNumber() != m_nPlayerNumber && m_nSkillGauge < MAX_GAUGE && m_State == PST_STAND)
				{//�����ȊO�̐F��h��ւ��Ă�����Q�[�W�̉��Z(�Q�[�W���}�b�N�ł͂Ȃ��A�������̏ꍇ)
					m_nSkillGauge++;
				}
				pBlock->SetPlayerNumber(m_nPlayerNumber);	//�v���C���[��
				m_pOnBlock = pBlock;						//����Ă���u���b�N��ݒ�
			}
		}
	}

	if (m_State == PST_PAINT && m_pOnBlock != nullptr)
	{
		switch (m_nSkillLv)
		{
		case 1:
			//�c�͈̔͂�h��
			for (int nCntX = 0; nCntX < 3; nCntX++)
			{
				//����Ă���u���b�N�̔ԍ����擾
				D3DXVECTOR2 BlockIdx = CGame::GetMap()->GetBlockIdx(m_pOnBlock);
				//�͈͓��̃u���b�N��h��
				BlockIdx = D3DXVECTOR2(BlockIdx.x - 1.0f, BlockIdx.y);			//�������ɐݒ肷��
				D3DXVECTOR2 Idx = D3DXVECTOR2(BlockIdx.x + nCntX, BlockIdx.y);
				CBlock* Block = CGame::GetMap()->GetBlock((int)Idx.x, (int)Idx.y);

				if (Block != nullptr)
				{
					Block->SetPlayerNumber(m_nPlayerNumber);
				}
			}
			break;

		case 2:
			//�\��(���Əc)�͈̔͂�h��
			//�c�͈̔�
			for (int nCntY = 0; nCntY < 3; nCntY++)
			{
				//����Ă���u���b�N�̔ԍ����擾
				D3DXVECTOR2 BlockIdx = CGame::GetMap()->GetBlockIdx(m_pOnBlock);
				//�͈͓��̃u���b�N��h��
				BlockIdx = D3DXVECTOR2(BlockIdx.x, BlockIdx.y - 1.0f);			//���S�ɐݒ肷��
				D3DXVECTOR2 Idx = D3DXVECTOR2(BlockIdx.x, BlockIdx.y + nCntY);
				CBlock* Block = CGame::GetMap()->GetBlock((int)Idx.x, (int)Idx.y);

				if (Block != nullptr)
				{//�u���b�N��h��
					Block->SetPlayerNumber(m_nPlayerNumber);
				}
			}
			//���͈̔�
			for (int nCntX = 0; nCntX < 3; nCntX++)
			{
				//����Ă���u���b�N�̔ԍ����擾
				D3DXVECTOR2 BlockIdx = CGame::GetMap()->GetBlockIdx(m_pOnBlock);
				//�͈͓��̃u���b�N��h��
				BlockIdx = D3DXVECTOR2(BlockIdx.x - 1.0f, BlockIdx.y);			//�������ɐݒ肷��
				D3DXVECTOR2 Idx = D3DXVECTOR2(BlockIdx.x + nCntX, BlockIdx.y);
				CBlock* Block = CGame::GetMap()->GetBlock((int)Idx.x, (int)Idx.y);

				if (Block != nullptr)
				{//�u���b�N��h��
					Block->SetPlayerNumber(m_nPlayerNumber);
				}
			}
			break;

		case 3:
			//3�~3�͈̔͂�h��
			for (int nCntY = 0; nCntY < 3; nCntY++)
			{
				for (int nCntX = 0; nCntX < 3; nCntX++)
				{
					//����Ă���u���b�N�̔ԍ����擾
					D3DXVECTOR2 BlockIdx = CGame::GetMap()->GetBlockIdx(m_pOnBlock);
					//�͈͓��̃u���b�N��h��
					BlockIdx = D3DXVECTOR2(BlockIdx.x - 1.0f, BlockIdx.y - 1.0f);			//����ɐݒ肷��
					D3DXVECTOR2 Idx = D3DXVECTOR2(BlockIdx.x + nCntX, BlockIdx.y + nCntY);
					CBlock* Block = CGame::GetMap()->GetBlock((int)Idx.x, (int)Idx.y);

					if (Block != nullptr)
					{//�u���b�N��h��
						Block->SetPlayerNumber(m_nPlayerNumber);
					}
				}
			}
			break;

		default:
			break;
		}
	}

	//����Ă���u���b�N�̔ԍ����擾
	D3DXVECTOR2 BlockIdx = CGame::GetMap()->GetBlockIdx(m_pOnBlock);
	//����Ă���u���b�N�̏����擾
	CBlock* Block = CGame::GetMap()->GetBlock((int)BlockIdx.x, (int)BlockIdx.y);

	if (Block != nullptr)
	{//�A�C�e���̏����擾����
		CItem *pItem = Block->GetOnItem();

		if (pItem != nullptr)
		{//�A�C�e�����E�����ꍇ
			m_nItemBuffTime = (int)CItem::BUFF_TIME;
			if (pItem->GetEffect() == CItem::SPEED)
			{
				m_ItemState = ITEM_SPEED;
			}
			//�u���b�N�̏�̃A�C�e��������
			Block->DeleteItem();
		}
	}
}

//-----------------------------------------------------------------------------
// �X�L������
//-----------------------------------------------------------------------------
void CPlayer::Skill()
{
	//�C���v�b�g�̎擾
	CInput* pInput = CInput::GetKey();

	//�Q�[�W�̗ʂɂ���ăX�L��Lv�����߂�
	if (m_nSkillGauge == MAX_GAUGE)
	{
		m_nSkillLv = 3;
	}
	else if (m_nSkillGauge >= MAX_GAUGE * 0.7)
	{
		m_nSkillLv = 2;
	}
	else if (m_nSkillGauge >= MAX_GAUGE * 0.3)
	{
		m_nSkillLv = 1;
	}
	else
	{
		m_nSkillLv = 0;
	}

	//���݂̃X�L��Lv�ɂ���Č��ʗʂ�ς���
	switch (m_nSkillLv)
	{
	case 1:
		if (pInput->Trigger(DIK_K))
		{
			m_nSkillGauge -= (int)(MAX_GAUGE * 0.3f);
			m_nSkillBuffTime = (int)(SKILL_BUFF_TIME);
			m_State = PST_SPEED;
		}
		else if (pInput->Trigger(DIK_L))
		{
			m_nSkillGauge -= (int)(MAX_GAUGE * 0.3f);
			m_nSkillBuffTime = (int)(SKILL_BUFF_TIME);
			m_State = PST_PAINT;
		}
		break;

	case 2:
		if (pInput->Trigger(DIK_K))
		{
			m_nSkillGauge -= (int)(MAX_GAUGE * 0.7f);
			m_nSkillBuffTime = (int)(SKILL_BUFF_TIME * 2.0f);
			m_State = PST_SPEED;
		}
		else if (pInput->Trigger(DIK_L))
		{
			m_nSkillGauge -= (int)(MAX_GAUGE * 0.7f);
			m_nSkillBuffTime = (int)(SKILL_BUFF_TIME * 2.0f);
			m_State = PST_PAINT;
		}
		break;

	case 3:
		if (pInput->Trigger(DIK_K))
		{
			m_nSkillGauge -= MAX_GAUGE;
			m_nSkillBuffTime = (int)(SKILL_BUFF_TIME * 5.0f);
			m_State = PST_SPEED;
		}
		else if (pInput->Trigger(DIK_L))
		{
			m_nSkillGauge -= MAX_GAUGE;
			m_nSkillBuffTime = (int)(SKILL_BUFF_TIME * 5.0f);
			m_State = PST_PAINT;
		}
		break;

	default:
		break;
	}
}