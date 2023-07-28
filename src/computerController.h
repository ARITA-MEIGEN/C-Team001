//=========================================
// 
// computer���v���C���[�𑀍삷��̃N���X
// Author YudaKaito
// 
//=========================================
#ifndef _COMPUTER_CONTROLLER_H_
#define _COMPUTER_CONTROLLER_H_

#include "controller.h"

//-----------------------------------------
// �O���錾
//-----------------------------------------
class CMap;

//-----------------------------------------
// �R���s���[�^�[�R���g���[���[�N���X
//-----------------------------------------
class CComputerController : public CController
{
public:
	CComputerController();
	~CComputerController() override;

	HRESULT Init() override;
	void Uninit() override;
	void Update() override;

	D3DXVECTOR3 Move() override;
	bool Skill() override;
	bool Throw() override;
private:

private:
	CMap* m_mapInfo;	// �Ֆʂ̏󋵏��
};
#endif // !_PLAYER_OPERATE_H_