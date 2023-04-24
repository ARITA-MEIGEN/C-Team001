//=============================================================================
//
// X�t�@�C���ǂݍ���
// Author : �L�c����
//
//=============================================================================

#ifndef _OBJECTX_H_
#define _OBJECTX_H_

//�C���N���[�h
#include"main.h"
#include"Object.h"

//�O���錾
class CShadow;

class CObjectX:public CObject
{
public:
	explicit CObjectX(int nPriority = 3);
	~CObjectX();
	//�v���g�^�C�v�錾
	virtual HRESULT Init()override;
	virtual void Uninit(void)override;
	virtual void Update(void)override;
	virtual void Draw(void)override;
	static CObjectX*Create(D3DXVECTOR3 pos, int Priority, LPCTSTR name);
	void BindModel(LPD3DXMESH pMesh, LPD3DXBUFFER pBuff, DWORD pNumMat);
	void Shadow();

	//�Z�b�^�[
	void SetPos(D3DXVECTOR3 pos);
	void SetRot(D3DXVECTOR3 rot);
	void SetModel(LPCTSTR name) { m_modelname = name; };
	void SetCol(D3DXCOLOR col) { m_col = col; };

	//�Z�b�^�[
	D3DXVECTOR3 GetPos() { return m_pos; };
	D3DXVECTOR3 GetRot() { return m_rot; };
	LPCTSTR GetModelName() { return m_modelname; };
	D3DXVECTOR3	GetSize() { return m_size; };
	D3DXCOLOR GetCol() { return m_col; };

private:
	LPD3DXMESH		m_pMesh;			//���b�V���ւ̃|�C���^
	LPD3DXBUFFER	m_pBuffMat;			//�}�e���A�����ւ̃|�C���^
	DWORD			m_nNumMat;			//�}�e���A�����̐�
	D3DXMATRIX		m_mtxWorld;			//���[���h�}�g���b�N�X
	D3DXVECTOR3		m_pos;				//�ʒu
	D3DXVECTOR3		m_addPos;			//�ʒu
	D3DXVECTOR3		m_rot;				//����
	D3DXVECTOR3		m_addRot;			//����
	D3DXVECTOR3		m_size;				//�傫��
	D3DXVECTOR3		m_vtxMax;			//���f���̍ő���W
	D3DXVECTOR3		m_vtxMin;			//���f���̍��W�̍ŏ��l
	D3DXVECTOR3		m_move;				//�ړ���
	D3DXVECTOR3		m_posold;			//�O��̈ʒu
	int				m_nIdxModelParent;	//�e���f���̃C���f�b�N�XaModel�̔ԍ�
	CShadow*		m_Shadow;			//�e
	D3DXVECTOR3		m_rotDest;			//�ړI�̊p�x�̕ۑ�
	D3DXMATRIX		m_mtxShadow;		//�e�̃}�g���N�X
	LPCTSTR			m_modelname;		//���f���̖��O
	D3DXCOLOR		m_col;				//�F
};
#endif



