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
class CPlayer;

//***************************
//�X�e�[�^�X�\���N���X�̒�`
//***************************
class CStatusUI : public CObject
{
private: /* �萔 */
	static const D3DXVECTOR3 GAUGE_LOCAL_POS;
	static const D3DXVECTOR2 GAUGE_SIZE;
	static const D3DXVECTOR3 CHARACTER_BG_LOCAL_POS;
	static const D3DXVECTOR2 CHARACTER_BG_SIZE;
	static const D3DXVECTOR3 SKILL_ICON_BG_LOCAL_POS;
	static const D3DXVECTOR2 SKILL_ICON_BG_SIZE;

	static const D3DXVECTOR3 ITEM_ICON_LEFT_LOCAL_POS;
	static const D3DXVECTOR3 ITEM_ICON_ADD_POS;
	static const D3DXVECTOR2 ITEM_ICON_SIZE;
public: /* �ÓI�����o�֐� */
	static CStatusUI *Create(const D3DXVECTOR3& inPos, int nPlayerNum);

public: /* �R���X�g���N�^�E�f�X�g���N�^ */
	explicit CStatusUI(int nPriority = 4);
	~CStatusUI() override;

public: /* �I�[�o�[���C�h�֐� */
	HRESULT Init() override;	//������
	void Uninit() override;		//�I��
	void Update() override;		//�X�V
	void Draw() {};		//�`��

	void SetPos(const D3DXVECTOR3& inPos);

	void SetPlayer(CPlayer* inPlayer) { m_myPlayer = inPlayer; }

private: /* �����o�֐� */
	void SetPlayerNum(int nPlayerNum);

private: /* �����o�ϐ� */
	D3DXVECTOR3 m_pos;
	CGauge* m_pGauge;			//�Q�[�W
	CObject2D* m_pGaugeBg;		//�Q�[�W�w�i
	CObject2D* m_pCharaBg;		//�L�����N�^�[�w�i
	CObject2D* m_pSkillIconBg;	//�X�L���A�C�R���w�i
	CObject2D* m_pItem;	//�X�L���A�C�R���w�i
	CObject2D* m_pItemIcon[3];	//�A�C�e����
	CPlayer* m_myPlayer;

	int m_nPlayerNum;	//�v���C���[�ԍ�
};

#endif