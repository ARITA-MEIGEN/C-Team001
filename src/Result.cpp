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

//�ÓI�����o�ϐ�
CObject2D*CResult::m_pBg = nullptr;
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
	LPDIRECT3DTEXTURE9 tex[3];

	//�w�i�̐���
	m_pBg = new CObject2D(CObject::OBJTYPE_UI);
	m_pBg->Init();
	m_pBg->SetPos(D3DXVECTOR3((float)SCREEN_WIDTH / 2, (float)SCREEN_HEIGHT / 2, 0.0f));
	m_pBg->SetSiz(D3DXVECTOR2((float)SCREEN_WIDTH, (float)SCREEN_HEIGHT));
	m_pBg->SetCol(D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));

	std::string textureKey[4];
	textureKey[0] = "RESULET_000";
	textureKey[1] = "RESULET_001";
	textureKey[2] = "RESULET_002";
	textureKey[3] = "RESULET_003";

	m_pBg->SetTextureKey(textureKey[CApplication::getInstance()->GetWinner()]);

	for (int i = 0; i < MAX_PLAYER; i++)
	{
		int Ranking = CMap::GetRanking(i);	//
	}

	return S_OK;
}

//====================================
//�I��
//====================================
void CResult::Uninit()
{
	CSound::GetInstance()->Stop();
}

//====================================
//�X�V
//====================================
void CResult::Update()
{
	CInput* pInput = CInput::GetKey();

	if (CApplication::getInstance()->GetFade()->GetFade() == CFade::FADE_NONE)
	{
		if ((pInput->Trigger(KEY_ALL)) == true)		//ENTER�L�[
		{//�G���^�[�Ń����L���O��
		 //���[�h�ݒ�
			CApplication::getInstance()->GetFade()->SetFade(CApplication::MODE_TITLE);
		}
	}
}

//====================================
//�`��
//====================================
void CResult::Draw()
{

}
