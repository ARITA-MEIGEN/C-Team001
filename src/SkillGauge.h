//=============================================================================
//
// skill_gauge.h
// Author:����]��
//
//=============================================================================
#ifndef _SKILL_GAUGE_H_
#define _SKILL_GAUGE_H_

#include "object2D.h"

//HP�Q�[�W�N���X
class CGauge : public CObject2D
{
public:
	//��`
	static const D3DXVECTOR2 GAUGE_SIZE;	//�Q�[�W����̑傫��
	static const float MAX_SIZE;			//�Q�[�W�̍ő�l

	explicit CGauge(int nPriority = 4);					//�I�[�o�[���C�h���ꂽ�R���X�g���N�^
	~CGauge() override;									//�f�X�g���N�^

	//�����o�֐�
	HRESULT Init() override;							//������
	void Uninit() override;								//�I��
	void Update() override;								//�X�V
	void Draw() override;								//�`��

	//�ÓI�����o�֐�
	static CGauge *Create(const D3DXVECTOR3 pos, const D3DXVECTOR2 size, const D3DXCOLOR col, const int number); //����

private:
	//�����o�ϐ�
	int m_nSkillNumber;					//�X�L���Q�[�W�̔ԍ�
};

#endif