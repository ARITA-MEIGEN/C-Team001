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
	static CMap *Create(int stgnumber);
	void Load();

	//�Q�b�^�[
	CBlock* GetBlock(const int number) { return (int)m_pBlock.size() > number ? m_pBlock[number] : nullptr; };
	CBlock* GetBlock(const int x, const int y);
	CBlock* GetPlayerSpawnBlock(const int index) { return GetBlock((int)m_playerSpawnIdx[index].x, (int)m_playerSpawnIdx[index].y); }
	int GetBlockCount() { return (int)m_pBlock.size(); };

private:
	//�����o�֐�
	STAGE m_StageNumber;
	std::vector<CBlock*> m_pBlock;
	std::vector<D3DXVECTOR2> m_playerSpawnIdx;
	int m_axisSizeX;
};

#endif