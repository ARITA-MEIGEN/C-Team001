//=============================================================================
//
// 3D�I�u�W�F�N�g
// Author : �L�c����
//
//=============================================================================

#ifndef _OBJECT3D_H_
#define _OBJECT3D_H_

//�C���N���[�h
#include"main.h"
#include"Object.h"

// ���_�t�H�[�}�b�g
const DWORD FVF_VERTEX_3D = (D3DFVF_XYZ | D3DFVF_NORMAL | D3DFVF_DIFFUSE | D3DFVF_TEX1);

//*****************************************************************************
//�O���錾
//*****************************************************************************
class CApplication;

//*****************************************************************************
// �\���̒�`
//*****************************************************************************
// ���_�f�[�^
struct VERTEX_3D
{
	D3DXVECTOR3 pos;	//���_���W
	D3DXVECTOR3 nor;	//�@���x�N�g��
	D3DCOLOR col;		//���_�J���[
	D3DXVECTOR2 tex;	//�e�N�X�`�����W;
};

class CObject3D : public CObject
{
public:
	//�����o�֐�
	explicit CObject3D(int nPriority = 3);
	~CObject3D()override;
	HRESULT Init()override;
	void Uninit()override;
	void Update()override;
	void Draw()override;
	static CObject3D*Create(D3DXVECTOR3 pos, D3DXVECTOR3 siz, int Priority);
	void BindTexture(LPDIRECT3DTEXTURE9 tex);

	//�Z�b�^�[
	void SetPos(const D3DXVECTOR3& pos);
	void SetSiz(const D3DXVECTOR3& siz);
	void SetRot(const D3DXVECTOR3& rot) { m_Rot = rot; };
	void SetCol(const D3DXCOLOR& col);
	void SetBackCulling(const bool isCulling) { m_isBackCulling = isCulling; }
	void SetMatrixWorld(const D3DXMATRIX& inMatrixWorld) { m_mtxWorld = inMatrixWorld; }
	void OnBillboard() { m_isBillboard = true; }
	void SetUV(float U1, float U2, float V1, float V2);

	//�Q�b�^�[
	const D3DXVECTOR3 GetPos() const { return m_Pos; }
	const D3DXVECTOR3 GetSiz() const { return m_Siz; }
	const D3DXVECTOR3 GetRot() const { return m_Rot; }
	const D3DXCOLOR GetCol() const { return m_Col; }
	const D3DXMATRIX GetMatrixWorld() const { return m_mtxWorld; }

	void SetTextureKey(const std::string key) { m_textureKey = key; }
private:
	//�����o�ϐ�
	std::string m_textureKey;			// �e�N�X�`���ɃA�N�Z�X����L�[
	LPDIRECT3DVERTEXBUFFER9 m_pVtxBuff;	//�|���S���̒��_�o�b�t�@
	float m_fLength;					//�Ίp���̒���
	float m_fAngle;						//�Ίp���̊p�x
	D3DXVECTOR3 m_Rot;					//��]
	D3DXMATRIX m_mtxWorld;		// ���[���h�}�g���b�N�X
	D3DXVECTOR3 m_Pos;					//�ʒu
	D3DXVECTOR3 m_Siz;					//�傫��
	D3DXCOLOR m_Col;					//�F
	bool m_isBackCulling;				// �w�ʃJ�����O�̎g�p�L��
	bool m_isBillboard;
};
#endif // !_OBJECT_H_


