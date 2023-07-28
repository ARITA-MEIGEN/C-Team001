//=============================================================================
//
// �I�u�W�F�N�g
// Author : �L�c����
//
//=============================================================================
//�C���N���[�h
#include"main.h"
#include"Result.h"
#include"input.h"
#include"Fade.h"
#include"Application.h"
#include"renderer.h"
#include"sound.h"
#include"Map.h"
#include"Player.h"
#include"CameraGame.h"
#include"Light.h"

//-----------------------------------------------------------------------------
//�ÓI�ϐ��錾
//-----------------------------------------------------------------------------
const float CResult::RANK_WIDTH = 270.0f;		// �����L���O�̐ݒu�Ԋu
const float CResult::PLAYER_WIDTH = 120.0f;		// �v���C���[�̐ݒu�Ԋu
const float CResult::TOP_HEIGHT = -40.0f;		// 1�ʂ̍���
const float CResult::PLAYER_HEIGHT = 40.0f;	//  �v���C���[�Ԃ̏��ʂ��Ƃ̍����̊Ԋu



//====================================
//�R���X�g���N�^
//====================================
CResult::CResult()
{
}

//====================================
//�f�X�g���N�^
//====================================
CResult::~CResult()
{

}

//====================================
//������
//====================================
HRESULT CResult::Init()
{
	LPDIRECT3DDEVICE9 pDevice;
	pDevice = CApplication::getInstance()->GetRenderer()->GetDevice();
	//�e�N�X�`���̓ǂݍ���
	std::string textureKey[4];
	textureKey[0] = "RESULET_000";
	textureKey[1] = "RESULET_001";
	textureKey[2] = "RESULET_002";
	textureKey[3] = "RESULET_003";


	//�J�����̐ݒ�
	m_pCamera = CCameraGame::Create();
	m_pCamera->SetPosV(D3DXVECTOR3(0.0f, 250.0f, 0.0f));
	m_pCamera->SetPosR(D3DXVECTOR3(0.0f,-500.0f, 00.0f));

	//���C�g�̐ݒ�
	m_pLight = new CLight;
	m_pLight->Init();


	//�w�i�̐���
	for (int i = 0; i < MAX_PLAYER; i++)
	{
		//�����L���O
		m_apRank[i] = new CObject2D(CObject::OBJTYPE_UI);
		m_apRank[i]->Init();
		m_apRank[i]->SetSiz(D3DXVECTOR2((float)100, (float)50));
		m_apRank[i]->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 0.0f));
	
		//�v���C���[����
		m_pPlayer[i] = CPlayer::Create({ -(PLAYER_WIDTH*1.5f) + (PLAYER_WIDTH * i),0.0f,0.0f }, D3DXVECTOR3(0.0f, 0.0f, 0.0f));

		//�y�䐶��
		m_pCylinder[i]= CObjectX::Create();
		m_pCylinder[i]->BindModel(CObjectXOriginalList::GetInstance()->Load("ENTYU", "data/MODEL/entyu000.x"));
		m_pCylinder[i]->SetPos(D3DXVECTOR3{m_pPlayer[i]->GetPos().x,m_pPlayer[i]->GetPos().y - 250.0f,m_pPlayer[i]->GetPos().z });
	}

	for (int i = 0; i < MAX_PLAYER; i++)
	{//�v���C���[�̔ԍ����珇�ʂ��l��
		m_apRank[i]->SetTextureKey(textureKey[CMap::GetRanking(i)]);
	}

	return S_OK;
}

//====================================
//�I��
//====================================
void CResult::Uninit()
{
	CSound::GetInstance()->Stop();
	//�J�����̐ݒ�
	if (m_pCamera != nullptr)
	{
		m_pCamera->Uninit();
		delete m_pCamera;
	}

	//���C�g�̐ݒ�
	if (m_pLight != nullptr)
	{
		m_pLight->Uninit();
		delete m_pLight;
	}
}

//====================================
//�X�V
//====================================
void CResult::Update()
{
	CInput* pInput = CInput::GetKey();

	m_pCamera->Update();
	m_pLight->Update();

	if (CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
	{
		if ((pInput->Trigger(DIK_RETURN)) == true)		//ENTER�L�[
		{//�G���^�[�Ń����L���O��
		 //���[�h�ݒ�
			CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_TITLE);
		}
	}

	for (int i = 0; i < MAX_PLAYER; i++)
	{
		if (m_pCylinder[i]->GetPos().y < TOP_HEIGHT - CMap::GetRanking(i) * PLAYER_HEIGHT)//����
		{//�v���C���[����Ɉړ�
			m_pCylinder[i]->SetPos(D3DXVECTOR3{ m_pCylinder[i]->GetPos().x, m_pCylinder[i]->GetPos().y + 0.5f , m_pCylinder[i]->GetPos().z });
			m_pPlayer[i]->SetPos({ m_pPlayer[i]->GetPos().x,  m_pCylinder[i]->GetPos().y + m_pCylinder[i]->GetSize().y ,m_pPlayer[i]->GetPos().z });
		}
		else
		{//���ʕ\��
			m_apRank[i]->SetPos(D3DXVECTOR3((float)SCREEN_WIDTH / 2 - (RANK_WIDTH * 1.5f) + RANK_WIDTH * i, 150.0f + CMap::GetRanking(i) * 80.0f, 0.0f));
			m_apRank[i]->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));
			m_pPlayer[i]->SetResultMotion(CMap::GetRanking(i));
		}
	}

}

//====================================
//�`��
//====================================
void CResult::Draw()
{
	m_pCamera->Set();
}
