#include "area.h"
#include "Map.h"
#include "Application.h"

CArea::CArea(int nPriority) : CObject(nPriority)
{
}

CArea::~CArea()
{
}

HRESULT CArea::Init()
{
	return S_OK;
}

void CArea::Uninit()
{
}

void CArea::Update()
{
	m_time--;

	if (m_time <= 0)
	{
		m_functionAtDied();
		Release();		// ”jŠü—\’è
		return;
	}
}

void CArea::Draw()
{
}

//=============================================================================
// ¶¬
//=============================================================================
CArea * CArea::Create(D3DXVECTOR2 index, const unsigned int inRange, const unsigned int inTime)
{
	CArea* area = new CArea;

	// ¶¬o—ˆ‚È‚¯‚ê‚Î
	assert(area != nullptr);

	area->Init();
	area->m_centerIndex = index;
	area->m_time = inTime;
	area->m_range = inRange;
	return area;
}
