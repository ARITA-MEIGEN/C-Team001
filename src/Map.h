//=============================================================================
//
// �}�b�v����
// Author:arita meigen
//
//=============================================================================
#ifndef _MAP_H_				// ���̃}�N����`������ĂȂ�������
#define _MAP_H_				// ��d�C���N���[�h�h�~�̃}�N����`

//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include"Block.h"
#include <vector>

//-----------------------------------------------------------------------------
// �v���g�^�C�v�錾
//-----------------------------------------------------------------------------
#define MAX_BLOCK	(16)	//�u���b�N�̍ő吔
#define BLOCK_X		(4)		//�u���b�N�̐�X
#define BLOCK_Y		(4)		//�u���b�N�̐�Y

//-----------------------------------------------------------------------------
// �v���g�^�C�v�錾
//-----------------------------------------------------------------------------
class CMap
{
private:
	static const float BLOCK_WIDTH;	// �u���b�N���m�̕�
public:
	enum STAGE
	{
		STAGE_01=0,
		STAGE_MAX
	};

	explicit CMap();
	~CMap();
	HRESULT Init();
	void Uninit();
	void Update();
	static CMap *Create(int stgnumber);
	void Load();

	//�Q�b�^�[
	CBlock* GetBlock(const int number) { return (int)m_pBlock.size() > number ? m_pBlock[number] : nullptr; };
	CBlock* GetBlock(const int x, const int y);
	D3DXVECTOR2 GetBlockIdx(CBlock* block);
	CBlock* GetPlayerSpawnBlock(const int index) { return GetBlock((int)m_playerSpawnIdx[index].x, (int)m_playerSpawnIdx[index].y); }
	int GetBlockCount() { return (int)m_pBlock.size(); };
	int CMap::GetCountBlockType(int nType);


private:
	//�����o�֐�
	STAGE m_StageNumber;
	std::vector<CBlock*> m_pBlock;
	int m_nAllBlock[5];
	std::vector<D3DXVECTOR2> m_playerSpawnIdx;
	int m_axisSizeX;

	// Item�֘A
	int m_nPopCnt;
};

#endif