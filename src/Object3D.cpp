//=============================================================================
//
// 3D�I�u�W�F�N�g
// Author : �L�c����
//
//=============================================================================

//�C���N���[�h
#include "Object3D.h"
#include "renderer.h"
#include"Application.h"
#include"Shadow.h"
#include "Texture.h"

#define POLIGON_SIZE	(500.0f)	//�|���S���̑傫��

//=============================================================================
// �R���X�g���N�^
//=============================================================================
CObject3D::CObject3D(int nPriority) :CObject(nPriority)
{
	m_pVtxBuff = nullptr;							// �|���S���̒��_�o�b�t�@
	m_fLength = 0.0f;								// �Ίp���̒���
	m_fAngle = 0.0f;								// �Ίp���̊p�x
	m_Pos = D3DXVECTOR3(0.0f, 0.0f, 0.0f);			// �ʒu������������
	m_Rot = D3DXVECTOR3(0.0f, 0.0f, 0.0f);			// ������������
	m_Col = D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f);		// �F
}

//=============================================================================
// �f�X�g���N�^
//=============================================================================
CObject3D::~CObject3D()
{
	assert(m_pVtxBuff == nullptr);		//�|���S���̒��_�o�b�t�@
}

//=============================================================================
// ������
//=============================================================================
HRESULT  CObject3D::Init()
{
	//�f�o�C�X�̎擾
	LPDIRECT3DDEVICE9 pDevice;
	pDevice = CApplication::getInstance()->GetRenderer()->GetDevice();

	//���_�o�b�t�@�̐���
	pDevice->CreateVertexBuffer(sizeof(VERTEX_3D) * 4,
		D3DUSAGE_WRITEONLY,
		FVF_VERTEX_3D,
		D3DPOOL_MANAGED,
		&m_pVtxBuff,
		nullptr);

	VERTEX_3D*pVtx;
	//���_�o�b�t�@�����b�N���A���_�f�[�^�ւ̃|�C���^���擾
	m_pVtxBuff->Lock(0, 0, (void**)&pVtx, 0);

	//���_���W�̐ݒ�
	pVtx[0].pos = D3DXVECTOR3(m_Pos.x - (m_Siz.x / 2), m_Pos.y, m_Pos.z - (m_Siz.z / 2));
	pVtx[1].pos = D3DXVECTOR3(m_Pos.x - (m_Siz.x / 2), m_Pos.y, m_Pos.z + (m_Siz.z / 2));
	pVtx[2].pos = D3DXVECTOR3(m_Pos.x + (m_Siz.x / 2), m_Pos.y, m_Pos.z - (m_Siz.z / 2));
	pVtx[3].pos = D3DXVECTOR3(m_Pos.x + (m_Siz.x / 2), m_Pos.y, m_Pos.z + (m_Siz.z / 2));

	//�@���x�N�g���̐ݒ�
	pVtx[0].nor = D3DXVECTOR3(0.0f, 1.0f, 0.0f);
	pVtx[1].nor = D3DXVECTOR3(0.0f, 1.0f, 0.0f);
	pVtx[2].nor = D3DXVECTOR3(0.0f, 1.0f, 0.0f);
	pVtx[3].nor = D3DXVECTOR3(0.0f, 1.0f, 0.0f);

	//�e�N�X�`�����W�̐ݒ�
	pVtx[0].tex = D3DXVECTOR2(0.0f, 0.0f);
	pVtx[1].tex = D3DXVECTOR2(1.0f, 0.0f);
	pVtx[2].tex = D3DXVECTOR2(0.0f, 1.0f);
	pVtx[3].tex = D3DXVECTOR2(1.0f, 1.0f);


	m_Col = D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f);

	//���_�J���[�ݒ�
	for (int i = 0; i < 4; i++)
	{
		pVtx[i].col = m_Col;
	}

	//���_�o�b�t�@���A�����b�N
	m_pVtxBuff->Unlock();

	return S_OK;
}

//=============================================================================
//�I��
//=============================================================================
void  CObject3D::Uninit()
{
	//���_�o�b�t�@��j��
	if (m_pVtxBuff != nullptr)
	{
		m_pVtxBuff->Release();
		m_pVtxBuff = nullptr;
	}

	CObject::Release();
}

//=============================================================================
// �X�V
//=============================================================================
void  CObject3D::Update()
{
	//�f�o�C�X�̎擾
	LPDIRECT3DDEVICE9 pDevice;
	pDevice = CApplication::getInstance()->GetRenderer()->GetDevice();
	VERTEX_3D*pVtx;

	//���_�o�b�t�@�����b�N���A���_�f�[�^�ւ̃|�C���^���擾
	m_pVtxBuff->Lock(0, 0, (void**)&pVtx, 0);

	//���_���W�̐ݒ�
	pVtx[0].pos = D3DXVECTOR3(-(m_Siz.x * 0.5f), 0.0f, +(m_Siz.z * 0.5f));
	pVtx[1].pos = D3DXVECTOR3(+(m_Siz.x * 0.5f), 0.0f, +(m_Siz.z * 0.5f));
	pVtx[2].pos = D3DXVECTOR3(-(m_Siz.x * 0.5f), 0.0f, -(m_Siz.z * 0.5f));
	pVtx[3].pos = D3DXVECTOR3(+(m_Siz.x * 0.5f), 0.0f, -(m_Siz.z * 0.5f));

	//�@���x�N�g���̐ݒ�
	pVtx[0].nor = D3DXVECTOR3(0.0f, 1.0f, 0.0f);
	pVtx[1].nor = D3DXVECTOR3(0.0f, 1.0f, 0.0f);
	pVtx[2].nor = D3DXVECTOR3(0.0f, 1.0f, 0.0f);
	pVtx[3].nor = D3DXVECTOR3(0.0f, 1.0f, 0.0f);

	//�e�N�X�`�����W�̐ݒ�
	pVtx[0].tex = D3DXVECTOR2(0.0f, 0.0f);
	pVtx[1].tex = D3DXVECTOR2(1.0f, 0.0f);
	pVtx[2].tex = D3DXVECTOR2(0.0f, 1.0f);
	pVtx[3].tex = D3DXVECTOR2(1.0f, 1.0f);

	//���_�o�b�t�@���A�����b�N
	m_pVtxBuff->Unlock();
}

//=============================================================================
// �`��
//=============================================================================
void  CObject3D::Draw()
{
	//�f�o�C�X�̎擾
	LPDIRECT3DDEVICE9 pDevice;
	pDevice = CApplication::getInstance()->GetRenderer()->GetDevice();

	D3DXMATRIX mtxRot, mtxTrans;	//�v�Z�p�}�g���b�N�X

	//���[���h�}�g���b�N�X�̏�����
	D3DXMatrixIdentity(&m_mtxWorldPolygon);

	//�����𔽉f
	D3DXMatrixRotationYawPitchRoll(&mtxRot,m_Rot.y, m_Rot.x, m_Rot.z);
	D3DXMatrixMultiply(&m_mtxWorldPolygon, &m_mtxWorldPolygon, &mtxRot);

	//�ʒu�𔽉f
	D3DXMatrixTranslation(&mtxTrans, m_Pos.x, m_Pos.y, m_Pos.z);
	D3DXMatrixMultiply(&m_mtxWorldPolygon, &m_mtxWorldPolygon, &mtxTrans);

	//���[���h�}�g���b�N�X�̐ݒ�
	pDevice->SetTransform(D3DTS_WORLD, &m_mtxWorldPolygon);

	//���_�o�b�t�@���f�[�^�X�g���[���ɐݒ�
	pDevice->SetStreamSource(0, m_pVtxBuff, 0, sizeof(VERTEX_3D));

	//���_�t�H�[�}�b�g�̐ݒ�
	pDevice->SetFVF(FVF_VERTEX_3D);

	// �e�N�X�`���̎擾
	CTexture* pTexture = CTexture::GetInstance();

	// �e�N�X�`���̐ݒ�
	pDevice->SetTexture(0, pTexture->GetTexture(m_textureKey));

	// �J�����O����
	//pDevice->SetRenderState(D3DRS_CULLMODE, D3DCULL_NONE);

	// ���e�X�g��L��
	pDevice->SetRenderState(D3DRS_ALPHATESTENABLE, TRUE);

	// ���e�X�g�̐ݒ�
	pDevice->SetRenderState(D3DRS_ALPHAREF, 100);
	pDevice->SetRenderState(D3DRS_ALPHAFUNC, D3DCMP_GREATER);

	// ���C�g�𖳌�
	pDevice->SetRenderState(D3DRS_LIGHTING, FALSE);

	//�|���S���̕`��
	pDevice->DrawPrimitive(D3DPT_TRIANGLESTRIP,	//�|���S���̌`
		0,										//���_�̊J�n�ꏊ
		4);

	// ���C�g��L��	
	pDevice->SetRenderState(D3DRS_LIGHTING, TRUE);

	// ���e�X�g�𖳌�
	pDevice->SetRenderState(D3DRS_ALPHATESTENABLE, FALSE);

	//�J�����O�̐ݒ�����ɖ߂�
	pDevice->SetRenderState(D3DRS_CULLMODE, D3DCULL_CCW);

	//�e�N�X�`���̐ݒ�
	pDevice->SetTexture(0, NULL);

}

//=============================================================================
// �ʒu�̐ݒ�
//=============================================================================
void CObject3D::SetPos(const D3DXVECTOR3& pos)
{
	m_Pos = pos;
}

//=============================================================================
// �T�C�Y�̐ݒ�
//=============================================================================
void CObject3D::SetSiz(const D3DXVECTOR3& siz)
{
	m_Siz = siz;
}

//=============================================================================
// �F�̐ݒ�
//=============================================================================
void CObject3D::SetCol(const D3DXCOLOR& col)
{
	m_Col = col;

	//�f�o�C�X�̎擾
	LPDIRECT3DDEVICE9 pDevice = CApplication::getInstance()->GetRenderer()->GetDevice();;

	VERTEX_3D* pVtx;

	//���_�o�b�t�@�����b�N���A���_�f�[�^�ւ̃|�C���^���擾
	m_pVtxBuff->Lock(0, 0, (void**)&pVtx, 0);

	//���_�J���[�ݒ�
	for (int i = 0; i < 4; i++)
	{
		pVtx[i].col = m_Col;
	}

	//���_�o�b�t�@���A�����b�N
	m_pVtxBuff->Unlock();
}

//=============================================================================
// ����
//=============================================================================
CObject3D * CObject3D::Create(D3DXVECTOR3 pos, D3DXVECTOR3 siz, int Priority)
{
	CObject3D*pObject3D;
	pObject3D = new CObject3D(Priority);
	pObject3D->Init();
	pObject3D->SetPos(pos);
	pObject3D->SetSiz(siz);

	return pObject3D;
}
