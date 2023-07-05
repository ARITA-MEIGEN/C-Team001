//================================================
//
//�w�i [Bg.h]
//Author : Kishimoto Eiji
//
//================================================
#ifndef _BG_H_
#define _BG_H_

//***************************
//�C���N���[�h
//***************************
#include "Object.h"

//***************************
//�O���錾
//***************************
class CObject2D;

//***************************
//�X�e�[�^�X�\���N���X�̒�`
//***************************
class CBg : public CObject
{
public: /* �ÓI�����o�֐� */
	static CBg *Create();	//����

public: /* �R���X�g���N�^�E�f�X�g���N�^ */
	explicit CBg(int nPriority = 4);
	~CBg() override;

public: /* �I�[�o�[���C�h�֐� */
	HRESULT Init() override;	//������
	void Uninit() override;		//�I��
	void Update() override;		//�X�V
	void Draw() override;		//�`��

private: /* �����o�֐� */
	void Circle_Pop();	//�o�����̃T�[�N��
	void Circle_Move();	//�ړ����̃T�[�N��
	
private: /* �����o�ϐ� */
	CObject2D* m_pBg;		//�w�i
	CObject2D* m_pCircle;	//�T�[�N��

	bool m_bPop;	//�o�������ǂ���
};

#endif