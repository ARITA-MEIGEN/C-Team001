//=============================================================================
// Content     (�Q�[���̐ݒ�)(player.cpp)
// Author     : �L�c����
//=============================================================================

//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include "ObjectX.h"
#include "Application.h"
#include "renderer.h"
#include "Camera.h"
#include "Shadow.h"
#include "Light.h"
#include "Game.h"

//�}�N����`
#define MIN_SPEED		(0.1f)	//���C�ɂ��Œᑬ�x

//-----------------------------------------------------------------------------
// �R���X�g���N�^
//-----------------------------------------------------------------------------
CObjectX::CObjectX(int nPriority) :CObject(nPriority)
{
	m_mtxParent = nullptr;
	//m_modelData = nullptr;
}

//-----------------------------------------------------------------------------
// �f�X�g���N�^
//-----------------------------------------------------------------------------
CObjectX::~CObjectX()
{

}

//-----------------------------------------------------------------------------
// ����������
//-----------------------------------------------------------------------------
HRESULT CObjectX::Init()
{
	//���̏�����
	m_pos = D3DXVECTOR3(0.0f, 0.0f, 0.0f);		// ���W
	m_rot = D3DXVECTOR3(0.0f, 0.0f, 0.0f);		// ����
	m_sizeMag = D3DXVECTOR3(1.0f, 1.0f, 1.0f);		// ����
	m_col = D3DXCOLOR(0.0f, 0.0f, 0.0f, 1.0f);	// �F
	//�e�̐���
//	m_Shadow = CShadow::Create(m_pos, D3DXVECTOR3(50.0f,0.0f,50.0f));

	return S_OK;
}

//-----------------------------------------------------------------------------
// �I������
//-----------------------------------------------------------------------------
void CObjectX::Uninit(void)
{
	CObject::Release();
}

//-----------------------------------------------------------------------------
// �X�V����
//-----------------------------------------------------------------------------
void CObjectX::Update(void)
{
	m_posold = m_pos;		//�O��̈ʒu�̕ۑ�
	m_pos += m_move;		//�ʒu�̍X�V

//	m_Shadow->SetPos(m_pos);

	//�ړ��ʍX�V(����������)
	m_move.x += (0.0f - m_move.x) * MIN_SPEED;
	m_move.z += (0.0f - m_move.z) * MIN_SPEED;
}

//-----------------------------------------------------------------------------
// �`�揈��
//-----------------------------------------------------------------------------
void CObjectX::Draw(void)
{
	LPDIRECT3DDEVICE9 pDevice;	//�f�o�C�X�ւ̃|�C���^
	pDevice = CApplication::getInstance()->GetRenderer()->GetDevice();

	D3DXMATRIX mtxRot, mtxTrans;	// �v�Z�p�}�g���b�N�X
	D3DMATERIAL9 matDef;			// ���݂̃}�e���A���ۑ��p
	D3DXMATERIAL *pMat;				// �}�e���A���̏��

	//���݂̃}�e���A�����ێ�
	pDevice->GetMaterial(&matDef);

	//�p�[�c�̃��[���h�}�g���b�N�X�̏�����
	D3DXMatrixIdentity(&m_mtxWorld);

	// �傫���𔽉f
	D3DXMatrixScaling(&mtxTrans, m_sizeMag.x, m_sizeMag.y, m_sizeMag.z);
	D3DXMatrixMultiply(&m_mtxWorld, &m_mtxWorld, &mtxTrans);

	//�p�[�c�̃��f���̌����𔽉f
	D3DXMatrixRotationYawPitchRoll(&mtxRot, m_rot.y, m_rot.x, m_rot.z);
	D3DXMatrixMultiply(&m_mtxWorld, &m_mtxWorld, &mtxRot);

	//�p�[�c�̃��f���̈ʒu�𔽉f
	D3DXMatrixTranslation(&mtxTrans, m_pos.x, m_pos.y, m_pos.z);
	D3DXMatrixMultiply(&m_mtxWorld, &m_mtxWorld, &mtxTrans);

	D3DXMATRIX mtxParrent;
	D3DXMatrixIdentity(&mtxParrent);

	//�e�̃}�g���b�N�X�Ɗ|�����킹��
	if (m_pParent != nullptr)
	{
		mtxParrent = m_pParent->GetMatrix();
	}
	else if(m_mtxParent != nullptr)
	{
		mtxParrent = *m_mtxParent;
	}
	else
	{
	}

	//�e�̍��W�Ƃ������킹��
	D3DXMatrixMultiply(&m_mtxWorld, &m_mtxWorld, &mtxParrent);

	//�e�̐���
	//Shadow()

	//���[���h�}�g���b�N�X�̐ݒ�
	pDevice->SetTransform(D3DTS_WORLD, &m_mtxWorld);

	//�}�e���A���f�[�^�ւ̃|�C���^���擾
	pMat = (D3DXMATERIAL*)m_modelData.pBuffMat->GetBufferPointer();

	//�}�e���A���̕`��
	for (int nCnt2 = 0; nCnt2 < (int)m_modelData.numMat; nCnt2++)
	{
		D3DXCOLOR emisive = pMat[nCnt2].MatD3D.Emissive;
		D3DXCOLOR diffuse = pMat[nCnt2].MatD3D.Diffuse;

		pMat[nCnt2].MatD3D.Emissive = m_materialColor[nCnt2];
		pMat[nCnt2].MatD3D.Diffuse.a = m_materialColor[nCnt2].a;

		//�}�e���A���̐ݒ�
		pDevice->SetMaterial(&pMat[nCnt2].MatD3D);

		//�v���C���[�p�[�c�̕`��
		m_modelData.pMesh->DrawSubset(nCnt2);

		pMat[nCnt2].MatD3D.Emissive = emisive;
		pMat[nCnt2].MatD3D.Diffuse = diffuse;
	}
	//�ێ����Ă����}�e���A����߂�
	pDevice->SetMaterial(&matDef);
}

//-----------------------------------------------------------------------------
// ����
//-----------------------------------------------------------------------------
CObjectX * CObjectX::Create()
{
	CObjectX*pObjectX;
	pObjectX = new CObjectX();
	pObjectX->Init();

	return pObjectX;
}

//-----------------------------------------------------------------------------
// ���f���ǂݍ���
//-----------------------------------------------------------------------------
void CObjectX::BindModel(LPD3DXMESH pMesh, LPD3DXBUFFER pBuff, DWORD pNumMat)
{
	m_modelData.pBuffMat = pBuff;
	m_modelData.pMesh = pMesh;
	m_modelData.numMat = pNumMat;
}

//-----------------------------------------------------------------------------
// ���f���̊��蓖��
//-----------------------------------------------------------------------------
void CObjectX::BindModel(CObjectXOriginalList::SModelData model)
{
	m_modelData = model;
	m_materialColor.clear();
	m_materialColor.resize(m_modelData.numMat);

	D3DXMATERIAL* pMat = (D3DXMATERIAL*)m_modelData.pBuffMat->GetBufferPointer();

	for (size_t i = 0; i < m_modelData.numMat; i++)
	{
		D3DXCOLOR col;
		col.r = pMat[i].MatD3D.Emissive.r;
		col.g = pMat[i].MatD3D.Emissive.g;
		col.b = pMat[i].MatD3D.Emissive.b;
		col.a = pMat[i].MatD3D.Diffuse.a;
		SetColorMaterial(i, col);
	}
}

//-----------------------------------------------------------------------------
// �e�̍쐬
//-----------------------------------------------------------------------------
void CObjectX::Shadow()
{
	D3DXMATERIAL *pMat;			//�}�e���A���̂Ȃ�
	LPDIRECT3DDEVICE9 pDevice;	//�f�o�C�X�ւ̃|�C���^
	pDevice = CApplication::getInstance()->GetRenderer()->GetDevice();

	D3DXCOLOR col[2];			//�F�Ɣ����̐ݒ�

	//�e��`�悷�鏈��
	D3DXPLANE planeField;
	D3DXVECTOR4 vecLight;
	D3DXVECTOR3 pos, normal;
	//�V���h�E�}�g���b�N�X�̏�����
	D3DXMatrixIdentity(&m_mtxShadow);

	//���C�g�̋t�����Ō�̐��l�̓f�B���N�V���i�����C�g�ȊO�̏ꍇ�������炵���H
	D3DXVECTOR3 lightvec = CGame::GetLight()->GetVec(2);		//���C�g�̎擾
	vecLight = D3DXVECTOR4(-lightvec.x, -lightvec.y, -lightvec.z, 0.0f);

	pos = D3DXVECTOR3(0.0f, 1.0f, 0.0f);
	normal = D3DXVECTOR3(0.0f, 1.0f, 0.0f);
	D3DXPlaneFromPointNormal(&planeField, &pos, &normal);
	D3DXMatrixShadow(&m_mtxShadow, &vecLight, &planeField);

	//���f���̃}�g���b�N�X�Ƃ̊|���Z
	D3DXMatrixMultiply(&m_mtxShadow, &m_mtxShadow, &m_mtxWorld);

	//�e�̕`��
	//�}�e���A���f�[�^�ւ̃|�C���^���擾
	pMat = (D3DXMATERIAL*)m_modelData.pBuffMat->GetBufferPointer();

	pDevice->SetTransform(D3DTS_WORLD, &m_mtxShadow);

	for (int i = 0; i < (int)m_modelData.numMat; i++)
	{
		col[0] = pMat[i].MatD3D.Diffuse;
		col[1] = pMat[i].MatD3D.Emissive;

		pMat[i].MatD3D.Diffuse = D3DXCOLOR(0.0f, 0.0f, 0.0f, 1.0f);
		pMat[i].MatD3D.Emissive = D3DXCOLOR(0.0f, 0.0f, 0.0f, 1.0f);
		//�}�e���A���̐ݒ�
		pDevice->SetMaterial(&pMat[i].MatD3D);

		//�v���C���[�p�[�c�̕`��
		m_modelData.pMesh->DrawSubset(i);

		pMat[i].MatD3D.Diffuse = col[0];
		pMat[i].MatD3D.Emissive = col[1];
	}
}

//-----------------------------------------------------------------------------
// �e���f���̓o�^���A�e�Ɏ��g���q���Ƃ��ĕۑ�
//-----------------------------------------------------------------------------
void CObjectX::SetParent(CObjectX * pModel)
{
	m_pParent = pModel;
	m_pParent->SetChildren(this);
}
