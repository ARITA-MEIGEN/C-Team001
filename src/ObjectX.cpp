//=============================================================================
// Content     (�Q�[���̐ݒ�)(player.cpp)
// Author     : �L�c����
//=============================================================================

//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include"ObjectX.h"
#include"renderer.h"
#include"Camera.h"
#include"InputKeyBoard.h"
#include"Shadow.h"
#include"Application.h"

//�}�N����`
#define PLAYER_SPEED	(2.0f)	//�ړ����x
#define MIN_SPEED		(0.1f)	//���C�ɂ��Œᑬ�x
#define NUM_MODELPARTS	(1)		//���f���̃p�[�c��

static int g_nIdxShadow;		//�e��ID

//-----------------------------------------------------------------------------
// �R���X�g���N�^
//-----------------------------------------------------------------------------
CObjectX::CObjectX(int nPriority) :CObject(nPriority)
{
	m_mtxParent = nullptr;
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
	m_pos = D3DXVECTOR3(0.0f, 0.0f, 0.0f);		//���W
	m_rot = D3DXVECTOR3(0.0f, 0.0f, 0.0f);		//����
	
	//�e�̐���
//	m_Shadow = CShadow::Create(m_pos, D3DXVECTOR3(50.0f,0.0f,50.0f));

	return S_OK;
}

//-----------------------------------------------------------------------------
// �I������
//-----------------------------------------------------------------------------
void CObjectX::Uninit(void)
{
	if (m_pMesh != NULL)
	{
		m_pMesh->Release();
		m_pMesh = NULL;
	}
	if (m_pBuffMat != NULL)
	{
		m_pBuffMat->Release();
		m_pBuffMat = NULL;
	}
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
	if (m_pMesh == nullptr)
	{
		return;
	}

	LPDIRECT3DDEVICE9 pDevice;	//�f�o�C�X�ւ̃|�C���^
	pDevice = CApplication::getInstance()->GetRenderer()->GetDevice();

	D3DXMATRIX mtxRot, mtxTrans;	// �v�Z�p�}�g���b�N�X
	D3DMATERIAL9 matDef;			// ���݂̃}�e���A���ۑ��p
	D3DXMATERIAL *pMat;				// �}�e���A���̏��

	//���݂̃}�e���A�����ێ�
	pDevice->GetMaterial(&matDef);

	//�p�[�c�̃��[���h�}�g���b�N�X�̏�����
	D3DXMatrixIdentity(&m_mtxWorld);

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
	pMat = (D3DXMATERIAL*)m_pBuffMat->GetBufferPointer();

	//�}�e���A���̕`��
	for (int nCnt2 = 0; nCnt2 < (int)m_nNumMat; nCnt2++)
	{
		pMat[nCnt2].MatD3D.Emissive = m_col;

		//�}�e���A���̐ݒ�
		pDevice->SetMaterial(&pMat[nCnt2].MatD3D);

		//�v���C���[�p�[�c�̕`��
		m_pMesh->DrawSubset(nCnt2);
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
	m_pBuffMat = pBuff;
	m_pMesh = pMesh;
	m_nNumMat = pNumMat;
}

//-----------------------------------------------------------------------------
// �e�̍쐬
//-----------------------------------------------------------------------------
void CObjectX::Shadow()
{
	D3DXMATERIAL *pMat;							//�}�e���A���̂Ȃ�
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
	//D3DXVECTOR3 lightvec = CGame::GetLight()->GetVec(2);		//���C�g�̎擾
	//vecLight = D3DXVECTOR4(-lightvec.x, -lightvec.y, -lightvec.z, 0.0f);

	pos = D3DXVECTOR3(0.0f, 1.0f, 0.0f);
	normal = D3DXVECTOR3(0.0f, 1.0f, 0.0f);
	D3DXPlaneFromPointNormal(&planeField, &pos, &normal);
	D3DXMatrixShadow(&m_mtxShadow, &vecLight, &planeField);

	//���f���̃}�g���b�N�X�Ƃ̊|���Z
	D3DXMatrixMultiply(&m_mtxShadow, &m_mtxShadow, &m_mtxWorld);

	//�e�̕`��
	//�}�e���A���̕`��
	pMat = (D3DXMATERIAL*)m_pBuffMat->GetBufferPointer();

	pDevice->SetTransform(D3DTS_WORLD, &m_mtxShadow);

	for (int i = 0; i < (int)m_nNumMat; i++)
	{
		col[0] = pMat[i].MatD3D.Diffuse;
		col[1] = pMat[i].MatD3D.Emissive;

		pMat[i].MatD3D.Diffuse = D3DXCOLOR(0.0f, 0.0f, 0.0f, 1.0f);
		pMat[i].MatD3D.Emissive = D3DXCOLOR(0.0f, 0.0f, 0.0f, 1.0f);
		//�}�e���A���̐ݒ�
		pDevice->SetMaterial(&pMat[i].MatD3D);

		//�v���C���[�p�[�c�̕`��
		m_pMesh->DrawSubset(i);

		pMat[i].MatD3D.Diffuse = col[0];
		pMat[i].MatD3D.Emissive = col[1];
	}
}

//-----------------------------------------------------------------------------
// �T�C�Y�̎Z�o
//-----------------------------------------------------------------------------
void CObjectX::SizeCalculate()
{
	BYTE*pVtxBuff;		//���_�o�b�t�@�ւ̃|�C���^
	int nNumVtx;		//���_��
	DWORD sizeFVF;		//���_�t�H�[�}�b�g�̃T�C�Y

	// ���_�o�b�t�@�̃��b�N
	m_pMesh->LockVertexBuffer(D3DLOCK_READONLY, (void**)&pVtxBuff);

	//���_���̎擾
	nNumVtx = m_pMesh->GetNumVertices();

	//���_�t�H�[�}�b�g�̃T�C�Y���擾
	sizeFVF = D3DXGetFVFVertexSize(m_pMesh->GetFVF());

	//���_���W�̑��
	//���ׂĂ̒��_��pos���擾����
	D3DXVECTOR3 vtxMax = D3DXVECTOR3(-FLT_MAX, -FLT_MAX, -FLT_MAX);	//�ő�l�̕ۑ��p
	D3DXVECTOR3 vtxMin = D3DXVECTOR3(FLT_MAX, FLT_MAX, FLT_MAX);	//�ŏ��l�̕ۑ��p
	for (int nCntVtx = 0; nCntVtx < nNumVtx; nCntVtx++)
	{
		D3DXVECTOR3 vtx = *(D3DXVECTOR3*)pVtxBuff;
		//���_���W���r���ă��f���̍ŏ��l�ő�l���擾
		if (vtx.x > vtxMax.x)
		{//X�̍ő�l���擾
			vtxMax.x = vtx.x;
		}
		if (vtx.x < vtxMin.x)
		{//X�̍ŏ��l���擾
			vtxMin.x = vtx.x;
		}
		if (vtx.y > vtxMax.y)
		{//Y�̍ő�l���擾
			vtxMax.y = vtx.y;
		}
		if (vtx.y < vtxMin.y)
		{//Y�̍ŏ��l���擾
			vtxMin.y = vtx.y;
		}
		if (vtx.z > vtxMax.z)
		{//Z�̍ő�l���擾
			vtxMax.z = vtx.z;
		}
		if (vtx.z < vtxMin.z)
		{//Z�̍ŏ��l���擾
			vtxMin.z = vtx.z;
		}

		//���_�t�H�[�}�b�g�̃T�C�Y���|�C���^��i�߂�
		pVtxBuff += sizeFVF;
	}
	//���_�o�b�t�@�̃A�����b�N
	m_pMesh->UnlockVertexBuffer();

	m_vtxMax = vtxMax;	// ���_���W�̍ő�l
	m_vtxMin = vtxMin;	// ���_���W�̍ŏ��l

	m_size = vtxMax - vtxMin;	//�p�[�c�̃T�C�Y
}

//-----------------------------------------------------------------------------
// ���f���̐ݒ�
//-----------------------------------------------------------------------------
void CObjectX::SetModel(const char * Filename)
{
	// ������
	m_pBuffMat = nullptr;
	m_nNumMat = 0;
	m_pMesh = nullptr;

	LPDIRECT3DDEVICE9 pDevice;	//�f�o�C�X�ւ̃|�C���^
	pDevice = CApplication::getInstance()->GetRenderer()->GetDevice();

	D3DXLoadMeshFromX(Filename,
		D3DXMESH_SYSTEMMEM,
		pDevice,
		NULL,
		&m_pBuffMat,
		NULL,
		&m_nNumMat,
		&m_pMesh);
}

//-----------------------------------------------------------------------------
// �e���f���̓o�^���A�e�Ɏ��g���q���Ƃ��ĕۑ�
//-----------------------------------------------------------------------------
void CObjectX::SetParent(CObjectX * pModel)
{
	m_pParent = pModel;
	m_pParent->SetChildren(this);
}
