//=============================================================================
// Content     (�Q�[���̐ݒ�)(player.cpp)
// Author     : �L�c����
//=============================================================================

//-----------------------------------------------------------------------------
//�C���N���[�h
//-----------------------------------------------------------------------------
#include"Player.h"
#include"Application.h"
#include"renderer.h"
#include"Camera.h"
#include"input.h"
#include"Shadow.h"
#include"Mesh.h"
#include"ObjectX.h"
#include"Game.h"
#include"PlayerController.h"
#include"sound.h"
#include"Time.h"
#include"effect.h"
#include"Particle.h"
#include"Map.h"
#include "SkillGauge.h"
#include "motion.h"

//-----------------------------------------------------------------------------
//�ÓI�����o�ϐ�
//-----------------------------------------------------------------------------
const float CPlayer::PLAYER_SPEED = 5.0f; 		// �ړ����x
const float CPlayer::ITEM_ADD_SPEED = 1.5f;		// �A�C�e���ŉ��Z����X�s�[�h
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
	//���f���ƃ��[�V�����̓ǂݍ���
	for (int i = 0; i < 14; i++)
	{//�v���C���[�̐���
		m_apModel[i] = CObjectX::Create();
	}

	m_motion = new CMotion("data/TXT/Player01/Player01.txt");
	m_motion->Update();
	m_Motion = PM_ST_NEUTRAL;	//�j���[�g�������[�V�����ɕύX

	for (int i = 0; i < 14; i++)
	{
		m_apModel[i] = m_motion->GetParts(i);

		//�F�w��
		if (m_nPlayerNumber == 0)
		{
			m_apModel[i]->SetCol(D3DXCOLOR(1.0f, 0.0f, 0.0f, 1.0f));
		}
		else
		{
			m_apModel[i]->SetCol(D3DXCOLOR(0.0f, 0.0f, 1.0f, 1.0f));
		}
	}

	//������
	m_nSkillGauge = 0;
	m_nSkillLv = 0;

	//���I�m��
	m_controller = new CPlayerController(m_nPlayerNumber);

	//�X�L���Q�[�W�̍��W�̎Z�o(X:�Ԋu��1���̃Q�[�W�T�C�Y�𑫂��Ă���,Y:��ʂ̉��[�ɍ��킹�Ă���)
	D3DXVECTOR3 SkillPos = D3DXVECTOR3((CGauge::SPACE_SIZE * (m_nPlayerNumber + 1)) + (CGauge::MAX_SIZE * m_nPlayerNumber), SCREEN_HEIGHT - (CGauge::GAUGE_SIZE.y / 2.0f), 0.0f);
	
	//�X�L���Q�[�W�̐���
	switch (m_nPlayerNumber)
	{
		case 0:
			CGauge::Create(SkillPos, D3DXVECTOR2(0.0f, 0.0f), D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f), m_nPlayerNumber);
			break;

		case 1:
			CGauge::Create(SkillPos, D3DXVECTOR2(0.0f, 0.0f), D3DXCOLOR(0.0f, 1.0f, 1.0f, 1.0f), m_nPlayerNumber);
			break;

		case 2:
			CGauge::Create(SkillPos, D3DXVECTOR2(0.0f, 0.0f), D3DXCOLOR(0.0f, 0.0f, 1.0f, 1.0f), m_nPlayerNumber);
			break;

		case 3:
			CGauge::Create(SkillPos, D3DXVECTOR2(0.0f, 0.0f), D3DXCOLOR(1.0f, 1.0f, 1.0f, 0.5f), m_nPlayerNumber);
			break;

	default:
		break;
	}
	

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
	if ((CGame::GetGame() != CGame::GAME_END) && (CGame::GetGame() != CGame::GAME_START))
	{
		//Input();				//���͏���
		CInput* pInput = CInput::GetKey();
		
		if (m_nBuffTime > 0)
		{//�������ʂ̎��Ԃ����Z����
			m_nBuffTime--;
		}

		if (m_nBuffTime <= 0 && m_State != PST_STAND)
		{//�f�t�H���g�ɖ߂�
			m_State = PST_STAND;
		}

		Updatepos();			// ���W�X�V

		//�ړ�
		Move();

		//�X�L������
		Skill();

		m_motion->Update();

		Normalization();		// �p�x�̐��K��
		m_pShadow->SetPos({ m_pos.x, 1.0f, m_pos.z });

		BlockCollision();

#ifdef _DEBUG
		CDebugProc::Print("���݂̃v���C���[�̍��W:%f %f %f\n", m_pos.x, m_pos.y, m_pos.z);
		CDebugProc::Print("���݂̃��[�V����:%d\n", (int)m_Motion);
		CDebugProc::Print("���݂̏��:%d\n", (int)m_State);
		CDebugProc::Print("���݂̃t���[��:%d\n", m_frame);

		if (pInput->Trigger(DIK_U))
		{
			m_nBuffTime = 120;
			m_State = PST_SPEED;
		}
		if (pInput->Trigger(DIK_T))
		{
			m_Motion == PM_ST_NEUTRAL ? m_Motion = PM_ST_MOVE : m_Motion = PM_ST_NEUTRAL;
			m_motion->SetNumMotion(m_Motion);
		}
#endif // _DEBUG
	}
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
// ���͐ݒ�
//-----------------------------------------------------------------------------
void CPlayer::Input()
{
	CInput* pInput = CInput::GetKey();
	int Key = 0;
	pInput->PressDevice(KEY_DOWN_RIGHT);
	//���o�[
	{
		//��
		Key |= pInput->Press(DIK_S) || pInput->Press(JOYPAD_DOWN, m_nPlayerNumber)|| pInput->Press(JOYPAD_DOWN_LEFT, m_nPlayerNumber) || pInput->Press(JOYPAD_DOWN_RIGHT, m_nPlayerNumber) ? INPUT2 : INPUT_NOT2;
		//��
		Key |= pInput->Press(DIK_A) || pInput->Press(JOYPAD_LEFT, m_nPlayerNumber) || pInput->Press(JOYPAD_DOWN_LEFT, m_nPlayerNumber) || (pInput->Press(JOYPAD_UP_LEFT, m_nPlayerNumber)) ? INPUT4 : INPUT_NOT4;
		//�E
		Key |= pInput->Press(DIK_D) || pInput->Press(JOYPAD_RIGHT, m_nPlayerNumber) || (pInput->Press(JOYPAD_UP_RIGHT, m_nPlayerNumber)) || pInput->Press(JOYPAD_DOWN_RIGHT, m_nPlayerNumber) ? INPUT6 : INPUT_NOT6;
		//��
		Key |= pInput->Press(DIK_W) || pInput->Press(JOYPAD_UP, m_nPlayerNumber) || (pInput->Press(JOYPAD_UP_RIGHT, m_nPlayerNumber)) || (pInput->Press(JOYPAD_UP_LEFT, m_nPlayerNumber)) ? INPUT8 : INPUT_NOT8;

		//�j���[�g����
		Key |= (Key & INPUT_NOT6) == INPUT_NOT6 && (Key & INPUT_NOT2) == INPUT_NOT2 && (Key & INPUT_NOT4) == INPUT_NOT4 && (Key & INPUT_NOT8) == INPUT_NOT8 ? INPUT5 : INPUT_NOT5;
	}
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

	// �����x�N�g���|����ړ���
	if (m_State == PST_SPEED)
	{
		m_move = m_controller->Move() * PLAYER_SPEED * ITEM_ADD_SPEED;
	}
	else
	{
		m_move = m_controller->Move() * PLAYER_SPEED;
	}
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
				if(pBlock->GetNumber() != m_nPlayerNumber && m_nSkillGauge < MAX_GAUGE)
				{//�����ȊO�̐F��h��ւ��Ă�����Q�[�W�̉��Z
					m_nSkillGauge++;
				}
					pBlock->SetPlayerNumber(m_nPlayerNumber);	//�v���C���[��
					m_pOnBlock = pBlock;						//����Ă���u���b�N��ݒ�
			}
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
	else if(m_nSkillGauge >= 7)
	{
		m_nSkillLv = 2;
	}
	else if(m_nSkillGauge >= 3)
	{
		m_nSkillLv = 1;
	}
	else
	{
		m_nSkillLv = 0;
	}

	switch (m_nSkillLv)
	{
	case 1:
		if(pInput->Trigger(DIK_K))
		{
			m_nSkillGauge -= 3;
			m_nBuffTime = 60;
			m_State = PST_SPEED;
		}
		break;

	case 2:
		if (pInput->Trigger(DIK_K))
		{
			m_nSkillGauge -= 7;
			m_nBuffTime = 120;
			m_State = PST_SPEED;
		}
		break;

	case 3:
		if (pInput->Trigger(DIK_K))
		{
			m_nSkillGauge -= 10;
			m_nBuffTime = 300;
			m_State = PST_SPEED;
		}
		break;

	default:
		break;
	}
}