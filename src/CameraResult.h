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
	enum CAMSTATE
	{
		CAMERA_ROLL=0,	//��]
		CAMERA_UP,		//�㏸
		CAMERA_PULL,	//����
		MAX_CAMERA
	};

	static const float SPEED;		// �ړ����x
	static const float FACTOR;		// �Ǐ]�̌W��
	static const float ROTSPEED;	// ���񑬓x
	static const float ZPOS;		// Z���W
	static const float ZPullCamera;	// ���������̃J�����̍��W
	static const float YFlagCamera; // �J�����������^�C�~���O
public:
	CCameraResult();
	~CCameraResult();

	//�v���g�^�C�v�錾
	void Init() override;		// ������
	void Update() override;		// �X�V

	static CCameraResult* Create();	// ����


private:
	CAMSTATE CAMERASTATE;
};

#endif
