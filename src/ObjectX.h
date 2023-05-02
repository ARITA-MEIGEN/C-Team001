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
#include <vector>

//�O���錾
class CShadow;

class CObjectX:public CObject
{
public:
	explicit CObjectX(int nPriority = 3);
	~CObjectX();

	//�v���g�^�C�v�錾
	virtual HRESULT Init() override;
	virtual void Uninit() override;
	virtual void Update() override;
	virtual void Draw() override;

	static CObjectX*Create();

	void BindModel(LPD3DXMESH pMesh, LPD3DXBUFFER pBuff, DWORD pNumMat);
	void Shadow();
	void SizeCalculate();
	void SetModel(char* Filename);

	// Setter
	void SetPos(const D3DXVECTOR3& pos) { m_pos = pos; }
	void SetRot(const D3DXVECTOR3& rot) { m_rot = rot; }
	void SetPosDest(const D3DXVECTOR3& pos) { m_posDest = pos; };
	void SetRotDest(const D3DXVECTOR3& rot) { m_rotDest = rot; };
	void SetPosDefault(const D3DXVECTOR3& pos) { m_DefaultPos = pos; };
	void SetRotDefault(const D3DXVECTOR3& rot) { m_DefaultRot = rot; };
	void SetParent(CObjectX* pModel);
	void SetParentMatrix(D3DXMATRIX* inMatrix) { m_mtxParent = inMatrix; }
	void SetChildren(CObjectX* pModel) { m_childrens.push_back(pModel); }
	void SetCol(const D3DXCOLOR& col) { m_col = col; };

	// Getter
	const D3DXVECTOR3 GetPos() { return m_pos; };
	const D3DXVECTOR3 GetRot() { return m_rot; };
	const D3DXVECTOR3 GetPosDest() { return m_posDest; };
	const D3DXVECTOR3 GetRotDest() { return m_rotDest; };
	const D3DXVECTOR3 GetPosDefault() { return m_DefaultPos; };
	const D3DXVECTOR3 GetRotDefault() { return m_DefaultRot; };
	const LPCTSTR GetModelName() { return m_modelname; }
	const D3DXVECTOR3 GetSize() { return m_size; }
	const D3DXCOLOR GetCol() { return m_col; }
	CObjectX* GetParent() { return m_pParent; }
	const D3DXMATRIX& GetMatrix() { return m_mtxWorld; }

private:
	LPD3DXMESH		m_pMesh;			// ���b�V���ւ̃|�C���^
	LPD3DXBUFFER	m_pBuffMat;			// �}�e���A�����ւ̃|�C���^
	DWORD			m_nNumMat;			// �}�e���A�����̐�
	D3DXMATRIX		m_mtxWorld;			// ���[���h�}�g���b�N�X
	D3DXVECTOR3		m_size;				// �傫��
	D3DXVECTOR3		m_vtxMax;			// ���f���̍ő���W
	D3DXVECTOR3		m_vtxMin;			// ���f���̍��W�̍ŏ��l
	int				m_nIdxModelParent;	// �e���f���̃C���f�b�N�XaModel�̔ԍ�
	LPCTSTR			m_modelname;		// ���f���̖��O
	D3DXCOLOR		m_col;				// �F
  
	D3DXMATRIX*		m_mtxParent;		// �e�̃��[���h�}�g���b�N�X

	// �ʒu
	D3DXVECTOR3 m_pos;			// �ʒu
	D3DXVECTOR3 m_addPos;		// ���Z�ʒu
	D3DXVECTOR3 m_posold;		// �O��ʒu
	D3DXVECTOR3 m_DefaultPos;	// �����ʒu
	D3DXVECTOR3 m_move;			// �ړ���
	D3DXVECTOR3 m_posDest;		// �ړI�̈ʒu

	// ����	  
	D3DXVECTOR3 m_DefaultRot;	// ��������
	D3DXVECTOR3 m_rot;			// ����
	D3DXVECTOR3 m_addRot;		// ���Z����
	D3DXVECTOR3 m_rotDest;		// �ړI�̊p�x

	// �e	   
	CShadow*  m_Shadow;			// �e
	D3DXMATRIX  m_mtxShadow;	// �e�p���[���h�}�g���b�N�X

	// �e�q�֌W
	CObjectX* m_pParent;				// �e���f���ւ̃|�C���^
	std::vector<CObjectX*> m_childrens;	// �q���f���ւ̃|�C���^�R���e�i

	int m_nIdx;				// ���g�̔ԍ�
};
#endif
