//=================================================
// Content	(�Q�[���̐ݒ�)(camera.h)
// Author	: �L�c����
//=================================================
#ifndef _CAMERA_H_	// ���̃}�N����`������ĂȂ�������
#define _CAMERA_H_	// ��d�C���N���[�h�h�~�̃}�N����`

class CCamera
{
private:
	static const float CAMERA_NEAR;		// �ړ����x
	static const float CAMERA_FAR;		// �Ǐ]�̌W��
	static const float FIELD_OF_VIEW;	// ����p
public:
	CCamera();
	~CCamera();

	//�v���g�^�C�v�錾
	virtual void Init();		// ������
	virtual void Uninit();		// �I��
	virtual void Update();		// �X�V
	void Set();					// �ݒ�
	void NormalizeRadian();		// �p�x�̐��K��

	static CCamera* Create();	// ����

	void SetPosV(D3DXVECTOR3 posV) { m_posV = posV; };	//���_
	D3DXVECTOR3 GetPosV() { return m_posV; };	//���_
	void SetPosR(D3DXVECTOR3 posR) { m_posR = posR; };	//�����_
	void SetRot(D3DXVECTOR3 rot) { m_rot = rot; };		//����
	void SetVecU(D3DXVECTOR3 vec) { m_vecU = vec; };

	void AddPos(D3DXVECTOR3 move);

	D3DXVECTOR3 CalculateRotFromPos(const D3DXVECTOR3& inPos);	// �ʒu����J�����Ɍ������߂̊p�x���Z�o
protected:
	D3DXVECTOR3 m_posV;				// ���_
	D3DXVECTOR3 m_posVDest;			// ���_�̖ړI�n
	D3DXVECTOR3 m_posR;				// �����_
	D3DXVECTOR3 m_posRDest;			// �����_�̖ړI�n
	D3DXVECTOR3 m_vecU;				// ������x�N�g��
	D3DXVECTOR3 m_rot;				// ����
	D3DXVECTOR3 m_rotDest;			// �����̖ړI�̊p�x
	float m_fDistance;				// ����
	D3DXMATRIX m_mtxProjection;		// �v���W�F�N�V�����}�g���b�N�X
	D3DXMATRIX m_mtxView;			// �r���[�}�g���b�N�X

	D3DVIEWPORT9 m_viewPort;
};

#endif
