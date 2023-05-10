//=============================================================================
//
// �}�b�v����
// Author:arita meigen
//
//=============================================================================

//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include"Map.h"
#include"file.h"

//-----------------------------------------------------------------------------
// �ÓI�����o�[�ϐ��̐錾
//-----------------------------------------------------------------------------
const float CMap::BLOCK_WIDTH = 25.0f;	// �u���b�N���m�̕�

//=============================================================================
// �R���X�g���N�^
//=============================================================================
CMap::CMap()
{
}

//=============================================================================
// �f�X�g���N�^
//=============================================================================
CMap::~CMap()
{
}

//=============================================================================
// ������
//=============================================================================
HRESULT CMap::Init()
{
	Load();
	return S_OK;
}

//=============================================================================
// ����
//=============================================================================
CMap * CMap::Create(int stgnumber)
{
	CMap*pMap = new CMap();

	if (pMap!=nullptr)
	{
	pMap->m_StageNumber = (STAGE)stgnumber;
	pMap->Init();
	}
	return pMap;
}

//=============================================================================
// �ǂݍ���
//=============================================================================
void CMap::Load()
{
	using json = nlohmann::json;
	json map = LoadJson("data/FILE/map.json");

	int playerCount = map["PLAYER_SPAWN"].size();

	for (int i = 0; i < playerCount; i++)
	{
		D3DXVECTOR2 idx;
		idx.x = map["PLAYER_SPAWN"][i][0];
		idx.y = map["PLAYER_SPAWN"][i][1];

		m_playerSpawnIdx.push_back(idx);
	}

	m_pBlock.resize(map["MAP"].size() * map["MAP"][0].size());
	m_axisSizeX = map["MAP"][0].size();

	for (int i = 0; i < (int)map["MAP"].size(); i++)
	{
		for (int j = 0; j < (int)map["MAP"][i].size(); j++)
		{
			float z = i * -BLOCK_WIDTH + map["MAP"].size() * 0.5f * BLOCK_WIDTH;
			float x = j * BLOCK_WIDTH - map["MAP"][i].size() * 0.5f * BLOCK_WIDTH;

			switch ((int)map["MAP"][i][j])
			{
			case 0:
				m_pBlock[i * map["MAP"][i].size() + j] = CBlock::Create(D3DXVECTOR3(x, 0.0f, z), 0.0f);
				break;
			case 1:
				m_pBlock[i * map["MAP"][i].size() + j] = CBlock::Create(D3DXVECTOR3(x, 0.0f, z), 0.0f);
				break;
			case -1:
				break;
			default:
				break;
			}
		}
	}
}

//=============================================================================
// �u���b�N�̎擾
//=============================================================================
CBlock * CMap::GetBlock(const int x, const int y)
{
	int idx = (m_axisSizeX * y) + x;
	return m_pBlock[idx];
}
