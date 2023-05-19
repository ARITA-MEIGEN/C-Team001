//=============================================================================
//
// �}�b�v����
// Author:arita meigen
//
//=============================================================================

//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include "Map.h"
#include "file.h"
#include "utility.h"
#include "Item_Speed.h"

//-----------------------------------------------------------------------------
// �ÓI�����o�[�ϐ��̐錾
//-----------------------------------------------------------------------------
const float CMap::BLOCK_WIDTH = 25.0f;	// �u���b�N���m�̕�

//=============================================================================
// �R���X�g���N�^
//=============================================================================
CMap::CMap()
{
	m_nPopCnt = 0;
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

	m_nPopCnt = IntRandom(2 * 60, 1 * 60);
	return S_OK;
}

//=============================================================================
// ����
//=============================================================================
void CMap::Uninit()
{
	for (int i = 0; i < MAX_BLOCK; i++)
	{
		m_pBlock[i] = CBlock::Create(D3DXVECTOR3(0.0f, 0.0f, 0.0f), 0.0f);
	}
}

//=============================================================================
// �X�V
//=============================================================================
void CMap::Update()
{
	{
		m_nPopCnt--;
		if (m_nPopCnt <= 0)
		{
			CBlock* popPlanBlock = m_pBlock[IntRandom(m_pBlock.size() - 1, 0)];

			if (popPlanBlock->GetOnItem() != nullptr)
			{
				return;
			}
			if (popPlanBlock->IsStop())
			{
				return;
			}

			D3DXVECTOR3 pos = popPlanBlock->GetPos();
			pos.y += 25.0f;

			//�A�C�e���̐���
			popPlanBlock->SetOnItem(CSpeed::Create(pos, D3DXVECTOR3(25.0f, 0.0f, 25.0f), D3DXVECTOR3(-D3DX_PI * 0.5f, 0.0f, 0.0f), 60));
			popPlanBlock->SetCol(D3DXCOLOR(1.0f,0.0f,1.0f,1.0f));

			m_nPopCnt = IntRandom(2 * 10, 1 * 10);
		}
	}
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
	json map = LoadJson("data/FILE/map01.json");

	m_pBlock.resize(map["MAP"].size() * map["MAP"][0].size());
	m_axisSizeX = map["MAP"][0].size();

	m_playerSpawnIdx.resize(4);

	for (int i = 0; i < (int)map["MAP"].size(); i++)
	{
		for (int j = 0; j < (int)map["MAP"][i].size(); j++)
		{
			float z = i * -BLOCK_WIDTH + map["MAP"].size() * 0.5f * BLOCK_WIDTH;
			float x = j * BLOCK_WIDTH - map["MAP"][i].size() * 0.5f * BLOCK_WIDTH;

			m_pBlock[i * map["MAP"][i].size() + j] = CBlock::Create(D3DXVECTOR3(x, 0.0f, z), 0.0f);
			switch ((int)map["MAP"][i][j])
			{
			case -1:
				m_pBlock[i * map["MAP"][i].size() + j]->SetModel("");
				m_pBlock[i * map["MAP"][i].size() + j]->SetStop(true);
				break;
			case 0:
				break;
			case 1:
			case 2:
			case 3:
			case 4:
			{
				D3DXVECTOR2 idx;
				idx.x = j;
				idx.y = i;
				m_playerSpawnIdx[(int)map["MAP"][i][j]-1] = idx;
			}
				break;
			default:
				break;
			}
		}
	}
}

//=============================================================================
// �ǂݍ���
//=============================================================================
int CMap::GetCountBlockType(int nType)
{
	for (int i = 0; i < 4; i++)
	{//���Z�b�g
		m_nAllBlock[i] = 0;
	}
	for (int i = 0; i < MAX_BLOCK; i++)
	{//�^�C�v����

		if (m_pBlock[i]->GetNumber() < 0)
		{
			continue;
		}

		m_nAllBlock[m_pBlock[i]->GetNumber()]++;
	}
	return m_nAllBlock[nType];
}

//=============================================================================
// �u���b�N�̎擾
//=============================================================================
CBlock * CMap::GetBlock(const int x, const int y)
{
	int idx = (m_axisSizeX * y) + x;
	return m_pBlock[idx];
}

//=============================================================================
// �u���b�N�̔ԍ��擾
//=============================================================================
D3DXVECTOR2 CMap::GetBlockIdx(CBlock * block)
{
	for (int i = 0; i < (int)m_pBlock.size(); i++)
	{
		CBlock* pBlock = m_pBlock[i];

		if (pBlock == nullptr)
		{
			continue;
		}

		if (pBlock == block)
		{
			D3DXVECTOR2 idx;
			idx.y = i / m_axisSizeX;
			idx.x = i % m_axisSizeX;
			return idx;
		}
	}

	return D3DXVECTOR2(0.0f,0.0f);
}
