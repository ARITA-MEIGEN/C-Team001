//================================================
//
//�X�e�[�^�X�\�� [StatusUI.h]
//Author : Kishimoto Eiji
//
//================================================
#ifndef _STATUS_UI_H_
#define _STATUS_UI_H_

//***************************
//�C���N���[�h
//***************************
#include "Object.h"

//***************************
//�O���錾
//***************************
class CGauge;
class CObject2D;

//***************************
//�X�e�[�^�X�\���N���X�̒�`
//***************************
class CStatusUI : public CObject
{
public: /* �ÓI�����o�֐� */
	/*
		����
		int nPlayerNum ---> �v���C���[�ԍ�
	*/
	static CStatusUI *Create(int nPlayerNum);

public: /* �R���X�g���N�^�E�f�X�g���N�^ */
	explicit CStatusUI(int nPriority = 4);
	~CStatusUI() override;

public: /* �I�[�o�[���C�h�֐� */
	HRESULT Init() override;	//������
	void Uninit() override;		//�I��
	void Update() override;		//�X�V
	void Draw() override;		//�`��

private: /* �����o�֐� */
	/*
		�v���C���[�ԍ��̐ݒ�
		int nPlayerNum ---> �v���C���[�ԍ�
	*/
	void SetPlayerNum(int nPlayerNum);

private: /* �����o�ϐ� */
	CGauge* m_pGauge;			//�Q�[�W
	CObject2D* m_pCharaBg;		//�L�����N�^�[�w�i
	CObject2D* m_pSkillIconBg;	//�X�L���A�C�R���w�i

	int m_nPlayerNum;	//�v���C���[�ԍ�
};

#endif