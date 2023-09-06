//**************************************************************************************************
//
// ���[�V��������(motion.cpp)
// Auther�F�������l
// Author : Yuda Kaito
//
//**************************************************************************************************

//***************************************************************************
// �C���N���[�h
//***************************************************************************
#include <stdio.h>
#include <assert.h>
#include "application.h"
#include "motion.h"	
#include "objectX.h"
#include "texture.h"
#include "utility.h"
#include "renderer.h"

#include <fstream>
#include <iostream>
#include <string>

//***************************************************************************
// �萔��`
// Author : Yuda Kaito
//***************************************************************************
const unsigned int CMotion::MOTION_BLEND_FRAM = 5;	// ���[�V�����u�����h�̃t���[����	

//=============================================================================
// �R���X�g���N�^
// Author : �������l
// Author : Yuda Kaito
// �T�v : �C���X�^���X�������ɍs������
//=============================================================================
CMotion::CMotion(const char * pFileName)
{
	// �p�[�c���̏�����
	m_partsFile.clear();

	// ���[�V�����̏�����
	m_motion.clear();

	// �p�[�c�̏�����
	m_parts.clear();

	// �p�[�c���̏�����
	m_nMaxParts = 0;

	// �������[�V����
	m_nNumMotion = 0;

	// ���[�V�������s����
	m_bMotion = false;

	// ���[�V�����u�����h
	m_bMotionBlend = false;

	// ���[�V�����̓ǂݍ���
	LoodSetMotion(pFileName);
}

//=============================================================================
// �f�X�g���N�^
// Author : �������l
// �T�v : �C���X�^���X�I�����ɍs������
//=============================================================================
CMotion::~CMotion()
{
}

//=============================================================================
// ������
// Author : �������l
// �T�v : �p�[�c����X�t�@�C���ǂݍ���
//=============================================================================
void CMotion::Init()
{
	for (int nCntMotion = 0; nCntMotion < (int)m_motion.size(); nCntMotion++)
	{// �J�E���g�̃��Z�b�g
		CntReset(nCntMotion);
	}
	m_bMotion = true;
}

//=============================================================================
// �I��
// Author : �������l
// �T�v : �������̉��
//=============================================================================
void CMotion::Uninit(void)
{
	m_motion.clear();

	for (int i = 0; i < m_nMaxParts; i++)
	{
		if (m_parts[i] != nullptr)
		{
			m_parts[i] = nullptr;
		}
	}
}

//=============================================================================
// �X�V
// Author : �������l
// �T�v : ���[�V�����̍X�V
//=============================================================================
void CMotion::Update()
{
	if (m_bMotionBlend)
	{
		MotionBlend();
	}
	else if (m_bMotion && !m_bMotionBlend)
	{
		PlayMotion();
	}
}

//=============================================================================
// ���[�V�����̐ݒ�
// Author : �������l
// �T�v : ���[�V�����̏����ʒu�ɐݒ�
//=============================================================================
void CMotion::SetMotion(const unsigned int nCntMotionSet)
{
	CMotion::MyMotion& motion = m_motion[nCntMotionSet];

	for (int nCntParts = 0; nCntParts < m_nMaxParts; nCntParts++)
	{
		// �ϐ��錾
		D3DXVECTOR3 pos = D3DXVECTOR3(0.0f, 0.0f, 0.0f);		// �ʒu
		D3DXVECTOR3 rot = D3DXVECTOR3(0.0f, 0.0f, 0.0f);		// ����
		D3DXVECTOR3 posOrigin = m_parts[nCntParts]->GetPosDefault();	// ���̈ʒu
		D3DXVECTOR3 rotOrigin = m_parts[nCntParts]->GetRotDefault();	// ���̌���

		// �ʒu�̐ݒ�
		pos = (posOrigin + motion.pKeySet[motion.nCntKeySet].pKey[nCntParts].pos);

		//	�����̐ݒ�
		rot = (rotOrigin + motion.pKeySet[motion.nCntKeySet].pKey[nCntParts].rot);

		// �p�x�̐��K��
		rot.x = NormalizeAngle(rot.x);
		rot.y = NormalizeAngle(rot.y);
		rot.z = NormalizeAngle(rot.z);

		// ���̍X�V
		m_parts[nCntParts]->SetPos(pos);
		m_parts[nCntParts]->SetRot(rot);
	}
}

//=============================================================================
// �p�[�c�̐ݒ�
// Author : �������l
// �T�v : �s��𗘗p���āA�p�[�c�̐e�q�֌W�ƕ`��ݒ���s��
//=============================================================================
void CMotion::SetParts(D3DXMATRIX /*mtxWorld*/)
{
	for (int nCntParts = 0; nCntParts < m_nMaxParts; nCntParts++)
	{// ���f���̕`��
		if (m_parts[nCntParts]->GetParent() != nullptr)
		{
			m_parts[nCntParts]->Draw();
		}
		else
		{
//			m_parts[nCntParts]->Draw(mtxWorld);
		}
	}

	// �f�o�C�X�̎擾
	LPDIRECT3DDEVICE9 pDevice = CApplication::getInstance()->GetRenderer()->GetDevice();

	// �V�K�[�x�l��Z�o�b�t�@�̐[�x�l�������l�Ȃ�e�X�g�����ɂ���
	pDevice->SetRenderState(D3DRS_ZFUNC, D3DCMP_LESSEQUAL);
}

//=============================================================================
// ���f���̐؂�ւ�
// Author : Yuda Kaito
// �T�v : �g�p���Ă��郂�f���̐؂�ւ�
//=============================================================================
void CMotion::ChangeModel(int index, std::string path)
{
	assert(!(index < 0 || index >= m_parts.size()));

	m_parts[index]->BindModel(path);
}

//=============================================================================
// ���[�V�����̍Đ�
// Author : �������l
// �T�v : �ړI�̈ʒu�܂œ���̃t���[�����œ������鏈�����p�[�c���Ƃɍs��
//=============================================================================
void CMotion::PlayMotion()
{
	CMotion::MyMotion& motion = m_motion[m_nNumMotion];	// ���݃��[�V����

	MyKeySet& nowKeySet = motion.pKeySet[motion.nCntKeySet];

	for (int nCntParts = 0; nCntParts < (int)m_parts.size(); nCntParts++)
	{
		if (m_parts.size() <= nCntParts)
		{
			return;
		}

		if (nowKeySet.pKey.size() <= nCntParts)
		{
			return;
		}

		// �ϐ��錾
		D3DXVECTOR3 pos = m_parts[nCntParts]->GetPos();			// �ʒu
		D3DXVECTOR3 rot = m_parts[nCntParts]->GetRot();			// ����
		D3DXVECTOR3 posDest = m_parts[nCntParts]->GetPosDest();	// �ړI�̈ʒu
		D3DXVECTOR3 rotDest = m_parts[nCntParts]->GetRotDest();	// �ړI�̌���

		if (motion.nCntFrame == 0)
		{// �t���[���J�E���g��0�̎�
			// �ϐ��錾
			D3DXVECTOR3 posOrigin = m_parts[nCntParts]->GetPosDefault();		// ���̈ʒu
			D3DXVECTOR3 rotOrigin = m_parts[nCntParts]->GetRotDefault();		// ���̌���

			// �ړI�̈ʒu�ƌ����̎Z�o
			posDest = (posOrigin + nowKeySet.pKey[nCntParts].pos) - pos;
			rotDest = (rotOrigin + nowKeySet.pKey[nCntParts].rot) - rot;

			// �p�x�̐��K��
			rotDest.x = NormalizeAngle(rotDest.x);
			rotDest.y = NormalizeAngle(rotDest.y);
			rotDest.z = NormalizeAngle(rotDest.z);

			// ���̍X�V
			m_parts[nCntParts]->SetPosDest(posDest);
			m_parts[nCntParts]->SetRotDest(rotDest);
		}

		// �ϐ��錾
		D3DXVECTOR3 addPos = D3DXVECTOR3(posDest / (float)(nowKeySet.nFrame));
		D3DXVECTOR3 addRot = D3DXVECTOR3(rotDest / (float)(nowKeySet.nFrame));

		// �ʒu�̉��Z
		pos += addPos;

		//	�����̉��Z
		rot += addRot;

		// �p�x�̐��K��
		rot.x = NormalizeAngle(rot.x);
		rot.y = NormalizeAngle(rot.y);
		rot.z = NormalizeAngle(rot.z);

		// ���̍X�V
		m_parts[nCntParts]->SetPos(pos);
		m_parts[nCntParts]->SetRot(rot);
	}

	// �t���[���J�E���g�̉��Z
	motion.nCntFrame++;

	if (motion.nCntFrame >= nowKeySet.nFrame)
	{// �t���[���J�E���g���w��̃t���[�����𒴂����ꍇ
	 // �t���[�����̏�����
		motion.nCntFrame = 0;

		// �Đ����̃L�[�ԍ����̉��Z
		motion.nCntKeySet++;

		if (motion.nCntKeySet >= motion.nNumKey && motion.bLoop)
		{// �Đ����̃L�[���J�E���g���L�[���̍ő�l�𒴂����Ƃ��A���̃��[�V���������[�v���g�p���Ă���
			// �Đ����̃L�[���J�E���g��������
			motion.nCntKeySet = 0;

		}
		else if (motion.nCntKeySet >= motion.nNumKey)
		{
			motion.nCntKeySet = 0;
			m_bMotion = false;
		}
	}
}

//=============================================================================
// ���[�V�����u�����h
// Author : �������l
// �T�v : ���[�V�����ƃ��[�V�����̂Ȃ��ڂ𒲐�����
// �Ԃ�l : ���[�V�����u�����h�g�p�̉�
//=============================================================================
void CMotion::MotionBlend()
{
	CDebugProc::Print("BlendNow\n");
	CMotion::MyMotion& motion = m_motion[m_nNumMotion];

	for (int nCntParts = 0; nCntParts < (int)m_parts.size(); nCntParts++)
	{
		if (motion.pKeySet[motion.nCntKeySet].pKey.size() <= nCntParts)
		{
			return;
		}

		// �ϐ��錾
		D3DXVECTOR3 pos = m_parts[nCntParts]->GetPos();			// �ʒu
		D3DXVECTOR3 rot = m_parts[nCntParts]->GetRot();			// ����
		D3DXVECTOR3 posDest = m_parts[nCntParts]->GetPosDest();	// �ړI�̈ʒu
		D3DXVECTOR3 rotDest = m_parts[nCntParts]->GetRotDest();	// �ړI�̌���

		if (motion.nCntFrame == 0)
		{// �t���[���J�E���g��0�̎�
			// �ϐ��錾
			D3DXVECTOR3 posOrigin = m_parts[nCntParts]->GetPosDefault();		// ���̈ʒu
			D3DXVECTOR3 rotOrigin = m_parts[nCntParts]->GetRotDefault();		// ���̌���

			// �ړI�̈ʒu�ƌ����̎Z�o
			CMotion::MyKey myKey = motion.pKeySet[motion.nCntKeySet].pKey[nCntParts];
			posDest = posOrigin + myKey.pos - pos;
			rotDest = rotOrigin + myKey.rot - rot;

			// �p�x�̐��K��
			rotDest.x = NormalizeAngle(rotDest.x);
			rotDest.y = NormalizeAngle(rotDest.y);
			rotDest.z = NormalizeAngle(rotDest.z);

			// ���̍X�V
			m_parts[nCntParts]->SetPosDest(posDest);
			m_parts[nCntParts]->SetRotDest(rotDest);
		}

		// �ϐ��錾
		D3DXVECTOR3 addPos = D3DXVECTOR3(posDest / (float)(MOTION_BLEND_FRAM));
		D3DXVECTOR3 addRot = D3DXVECTOR3(rotDest / (float)(MOTION_BLEND_FRAM));

		// �ʒu�̉��Z
		pos += addPos;

		//	�����̉��Z
		rot += addRot;

		// �p�x�̐��K��
		rot.x = NormalizeAngle(rot.x);
		rot.y = NormalizeAngle(rot.y);
		rot.z = NormalizeAngle(rot.z);

		// ���̍X�V
		m_parts[nCntParts]->SetPos(pos);
		m_parts[nCntParts]->SetRot(rot);
	}

	// �t���[���J�E���g�̉��Z
	motion.nCntFrame++;

	if (motion.nCntFrame >= MOTION_BLEND_FRAM)
	{// �t���[���J�E���g���w��̃t���[�����𒴂����ꍇ

		motion.nCntFrame = 0;	// �t���[�����̏�����
		motion.nCntKeySet++;	// �Đ����̃L�[�ԍ����̉��Z

		m_bMotionBlend = false;
	}
}

//=============================================================================
// �p�[�c�ƃ��[�V�����̓ǂݍ���
// Author : �������l
// Author : �L�c����
// Author : Yuda Kaito
// �T�v : �p�[�c�ƃ��[�V�����̓ǂݍ��݁A���������Ăяo��
//=============================================================================
void CMotion::LoodSetMotion(const char *pFileName)
{
	// �t�@�C�����J��
	std::ifstream fileBasicData;
	std::string filename = pFileName;
	fileBasicData.open(filename, std::ios::in);

	char tag[2048];
	std::string readLineBasicData;

	int	modelnumber = 0;		// ���f���̔ԍ�
	int Idx = 0;

	// �ǂݍ��񂾕�����Ƃ̈�v�𒲂ׂ�
	auto StringMatched = [&readLineBasicData](std::string b)
	{
		return readLineBasicData.find(b) != std::string::npos;
	};

	while (std::getline(fileBasicData, readLineBasicData))
	{
		// "END_SCRIPT" �Ȃ�J��Ԃ��������ŏI������
		if (StringMatched("END_SCRIPT"))
		{
			break;
		}

		// "SCRIPT" �ł͂Ȃ��Ȃ�J��Ԃ��������ł�����x�ŏ�����J��Ԃ�
		if (!StringMatched("SCRIPT"))
		{
			continue;
		}

		while (std::getline(fileBasicData, readLineBasicData))
		{
			//���f���̏����ݒ�
			if (StringMatched("END_SCRIPT"))
			{
				break;
			}
			else if (StringMatched("NUM_MODEL"))
			{
				int num = 0;
				sscanf(readLineBasicData.c_str(), "%s = %d", tag, &num);	//�ǂݍ��񂾕������Ƃɐݒ肷��
				m_parts.resize(num);
			}
			else if (StringMatched("MODEL_FILENAME"))
			{
				char pass[1024];

				sscanf(readLineBasicData.c_str(), "%s = %s", tag, pass);	//���f���̃p�X�̐ݒ�

				std::string modelKey = "MODEL" + std::to_string(modelnumber);
				m_parts[modelnumber] = CObjectX::Create();
				m_parts[modelnumber]->BindModel(CObjectXOriginalList::GetInstance()->Load(modelKey, pass));
				modelnumber++;
			}
			else if (StringMatched("CHARACTERSET"))
			{//�����ʒu�̐ݒ�

				//�L�����N�^�[�̐ݒ�
				while (std::getline(fileBasicData, readLineBasicData))//��s�ǂݍ���
				{
					// �J��Ԃ��I������
					if (StringMatched("END_CHARACTERSET"))
					{
						break;
					}

					// "PARTSSET" �ł͂Ȃ��Ȃ�J��Ԃ��������ł�����x�ŏ�����J��Ԃ�
					if (StringMatched("PARTSSET"))
					{
						continue;
					}

					while (std::getline(fileBasicData, readLineBasicData))	//�ǂݍ��݃��[�v //��s�ǂݍ���
					{//�p�[�c�̐ݒ�	
						if (StringMatched("END_PARTSSET"))
						{//�p�[�c�̐ݒ�I��
							Idx++;
							break;
						}
						else if (StringMatched("INDEX"))
						{//�C���f�b�N�X�̐ݒ�
							sscanf(readLineBasicData.c_str(), "%s = %d", tag, &Idx);	// ���f���̃p�X�̐ݒ�
						}
						else if (StringMatched("PARENT"))
						{//�e���f���̐ݒ�
							int Parent;
							sscanf(readLineBasicData.c_str(), "%s = %d", tag, &Parent);	// ���f���̃p�X�̐ݒ�

							if (Parent >= 0 && Parent < (int)m_parts.size())
							{
								m_parts[Idx]->SetParent(m_parts[Parent]);
							}
						}
						else if (StringMatched("POS"))
						{//�ʒu
							D3DXVECTOR3 pos;
							sscanf(readLineBasicData.c_str(), "%s = %f%f%f", tag, &pos.x, &pos.y, &pos.z);	//���W�̎擾
							m_parts[Idx]->SetPos(pos);
							m_parts[Idx]->SetPosDefault(pos);
						}
						else if (StringMatched("ROT"))
						{//����
							D3DXVECTOR3 rot;
							sscanf(readLineBasicData.c_str(), "%s = %f%f%f", tag, &rot.x, &rot.y, &rot.z);
							m_parts[Idx]->SetRot(rot);
							m_parts[Idx]->SetRotDefault(rot);
						}
					}
				}
			}
			else if (StringMatched("MOTIONSET"))
			{//���[�V�����̐ݒ�
				while (std::getline(fileBasicData, readLineBasicData))	//�ǂݍ��ݗp���[�v
				{
					if (StringMatched("END_MOTIONSET"))
					{
						break;
					}
					else if (StringMatched("MOTION"))
					{
						std::ifstream fileMotionData;
						char motionFilePass[1024];
						sscanf(readLineBasicData.c_str(), "%s = %s", tag, motionFilePass);	//�t�@�C���ǂݍ���
						fileMotionData.open(motionFilePass, std::ios::in);

						while (std::getline(fileMotionData, readLineBasicData))	//�ǂݍ��ݗp���[�v
						{
							if (!StringMatched("MOTIONSET"))
							{
								continue;
							}

							MyMotion motion;
							while (std::getline(fileMotionData, readLineBasicData))	//�ǂݍ��ݗp���[�v
							{
								if (StringMatched("END_MOTIONSET"))
								{
									m_motion.push_back(motion);
									break;
								}

								if (StringMatched("NUM_KEY"))
								{
									sscanf(readLineBasicData.c_str(), "%s = %d", tag, &motion.nNumKey);	//�L�[�̑���
								}
								else if (StringMatched("LOOP"))
								{//���[�v���邩���Ȃ���
									int loop = 0;
									sscanf(readLineBasicData.c_str(), "%s = %d", tag, &loop);	//���[�v���邩�ǂ���

									motion.bLoop = loop == 1;
								}
								else if (StringMatched("KEYSET"))
								{
									MyKeySet myKeySet;
									while (std::getline(fileMotionData, readLineBasicData))
									{
										//key�̓��f���̃L�[�̔ԍ�
										if (StringMatched("END_KEYSET"))
										{
											motion.pKeySet.push_back(myKeySet);
											break;
										}
										else if (StringMatched("FRAME"))
										{//�L�[�̍Đ����Ԃ̐ݒ�
											sscanf(readLineBasicData.c_str(), "%s = %d", tag, &myKeySet.nFrame);	//�Đ����Ԃ̐ݒ�
										}
										else if (StringMatched("KEY"))
										{//�L�[�ݒ�
											MyKey myKey;
											while (std::getline(fileMotionData, readLineBasicData))
											{
												if (StringMatched("END_KEY"))
												{
													myKeySet.pKey.push_back(myKey);
													break;
												}
												else if (StringMatched("POS"))
												{
													sscanf(readLineBasicData.c_str(), "%s = %f%f%f", tag, &myKey.pos.x, &myKey.pos.y, &myKey.pos.z);
												}
												else if (StringMatched("ROT"))
												{
													sscanf(readLineBasicData.c_str(), "%s = %f%f%f", tag, &myKey.rot.x, &myKey.rot.y, &myKey.rot.z);
												}
											}
										}
									}
								}
							}
							break;	//�ǂݍ��݂��I������烋�[�v�E�o
						}
					}
				}
			}
			else if (StringMatched("#"))
			{
				continue;
			}
		}
	}

	// ������
	Init();
}

//=============================================================================
// �p�[�c�̈ʒu�����Ƃ̈ʒu�ɖ߂�
// Author : �������l
// �T�v : �p�[�c�̈ʒu�����Ƃ̈ʒu�ɖ߂�
//=============================================================================
void CMotion::SetPartsOrigin()
{
	for (int nCntParts = 0; nCntParts < m_nMaxParts; nCntParts++)
	{
		// �ʒu�̐ݒ�
		m_parts[nCntParts]->SetPos(m_parts[nCntParts]->GetPosDefault());

		//	�����̐ݒ�
		m_parts[nCntParts]->SetRot(m_parts[nCntParts]->GetRotDefault());
	}
}

//=============================================================================
// �J�E���g�̃��Z�b�g
// Author : �������l
// �T�v : �J�E���g�̃��Z�b�g
//=============================================================================
void CMotion::CntReset(const int nNumMotionOld)
{
	m_motion[nNumMotionOld].nCntFrame = 0;
	m_motion[nNumMotionOld].nCntKeySet = 0;
}

//=============================================================================
// ���[�V�����ԍ��̐ݒ�
// Author : �������l
// �T�v : ���[�V�����̔ԍ��̐ݒ�
//=============================================================================
void CMotion::SetNumMotion(const unsigned int nNumMotion)
{
	// ���[�V�����J�E���g�̃��Z�b�g
	CntReset(m_nNumMotion);

	// ���[�V�����ԍ��̐ݒ�
	m_nNumMotion = nNumMotion;

	// ���[�V�����u�����h���s��
	m_bMotionBlend = true;
	m_bMotion = true;
}

void CMotion::SetSizeMag(const D3DXVECTOR3 & size)
{
	int partsSize = m_parts.size();
	for (int i = 0; i < partsSize; i++)
	{
		m_parts[i]->SetSizeMag(size);
	}
}
