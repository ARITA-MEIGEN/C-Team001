//=============================================================================
//
// ��w�i
// Author : YudaKaito
//
//=============================================================================
#ifndef _SKY_BG_H_
#define _SKY_BG_H_

#include "Object3D.h"

//��N���X
class CSkyBg : public CObject3D
{
public:

	explicit CSkyBg();			// �R���X�g���N�^
	~CSkyBg() override;			// �f�X�g���N�^

	HRESULT Init() override;	// ����������
	void Update() override;		// �X�V����

	static CSkyBg* Create();	// ��������

private:
	float m_uPos;
};

#endif