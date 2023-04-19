//=================================================
// Content     (ゲームの設定)(player.cpp)
// Author     : 有田明玄
//=================================================

//インクルード
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

//静的メンバ変数
int CPlayer::m_nNumPlayer = 0;	//プレイヤーの数
//===========================
//コンストラクタ
//===========================
CPlayer::CPlayer(int nPriority) :CObject(nPriority)
{
	m_nPlayerNumber = m_nNumPlayer;
	m_nNumPlayer++;

	m_pShadow = CShadow::Create(m_pos, D3DXVECTOR3(80.0f, 0.0f, 80.0f));	// 影

	//モデルとモーションの読み込み
	for (int i = 0; i < NUM_PARTS; i++)
	{//プレイヤーの生成
		m_apModel[i] = CModel::Create();
	}
}

//===========================
//デストラクタ
//===========================
CPlayer::~CPlayer()
{
	m_nNumPlayer--;
}

//===========================
//初期化処理
//===========================
HRESULT CPlayer::Init()
{
	m_Motion = PM_ST_NEUTRAL;	//ニュートラルモーションに変更

	ReadMotion();

	for (int i = 0; i < NUM_PARTS; i++)
	{
		//プレイヤーの位置設定
		m_apModel[i]->SetPos(m_apMotion[0].aKey[0].aKey[i].fPos + m_apModel[i]->GetDPos());	//初期位置の設定
		m_apModel[i]->SetRot(m_apMotion[0].aKey[0].aKey[i].fRot + m_apModel[i]->GetDRot());	//差分の取得

		//色指定
		if (m_nPlayerNumber == 0)
		{
			m_apModel[i]->SetCol(D3DXCOLOR(1.0f, 0.0f, 0.0f, 1.0f));
		}
		else
		{
			m_apModel[i]->SetCol(D3DXCOLOR(0.0f, 0.0f, 1.0f, 1.0f));
		}
	}

	//動的確保
	m_controller = new CPlayerController(0);

	return S_OK;
}

//===========================
//終了処理
//===========================
void CPlayer::Uninit(void)
{
	for (int i = 0; i < NUM_PARTS; i++)
	{//プレイヤーの生成
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
//更新処理
//===========================
void CPlayer::Update(void)
{

	if (CGame::GetGame() != CGame::GAME_END&&CGame::GetGame() != CGame::GAME_START)
	{
		//Input();				//入力処理
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

		Updatepos();			//座標更新

		//移動
		Move();

		Normalization();		//角度の正規化
		m_pShadow->SetPos({ m_pos.x, 1.0f, m_pos.z });

#ifdef _DEBUG
		CDebugProc::Print("現在のプレイヤーの座標:%f %f %f", m_pos.x, m_pos.y, m_pos.z);
		CDebugProc::Print("現在のモーション:%d ", (int)m_Motion);
		CDebugProc::Print("現在の状態:%d ", (int)m_State);
		CDebugProc::Print("現在のフレーム:%d", m_frame);

#endif // _DEBUG
	}
}

//===========================
//描画処理
//===========================
void CPlayer::Draw(void)
{
	LPDIRECT3DDEVICE9 pDevice;	//デバイスへのポインタ
	pDevice = CApplication::getInstance()->GetRenderer()->GetDevice();

	D3DXMATRIX mtxRot, mtxTrans;	//計算用マトリックス
	D3DMATERIAL9 matDef;			//現在のマテリアル保存用

	//現在のマテリアルを維持
	pDevice->GetMaterial(&matDef);

	//パーツのワールドマトリックスの初期化
	D3DXMatrixIdentity(&m_mtxWorld);

	//パーツのモデルの向きを反映
	D3DXMatrixRotationYawPitchRoll(&mtxRot, m_rot.y, m_rot.x, m_rot.z);
	D3DXMatrixMultiply(&m_mtxWorld, &m_mtxWorld, &mtxRot);

	//パーツのモデルの位置を反映
	D3DXMatrixTranslation(&mtxTrans, m_pos.x, m_pos.y, m_pos.z);
	D3DXMatrixMultiply(&m_mtxWorld, &m_mtxWorld, &mtxTrans);

	//ワールドマトリックスの設定
	pDevice->SetTransform(D3DTS_WORLD, &m_mtxWorld);

	for (int i = 0; i < NUM_PARTS; i++)
	{
		m_apModel[i]->Draw(m_mtxWorld);
	}
}

//===========================
//生成
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
//モーション読み込み
//===========================
void CPlayer::ReadMotion()
{
	const int lenLine = 2048;	//1単語の最大数
	char strLine[lenLine];		//読み込み用の文字列
	char Read[lenLine];			//読み取る用
	int	modelnumber = 0;		//モデルの番号
	int motionnumber = 0;		//モーションの番号
	int key = 0;
	int partsmotion = 0;
	int Idx = 0;

	//ファイル読み込み
	FILE*fp = fopen("data/TXT/Player01/Player01.txt", "r");		//ファイル読み込み
	if (fp == nullptr)
	{//開けなかった時用
		assert(false);
	}
	if (fp != NULL)
	{
		while (fgets(Read, lenLine, fp) != nullptr)
		{
			//文字列の分析
			sscanf(Read, "%s", &strLine);
			if (strcmp(&strLine[0], "SCRIPT") == 0)	//比較して一致するかどうか調べる
			{
				while (fgets(Read, lenLine, fp) != nullptr)	//読み込み用ループ(一行読み込み)
				{//モデルの初期設定
					ZeroMemory(strLine, sizeof(char) * lenLine);	//文字列リセット

					//文字列の分析
					sscanf(Read, "%s", &strLine);

					if (strcmp(&strLine[0], "END_SCRIPT") == 0)
					{
						break;
					}
					else if (strcmp(&strLine[0], "NUM_MODEL") == 0)
					{
						sscanf(Read, "%s = %d", &strLine, &m_nNumModel);	//読み込んだ文字ごとに設定する
					}
					else if (strcmp(&strLine[0], "MODEL_FILENAME") == 0)
					{
						sscanf(Read, "%s = %s", &strLine, &m_nModelpass[0]);	//モデルのパスの設定

						m_apModel[modelnumber]->SetModel(&m_nModelpass[0]);
						modelnumber++;
					}
					else if (strcmp(&strLine[0], "CHARACTERSET") == 0)
					{//初期位置の設定
						while (fgets(Read, lenLine, fp) != nullptr)//一行読み込み
						{//キャラクターの設定
						 //文字列の分析
							ZeroMemory(strLine, sizeof(char) * lenLine);	//文字列リセット

							sscanf(Read, "%s", &strLine);
							if (strcmp(&strLine[0], "END_CHARACTERSET") == 0)
							{
								break;
							}
							if (strcmp(&strLine[0], "PARTSSET") == 0)
							{
								while (fgets(Read, lenLine, fp) != nullptr)	//読み込みループ //一行読み込み
								{//パーツの設定	
									ZeroMemory(strLine, sizeof(char) * lenLine);	//文字列リセット
									//文字列の分析
									sscanf(Read, "%s", &strLine);
									if (strcmp(&strLine[0], "END_PARTSSET") == 0)
									{//パーツの設定終了
										Idx++;
										break;
									}
									else if (strcmp(&strLine[0], "INDEX") == 0)
									{//インデックスの設定
										sscanf(Read, "%s = %d", &strLine, &Idx);	//モデルのパスの設定
									}
									else if (strcmp(&strLine[0], "PARENT") == 0)
									{//親モデルの設定
										int Parent;
										sscanf(Read, "%s = %d", &strLine, &Parent);	//モデルのパスの設定
										m_apModel[Idx]->SetParent(m_apModel[Parent]);
									}
									else if (strcmp(&strLine[0], "POS") == 0)
									{//位置
										D3DXVECTOR3 pos;
										sscanf(Read, "%s = %f%f%f", &strLine, &pos.x, &pos.y, &pos.z);	//座標の取得
										m_apModel[Idx]->SetPos(pos);
										m_apModel[Idx]->SetDPos(pos);
									}
									else if (strcmp(&strLine[0], "ROT") == 0)
									{//向き
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
					{//モーションの設定
						while (fgets(Read, lenLine, fp) != nullptr)	//読み込み用ループ
						{
							ZeroMemory(strLine, sizeof(char) * lenLine);	//文字列リセット

							//文字列の分析
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
								sscanf(Read, "%s = %s", &strLine, &cFilename[0]);	//ファイル読み込み

								//ファイル読み込み
								FILE* sta = fopen(cFilename, "r");		//ファイル読み込み
								if (sta == nullptr)
								{//開けなかった時用
									assert(false);
								}
								if (sta != NULL)
								{
									while (fgets(Read, lenLine, sta) != nullptr)	//読み込み用ループ
									{
										ZeroMemory(strLine, sizeof(char) * lenLine);	//文字列リセット

										//文字列の分析
										sscanf(Read, "%s", &strLine);

										if (strcmp(&strLine[0], "MOTIONSET") == 0)
										{
											while (fgets(Read, lenLine, sta) != nullptr)	//読み込み用ループ
											{
												ZeroMemory(strLine, sizeof(char) * lenLine);	//文字列リセット

												//文字列の分析
												sscanf(Read, "%s", &strLine);
												if (strcmp(&strLine[0], "END_MOTIONSET") == 0)
												{
													//モーションの番号繰り上げ
													motionnumber++;
													key = 0;
													fclose(sta);
													break;
												}
												if (strcmp(&strLine[0], "NUM_KEY") == 0)
												{
													sscanf(Read, "%s = %d", &strLine, &m_apMotion[motionnumber].nNumKey);	//キーの総数
												}
												else if (strcmp(&strLine[0], "LOOP") == 0)
												{//ループするかしないか
													sscanf(Read, "%s = %d", &strLine, (int*)&m_apMotion[motionnumber].bLoop);	//ループするかどうか
												}
												else if (strcmp(&strLine[0], "KEYSET") == 0)
												{
													while (fgets(Read, lenLine, sta) != nullptr)
													{
														ZeroMemory(strLine, sizeof(char) * lenLine);	//文字列リセット

														//文字列の分析
														sscanf(Read, "%s", &strLine);

														//keyはモデルのキーの番号
														if (strcmp(&strLine[0], "END_KEYSET") == 0)
														{
															key++;
															partsmotion = 0;	//番号リセット
															break;
														}
														else if (strcmp(&strLine[0], "FRAME") == 0)
														{//キーの再生時間の設定
															sscanf(Read, "%s = %d", &strLine, &m_apMotion[motionnumber].aKey[key].nFrame);	//再生時間の設定
														}
														else if (strcmp(&strLine[0], "KEY") == 0)
														{//キー設定
															while (fgets(Read, lenLine, sta) != nullptr)
															{
																ZeroMemory(strLine, sizeof(char) * lenLine);	//文字列リセット

																//文字列の分析
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
																		&m_apMotion[motionnumber].aKey[key].aKey[partsmotion].fPos.z);	//再生時間の設定
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
											break;	//読み込みが終わったらループ脱出
										}
									}
								}
							}
						}
					}
					else if (strcmp(&strLine[0], "AXISSET") == 0)
					{
						while (fgets(Read, lenLine, fp) != nullptr)	//読み込み用ループ
						{
							ZeroMemory(strLine, sizeof(char) * lenLine);	//文字列リセット

							//文字列の分析
							sscanf(Read, "%s", &strLine);

							if (strcmp(&strLine[0], "END_AXIS") == 0)
							{
								break;
							}
							else if ((strcmp(&strLine[0], "POS") == 0))
							{
								D3DXVECTOR3 axpos;
								sscanf(Read, "%s = %f%f%f", &strLine, &axpos.x, &axpos.y, &axpos.z);	//キーの総数

							}
							else if ((strcmp(&strLine[0], "SIZ") == 0))
							{
								D3DXVECTOR3  axsiz;
								sscanf(Read, "%s = %f%f%f", &strLine, &axsiz.x, &axsiz.y, &axsiz.z);	//キーの総数
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
//パーツのモーション
//===========================
void CPlayer::MotionPlayer()
{
	D3DXVECTOR3 RelaPos, RelaRot;		//1フレームごとの移動量
	D3DXVECTOR3 pos, rot, DiffPos, DiffRot;

	//カウンター更新
	if (m_nCurKey == m_apMotion[m_Motion].nNumKey&& m_apMotion[m_Motion].bLoop == false)
	{
		//ループモーションが終わったらニュートラルにする
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
		{//パーツ全部のモーション再生
			if (m_apModel[i] != nullptr)
			{
				if (m_nCurKey == m_apMotion[m_Motion].nNumKey - 1 && m_apMotion[m_Motion].bLoop == true)
				{//ループする場合最初のモーションに移行する
					DiffPos = D3DXVECTOR3(
						m_apMotion[m_Motion].aKey[0].aKey[i].fPos -
						m_apMotion[m_Motion].aKey[m_nCurKey].aKey[i].fPos);	//差分の取得

					DiffRot = D3DXVECTOR3(
						m_apMotion[m_Motion].aKey[0].aKey[i].fRot -
						m_apMotion[m_Motion].aKey[m_nCurKey].aKey[i].fRot);	//差分の取得
				}
				else if (m_nCurKey == m_apMotion[m_Motion].nNumKey - 1 && m_apMotion[m_Motion].bLoop == false)
				{//ループしない場合ニュートラルモーションに戻す
					switch (m_State)
					{//現在の状態に戻す
					case CPlayer::PST_STAND:
						DiffPos = D3DXVECTOR3(//座標差分の取得
							m_apMotion[0].aKey[0].aKey[i].fPos -
							m_apMotion[m_Motion].aKey[m_nCurKey].aKey[i].fPos);

						DiffRot = D3DXVECTOR3(//向き差分の取得
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
					{//位置座標の設定しなおし
						PlayFirstMotion();
					}
					DiffPos = D3DXVECTOR3(//座標差分の取得
						m_apMotion[m_Motion].aKey[m_nCurKey + 1].aKey[i].fPos -
						m_apMotion[m_Motion].aKey[m_nCurKey].aKey[i].fPos);

					DiffRot = D3DXVECTOR3(//向き差分の取得
						m_apMotion[m_Motion].aKey[m_nCurKey + 1].aKey[i].fRot -
						m_apMotion[m_Motion].aKey[m_nCurKey].aKey[i].fRot);
				}
			}

			//位置
			RelaPos = (DiffPos / (float)m_apMotion[m_Motion].aKey[m_nCurKey].nFrame);		//相対値
			RelaRot = (DiffRot / (float)m_apMotion[m_Motion].aKey[m_nCurKey].nFrame);

			//キーの設定
			//再生モードの場合
			pos = RelaPos + m_apModel[i]->GetPos();
			rot = RelaRot + m_apModel[i]->GetRot();

			//位置の設定
			m_apModel[i]->SetPos(pos);
			m_apModel[i]->SetRot(rot);
		}
	}

	//再生モードの場合
	 //カウンター更新
	if (m_frame >= m_apMotion[m_Motion].aKey[m_nCurKey].nFrame)
	{//キー番号の更新とカウンターのリセット
		m_nCurKey++;
		m_frame = 0;
		if (m_nCurKey >= m_apMotion[m_Motion].nNumKey)
		{//キー番号が最大数を超えた場合リセット
			if (m_apMotion[m_Motion].bLoop == true)
			{
				m_nCurKey = 0;
			}
		}
	}
	m_frame++;
}

//===========================
//モーション管理
//===========================
void CPlayer::MotionManager()
{
	if (m_MotionOld != m_Motion)
	{//状態が違う場合
		PlayFirstMotion();
	}
		MotionPlayer();		//プレイヤーのモーション
	m_MotionOld = m_Motion;
}

//===========================
//最初のモーションを設定
//===========================
void CPlayer::PlayFirstMotion()
{
	for (int i = 0; i < NUM_PARTS; i++)
	{
		//プレイヤーの生成
		m_apModel[i]->SetPos(D3DXVECTOR3(
			m_apMotion[m_Motion].aKey[0].aKey[i].fPos) + m_apModel[i]->GetDPos());	//初期位置の設定

		m_apModel[i]->SetRot(D3DXVECTOR3(
			m_apMotion[m_Motion].aKey[0].aKey[i].fRot) + m_apModel[i]->GetDRot());	//差分の取得
	}
	m_frame = 0;
	m_nCurKey = 0;
}

//==============================================
//入力設定
//==============================================
void CPlayer::Input()
{
	CInput* pInput = CInput::GetKey();
	int Key = 0;
	pInput->PressDevice(KEY_DOWN_RIGHT);
	//レバー
	{
		//下
		Key |= pInput->Press(DIK_S) || pInput->Press(JOYPAD_DOWN, m_nPlayerNumber)|| pInput->Press(JOYPAD_DOWN_LEFT, m_nPlayerNumber) || pInput->Press(JOYPAD_DOWN_RIGHT, m_nPlayerNumber) ? INPUT2 : INPUT_NOT2;
		//左
		Key |= pInput->Press(DIK_A) || pInput->Press(JOYPAD_LEFT, m_nPlayerNumber) || pInput->Press(JOYPAD_DOWN_LEFT, m_nPlayerNumber) || (pInput->Press(JOYPAD_UP_LEFT, m_nPlayerNumber)) ? INPUT4 : INPUT_NOT4;
		//右
		Key |= pInput->Press(DIK_D) || pInput->Press(JOYPAD_RIGHT, m_nPlayerNumber) || (pInput->Press(JOYPAD_UP_RIGHT, m_nPlayerNumber)) || pInput->Press(JOYPAD_DOWN_RIGHT, m_nPlayerNumber) ? INPUT6 : INPUT_NOT6;
		//上
		Key |= pInput->Press(DIK_W) || pInput->Press(JOYPAD_UP, m_nPlayerNumber) || (pInput->Press(JOYPAD_UP_RIGHT, m_nPlayerNumber)) || (pInput->Press(JOYPAD_UP_LEFT, m_nPlayerNumber)) ? INPUT8 : INPUT_NOT8;

		//ニュートラル
		Key |= (Key & INPUT_NOT6) == INPUT_NOT6 && (Key & INPUT_NOT2) == INPUT_NOT2 && (Key & INPUT_NOT4) == INPUT_NOT4 && (Key & INPUT_NOT8) == INPUT_NOT8 ? INPUT5 : INPUT_NOT5;
	}
}

//-----------------------------------------
// 移動
//-----------------------------------------
void CPlayer::Move()
{
	if (m_controller == nullptr)
	{
		assert(false);
		return;
	}

	// 方向ベクトル掛ける移動量
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
// コントローラーの設定
//-----------------------------------------
void CPlayer::SetController(CController * inOperate)
{
	m_controller = inOperate;
	m_controller->SetToOrder(this);

}

//==============================================
//座標の更新
//==============================================
void CPlayer::Updatepos()
{
	m_posold = m_pos;		//前回の位置の保存
	m_pos += m_move;		//位置の更新
}

//==============================================
//角度の正規化
//==============================================
void CPlayer::Normalization()
{
	//角度の正規化
	if (m_rot.y >= D3DX_PI)
	{
		m_rot.y -= D3DX_PI * 2;
	}
	else if (m_rot.y <= -D3DX_PI)
	{
		m_rot.y += D3DX_PI * 2;
	}
}