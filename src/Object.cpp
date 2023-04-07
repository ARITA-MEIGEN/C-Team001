//=============================================================================
//
// �I�u�W�F�N�g
// Author : �L�c����
//
//=============================================================================

//�C���N���[�h
#include "Object.h"
#include "ObjectList.h"
#include "Application.h"
#include "renderer.h"
#include "InputKeyBoard.h"

//�ÓI�����o�ϐ��錾
 int CObject::m_nNumAll=0;

//=============================================================================
// �R���X�g���N�^
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
// �f�X�g���N�^
//=============================================================================
CObject::~CObject()
{
	m_nNumAll--;
}
