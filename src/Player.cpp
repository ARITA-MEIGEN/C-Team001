//=================================================
// Content     (�Q�[���̐ݒ�)(player.cpp)
// Author     : �L�c����
//=================================================

//�C���N���[�h
#include"Player.h"
#include"Application.h"
#include"renderer.h"
#include"Camera.h"
#include"input.h"
#include"Shadow.h"
#include"Mesh.h"
#include"Model.h"
#include"Game.h"
#include"PlayerController.h"
#include"sound.h"
#include"Time.h"
#include"effect.h"
#include"Particle.h"

//�ÓI�����o�ϐ�
int CPlayer::m_nNumPlayer = 0;	//�v���C���[�̐�
//===========================
//�R���X�g���N�^
//===========================
CPlayer::CPlayer(int nPriority) :CObject(nPriority)
{
	m_nPlayerNumber = m_nNumPlayer;
	m_nNumPlayer++;

	m_pShadow = CShadow::Create(m_pos, D3DXVECTOR3(80.0f, 0.0f, 80.0f));	// �e

	//���f���ƃ��[�V�����̓ǂݍ���
	for (int i = 0; i < NUM_PARTS; i++)
	{//�v���C���[�̐���
		m_apModel[i] = CModel::Create();
	}
}

//===========================
//�f�X�g���N�^
//===========================
CPlayer::~CPlayer()
{
	m_nNumPlayer--;
}

//===========================
//����������
//===========================
HRESULT CPlayer::Init()
{
	m_Motion = PM_ST_NEUTRAL;	//�j���[�g�������[�V�����ɕύX

	ReadMotion();

	for (int i = 0; i < NUM_PARTS; i++)
	{
		//�v���C���[�̈ʒu�ݒ�
		m_apModel[i]->SetPos(m_apMotion[0].aKey[0].aKey[i].fPos + m_apModel[i]->GetDPos());	//�����ʒu�̐ݒ�
		m_apModel[i]->SetRot(m_apMotion[0].aKey[0].aKey[i].fRot + m_apModel[i]->GetDRot());	//�����̎擾

		//�F�w��
		if (m_nPlayerNumber == 0)
		{
			m_apModel[i]->SetCol(D3DXCOLOR(1.0f, 0.0f, 0.0f, 1.0f));
		}
		else
		{
			m_apModel[i]->SetCol(D3DXCOLOR(0.0f, 0.0f, 1.0f, 1.0f));
		}
	}

	//���I�m��
	m_controller = new CPlayerController(0);

	return S_OK;
}

//===========================
//�I������
//===========================
void CPlayer::Uninit(void)
{
	for (int i = 0; i < NUM_PARTS; i++)
	{//�v���C���[�̐���
		m_apModel[i]->Uninit();
		delete m_apModel[i];
		m_apModel[i] = nullptr;
	}

	if (m_pShadow != nullptr)
	{
		m_pShadow = nullptr;
	}	

	if (m_controller != nullptr)
	{
		delete m_controller;
		m_controller = nullptr;
	}

	CObject::Release();
}

//===========================
//�X�V����
//===========================
void CPlayer::Update(void)
{

	if (CGame::GetGame() != CGame::GAME_END&&CGame::GetGame() != CGame::GAME_START)
	{
		//Input();				//���͏���
		CInput* pInput = CInput::GetKey();
		if (pInput->Press(DIK_U))
		{
			m_nBuffTime = 120;
			m_State = PST_SPEED;
		}
		m_nBuffTime--;
		if (m_nBuffTime <= 0)
		{
			m_State = PST_STAND;
		}

		Updatepos();			//���W�X�V

		//�ړ�
		Move();

		Normalization();		//�p�x�̐��K��
		m_pShadow->SetPos({ m_pos.x, 1.0f, m_pos.z });

#ifdef _DEBUG
		CDebugProc::Print("���݂̃v���C���[�̍��W:%f %f %f", m_pos.x, m_pos.y, m_pos.z);
		CDebugProc::Print("���݂̃��[�V����:%d ", (int)m_Motion);
		CDebugProc::Print("���݂̏��:%d ", (int)m_State);
		CDebugProc::Print("���݂̃t���[��:%d", m_frame);

#endif // _DEBUG
	}
}

//===========================
//�`�揈��
//===========================
void CPlayer::Draw(void)
{
	LPDIRECT3DDEVICE9 pDevice;	//�f�o�C�X�ւ̃|�C���^
	pDevice = CApplication::getInstance()->GetRenderer()->GetDevice();

	D3DXMATRIX mtxRot, mtxTrans;	//�v�Z�p�}�g���b�N�X
	D3DMATERIAL9 matDef;			//���݂̃}�e���A���ۑ��p

	//���݂̃}�e���A�����ێ�
	pDevice->GetMaterial(&matDef);

	//�p�[�c�̃��[���h�}�g���b�N�X�̏�����
	D3DXMatrixIdentity(&m_mtxWorld);

	//�p�[�c�̃��f���̌����𔽉f
	D3DXMatrixRotationYawPitchRoll(&mtxRot, m_rot.y, m_rot.x, m_rot.z);
	D3DXMatrixMultiply(&m_mtxWorld, &m_mtxWorld, &mtxRot);

	//�p�[�c�̃��f���̈ʒu�𔽉f
	D3DXMatrixTranslation(&mtxTrans, m_pos.x, m_pos.y, m_pos.z);
	D3DXMatrixMultiply(&m_mtxWorld, &m_mtxWorld, &mtxTrans);

	//���[���h�}�g���b�N�X�̐ݒ�
	pDevice->SetTransform(D3DTS_WORLD, &m_mtxWorld);

	for (int i = 0; i < NUM_PARTS; i++)
	{
		m_apModel[i]->Draw(m_mtxWorld);
	}
}

//===========================
//����
//===========================
CPlayer * CPlayer::Create(D3DXVECTOR3 pos, D3DXVECTOR3 rot)
{
	CPlayer*pPlayer;
	pPlayer = new CPlayer(CObject::OBJTYPE_MODEL);
	pPlayer->m_pos = pos;
	pPlayer->m_rot = rot;
	pPlayer->Init();

	return pPlayer;
}

//===========================
//���[�V�����ǂݍ���
//===========================
void CPlayer::ReadMotion()
{
	const int lenLine = 2048;	//1�P��̍ő吔
	char strLine[lenLine];		//�ǂݍ��ݗp�̕�����
	char Read[lenLine];			//�ǂݎ��p
	int	modelnumber = 0;		//���f���̔ԍ�
	int motionnumber = 0;		//���[�V�����̔ԍ�
	int key = 0;
	int partsmotion = 0;
	int Idx = 0;

	//�t�@�C���ǂݍ���
	FILE*fp = fopen("data/TXT/Player01/Player01.txt", "r");		//�t�@�C���ǂݍ���
	if (fp == nullptr)
	{//�J���Ȃ��������p
		assert(false);
	}
	if (fp != NULL)
	{
		while (fgets(Read, lenLine, fp) != nullptr)
		{
			//������̕���
			sscanf(Read, "%s", &strLine);
			if (strcmp(&strLine[0], "SCRIPT") == 0)	//��r���Ĉ�v���邩�ǂ������ׂ�
			{
				while (fgets(Read, lenLine, fp) != nullptr)	//�ǂݍ��ݗp���[�v(��s�ǂݍ���)
				{//���f���̏����ݒ�
					ZeroMemory(strLine, sizeof(char) * lenLine);	//�����񃊃Z�b�g

					//������̕���
					sscanf(Read, "%s", &strLine);

					if (strcmp(&strLine[0], "END_SCRIPT") == 0)
					{
						break;
					}
					else if (strcmp(&strLine[0], "NUM_MODEL") == 0)
					{
						sscanf(Read, "%s = %d", &strLine, &m_nNumModel);	//�ǂݍ��񂾕������Ƃɐݒ肷��
					}
					else if (strcmp(&strLine[0], "MODEL_FILENAME") == 0)
					{
						sscanf(Read, "%s = %s", &strLine, &m_nModelpass[0]);	//���f���̃p�X�̐ݒ�

						m_apModel[modelnumber]->SetModel(&m_nModelpass[0]);
						modelnumber++;
					}
					else if (strcmp(&strLine[0], "CHARACTERSET") == 0)
					{//�����ʒu�̐ݒ�
						while (fgets(Read, lenLine, fp) != nullptr)//��s�ǂݍ���
						{//�L�����N�^�[�̐ݒ�
						 //������̕���
							ZeroMemory(strLine, sizeof(char) * lenLine);	//�����񃊃Z�b�g

							sscanf(Read, "%s", &strLine);
							if (strcmp(&strLine[0], "END_CHARACTERSET") == 0)
							{
								break;
							}
							if (strcmp(&strLine[0], "PARTSSET") == 0)
							{
								while (fgets(Read, lenLine, fp) != nullptr)	//�ǂݍ��݃��[�v //��s�ǂݍ���
								{//�p�[�c�̐ݒ�	
									ZeroMemory(strLine, sizeof(char) * lenLine);	//�����񃊃Z�b�g
									//������̕���
									sscanf(Read, "%s", &strLine);
									if (strcmp(&strLine[0], "END_PARTSSET") == 0)
									{//�p�[�c�̐ݒ�I��
										Idx++;
										break;
									}
									else if (strcmp(&strLine[0], "INDEX") == 0)
									{//�C���f�b�N�X�̐ݒ�
										sscanf(Read, "%s = %d", &strLine, &Idx);	//���f���̃p�X�̐ݒ�
									}
									else if (strcmp(&strLine[0], "PARENT") == 0)
									{//�e���f���̐ݒ�
										int Parent;
										sscanf(Read, "%s = %d", &strLine, &Parent);	//���f���̃p�X�̐ݒ�
										m_apModel[Idx]->SetParent(m_apModel[Parent]);
									}
									else if (strcmp(&strLine[0], "POS") == 0)
									{//�ʒu
										D3DXVECTOR3 pos;
										sscanf(Read, "%s = %f%f%f", &strLine, &pos.x, &pos.y, &pos.z);	//���W�̎擾
										m_apModel[Idx]->SetPos(pos);
										m_apModel[Idx]->SetDPos(pos);
									}
									else if (strcmp(&strLine[0], "ROT") == 0)
									{//����
										D3DXVECTOR3 rot;
										sscanf(Read, "%s = %f%f%f", &strLine, &rot.x, &rot.y, &rot.z);
										m_apModel[Idx]->SetRot(rot);
										m_apModel[Idx]->SetDRot(rot);
									}
								}
							}
						}
					}
					else if (strcmp(&strLine[0], "MOTIONSET") == 0)
					{//���[�V�����̐ݒ�
						while (fgets(Read, lenLine, fp) != nullptr)	//�ǂݍ��ݗp���[�v
						{
							ZeroMemory(strLine, sizeof(char) * lenLine);	//�����񃊃Z�b�g

							//������̕���
							sscanf(Read, "%s", &strLine);
							if (strcmp(&strLine[0], "END_MOTIONSET") == 0)
							{
								if (motionnumber > PM_MAX)
								{
									assert(false);
								}
								break;
							}
							else if (strcmp(&strLine[0], "MOTION") == 0)
							{
								const char cFilename[255] = {};
								sscanf(Read, "%s = %s", &strLine, &cFilename[0]);	//�t�@�C���ǂݍ���

								//�t�@�C���ǂݍ���
								FILE* sta = fopen(cFilename, "r");		//�t�@�C���ǂݍ���
								if (sta == nullptr)
								{//�J���Ȃ��������p
									assert(false);
								}
								if (sta != NULL)
								{
									while (fgets(Read, lenLine, sta) != nullptr)	//�ǂݍ��ݗp���[�v
									{
										ZeroMemory(strLine, sizeof(char) * lenLine);	//�����񃊃Z�b�g

										//������̕���
										sscanf(Read, "%s", &strLine);

										if (strcmp(&strLine[0], "MOTIONSET") == 0)
										{
											while (fgets(Read, lenLine, sta) != nullptr)	//�ǂݍ��ݗp���[�v
											{
												ZeroMemory(strLine, sizeof(char) * lenLine);	//�����񃊃Z�b�g

												//������̕���
												sscanf(Read, "%s", &strLine);
												if (strcmp(&strLine[0], "END_MOTIONSET") == 0)
												{
													//���[�V�����̔ԍ��J��グ
													motionnumber++;
													key = 0;
													fclose(sta);
													break;
												}
												if (strcmp(&strLine[0], "NUM_KEY") == 0)
												{
													sscanf(Read, "%s = %d", &strLine, &m_apMotion[motionnumber].nNumKey);	//�L�[�̑���
												}
												else if (strcmp(&strLine[0], "LOOP") == 0)
												{//���[�v���邩���Ȃ���
													sscanf(Read, "%s = %d", &strLine, (int*)&m_apMotion[motionnumber].bLoop);	//���[�v���邩�ǂ���
												}
												else if (strcmp(&strLine[0], "KEYSET") == 0)
												{
													while (fgets(Read, lenLine, sta) != nullptr)
													{
														ZeroMemory(strLine, sizeof(char) * lenLine);	//�����񃊃Z�b�g

														//������̕���
														sscanf(Read, "%s", &strLine);

														//key�̓��f���̃L�[�̔ԍ�
														if (strcmp(&strLine[0], "END_KEYSET") == 0)
														{
															key++;
															partsmotion = 0;	//�ԍ����Z�b�g
															break;
														}
														else if (strcmp(&strLine[0], "FRAME") == 0)
														{//�L�[�̍Đ����Ԃ̐ݒ�
															sscanf(Read, "%s = %d", &strLine, &m_apMotion[motionnumber].aKey[key].nFrame);	//�Đ����Ԃ̐ݒ�
														}
														else if (strcmp(&strLine[0], "KEY") == 0)
														{//�L�[�ݒ�
															while (fgets(Read, lenLine, sta) != nullptr)
															{
																ZeroMemory(strLine, sizeof(char) * lenLine);	//�����񃊃Z�b�g

																//������̕���
																sscanf(Read, "%s", &strLine);

																if (strcmp(&strLine[0], "END_KEY") == 0)
																{
																	partsmotion++;
																	break;
																}
																else if (strcmp(&strLine[0], "POS") == 0)
																{
																	sscanf(Read, "%s = %f%f%f", &strLine,
																		&m_apMotion[motionnumber].aKey[key].aKey[partsmotion].fPos.x,
																		&m_apMotion[motionnumber].aKey[key].aKey[partsmotion].fPos.y,
																		&m_apMotion[motionnumber].aKey[key].aKey[partsmotion].fPos.z);	//�Đ����Ԃ̐ݒ�
																}
																else if (strcmp(&strLine[0], "ROT") == 0)
																{
																	sscanf(Read, "%s = %f%f%f", &strLine,
																		&m_apMotion[motionnumber].aKey[key].aKey[partsmotion].fRot.x,
																		&m_apMotion[motionnumber].aKey[key].aKey[partsmotion].fRot.y,
																		&m_apMotion[motionnumber].aKey[key].aKey[partsmotion].fRot.z);
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
						}
					}
					else if (strcmp(&strLine[0], "AXISSET") == 0)
					{
						while (fgets(Read, lenLine, fp) != nullptr)	//�ǂݍ��ݗp���[�v
						{
							ZeroMemory(strLine, sizeof(char) * lenLine);	//�����񃊃Z�b�g

							//������̕���
							sscanf(Read, "%s", &strLine);

							if (strcmp(&strLine[0], "END_AXIS") == 0)
							{
								break;
							}
							else if ((strcmp(&strLine[0], "POS") == 0))
							{
								D3DXVECTOR3 axpos;
								sscanf(Read, "%s = %f%f%f", &strLine, &axpos.x, &axpos.y, &axpos.z);	//�L�[�̑���

							}
							else if ((strcmp(&strLine[0], "SIZ") == 0))
							{
								D3DXVECTOR3  axsiz;
								sscanf(Read, "%s = %f%f%f", &strLine, &axsiz.x, &axsiz.y, &axsiz.z);	//�L�[�̑���
							}
						}
					}

					else if (strcmp(&strLine[0], "#") == 0)
					{
						continue;
					}
				}
			}
			else if (strcmp(&strLine[0], "END_SCRIPT") == 0)
			{
				break;
			}
		}
		fclose(fp);
	}
}

//===========================
//�p�[�c�̃��[�V����
//===========================
void CPlayer::MotionPlayer()
{
	D3DXVECTOR3 RelaPos, RelaRot;		//1�t���[�����Ƃ̈ړ���
	D3DXVECTOR3 pos, rot, DiffPos, DiffRot;

	//�J�E���^�[�X�V
	if (m_nCurKey == m_apMotion[m_Motion].nNumKey&& m_apMotion[m_Motion].bLoop == false)
	{
		//���[�v���[�V�������I�������j���[�g�����ɂ���
		switch (m_State)
		{
		case CPlayer::PST_STAND:
			m_Motion = PM_ST_NEUTRAL;
			break;
		}
		PlayFirstMotion();
		return;
	}
	else
	{
		for (int i = 0; i < NUM_PARTS; i++)
		{//�p�[�c�S���̃��[�V�����Đ�
			if (m_apModel[i] != nullptr)
			{
				if (m_nCurKey == m_apMotion[m_Motion].nNumKey - 1 && m_apMotion[m_Motion].bLoop == true)
				{//���[�v����ꍇ�ŏ��̃��[�V�����Ɉڍs����
					DiffPos = D3DXVECTOR3(
						m_apMotion[m_Motion].aKey[0].aKey[i].fPos -
						m_apMotion[m_Motion].aKey[m_nCurKey].aKey[i].fPos);	//�����̎擾

					DiffRot = D3DXVECTOR3(
						m_apMotion[m_Motion].aKey[0].aKey[i].fRot -
						m_apMotion[m_Motion].aKey[m_nCurKey].aKey[i].fRot);	//�����̎擾
				}
				else if (m_nCurKey == m_apMotion[m_Motion].nNumKey - 1 && m_apMotion[m_Motion].bLoop == false)
				{//���[�v���Ȃ��ꍇ�j���[�g�������[�V�����ɖ߂�
					switch (m_State)
					{//���݂̏�Ԃɖ߂�
					case CPlayer::PST_STAND:
						DiffPos = D3DXVECTOR3(//���W�����̎擾
							m_apMotion[0].aKey[0].aKey[i].fPos -
							m_apMotion[m_Motion].aKey[m_nCurKey].aKey[i].fPos);

						DiffRot = D3DXVECTOR3(//���������̎擾
							m_apMotion[0].aKey[0].aKey[i].fRot -
							m_apMotion[m_Motion].aKey[m_nCurKey].aKey[i].fRot);
						break;
					default:
						break;
					}
				}
				else
				{
					if (m_nCurKey == 0 && m_frame == 0)
					{//�ʒu���W�̐ݒ肵�Ȃ���
						PlayFirstMotion();
					}
					DiffPos = D3DXVECTOR3(//���W�����̎擾
						m_apMotion[m_Motion].aKey[m_nCurKey + 1].aKey[i].fPos -
						m_apMotion[m_Motion].aKey[m_nCurKey].aKey[i].fPos);

					DiffRot = D3DXVECTOR3(//���������̎擾
						m_apMotion[m_Motion].aKey[m_nCurKey + 1].aKey[i].fRot -
						m_apMotion[m_Motion].aKey[m_nCurKey].aKey[i].fRot);
				}
			}

			//�ʒu
			RelaPos = (DiffPos / (float)m_apMotion[m_Motion].aKey[m_nCurKey].nFrame);		//���Βl
			RelaRot = (DiffRot / (float)m_apMotion[m_Motion].aKey[m_nCurKey].nFrame);

			//�L�[�̐ݒ�
			//�Đ����[�h�̏ꍇ
			pos = RelaPos + m_apModel[i]->GetPos();
			rot = RelaRot + m_apModel[i]->GetRot();

			//�ʒu�̐ݒ�
			m_apModel[i]->SetPos(pos);
			m_apModel[i]->SetRot(rot);
		}
	}

	//�Đ����[�h�̏ꍇ
	 //�J�E���^�[�X�V
	if (m_frame >= m_apMotion[m_Motion].aKey[m_nCurKey].nFrame)
	{//�L�[�ԍ��̍X�V�ƃJ�E���^�[�̃��Z�b�g
		m_nCurKey++;
		m_frame = 0;
		if (m_nCurKey >= m_apMotion[m_Motion].nNumKey)
		{//�L�[�ԍ����ő吔�𒴂����ꍇ���Z�b�g
			if (m_apMotion[m_Motion].bLoop == true)
			{
				m_nCurKey = 0;
			}
		}
	}
	m_frame++;
}

//===========================
//���[�V�����Ǘ�
//===========================
void CPlayer::MotionManager()
{
	if (m_MotionOld != m_Motion)
	{//��Ԃ��Ⴄ�ꍇ
		PlayFirstMotion();
	}
		MotionPlayer();		//�v���C���[�̃��[�V����
	m_MotionOld = m_Motion;
}

//===========================
//�ŏ��̃��[�V������ݒ�
//===========================
void CPlayer::PlayFirstMotion()
{
	for (int i = 0; i < NUM_PARTS; i++)
	{
		//�v���C���[�̐���
		m_apModel[i]->SetPos(D3DXVECTOR3(
			m_apMotion[m_Motion].aKey[0].aKey[i].fPos) + m_apModel[i]->GetDPos());	//�����ʒu�̐ݒ�

		m_apModel[i]->SetRot(D3DXVECTOR3(
			m_apMotion[m_Motion].aKey[0].aKey[i].fRot) + m_apModel[i]->GetDRot());	//�����̎擾
	}
	m_frame = 0;
	m_nCurKey = 0;
}

//==============================================
//���͐ݒ�
//==============================================
void CPlayer::Input()
{
	CInput* pInput = CInput::GetKey();
	int Key = 0;
	pInput->PressDevice(KEY_DOWN_RIGHT);
	//���o�[
	{
		//��
		Key |= pInput->Press(DIK_S) || pInput->Press(JOYPAD_DOWN, m_nPlayerNumber)|| pInput->Press(JOYPAD_DOWN_LEFT, m_nPlayerNumber) || pInput->Press(JOYPAD_DOWN_RIGHT, m_nPlayerNumber) ? INPUT2 : INPUT_NOT2;
		//��
		Key |= pInput->Press(DIK_A) || pInput->Press(JOYPAD_LEFT, m_nPlayerNumber) || pInput->Press(JOYPAD_DOWN_LEFT, m_nPlayerNumber) || (pInput->Press(JOYPAD_UP_LEFT, m_nPlayerNumber)) ? INPUT4 : INPUT_NOT4;
		//�E
		Key |= pInput->Press(DIK_D) || pInput->Press(JOYPAD_RIGHT, m_nPlayerNumber) || (pInput->Press(JOYPAD_UP_RIGHT, m_nPlayerNumber)) || pInput->Press(JOYPAD_DOWN_RIGHT, m_nPlayerNumber) ? INPUT6 : INPUT_NOT6;
		//��
		Key |= pInput->Press(DIK_W) || pInput->Press(JOYPAD_UP, m_nPlayerNumber) || (pInput->Press(JOYPAD_UP_RIGHT, m_nPlayerNumber)) || (pInput->Press(JOYPAD_UP_LEFT, m_nPlayerNumber)) ? INPUT8 : INPUT_NOT8;

		//�j���[�g����
		Key |= (Key & INPUT_NOT6) == INPUT_NOT6 && (Key & INPUT_NOT2) == INPUT_NOT2 && (Key & INPUT_NOT4) == INPUT_NOT4 && (Key & INPUT_NOT8) == INPUT_NOT8 ? INPUT5 : INPUT_NOT5;
	}
}

//-----------------------------------------
// �ړ�
//-----------------------------------------
void CPlayer::Move()
{
	if (m_controller == nullptr)
	{
		assert(false);
		return;
	}

	// �����x�N�g���|����ړ���
	if (m_State == PST_SPEED)
	{
		m_move = m_controller->Move() * PLAYER_SPEED * ITEM_ADD_SPEED;
	}
	else
	{
		m_move = m_controller->Move() * PLAYER_SPEED;
	}
}

//-----------------------------------------
// �R���g���[���[�̐ݒ�
//-----------------------------------------
void CPlayer::SetController(CController * inOperate)
{
	m_controller = inOperate;
	m_controller->SetToOrder(this);

}

//==============================================
//���W�̍X�V
//==============================================
void CPlayer::Updatepos()
{
	m_posold = m_pos;		//�O��̈ʒu�̕ۑ�
	m_pos += m_move;		//�ʒu�̍X�V
}

//==============================================
//�p�x�̐��K��
//==============================================
void CPlayer::Normalization()
{
	//�p�x�̐��K��
	if (m_rot.y >= D3DX_PI)
	{
		m_rot.y -= D3DX_PI * 2;
	}
	else if (m_rot.y <= -D3DX_PI)
	{
		m_rot.y += D3DX_PI * 2;
	}
}