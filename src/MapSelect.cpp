//=============================================================================
//
// �}�b�v�I��
// Author : ����]��
//
//=============================================================================

//�C���N���[�h
#include"main.h"
#include"MapSelect.h"
#include"input.h"
#include"Fade.h"
#include"Application.h"
#include"renderer.h"
#include"sound.h"
#include"Map.h"
#include"Game.h"
#include"Player.h"
#include"CameraGame.h"
#include"Light.h"
#include"Object3D.h"

//====================================
// �萔
//====================================
int CMapSelect::m_nMapNumber = 0;

//====================================
//�R���X�g���N�^
//====================================
CMapSelect::CMapSelect()
{
}

//====================================
//�f�X�g���N�^
//====================================
CMapSelect::~CMapSelect()
{
}

//====================================
//������
//====================================
HRESULT CMapSelect::Init()
{
	CSound::GetInstance()->Play(CSound::ELabel::LABEL_BGM_TITLE);

	//������
	m_bMapChange = false;

	//������
	for (int nCnt = 0; nCnt < CMap::STAGE_MAX; nCnt++)
	{
		D3DXVECTOR3 pos(SCREEN_WIDTH * 0.5f + (100.0f * nCnt) - (100.0f * CMap::STAGE_MAX * 0.5f), 600.0f, 0.0f);
		m_pObj2DPolygon[nCnt] = CObject2D::Create(pos, D3DXVECTOR2(75.0f, 75.0f), 6);
		CObject2D* main = CObject2D::Create(pos, D3DXVECTOR2(60.0f, 60.0f), 6);
		main->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));
	}

	//�J�����̐ݒ�
	m_pCamera = CCameraGame::Create();

	//���C�g�̐ݒ�
	m_pLight = new CLight;
	m_pLight->Init();

	//�w�i
	CObject3D* pori = CObject3D::Create(D3DXVECTOR3(0.0f, -50.0f, 0.0f), D3DXVECTOR3(4000.0f, 0.0f, 2000.0f), 2);
	pori->SetUV(0.0f,20.0f,0.0f,20.0f);
	pori->SetTextureKey("TEST_FLOOR");

	//�}�b�v����
	m_pMap = CMap::Create(m_nMapNumber);

	return S_OK;
}

//====================================
//�I��
//====================================
void CMapSelect::Uninit()
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

	//�}�b�v�̏I��
	if (m_pMap != nullptr)
	{
		delete m_pMap;
	}
}

//====================================
//�X�V
//====================================
void CMapSelect::Update()
{
	//�X�V����
	m_pCamera->Update();
	m_pLight->Update();

	//���͏���
	Input();

	if (m_bMapChange)
	{
		//�I������
		Select();
	}

	for (int nCnt = 0; nCnt < CMap::STAGE_MAX; nCnt++)
	{//���I�����Ă�}�b�v�Ɠ����ԍ��̃|���S���𔒂�����
		if (nCnt == m_nMapNumber)
		{
			m_pObj2DPolygon[nCnt]->SetCol(D3DXCOLOR(1.0f, 0.0f, 0.0f, 1.0f));
		}
		else
		{
			m_pObj2DPolygon[nCnt]->SetCol(D3DXCOLOR(0.0f, 0.0f, 0.0f, 0.5f));
		}
	}
}

//====================================
//�`��
//====================================
void CMapSelect::Draw()
{
	m_pCamera->Set();
}

//====================================
//����
//====================================
void CMapSelect::Input()
{
	//�C���v�b�g�̏����擾
	CInput* pInput = CInput::GetKey();

	//�t�F�[�h���Ă��Ȃ����
	if (CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
	{
		//�����͂ō���I��
		if (m_nMapNumber >= (CMap::STAGE_01 + 1))
		{//���[�ł͂Ȃ��Ȃ獶��
			if (pInput->Trigger(JOYPAD_LEFT) || pInput->Trigger(DIK_O))
			{
				m_nMapNumber--;
				m_bMapChange = true;
			}
		}

		//�E���͂ŉE��I��
		if (m_nMapNumber <= (CMap::STAGE_MAX - 2))
		{//�E�[�ł͂Ȃ��Ȃ�E��
			if (pInput->Trigger(JOYPAD_RIGHT) || pInput->Trigger(DIK_P))
			{
				m_nMapNumber++;
				m_bMapChange = true;
			}
		}

		if ((pInput->Trigger(DIK_RETURN)) || (pInput->Trigger(JOYPAD_B)))		//ENTER�L�[
		{//�G���^�[�ŃX�L���I����
		 //���[�h�ݒ�
			CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_SKILL);
		}
	}
}

//====================================
//�I��
//====================================
void CMapSelect::Select()
{
	//�}�b�v�̏I��
	if (m_pMap != nullptr)
	{
		m_pMap->Uninit();
		delete m_pMap;
		m_pMap = nullptr;
	}
	//�\������Ă���}�b�v��ς���
	m_pMap = CMap::Create(m_nMapNumber);

	//�}�b�v�̕ύX���~�߂�
	m_bMapChange = false;
}