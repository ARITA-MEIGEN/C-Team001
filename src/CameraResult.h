//=================================================
// Content     (�Q�[���̐ݒ�)(camera.h)
// Author     : �L�c����
//=================================================
#ifndef _CAMERA_RESULT_H_		// ���̃}�N����`������ĂȂ�������
#define _CAMERA_RESULT_H_		// ��d�C���N���[�h�h�~�̃}�N����`

#include "Camera.h"

class CCameraResult : public CCamera
{
private:
	static const float SPEED;		// �ړ����x
	static const float FACTOR;		// �Ǐ]�̌W��
	static const float ROTSPEED;	// ���񑬓x
	static const float ZPOS;		// Z���W
public:
	CCameraResult();
	~CCameraResult();

	//�v���g�^�C�v�錾
	void Init() override;		// ������
	void Update() override;		// �X�V

	static CCameraResult* Create();	// ����

private:
};

#endif
