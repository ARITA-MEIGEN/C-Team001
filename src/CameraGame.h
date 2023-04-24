//=================================================
// Content     (�Q�[���̐ݒ�)(camera.h)
// Author     : �L�c����
//=================================================
#ifndef _CAMERA_GAME_H_		// ���̃}�N����`������ĂȂ�������
#define _CAMERA_GAME_H_		// ��d�C���N���[�h�h�~�̃}�N����`

#include "Camera.h"

class CCameraGame : public CCamera
{
	static const float SPEED;		// �ړ����x
	static const float FACTOR;		// �Ǐ]�̌W��
	static const float ROTSPEED;	// ���񑬓x
	static const float ZPOS;		// Z���W
public:
	CCameraGame();
	~CCameraGame();

	//�v���g�^�C�v�錾
	void Init() override;		// ������
	void Update() override;		// �X�V
	void Set();					// �ݒ�

	static CCameraGame* Create();	// ����

private:
};

#endif
