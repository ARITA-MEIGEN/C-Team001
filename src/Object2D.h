//=============================================================================
//
// 2D�I�u�W�F�N�g
// Author : �L�c����
//
//=============================================================================

#ifndef _OBJECT2D_H_
#define _OBJECT2D_H_

//�C���N���[�h
#include "Main.h"
#include "Object.h"
#include <string>

//*****************************************************************************
//�O���錾
//*****************************************************************************
class CApplication;

class CObject2D : public CObject
{
private:
	// ���_�t�H�[�}�b�g
	const DWORD FVF_VERTEX_2D = (D3DFVF_XYZRHW | D3DFVF_DIFFUSE | D3DFVF_TEX1);

	// ���_�f�[�^
	struct VERTEX_2D
	{
		D3DXVECTOR3 pos;
		float rhw;
		D3DCOLOR col;
		D3DXVECTOR2 tex;	//�e�N�X�`�����W
	};
public:
	//�����o�֐�
	explicit CObject2D(int nPriority = 3);
	~CObject2D()override;
	HRESULT Init()override;
	void Uninit()override;
	void Update()override;
	void Draw()override;
	static bool Hit(D3DXVECTOR3 pos, D3DXVECTOR3 TargetPos, D3DXVECTOR2 Siz, D3DXVECTOR2 TargetSiz);

	// �ʒu
	void SetPos(const D3DXVECTOR3& pos);
	void AddPos(const D3DXVECTOR3& add) { SetPos(m_Pos + add); }
	void SetSkillPos(const float &gauge);					//�X�L���Q�[�W�̐ݒ�
	D3DXVECTOR3 GetPos() { return m_Pos; }

	// �傫��
	void SetSiz(D3DXVECTOR2 Siz);
	void AddSiz(D3DXVECTOR2 Siz) { SetSiz(m_Siz + Siz); }
	D3DXVECTOR2 GetSiz();

	// �F
	void SetCol(D3DXCOLOR col);
	void AddCol(D3DXCOLOR col) { SetCol(m_Col + col); };
	void SetColAlpha(float inAlpha) { SetCol(D3DXCOLOR(m_Col.r, m_Col.g, m_Col.b, inAlpha)); }
	D3DXCOLOR GetCol();

	// �p�x
	void SetRot(float Rot);
	float GetRot();
	
	// �e�N�X�`��
	void SetTextureKey(const std::string key) { m_textureKey = key; }
	void SetUV(float U1, float U2, float V1, float V2);
	D3DXVECTOR2 GetUV(int number);

	// ����
	static CObject2D*Create(D3DXVECTOR3 pos, D3DXVECTOR2 siz, int Priority);
private:
	void VtxPos();
private:
	//�����o�ϐ�
	std::string m_textureKey;			// �e�N�X�`���ɃA�N�Z�X����L�[
	LPDIRECT3DVERTEXBUFFER9 m_pVtxBuff;	// �|���S���̒��_�o�b�t�@
	float m_fLength;					// �Ίp���̒���
	float m_fAngle;						// �Ίp���̊p�x
	float m_Rot;						// ��]
	D3DXVECTOR3 m_Pos;					// �ʒu
	D3DXVECTOR2 m_Siz;					// �傫��
	D3DXCOLOR m_Col;					// �F
	D3DXVECTOR2 m_UV[2];				// �e�N�X�`�����W
};
#endif // !_OBJECT_H_

