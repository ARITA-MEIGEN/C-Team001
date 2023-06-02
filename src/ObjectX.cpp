//=============================================================================
// Content     (ゲームの設定)(player.cpp)
// Author     : 有田明玄
//=============================================================================

//-----------------------------------------------------------------------------
// include
//-----------------------------------------------------------------------------
#include"ObjectX.h"
#include"renderer.h"
#include"Camera.h"
#include"InputKeyBoard.h"
#include"Shadow.h"
#include"Application.h"

//マクロ定義
#define PLAYER_SPEED	(2.0f)	//移動速度
#define MIN_SPEED		(0.1f)	//摩擦による最低速度
#define NUM_MODELPARTS	(1)		//モデルのパーツ数

static int g_nIdxShadow;		//影のID

//-----------------------------------------------------------------------------
// コンストラクタ
//-----------------------------------------------------------------------------
CObjectX::CObjectX(int nPriority) :CObject(nPriority)
{
	m_mtxParent = nullptr;
}

//-----------------------------------------------------------------------------
// デストラクタ
//-----------------------------------------------------------------------------
CObjectX::~CObjectX()
{

}

//-----------------------------------------------------------------------------
// 初期化処理
//-----------------------------------------------------------------------------
HRESULT CObjectX::Init()
{
	//情報の初期化
	m_pos = D3DXVECTOR3(0.0f, 0.0f, 0.0f);		//座標
	m_rot = D3DXVECTOR3(0.0f, 0.0f, 0.0f);		//向き
	
	//影の生成
//	m_Shadow = CShadow::Create(m_pos, D3DXVECTOR3(50.0f,0.0f,50.0f));

	return S_OK;
}

//-----------------------------------------------------------------------------
// 終了処理
//-----------------------------------------------------------------------------
void CObjectX::Uninit(void)
{
	if (m_pMesh != NULL)
	{
		m_pMesh->Release();
		m_pMesh = NULL;
	}
	if (m_pBuffMat != NULL)
	{
		m_pBuffMat->Release();
		m_pBuffMat = NULL;
	}
	CObject::Release();
}

//-----------------------------------------------------------------------------
// 更新処理
//-----------------------------------------------------------------------------
void CObjectX::Update(void)
{
	m_posold = m_pos;		//前回の位置の保存
	m_pos += m_move;		//位置の更新

//	m_Shadow->SetPos(m_pos);

	//移動量更新(減衰させる)
	m_move.x += (0.0f - m_move.x) * MIN_SPEED;
	m_move.z += (0.0f - m_move.z) * MIN_SPEED;

}

//-----------------------------------------------------------------------------
// 描画処理
//-----------------------------------------------------------------------------
void CObjectX::Draw(void)
{
	if (m_pMesh == nullptr)
	{
		return;
	}

	LPDIRECT3DDEVICE9 pDevice;	//デバイスへのポインタ
	pDevice = CApplication::getInstance()->GetRenderer()->GetDevice();

	D3DXMATRIX mtxRot, mtxTrans;	// 計算用マトリックス
	D3DMATERIAL9 matDef;			// 現在のマテリアル保存用
	D3DXMATERIAL *pMat;				// マテリアルの情報

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

	D3DXMATRIX mtxParrent;
	D3DXMatrixIdentity(&mtxParrent);

	//親のマトリックスと掛け合わせる
	if (m_pParent != nullptr)
	{
		mtxParrent = m_pParent->GetMatrix();
	}
	else if(m_mtxParent != nullptr)
	{
		mtxParrent = *m_mtxParent;
	}
	else
	{
	}

	//親の座標とかけ合わせる
	D3DXMatrixMultiply(&m_mtxWorld, &m_mtxWorld, &mtxParrent);

	//影の生成
	//Shadow()

	//ワールドマトリックスの設定
	pDevice->SetTransform(D3DTS_WORLD, &m_mtxWorld);

	//マテリアルデータへのポインタを取得
	pMat = (D3DXMATERIAL*)m_pBuffMat->GetBufferPointer();

	//マテリアルの描画
	for (int nCnt2 = 0; nCnt2 < (int)m_nNumMat; nCnt2++)
	{
		pMat[nCnt2].MatD3D.Emissive = m_col;

		//マテリアルの設定
		pDevice->SetMaterial(&pMat[nCnt2].MatD3D);

		//プレイヤーパーツの描画
		m_pMesh->DrawSubset(nCnt2);
	}
	//保持していたマテリアルを戻す
	pDevice->SetMaterial(&matDef);
}

//-----------------------------------------------------------------------------
// 操作
//-----------------------------------------------------------------------------
CObjectX * CObjectX::Create()
{
	CObjectX*pObjectX;
	pObjectX = new CObjectX();
	pObjectX->Init();

	return pObjectX;
}

//-----------------------------------------------------------------------------
// モデル読み込み
//-----------------------------------------------------------------------------
void CObjectX::BindModel(LPD3DXMESH pMesh, LPD3DXBUFFER pBuff, DWORD pNumMat)
{
	m_pBuffMat = pBuff;
	m_pMesh = pMesh;
	m_nNumMat = pNumMat;
}

//-----------------------------------------------------------------------------
// 影の作成
//-----------------------------------------------------------------------------
void CObjectX::Shadow()
{
	D3DXMATERIAL *pMat;							//マテリアルのなんか
	LPDIRECT3DDEVICE9 pDevice;	//デバイスへのポインタ
	pDevice = CApplication::getInstance()->GetRenderer()->GetDevice();

	D3DXCOLOR col[2];			//色と発光の設定

	//影を描画する処理
	D3DXPLANE planeField;
	D3DXVECTOR4 vecLight;
	D3DXVECTOR3 pos, normal;
	//シャドウマトリックスの初期化
	D3DXMatrixIdentity(&m_mtxShadow);

	//ライトの逆方向最後の数値はディレクショナルライト以外の場合動かすらしい？
	//D3DXVECTOR3 lightvec = CGame::GetLight()->GetVec(2);		//ライトの取得
	//vecLight = D3DXVECTOR4(-lightvec.x, -lightvec.y, -lightvec.z, 0.0f);

	pos = D3DXVECTOR3(0.0f, 1.0f, 0.0f);
	normal = D3DXVECTOR3(0.0f, 1.0f, 0.0f);
	D3DXPlaneFromPointNormal(&planeField, &pos, &normal);
	D3DXMatrixShadow(&m_mtxShadow, &vecLight, &planeField);

	//モデルのマトリックスとの掛け算
	D3DXMatrixMultiply(&m_mtxShadow, &m_mtxShadow, &m_mtxWorld);

	//影の描画
	//マテリアルの描画
	pMat = (D3DXMATERIAL*)m_pBuffMat->GetBufferPointer();

	pDevice->SetTransform(D3DTS_WORLD, &m_mtxShadow);

	for (int i = 0; i < (int)m_nNumMat; i++)
	{
		col[0] = pMat[i].MatD3D.Diffuse;
		col[1] = pMat[i].MatD3D.Emissive;

		pMat[i].MatD3D.Diffuse = D3DXCOLOR(0.0f, 0.0f, 0.0f, 1.0f);
		pMat[i].MatD3D.Emissive = D3DXCOLOR(0.0f, 0.0f, 0.0f, 1.0f);
		//マテリアルの設定
		pDevice->SetMaterial(&pMat[i].MatD3D);

		//プレイヤーパーツの描画
		m_pMesh->DrawSubset(i);

		pMat[i].MatD3D.Diffuse = col[0];
		pMat[i].MatD3D.Emissive = col[1];
	}
}

//-----------------------------------------------------------------------------
// サイズの算出
//-----------------------------------------------------------------------------
void CObjectX::SizeCalculate()
{
	BYTE*pVtxBuff;		//頂点バッファへのポインタ
	int nNumVtx;		//頂点数
	DWORD sizeFVF;		//頂点フォーマットのサイズ

	// 頂点バッファのロック
	m_pMesh->LockVertexBuffer(D3DLOCK_READONLY, (void**)&pVtxBuff);

	//頂点数の取得
	nNumVtx = m_pMesh->GetNumVertices();

	//頂点フォーマットのサイズを取得
	sizeFVF = D3DXGetFVFVertexSize(m_pMesh->GetFVF());

	//頂点座標の代入
	//すべての頂点のposを取得する
	D3DXVECTOR3 vtxMax = D3DXVECTOR3(-FLT_MAX, -FLT_MAX, -FLT_MAX);	//最大値の保存用
	D3DXVECTOR3 vtxMin = D3DXVECTOR3(FLT_MAX, FLT_MAX, FLT_MAX);	//最小値の保存用
	for (int nCntVtx = 0; nCntVtx < nNumVtx; nCntVtx++)
	{
		D3DXVECTOR3 vtx = *(D3DXVECTOR3*)pVtxBuff;
		//頂点座標を比較してモデルの最小値最大値を取得
		if (vtx.x > vtxMax.x)
		{//Xの最大値を取得
			vtxMax.x = vtx.x;
		}
		if (vtx.x < vtxMin.x)
		{//Xの最小値を取得
			vtxMin.x = vtx.x;
		}
		if (vtx.y > vtxMax.y)
		{//Yの最大値を取得
			vtxMax.y = vtx.y;
		}
		if (vtx.y < vtxMin.y)
		{//Yの最小値を取得
			vtxMin.y = vtx.y;
		}
		if (vtx.z > vtxMax.z)
		{//Zの最大値を取得
			vtxMax.z = vtx.z;
		}
		if (vtx.z < vtxMin.z)
		{//Zの最小値を取得
			vtxMin.z = vtx.z;
		}

		//頂点フォーマットのサイズ分ポインタを進める
		pVtxBuff += sizeFVF;
	}
	//頂点バッファのアンロック
	m_pMesh->UnlockVertexBuffer();

	m_vtxMax = vtxMax;	// 頂点座標の最大値
	m_vtxMin = vtxMin;	// 頂点座標の最小値

	m_size = vtxMax - vtxMin;	//パーツのサイズ
}

//-----------------------------------------------------------------------------
// モデルの設定
//-----------------------------------------------------------------------------
void CObjectX::SetModel(const char * Filename)
{
	// 初期化
	m_pBuffMat = nullptr;
	m_nNumMat = 0;
	m_pMesh = nullptr;

	LPDIRECT3DDEVICE9 pDevice;	//デバイスへのポインタ
	pDevice = CApplication::getInstance()->GetRenderer()->GetDevice();

	D3DXLoadMeshFromX(Filename,
		D3DXMESH_SYSTEMMEM,
		pDevice,
		NULL,
		&m_pBuffMat,
		NULL,
		&m_nNumMat,
		&m_pMesh);
}

//-----------------------------------------------------------------------------
// 親モデルの登録かつ、親に自身を子供として保存
//-----------------------------------------------------------------------------
void CObjectX::SetParent(CObjectX * pModel)
{
	m_pParent = pModel;
	m_pParent->SetChildren(this);
}
