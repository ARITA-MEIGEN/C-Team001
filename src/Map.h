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
#include "Block.h"
#include "Game.h"
#include <vector>

//-----------------------------------------------------------------------------
// �}�N����`
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//  �O���錾
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// �v���g�^�C�v�錾
//-----------------------------------------------------------------------------
class CMap
{
public:
	static const float BLOCK_WIDTH;	// �u���b�N���m�̕�

	enum STAGE
	{
		STAGE_01=0,
		STAGE_02,
		STAGE_03,
		STAGE_04,
		STAGE_05,
		STAGE_MAX
	};

	explicit CMap();
	~CMap();
	HRESULT Init();
	void Uninit();
	void Update();
	static CMap *Create(int stgnumber);
	void Load();
	void Ranking();	//�����L���O
	void OpenMap();	// �I�����ɉ�ʊO�ɎU�J�����鏈��

	//�Q�b�^�[
	CBlock* GetBlock(const int number) { return (int)m_pBlock.size() > number ? m_pBlock[number] : nullptr; };
	CBlock* GetBlock(const int x, const int y);
	D3DXVECTOR2 GetBlockIdx(CBlock* block);
	CBlock* GetPlayerSpawnBlock(const int index) { return GetBlock((int)m_playerSpawnIdx[index].x, (int)m_playerSpawnIdx[index].y); }
	int GetBlockCount() { return (int)m_pBlock.size(); };
	int CMap::GetCountBlockType(int nType);
	static int GetRanking(int number) { return m_anRanking[number]; };

private:
	void PopItem();
	void PopFutureArea();
private:
	//�����o�֐�
	STAGE m_StageNumber;
	std::vector<CBlock*> m_pBlock;
	int m_nAllBlock[5];
	std::vector<D3DXVECTOR2> m_playerSpawnIdx;
	int m_axisSizeX;
	static int m_anRanking[MAX_PLAYER];	//	�����L���O����

	// Item�֘A
	int m_nItemPopCount;
	int m_itemPopRandMinTime;	// �A�C�e���ďo�����Ԃ̍Œ�l
	int m_itemPopRandMaxTime;	// �A�C�e���ďo�����Ԃ̍ő�l

	// Area�֘A
	int m_nAreaPopCount;
	int m_areaPopRandMinTime;	// �G���A�ďo�����Ԃ̍Œ�l
	int m_areaPopRandMaxTime;	// �G���A�ďo�����Ԃ̍ő�l

};

#endif