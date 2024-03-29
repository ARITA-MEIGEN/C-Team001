//=============================================================================
//
// skill_gauge.h
// Author:ûüì]
//
//=============================================================================
#ifndef _SKILL_GAUGE_H_
#define _SKILL_GAUGE_H_

#include "object2D.h"

//XLQ[WUINX
class CGauge : public CObject2D
{
public:
	//è`
	static const D3DXVECTOR2 GAUGE_SIZE;	//Q[WêÂªÌå«³
	static const float MAX_SIZE;			//Q[WÌÅål
	static const float SPACE_SIZE;			//Q[W¯mÌÔuÌå«³

	explicit CGauge(int nPriority = CObjectList::LEVEL_2D_UI);	//I[o[Ch³ê½RXgN^
	~CGauge() override;				//fXgN^

	//oÖ
	HRESULT Init() override;	//ú»
	void Uninit() override;		//I¹
	void Update() override;		//XV
	void Draw() override;		//`æ

	//ÃIoÖ
	static CGauge *Create(const D3DXVECTOR3 pos, const D3DXVECTOR2 size, const D3DXCOLOR col, const int number); //¶¬

private:
	//oÏ
	int m_nSkillNumber;			//XLQ[WÌÔ
};

#endif