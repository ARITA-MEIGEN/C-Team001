//=============================================================================
//
// �A�v���P�[�V����
// Author : �L�c����
//
//=============================================================================

// �C���N���[�h
#include "Application.h"
#include "renderer.h"
#include "main.h"
#include "input.h"
#include "DebugProc.h"
#include "Fade.h"
#include "sound.h"
#include "Title.h"
#include "Game.h"
#include "Result.h"
#include "Texture.h"
#include "ObjectList.h"
#include "Texture.h"
#include "SkillSelect.h"
#include "MapSelect.h"
#include "tutorial.h"

//====================================
//�ÓI�����o�ϐ�
//====================================
CApplication* CApplication::instance = nullptr;

//====================================
//������
//====================================
HRESULT CApplication::Init(HWND hWnd, bool bWindow, HINSTANCE hInstance)
{
	m_pRenderer = new CRenderer;

	//����������
	if (FAILED(m_pRenderer->Init(hWnd, bWindow)))
	{//�����������Ɏ��s�����ꍇ
		return-1;
	}

	//-------------------------------
	//�L�[�{�[�h�ƃW���C�p�b�h�̐���
	//-------------------------------
	CInput::Create();
	if (FAILED(CInput::GetKey()->Init(hInstance, hWnd)))
	{
		return E_FAIL;
	}

	//�T�E���h������
	// ���y�����̏���������
	if (FAILED(CSound::GetInstance()->Init(hWnd)))
	{
		return E_FAIL;
	}

	// Texture�̓Ǎ���
	m_pTexture = CTexture::GetInstance();
	m_pTexture->LoadAll();

	CObjectXOriginalList::GetInstance()->LoadAll();

	// ���[�h�̐ݒ�
	m_pFade = CFade::Create();

	// �f�o�b�O�p�����̐���
	m_pDebugProc = new CDebugProc;
	m_pDebugProc->Init();

	//�X�R�A���Z�b�g
	ResetScore();

	return S_OK;
}

//====================================
//�I��
//====================================
void CApplication::Uninit()
{
	//�����_�����O�N���X�̔j��
	if (m_pRenderer != nullptr)
	{
		// �I������
		m_pRenderer->Uninit();
		delete m_pRenderer;
		m_pRenderer = nullptr;
	}

	// ���[�h�̏I��
	if (m_pMode != nullptr)
	{
		m_pMode->Uninit();
		delete m_pMode;
		m_pMode = nullptr;
	}

	// �t�F�[�h�̏I��
	if (m_pFade != nullptr)
	{
		m_pFade->Uninit();
		delete m_pFade;
		m_pFade = nullptr;
	}

	// �f�o�b�O�p�����̏I��
	if (m_pDebugProc != nullptr)
	{
		m_pDebugProc->Uninit();
		delete m_pDebugProc;
		m_pDebugProc = nullptr;
	}

	// ���͏����̏I��
	if (CInput::GetKey() != nullptr)
	{
		CInput::GetKey()->Uninit();
	}

	//�T�E���h�����̏I��
	if (CSound::GetInstance() != nullptr)
	{// �I������
		CSound::GetInstance()->Uninit();
	}

	//�e�N�X�`���̏I��
	if (CTexture::GetInstance() != nullptr)
	{// �I������
		CTexture::GetInstance()->UnloadAll();
		delete CTexture::GetInstance();
	}

	CObjectXOriginalList::GetInstance()->Uninit();
}

//====================================
//�X�V
//====================================
void CApplication::Update()
{
#ifdef _DEBUG
	LPDIRECT3DDEVICE9 pDevice = CApplication::GetRenderer()->GetDevice();	//�f�o�C�X�ւ̃|�C���^

	//���C���[�t���[��
	if (CInput::GetKey()->Trigger(DIK_1))
	{
		pDevice->SetRenderState(D3DRS_FILLMODE, D3DFILL_WIREFRAME);
	}
	if (CInput::GetKey()->Trigger(DIK_2))
	{
		pDevice->SetRenderState(D3DRS_FILLMODE, D3DFILL_SOLID);
	}
#endif // _DEBUG

	//�����_���[�X�V
	m_pRenderer->Update();

	//�L�[�{�[�h�ƃW���C�p�b�h�̍X�V
	if (CInput::GetKey() != nullptr)
	{
		CInput::GetKey()->Update();
	}

	//���[�h���Ƃ̍X�V
	m_pMode->Update();

	//�t�F�[�h�̍X�V
	m_pFade->Update();
}

//====================================
//�`��
//====================================
void CApplication::Draw()
{
	m_pRenderer->Draw();

	//���[�h���Ƃ̕`��
	m_pMode->Draw();
}

//======================================================
//���[�h�̐ݒ�
//======================================================
void CApplication::SetMode(MODE mode)
{
	//�V�������(���[�h)�̏���������
	if (m_pMode != nullptr)
	{
		CSound::GetInstance()->Stop();
		m_pMode->Uninit();
		delete m_pMode;
		m_pMode = nullptr;
	}

	m_mode = mode;	//���݂̉��(���[�h)��؂�ւ���
	CObjectList::GetInstance()->AllRelease();

	//�V�������(���[�h)�̏���������
	switch (m_mode)
	{
	case MODE_TITLE:	//�^�C�g�����
		m_pMode = new CTitle;
		m_pMode->Init();
		break;

	case MODE_TUTORIAL:	//�}�b�v�I�����
		m_pMode = new CTutorial;
		m_pMode->Init();
		break;

	case MODE_MAP:	//�}�b�v�I�����
		m_pMode = new CMapSelect;
		m_pMode->Init();
		break;

	case MODE_SKILL:	//�X�L���I�����
		m_pMode = new CSkillSelect;
		m_pMode->Init();
		break;

	case MODE_GAME:		//�Q�[�����
		m_pMode = new CGame;
		m_pMode->Init();
		break;

	case MODE_RESULT:	//���U���g���
		m_pMode = new CResult;
		m_pMode->Init();
		break;
	}
}