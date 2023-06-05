//=============================================================================
//
// �I�u�W�F�N�gX��ǂݍ���ŕۑ����鏈�� [objectX_group.h]
// Author : Yuda Kaito
//
//=============================================================================
#ifndef _OBJECTX_ORIGINAL_LIST_H_
#define _OBJECTX_ORIGINAL_LIST_H_

//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include "main.h"
#include <string>
#include <vector>
#include <map>

//-----------------------------------------------------------------------------
//  ObjectX �̌��{��ۑ�����N���X
//
//  ObjectX �� std::string �ł̃^�O�ɂ���ĊǗ�����Ă���B
// �g�p�҂̓^�O��m��Ȃ��ƃf�[�^�ɃA�N�Z�X���邱�Ƃ��o���Ȃ��B
// �S�Ă̎g�p�҂͎g�p����Ă���^�O��m�邱�Ƃ��ł��邪���ꂪ�ǂ̃��f���Ɏg�p����Ă��邩������Ȃ��B
//-----------------------------------------------------------------------------
class CObjectXOriginalList
{
private: /* �v���C�x�[�g�萔 */
	static const wchar_t* filePath;

public:

	// ���f���f�[�^
	struct SModelData
	{
		LPD3DXMESH pMesh;		// ���b�V���ւ̃|�C���^
		LPD3DXBUFFER pBuffMat;	// �}�e���A�����ւ̃|�C���^
		DWORD numMat;			// �}�e���A�����̐�
		D3DXVECTOR3 minVtx;		// ���f���̍��W�̍ŏ��l
		D3DXVECTOR3 maxVtx;		// ���f���̍��W�̍ő�l
		D3DXVECTOR3 size;		// ������
	};

private:
	CObjectXOriginalList();
	static CObjectXOriginalList* m_originalList;
public:
	static CObjectXOriginalList* GetInstance();
	~CObjectXOriginalList();

	static void Uninit();

	//-------------------------------------------------------------------------
	// �����o�[�֐�
	//-------------------------------------------------------------------------
	void LoadAll();		// �S�Ă̓ǂݍ���
	void UnloadAll();	// �S�Ă̔j��
	SModelData Load(std::string inKey, std::string inFileName);	// �w��̓ǂݍ���
	SModelData Load(std::vector<std::string> inModel) { return Load(inModel[0], inModel[1]); }		// �w��̓ǂݍ���
	void Unload(std::string inKey);				// �w��̔j��

	// Getter
	SModelData GetModelData(std::string inKey) { return m_model[inKey]; }	// ���b�V���̎擾
	LPD3DXMESH GetMesh(std::string inKey);		// ���b�V���̎擾
	LPD3DXBUFFER GetBuffMat(std::string inKey);	// �o�b�t�@�[�̎擾
	DWORD GetNumMat(std::string inKey);			// �}�e���A�����̎擾
	D3DXVECTOR3 GetMinVtx(std::string inKey);	// �ŏ����_�̎擾
	D3DXVECTOR3 GetMaxVtx(std::string inKey);	// �ő咸�_�̎擾
	D3DXVECTOR3 GetSize(std::string inKey);		// �傫���̎擾
	std::string GetTag(int index);
	std::vector<std::string> GetTagList() { return m_tagList; };

private: /* �v���C�x�[�g�֐� */
	bool ExistsKey(std::string inKey) { return m_model.count(inKey) != 0; }	// Map���Ɏw�肳�ꂽKey�����݂��邩�ۂ�

private:
	std::map<std::string, SModelData, std::less<>> m_model;	// ���f���̏��
	std::map<std::string, std::string, std::less<>> m_fileName;	// �t�@�C�����̏��
	std::vector<std::string> m_tagList;	// �^�O���X�g
};
#endif