//=============================================================================
//
// �I�u�W�F�N�gX��ǂݍ���ŕۑ����鏈�� [objectX_group.cpp]
// Author : Yuda Kaito
//
//=============================================================================
//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include "application.h"
#include "renderer.h"
#include "ObjectXOriginalList.h"
#include "file.h"

#include <assert.h>

//-----------------------------------------------------------------------------
// �萔
//-----------------------------------------------------------------------------
const wchar_t* CObjectXOriginalList::filePath = L"Data/FILE/model.json";

//-----------------------------------------------------------------------------
// �ÓI�ϐ�
//-----------------------------------------------------------------------------
CObjectXOriginalList* CObjectXOriginalList::m_originalList = nullptr;

//=============================================================================
// �f�t�H���g�R���X�g���N�^
//=============================================================================
CObjectXOriginalList::CObjectXOriginalList()
{
}

//=============================================================================
// �C���X�^���X�̎擾
//=============================================================================
CObjectXOriginalList * CObjectXOriginalList::GetInstance()
{
	if (m_originalList == nullptr)
	{
		m_originalList = new CObjectXOriginalList;
	}
	return m_originalList;
}

//=============================================================================
// �f�X�g���N�^
//=============================================================================
CObjectXOriginalList::~CObjectXOriginalList()
{
}

//=============================================================================
// �I������
//=============================================================================
void CObjectXOriginalList::Uninit()
{
	if (m_originalList != nullptr)
	{
		delete m_originalList;
		m_originalList = nullptr;
	}
}

//=============================================================================
// �S�Ă̓ǂݍ���
//=============================================================================
void CObjectXOriginalList::LoadAll()
{
	nlohmann::json list = LoadJson(filePath);

	int size = (int)list["MODEL"].size();

	std::string test = list["MODEL"][0][0];
	for (int i = 0; i < size; ++i)
	{
		Load(list["MODEL"].at(i));
	}
}

//=============================================================================
// �ǂݍ���
//=============================================================================
CObjectXOriginalList::SModelData CObjectXOriginalList::Load(std::string inKey, std::string inFileName)
{
	SModelData model = {};
	std::string fileName = inFileName;

	if (m_fileName[inKey] == inFileName)
	{
		return m_model[inKey];
	}

	// ���f�����̏�����
	model.pBuffMat = nullptr;
	model.numMat = 0;
	model.pMesh = nullptr;

	//�f�o�C�X�̎擾
	LPDIRECT3DDEVICE9 pDevice = CApplication::getInstance()->GetRenderer()->GetDevice();

	//X�t�@�C���̓ǂݍ���
	D3DXLoadMeshFromX(&fileName.front(),
		D3DXMESH_SYSTEMMEM,
		pDevice,
		NULL,
		&model.pBuffMat,
		NULL,
		&model.numMat,
		&model.pMesh);

	int nNumVtx;	// ���_���ۑ��p�ϐ�
	DWORD sizeFVF;	// ���_�t�H�[�}�b�g�̃T�C�Y
	BYTE *pVtxBuff;	// ���_�o�b�t�@�ւ̃|�C���^

	//���_���̎擾
	nNumVtx = model.pMesh->GetNumVertices();

	//���_�t�H�[�}�b�g�̃T�C�Y���擾
	sizeFVF = D3DXGetFVFVertexSize(model.pMesh->GetFVF());

	//���_�o�b�t�@�̃��b�N
	model.pMesh->LockVertexBuffer(D3DLOCK_READONLY, (void**)&pVtxBuff);

	// ���f���̒[���i�[����ϐ��̃��Z�b�g
	model.minVtx = D3DXVECTOR3(FLT_MAX, FLT_MAX, FLT_MAX);
	model.maxVtx = D3DXVECTOR3(-FLT_MAX, -FLT_MAX, -FLT_MAX);

	for (int nCntVtx = 0; nCntVtx < nNumVtx; nCntVtx++)
	{
		//���_���W�̑��
		D3DXVECTOR3 vtx = *(D3DXVECTOR3*)pVtxBuff;

		//X
		if (vtx.x < model.minVtx.x)
		{//�ŏ��l
			model.minVtx.x = vtx.x;
		}
		if (vtx.x > model.maxVtx.x)
		{//�ő�l
			model.maxVtx.x = vtx.x;
		}

		//Y
		if (vtx.y < model.minVtx.y)
		{//�ŏ��l
			model.minVtx.y = vtx.y;
		}
		if (vtx.y > model.maxVtx.y)
		{//�ő�l
			model.maxVtx.y = vtx.y;
		}

		//Z
		if (vtx.z < model.minVtx.z)
		{//�ŏ��l
			model.minVtx.z = vtx.z;
		}
		if (vtx.z > model.maxVtx.z)
		{//�ő�l
			model.maxVtx.z = vtx.z;
		}

		//���_�t�H�[�}�b�g�̃T�C�Y���|�C���^�i�߂�
		pVtxBuff += sizeFVF;
	}

	// �T�C�Y�ݒ�
	model.size = model.maxVtx - model.minVtx;

	//���_�o�b�t�@�̃A�����b�N
	model.pMesh->UnlockVertexBuffer();

	if (!ExistsKey(inKey))
	{
		m_model[inKey] = model;
		m_fileName[inKey] = fileName;
		m_tagList.push_back(inKey);
	}
	else
	{
		m_model[inKey] = model;
	}

	return model;
}

//=============================================================================
// �S�Ẳ��
//=============================================================================
void CObjectXOriginalList::UnloadAll()
{
	m_model.clear();
}

//=============================================================================
// ���
//=============================================================================
void CObjectXOriginalList::Unload(std::string inKey)
{
	m_model.erase(inKey);
}

//=============================================================================
// ���b�V���̎擾
//=============================================================================
LPD3DXMESH CObjectXOriginalList::GetMesh(std::string inKey)
{
	// Key�����݂��邩�ۂ��B
	if (!ExistsKey(inKey))
	{
		// Key���Ȃ������ꍇ
		return nullptr;
	}

	/* ��Key���������ꍇ�� */

	return m_model[inKey].pMesh;
}

//=============================================================================
// �o�b�t�@�̎擾
//=============================================================================
LPD3DXBUFFER CObjectXOriginalList::GetBuffMat(std::string inKey)
{
	// Key�����݂��邩�ۂ��B
	if (!ExistsKey(inKey))
	{
		// Key���Ȃ������ꍇ
		return nullptr;
	}

	/* ��Key���������ꍇ�� */

	return m_model[inKey].pBuffMat;
}

//=============================================================================
// �}�e���A�����̎擾
//=============================================================================
DWORD CObjectXOriginalList::GetNumMat(std::string inKey)
{
	// Key�����݂��邩�ۂ��B
	if (!ExistsKey(inKey))
	{
		// Key���Ȃ������ꍇ
		return 0;
	}

	/* ��Key���������ꍇ�� */

	return m_model[inKey].numMat;
}

//=============================================================================
// �}�e���A�����̎擾
//=============================================================================
D3DXVECTOR3 CObjectXOriginalList::GetMinVtx(std::string inKey)
{
	// Key�����݂��邩�ۂ��B
	if (!ExistsKey(inKey))
	{
		// Key���Ȃ������ꍇ
		return D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	}

	/* ��Key���������ꍇ�� */

	return m_model[inKey].minVtx;
}

//=============================================================================
// ��Ԓl���傫�����_�o�b�t�@�̎擾
//=============================================================================
D3DXVECTOR3 CObjectXOriginalList::GetMaxVtx(std::string inKey)
{
	// Key�����݂��邩�ۂ��B
	if (!ExistsKey(inKey))
	{
		// Key���Ȃ������ꍇ
		return D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	}

	/* ��Key���������ꍇ�� */

	return m_model[inKey].maxVtx;
}

//=============================================================================
// ��Ԓl�����������_�o�b�t�@�̎擾
//=============================================================================
D3DXVECTOR3 CObjectXOriginalList::GetSize(std::string inKey)
{
	// Key�����݂��邩�ۂ��B
	if (!ExistsKey(inKey))
	{
		// Key���Ȃ������ꍇ
		return D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	}

	/* ��Key���������ꍇ�� */

	return m_model[inKey].size;
}

std::string CObjectXOriginalList::GetTag(int index)
{
	if (0 > index)
	{
		return m_tagList[0];
	}
	else if ((int)m_tagList.size() <= index)
	{
		return m_tagList[(int)m_tagList.size() - 1];
	}
	else
	{
		return m_tagList[index];
	}
}
