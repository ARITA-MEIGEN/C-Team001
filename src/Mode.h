//=============================================================================
//
// モード
// Author : Yuda Kaito
//
//=============================================================================
#ifndef _MODE_H_
#define _MODE_H_

//-----------------------------------------------------------------------------
// モード
//-----------------------------------------------------------------------------
class CMode
{
public:
	explicit CMode();
	virtual ~CMode() {};

	virtual HRESULT Init() = 0;
	virtual void Uninit() {};
	virtual void Update() {};
	virtual void Draw() {};
private:
};

#endif