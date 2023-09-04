//================================================
//
//�w�i [Bg.h]
//Author : Yuda Kaito
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
class CAreaWarning : public CObject
{
public: /* �ÓI�����o�֐� */
	static CAreaWarning* Create(const D3DXVECTOR3& inPos);	//����

public: /* �R���X�g���N�^�E�f�X�g���N�^ */
	explicit CAreaWarning();
	~CAreaWarning() override;

public: /* �I�[�o�[���C�h�֐� */
	HRESULT Init() override;	//������
	void Uninit() override;		//�I��
	void Update() override;		//�X�V
	void Draw() override;		//�X�V

	void SetPos(const D3DXVECTOR3& inPos);
private: /* �����o�֐� */

private: /* �����o�ϐ� */
	CObject2D* m_text;	// �x���e�L�X�g
	CObject2D* m_bg;	// �w�i

	D3DXVECTOR3 m_pos;
};

#endif