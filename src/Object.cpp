//=============================================================================
//
// オブジェクト
// Author : 有田明玄
//
//=============================================================================

//インクルード
#include "Object.h"
#include "ObjectList.h"
#include "Application.h"
#include "renderer.h"
#include "InputKeyBoard.h"

//静的メンバ変数宣言
 int CObject::m_nNumAll=0;

//=============================================================================
// コンストラクタ
//=============================================================================
 CObject::CObject(int nPriority /*=3*/)
 {
	 m_nPriority = nPriority;

	 CObjectList* taskGroup = CObjectList::GetInstance();

	 taskGroup->SetPushCurrent(this, m_nPriority);

	 m_bDead = false;
	 m_nNumAll++;
 }

//=============================================================================
// デストラクタ
//=============================================================================
CObject::~CObject()
{
	m_nNumAll--;
}
