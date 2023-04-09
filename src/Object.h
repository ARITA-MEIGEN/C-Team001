//=============================================================================
//
// �I�u�W�F�N�g
// Author : �L�c����
//
//=============================================================================
#ifndef _OBJECT_H_
#define _OBJECT_H_

class CObject
{
public:
	//�\����
	enum EType
	{
		OBJTYPE_NONE = -1,
		OBJTYPE_MAP = 0,
		OBJTYPE_PLANET,
		OBJTYPE_GOAL,
		OBJTYPE_BLOCK,
		OBJTYPE_MODEL,
		OBJTYPE_GIMMICK,
		OBJTYPE_UI,
		OBJTYPE_FADE,
		OBJTYPE_MAX,
	};

	//�����o�֐�
	explicit CObject(int nPriority = 3);
	virtual ~CObject();
	virtual HRESULT Init() = 0;		// ������
	virtual void Uninit() = 0;		// �I��
	virtual void Update() = 0;		// �X�V
	virtual void Draw() = 0;		// �`��
	void SetType(EType Type);		// ��ނ̐ݒ�

	int GetPriority() { return m_nPriority; }
	
	/* �j���� */
	void Release() { m_bDead = true; }		// �j���\��
	bool IsRelease() { return m_bDead; }	// �j���\��Ȃ̂�

	/* ���X�g�\�� */
	void SetPrev(CObject* inTask) { m_pPrev = inTask; }
	CObject* GetPrev() { return m_pPrev; }
	void SetNext(CObject* inTask) { m_pNext = inTask; }
	CObject* GetNext() { return m_pNext; }

protected:
	int m_frame;		// ��������Ă���̎���

private:
	//�����o�ϐ�
	int m_nPriority;	// �`��̗D�揇��
	CObject* m_pPrev;	// �O�̃I�u�W�F�N�g
	CObject* m_pNext;	// ���̃I�u�W�F�N�g
	bool m_bDead;		// ���S�t���O
	EType m_type;		// �^�C�v
};
#endif // !_OBJECT_H_
