//**************************************************************************************************
//
// ���[�V��������(motion.h)
// Auther�F�������l
// Auther�FYuda Katio
// �T�v : ���[�V�����N���X�̐ݒ�
//
//**************************************************************************************************
#ifndef _MOTION_H_			// ���̃}�N����`������ĂȂ�������
#define _MOTION_H_			// ��d�C���N���[�h�h�~�̃}�N����`

//***************************************************************************
// �C���N���[�h
//***************************************************************************
#include <vector>

//*****************************************************************************
// �O���錾
//*****************************************************************************
class CObjectX;

//=============================================================================
// ���[�V�����N���X
// Author : �������l
// �T�v : ���[�V�����ݒ���s���N���X
//=============================================================================
class CMotion
{
public:
	//***************************************************************************
	// �萔��`
	//***************************************************************************
	static const unsigned int MOTION_BLEND_FRAM;		// ���[�V�����u�����h�̃t���[����	

	//***************************************************************
	// �L�[�\���̂��`
	//***************************************************************
	typedef struct
	{
		D3DXVECTOR3 pos;	// ���݈ʒu
		D3DXVECTOR3 rot;	// ���݌���
	}MyKey;

	//***************************************************************
	// �L�[�ݒ�\���̂��`
	//***************************************************************
	typedef struct
	{
		int nFrame;					// �t���[����
		std::vector<MyKey> pKey;	// �L�[���
	}MyKeySet;

	//***************************************************************
	// ���[�V�����ݒ�\���̂��`
	//***************************************************************
	typedef struct
	{
		int nNumKey;		// �L�[��
		int nCntKeySet;		// �L�[�Z�b�g�J�E���g
		int nCntFrame;		// �t���[���J�E���g
		bool bLoop;			// ���[�v�g�p��
		bool bMotion;		// ���[�V�������s���Ă��邩
		std::vector<MyKeySet> pKeySet;	// �L�[�ݒ���
	}MyMotion;

	//--------------------------------------------------------------------
	// �R���X�g���N�^�ƃf�X�g���N�^
	//--------------------------------------------------------------------
	CMotion(const char *pFileName);
	~CMotion();

	//--------------------------------------------------------------------
	// �����o�֐�
	//--------------------------------------------------------------------
	void Init();	// ������
	void Update();	// �X�V
	void Uninit(void);	// �I��

	void ReloadMotion(const char *pFileName);	// ���[�V�����̍ēǂݍ���

	// ���[�V�����̗L��
	void SetUseMotion(bool isMotion) { m_bMotion = isMotion; }		// ���[�V�������s���Ă��邩�ݒ�
	bool GetMotion() { return m_bMotion; }							// ���[�V�������s���Ă��邩�擾

	// ���[�V�����u�����h���s�Ȃ��Ă��邩
	bool GetMotionBlend() { return m_bMotionBlend; }				// ���[�V�����u�����h���s���Ă��邩�擾
	void SetMotionBlend(bool isBlend) { m_bMotionBlend = isBlend; }	// ���[�V�����u�����h���s���Ă��邩�ݒ�

	// Setter
	void SetPartsOrigin();									// �p�[�c�����Ƃ̏ꏊ�ɔz�u����
	void SetMotion(const unsigned int nCntMotionSet);		// ���[�V�����̏����ݒ�
	void SetParts(D3DXMATRIX mtxWorld);						// �p�[�c�̐ݒ�
	void SetNumMotion(const unsigned int nNumMotion);		// ���[�V�����ԍ��̐ݒ�

	void SetSizeMag(const D3DXVECTOR3& size);

	// Getter
	int GetMaxParts() { return m_nMaxParts; }					// �p�[�c�̍ő吔�̎擾
	std::vector<CObjectX*> GetParts() { return m_parts; }		// �p�[�c���f���̎擾
	CObjectX* GetParts(int index) { return m_parts[index]; }	// �p�[�c�̃I�u�W�F�N�g���擾

	void ChangeModel(int index, std::string path);

private:
	//--------------------------------------------------------------------
	// �����o�֐�
	//--------------------------------------------------------------------
	void PlayMotion();	// ���[�V�����̍Đ�
	void MotionBlend();	// ���[�V�����u�����h
	void LoodSetMotion(const char *pFileName);	// ���[�V�����ǂݍ���
	void LoodTxt(const char *pFileName);		// ���[�V�����ǂݍ���(.txt)
	void LoodJson(const char *pFileName);		// ���[�V�����ǂݍ���(.json)
	void CntReset(const int nNumMotionOld);		// �J�E���g���Z�b�g

	//--------------------------------------------------------------------
	// �����o�ϐ�
	//--------------------------------------------------------------------
	std::vector<MyMotion> m_motion;			// ���[�V����
	std::vector<CObjectX*> m_parts;			// �p�[�c
	std::vector<std::string> m_partsFile;	// �p�[�c��X�t�@�C����
	int m_nMaxParts;		// �p�[�c��
	int m_nNumMotion;		// ���ݍs���Ă��郂�[�V����
	bool m_bMotion;			// ���[�V�������s����
	bool m_bMotionBlend;	// ���[�V�����u�����h
};
#endif

