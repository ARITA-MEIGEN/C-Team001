//=============================================================================
//
// �I�u�W�F�N�g
// Author : �L�c����
//
//=============================================================================
//�C���N���[�h
#include"main.h"
#include"Application.h"
#include"Game.h"
#include"Player.h"
#include"Player.h"
#include"Mesh.h"
#include"CameraGame.h"
#include"Light.h"
#include"Shadow.h"
#include"Fade.h"
#include"sound.h"
#include"input.h"
#include"effect.h"
#include"Time.h"
#include"Map.h"
#include"Item_Speed.h"
#include"SkillGauge.h"
#include"StatusUI.h"

#include "File.h"

//�ÓI�����o�ϐ�
CPlayer*CGame::m_pPlayer[MAX_PLAYER] = {};
CGame::GAME CGame::m_gamestate;
bool CGame::bDebugCamera = nullptr;

CCamera* CGame::m_pCamera = nullptr;
CLight* CGame::m_pLight = nullptr;
CFloor* CGame::m_pFloor = nullptr;
CTimer* CGame::m_pTimer = nullptr;
CUI* CGame::m_pUI = nullptr;
CMap* CGame::m_pMap = nullptr;
CStatusUI* CGame::m_apStatusUI[MAX_PLAYER] = {};

//====================================
//�R���X�g���N�^
//====================================
CGame::CGame()
{
}

//====================================
//�f�X�g���N�^
//====================================
CGame::~CGame()
{

}

//====================================
//������
//====================================
HRESULT CGame::Init()
{
	CObjectXOriginalList::GetInstance()->LoadAll();

	//�J�����̐ݒ�
	m_pCamera = CCameraGame::Create();

	//���C�g�̐ݒ�
	m_pLight = new CLight;
	m_pLight->Init();

	//�u���b�N����
	m_pMap = CMap::Create(0);

	//�v���C���[�̐���
	for (int nCnt = 0; nCnt < MAX_PLAYER; nCnt++)
	{
		CBlock* spawnBlock = m_pMap->GetPlayerSpawnBlock(nCnt);
		m_pPlayer[nCnt] = CPlayer::Create(spawnBlock->GetPos(), D3DXVECTOR3(0.0f, D3DX_PI * 0.5f, 0.0f));

		//�X�e�[�^�X�\���̐���
		m_apStatusUI[nCnt] = CStatusUI::Create(nCnt);
	}
	
	//�f�o�b�O�p�J�������샂�[�h
	bDebugCamera = false;

	m_pTimer = CTimer::Create();
	m_Timer = 0;

	m_Round = ROUND_1;

	// �w�i���f���̐ݒu
	{
		nlohmann::json loadData = LoadJson("test.json");

		int loadDataSize = loadData["MODEL"].size();

		for (int i = 0; i < loadDataSize; i++)
		{
			std::string tag = loadData["MODEL"][i]["TAG"];
			D3DXVECTOR3 pos = { loadData["MODEL"][i]["POS"][0],loadData["MODEL"][i]["POS"][1] ,loadData["MODEL"][i]["POS"][2] };
			D3DXVECTOR3 rot = { loadData["MODEL"][i]["ROT"][0],loadData["MODEL"][i]["ROT"][1] ,loadData["MODEL"][i]["ROT"][2] };

			CObjectX* object = CObjectX::Create();
			CObjectXOriginalList* original = CObjectXOriginalList::GetInstance();
			object->BindModel(original->GetModelData(tag));
			object->SetModelTag(tag);
			object->SetPos(pos + D3DXVECTOR3(0.0f, -500.0f, 0.0f));
			object->SetRot(rot);
		}
	}

	return S_OK;
}

//====================================
//�I��
//====================================
void CGame::Uninit()
{
	//�J�����̏I��
	if (m_pCamera != nullptr)
	{
		m_pCamera->Uninit();
		delete m_pCamera;
	}

	// ���C�g�̏I��
	if (m_pLight != nullptr)
	{
		m_pLight->Uninit();
		delete m_pLight;
	}
	
	// �^�C�}�[�̏I��
	if (m_pTimer != nullptr)
	{
		m_pTimer->Uninit();
		delete m_pTimer;
	}

	// �}�b�v�̏I��
	if (m_pMap != nullptr)
	{
		delete m_pMap;
	}

	for (int i = 0; i < MAX_PLAYER; i++)
	{//�X�e�[�^�X�\��
		if (m_apStatusUI[i] == nullptr)
		{//NULL�`�F�b�N
			continue;
		}

		/* nullptr�ł͂Ȃ��ꍇ */

		m_apStatusUI[i] = nullptr;
	}

	// ���y�̒�~
	CSound::GetInstance()->Stop();
}

//====================================
//�X�V
//====================================
void CGame::Update()
{
	m_pCamera->Update();
	m_pLight->Update();

	m_pMap->Update();

	for (int i = 0; i < MAX_PLAYER; i++)
	{//�X�e�[�^�X�\��
		if (m_apStatusUI[i] == nullptr)
		{//NULL�`�F�b�N
			continue;
		}

		/* nullptr�ł͂Ȃ��ꍇ */

		m_apStatusUI[i]->Update();
	}

	CInput* pInput = CInput::GetKey();
	if (CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
	{
		m_pTimer->Update();

		if (m_pTimer->GetTimer() <= 0)
		{
			CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_RESULT);
			m_pMap->Ranking();
		}

#ifdef _DEBUG
		//�w��̃L�[�������ꂽ���ǂ���
		if (CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
		{
			if (pInput->Trigger(DIK_RETURN))
			{
				CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_RESULT);
				m_pMap->Ranking();
			}
		}
#endif // !_DEBUG
	}
}

//====================================
//�`��
//====================================
void CGame::Draw()
{
	m_pCamera->Set();

	for (int i = 0; i < MAX_PLAYER; i++)
	{//�X�e�[�^�X�\��
		if (m_apStatusUI[i] == nullptr)
		{//NULL�`�F�b�N
			continue;
		}

		/* nullptr�ł͂Ȃ��ꍇ */

		m_apStatusUI[i]->Draw();
	}
}

//====================================
//���E���h�ڍs���̏���
//====================================
void CGame::ResetGame()
{
	for (int i = 0; i < MAX_PLAYER; i++)
	{
		m_pPlayer[i]->Init();
		m_pPlayer[i]->SetPos(D3DXVECTOR3(-50.0f+(100.0f*i), 0.0f, 0.0f));
	}

	m_pTimer->Init();
	m_gamestate = GAME_START;
	m_Timer = 0;
	return;
}

//====================================
//���s����(�u���b�N���̃J�E���g)
//====================================
void CGame::BlockCount()
{
	
}
