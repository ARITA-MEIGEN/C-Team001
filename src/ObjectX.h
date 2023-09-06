//=============================================================================
//
// X�t�@�C���ǂݍ���
// Author : �L�c����
//
//=============================================================================

#ifndef _OBJECTX_H_
#define _OBJECTX_H_

//�C���N���[�h
#include "main.h"
#include "Object.h"
#include "ObjectXOriginalList.h"
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
	void BindModel(CObjectXOriginalList::SModelData  model);
	void BindModel(std::string modelTag) { BindModel(CObjectXOriginalList::GetInstance()->GetModelData(modelTag)); }
	void Shadow();
	void SetModel(const char* Filename);

	// Setter
	void SetPos(const D3DXVECTOR3& inPos) { m_pos = inPos; }
	void AddPos(const D3DXVECTOR3& inPos) { SetPos(m_pos + inPos); }
	void SetPosDest(const D3DXVECTOR3& pos) { m_posDest = pos; };
	void SetPosDefault(const D3DXVECTOR3& pos) { m_DefaultPos = pos; };
	const D3DXVECTOR3 GetPos() { return m_pos; };
	const D3DXVECTOR3 GetPosDest() { return m_posDest; };
	const D3DXVECTOR3 GetPosDefault() { return m_DefaultPos; };

	// ����
	void SetRot(const D3DXVECTOR3& inRot) { m_rot = inRot; }
	void AddRot(const D3DXVECTOR3& inRot) { SetRot(m_rot + inRot); }
	void SetRotDest(const D3DXVECTOR3& rot) { m_rotDest = rot; };
	void SetRotDefault(const D3DXVECTOR3& rot) { m_DefaultRot = rot; };
	const D3DXVECTOR3 GetRot() { return m_rot; };
	const D3DXVECTOR3 GetRotDest() { return m_rotDest; };
	const D3DXVECTOR3 GetRotDefault() { return m_DefaultRot; };

	// �傫��
	void SetSizeMag(const D3DXVECTOR3& size) { m_sizeMag = size; }
	const D3DXVECTOR3 GetSize() { return m_modelData.size; }
	const D3DXVECTOR3 GetSizeMag() { return m_sizeMag; }

	// �F
	void SetCol(const D3DXCOLOR& col) { m_materialColor[0] = col; };
	void SetColorMaterial(const int index, const D3DXCOLOR& col) { m_materialColor[index] = col; };
	void SetAllColorMaterial(const D3DXCOLOR& col) { for (size_t i = 0; i < m_materialColor.size(); i++) { m_materialColor[i] = col; } };
	const D3DXCOLOR GetCol() { return m_materialColor[0]; }
	const int GetColorMaterialSize() { return m_materialColor.size(); }

	// �e�q�֌W
	void SetParent(CObjectX* pModel);
	void SetParentMatrix(D3DXMATRIX* inMatrix) { m_mtxParent = inMatrix; }
	void SetChildren(CObjectX* pModel) { m_childrens.push_back(pModel); }
	CObjectX* GetParent() { return m_pParent; }

	// Getter
	const CObjectXOriginalList::SModelData GetModelData() { return m_modelData; };
	const LPCTSTR GetModelName() { return m_modelname; }
	const D3DXMATRIX& GetMatrix() { return m_mtxWorld; }

private:
	CObjectXOriginalList::SModelData m_modelData;	//���f���f�[�^�̎Q��
	D3DXMATRIX		m_mtxWorld;			// ���[���h�}�g���b�N�X
	int				m_nIdxModelParent;	// �e���f���̃C���f�b�N�XaModel�̔ԍ�
	LPCTSTR			m_modelname;		// ���f���̖��O
	D3DXCOLOR		m_col;				// �F
	std::vector<D3DXCOLOR>	m_materialColor;	// �}�e���A�����Ɛݒ肷��F

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

	// �傫���{��
	D3DXVECTOR3 m_sizeMag;		// �{��

	// �e	   
	CShadow*  m_Shadow;			// �e
	D3DXMATRIX  m_mtxShadow;	// �e�p���[���h�}�g���b�N�X

	// �e�q�֌W
	CObjectX* m_pParent;				// �e���f���ւ̃|�C���^
	std::vector<CObjectX*> m_childrens;	// �q���f���ւ̃|�C���^�R���e�i

	int m_nIdx;				// ���g�̔ԍ�
};
#endif
