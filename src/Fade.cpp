//=================================================
// Content     (�t�F�[�h�̐ݒ�)(fade.cpp)
// Author     : �L�c����
// Since      : (�쐬��2021/08/29)
//=================================================
#include "fade.h"

 //===========================
 // �R���X�g���N�^
 //===========================
 CFade::CFade()
 {

 }

 //===========================
 // �f�X�g���N�^
 //===========================
 CFade::~CFade()
 {

 }

 //===========================
 // ������
 //===========================
 HRESULT CFade::Init(CApplication::MODE modeNext)
 {
	 //�񋓌^�̏�����
	 m_fade = FADE_IN;		//�t�F�[�h�C�����
	 m_modeNext = modeNext;	//���̉��(���[�h)��ݒ�
	 m_col = D3DXCOLOR(0.0f, 0.0f, 0.0f, 1.0f);	//�����|���S��(�s����)�ɂ��Ă���
	 m_bModeChange = false;

	 return S_OK;
 }

 //===========================
 // �I��
 //===========================
 void CFade::Uninit()
 {
	
 }

 //===========================
 // �X�V
 //===========================
 void CFade::Update()
 {
	 if (m_fade != FADE_NONE)
	 {
		 if (m_fade == FADE_IN)
		 {//�t�F�[�h�C�����
			 FadeIn();
		 }
		 else if (m_fade == FADE_OUT)
		 {//�t�F�[�h�A�E�g���
			 FadeOut();
		 }
	 }
	 m_pObject->SetCol(m_col);
	 m_pObject->Update();		//���ɒu���Ȃ��Ɛ������ꂽ��u���������̂܂܂ɂȂ��Ă��܂�
 }

 //===========================
 // �`��
 //===========================
 void CFade::Draw()
 {
	 m_pObject->Draw();
 }

 //===========================
 // �ݒ�
 //===========================
 void CFade::SetFade(CApplication::MODE modeNext)
 {
	 if (m_fade != FADE_OUT)
	 {
		 m_fade = FADE_OUT;		//�t�F�[�h�A�E�g��Ԃ�
		 m_modeNext = modeNext;	//���̉�ʂ�ݒ�
		 m_col = D3DXCOLOR(0.0f, 0.0f, 0.0f, 0.0f);
		 m_bModeChange = true;
	 }
 }
 //�J�ڂȂ�
 void CFade::SetFade()
 {
	 if (m_fade != FADE_OUT)
	 {
		 m_fade = FADE_OUT;		//�t�F�[�h�A�E�g��Ԃ�
		 m_col = D3DXCOLOR(0.0f, 0.0f, 0.0f, 0.0f);
		 m_bModeChange = false;
	 }
 }

 //===========================
 //����
 //===========================
 CFade* CFade::Create()
 {
	 CFade* pFade = new CFade();
	 CApplication::getInstance()->SetMode(CApplication::MODE_TITLE);
	 pFade->CreateFade();
	 pFade->Init(CApplication::MODE_TITLE);


	 return pFade;
 }

 //===========================
 //�|���S���̐���
 //===========================
 void CFade::CreateFade()
 {
	 m_pObject = new CObject2D(CObject::OBJTYPE_FADE);
	 m_pObject->Init();
	 m_pObject->SetPos(D3DXVECTOR3(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, 0.0f));
	 m_pObject->SetSiz(D3DXVECTOR2((float)SCREEN_WIDTH, (float)SCREEN_HEIGHT));
	 m_pObject->SetCol(m_col);
 }

 //�t�F�[�h�C��
 void CFade::FadeIn()
 {
	 m_col.a -= 0.03f;	//�|���S���𓧖��ɂ��Ă���

	 if (m_col.a <= 0.0f)
	 {
		 m_col.a = 0.0f;
		 m_fade = FADE_NONE;	//�������Ă��Ȃ���Ԃ�
	 }
 }

 //�t�F�[�h�A�E�g
 void CFade::FadeOut()
 {
	 m_col.a += 0.03f;	//�|���S����s�����ɂ��Ă���

	 if (m_col.a >= 1.0f)
	 {
		 m_col.a = 1.0f;
		 m_fade = FADE_IN;	//�t�F�[�h�C����Ԃ�

		 if (m_bModeChange == true)
		 {//�����_���[�̏I��������ʂ邽�߂�����x�|���S���𐶐����Ȃ���΂Ȃ�Ȃ�
			 CApplication::getInstance()->SetMode(m_modeNext);	//��ʐ؂�ւ�
			 CreateFade();
		 }
	 }
 }
