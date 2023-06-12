xof 0302txt 0064
template Header {
 <3D82AB43-62DA-11cf-AB39-0020AF71E433>
 WORD major;
 WORD minor;
 DWORD flags;
}

template Vector {
 <3D82AB5E-62DA-11cf-AB39-0020AF71E433>
 FLOAT x;
 FLOAT y;
 FLOAT z;
}

template Coords2d {
 <F6F23F44-7686-11cf-8F52-0040333594A3>
 FLOAT u;
 FLOAT v;
}

template Matrix4x4 {
 <F6F23F45-7686-11cf-8F52-0040333594A3>
 array FLOAT matrix[16];
}

template ColorRGBA {
 <35FF44E0-6C7C-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
 FLOAT alpha;
}

template ColorRGB {
 <D3E16E81-7835-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
}

template IndexedColor {
 <1630B820-7842-11cf-8F52-0040333594A3>
 DWORD index;
 ColorRGBA indexColor;
}

template Boolean {
 <4885AE61-78E8-11cf-8F52-0040333594A3>
 WORD truefalse;
}

template Boolean2d {
 <4885AE63-78E8-11cf-8F52-0040333594A3>
 Boolean u;
 Boolean v;
}

template MaterialWrap {
 <4885AE60-78E8-11cf-8F52-0040333594A3>
 Boolean u;
 Boolean v;
}

template TextureFilename {
 <A42790E1-7810-11cf-8F52-0040333594A3>
 STRING filename;
}

template Material {
 <3D82AB4D-62DA-11cf-AB39-0020AF71E433>
 ColorRGBA faceColor;
 FLOAT power;
 ColorRGB specularColor;
 ColorRGB emissiveColor;
 [...]
}

template MeshFace {
 <3D82AB5F-62DA-11cf-AB39-0020AF71E433>
 DWORD nFaceVertexIndices;
 array DWORD faceVertexIndices[nFaceVertexIndices];
}

template MeshFaceWraps {
 <4885AE62-78E8-11cf-8F52-0040333594A3>
 DWORD nFaceWrapValues;
 Boolean2d faceWrapValues;
}

template MeshTextureCoords {
 <F6F23F40-7686-11cf-8F52-0040333594A3>
 DWORD nTextureCoords;
 array Coords2d textureCoords[nTextureCoords];
}

template MeshMaterialList {
 <F6F23F42-7686-11cf-8F52-0040333594A3>
 DWORD nMaterials;
 DWORD nFaceIndexes;
 array DWORD faceIndexes[nFaceIndexes];
 [Material]
}

template MeshNormals {
 <F6F23F43-7686-11cf-8F52-0040333594A3>
 DWORD nNormals;
 array Vector normals[nNormals];
 DWORD nFaceNormals;
 array MeshFace faceNormals[nFaceNormals];
}

template MeshVertexColors {
 <1630B821-7842-11cf-8F52-0040333594A3>
 DWORD nVertexColors;
 array IndexedColor vertexColors[nVertexColors];
}

template Mesh {
 <3D82AB44-62DA-11cf-AB39-0020AF71E433>
 DWORD nVertices;
 array Vector vertices[nVertices];
 DWORD nFaces;
 array MeshFace faces[nFaces];
 [...]
}

Header{
1;
0;
1;
}

Mesh {
 240;
 -0.12000;-0.65000;0.35000;,
 -0.14875;-0.59966;0.41217;,
 -0.14875;-0.46995;0.30713;,
 -0.12000;-0.52029;0.24497;,
 -0.14875;-0.52774;0.50098;,
 -0.14875;-0.39803;0.39595;,
 -0.12000;-0.47740;0.56315;,
 -0.12000;-0.34769;0.45812;,
 -0.14875;-0.34024;0.20210;,
 -0.12000;-0.39059;0.13993;,
 -0.14875;-0.26832;0.29091;,
 -0.12000;-0.21798;0.35308;,
 -0.14875;-0.21054;0.09707;,
 -0.12000;-0.26088;0.03490;,
 -0.14875;-0.13862;0.18588;,
 -0.12000;-0.08827;0.24805;,
 -0.14875;-0.08083;-0.00797;,
 -0.12000;-0.13117;-0.07014;,
 -0.14875;-0.00891;0.08084;,
 -0.12000;0.04143;0.14301;,
 -0.14875;0.04888;-0.11300;,
 -0.12000;-0.00147;-0.17517;,
 -0.14875;0.12080;-0.02419;,
 -0.12000;0.17114;0.03798;,
 -0.14875;0.17858;-0.21804;,
 -0.12000;0.12824;-0.28021;,
 -0.14875;0.25050;-0.12923;,
 -0.12000;0.30085;-0.06706;,
 -0.14875;0.30829;-0.32307;,
 -0.12000;0.25795;-0.38524;,
 -0.14875;0.38021;-0.23426;,
 -0.12000;0.43055;-0.17209;,
 -0.14875;0.43800;-0.42811;,
 -0.12000;0.38765;-0.49027;,
 -0.14875;0.50992;-0.33929;,
 -0.12000;0.56026;-0.27713;,
 -0.12000;0.57490;-0.52426;,
 -0.09700;0.53462;-0.57399;,
 -0.12000;0.63243;-0.45321;,
 -0.09700;0.67271;-0.40347;,
 -0.12000;-0.47740;0.56315;,
 0.11000;-0.47740;0.56315;,
 0.11000;-0.34769;0.45812;,
 -0.12000;-0.34769;0.45812;,
 0.11000;-0.21798;0.35308;,
 -0.12000;-0.21798;0.35308;,
 0.11000;-0.08827;0.24805;,
 -0.12000;-0.08827;0.24805;,
 0.11000;0.04143;0.14301;,
 -0.12000;0.04143;0.14301;,
 0.11000;0.17114;0.03798;,
 -0.12000;0.17114;0.03798;,
 0.11000;0.30085;-0.06706;,
 -0.12000;0.30085;-0.06706;,
 0.11000;0.43055;-0.17209;,
 -0.12000;0.43055;-0.17209;,
 0.11000;0.56026;-0.27713;,
 -0.12000;0.56026;-0.27713;,
 0.08700;0.67271;-0.40347;,
 -0.09700;0.67271;-0.40347;,
 0.11000;-0.47740;0.56315;,
 0.13875;-0.52774;0.50098;,
 0.13875;-0.39803;0.39595;,
 0.11000;-0.34769;0.45812;,
 0.13875;-0.59966;0.41217;,
 0.13875;-0.46995;0.30713;,
 0.11000;-0.65000;0.35000;,
 0.11000;-0.52029;0.24497;,
 0.13875;-0.26832;0.29091;,
 0.11000;-0.21798;0.35308;,
 0.13875;-0.34024;0.20210;,
 0.11000;-0.39059;0.13993;,
 0.13875;-0.13862;0.18588;,
 0.11000;-0.08827;0.24805;,
 0.13875;-0.21054;0.09707;,
 0.11000;-0.26088;0.03490;,
 0.13875;-0.00891;0.08084;,
 0.11000;0.04143;0.14301;,
 0.13875;-0.08083;-0.00797;,
 0.11000;-0.13117;-0.07014;,
 0.13875;0.12080;-0.02419;,
 0.11000;0.17114;0.03798;,
 0.13875;0.04888;-0.11300;,
 0.11000;-0.00147;-0.17517;,
 0.13875;0.25050;-0.12923;,
 0.11000;0.30085;-0.06706;,
 0.13875;0.17858;-0.21804;,
 0.11000;0.12824;-0.28021;,
 0.13875;0.38021;-0.23426;,
 0.11000;0.43055;-0.17209;,
 0.13875;0.30829;-0.32307;,
 0.11000;0.25795;-0.38524;,
 0.13875;0.50992;-0.33929;,
 0.11000;0.56026;-0.27713;,
 0.13875;0.43800;-0.42811;,
 0.11000;0.38765;-0.49027;,
 0.11000;0.63243;-0.45321;,
 0.08700;0.67271;-0.40347;,
 0.11000;0.57490;-0.52426;,
 0.08700;0.53462;-0.57399;,
 0.11000;-0.65000;0.35000;,
 -0.12000;-0.65000;0.35000;,
 -0.12000;-0.52029;0.24497;,
 0.11000;-0.52029;0.24497;,
 -0.12000;-0.39059;0.13993;,
 0.11000;-0.39059;0.13993;,
 -0.12000;-0.26088;0.03490;,
 0.11000;-0.26088;0.03490;,
 -0.12000;-0.13117;-0.07014;,
 0.11000;-0.13117;-0.07014;,
 -0.12000;-0.00147;-0.17517;,
 0.11000;-0.00147;-0.17517;,
 -0.12000;0.12824;-0.28021;,
 0.11000;0.12824;-0.28021;,
 -0.12000;0.25795;-0.38524;,
 0.11000;0.25795;-0.38524;,
 -0.12000;0.38765;-0.49027;,
 0.11000;0.38765;-0.49027;,
 -0.09700;0.53462;-0.57399;,
 0.08700;0.53462;-0.57399;,
 0.13875;-0.59966;0.41217;,
 -0.14875;-0.59966;0.41217;,
 -0.12000;-0.65000;0.35000;,
 0.13875;-0.52774;0.50098;,
 -0.14875;-0.52774;0.50098;,
 -0.12000;-0.47740;0.56315;,
 -0.09700;0.53462;-0.57399;,
 -0.12000;0.57490;-0.52426;,
 0.11000;0.57490;-0.52426;,
 -0.12000;0.63243;-0.45321;,
 0.11000;0.63243;-0.45321;,
 -0.09700;0.67271;-0.40347;,
 -0.11479;-0.78920;0.25259;,
 -0.22350;-0.69467;0.36934;,
 -0.23500;-0.61027;0.29082;,
 -0.12057;-0.70979;0.16793;,
 -0.22350;-0.50560;0.60282;,
 -0.23500;-0.41125;0.53659;,
 -0.11479;-0.41106;0.71956;,
 -0.12057;-0.31174;0.65948;,
 -0.11479;-0.41106;0.71956;,
 -0.11425;-0.41106;0.71956;,
 -0.12000;-0.31174;0.65948;,
 -0.12057;-0.31174;0.65948;,
 0.10425;-0.41106;0.71956;,
 0.11000;-0.31174;0.65948;,
 0.10480;-0.41106;0.71956;,
 0.11058;-0.31174;0.65948;,
 0.10480;-0.41106;0.71956;,
 0.21350;-0.50560;0.60282;,
 0.22500;-0.41125;0.53659;,
 0.11058;-0.31174;0.65948;,
 0.21350;-0.69467;0.36934;,
 0.22500;-0.61027;0.29082;,
 0.10480;-0.78920;0.25259;,
 0.11058;-0.70979;0.16793;,
 0.10480;-0.78920;0.25259;,
 0.10425;-0.78920;0.25259;,
 0.11000;-0.70979;0.16793;,
 0.11058;-0.70979;0.16793;,
 -0.11425;-0.78920;0.25259;,
 -0.12000;-0.70979;0.16793;,
 -0.11479;-0.78920;0.25259;,
 -0.12057;-0.70979;0.16793;,
 0.21350;-0.69467;0.36934;,
 0.10425;-0.69467;0.36934;,
 0.10425;-0.78920;0.25259;,
 0.21350;-0.50560;0.60282;,
 0.10425;-0.50560;0.60282;,
 0.10425;-0.41106;0.71956;,
 -0.11425;-0.69467;0.36934;,
 -0.11425;-0.78920;0.25259;,
 -0.11425;-0.50560;0.60282;,
 -0.11425;-0.41106;0.71956;,
 -0.22350;-0.69467;0.36934;,
 -0.11479;-0.78920;0.25259;,
 -0.22350;-0.50560;0.60282;,
 -0.11479;-0.41106;0.71956;,
 0.11000;-0.70979;0.16793;,
 0.11000;-0.61027;0.29082;,
 0.22500;-0.61027;0.29082;,
 0.11000;-0.41125;0.53659;,
 0.22500;-0.41125;0.53659;,
 0.11000;-0.31174;0.65948;,
 -0.12000;-0.70979;0.16793;,
 -0.12000;-0.61027;0.29082;,
 -0.12000;-0.41125;0.53659;,
 -0.12000;-0.31174;0.65948;,
 -0.12057;-0.70979;0.16793;,
 -0.23500;-0.61027;0.29082;,
 -0.23500;-0.41125;0.53659;,
 -0.12057;-0.31174;0.65948;,
 -0.09911;-4.95460;4.15421;,
 -0.10565;-4.92398;4.19203;,
 -0.09911;-2.79756;2.44702;,
 -0.09911;-2.98625;2.33836;,
 -0.09911;-0.60235;0.67662;,
 -0.09911;-0.74903;0.50717;,
 -0.10003;-0.50410;0.62222;,
 -0.10003;-0.69097;0.39166;,
 -0.10565;-4.92398;4.19203;,
 -0.01402;-5.39878;4.57652;,
 -0.00747;-2.79756;2.44702;,
 -0.09911;-2.79756;2.44702;,
 0.07761;-4.92398;4.19203;,
 0.08416;-2.79756;2.44702;,
 -0.00747;-0.60235;0.67662;,
 -0.09911;-0.60235;0.67662;,
 0.08416;-0.60235;0.67662;,
 -0.00747;-0.50410;0.62222;,
 -0.10003;-0.50410;0.62222;,
 0.08508;-0.50410;0.62222;,
 0.07761;-4.92398;4.19203;,
 0.08416;-4.95460;4.15421;,
 0.08416;-2.98625;2.33836;,
 0.08416;-2.79756;2.44702;,
 0.08416;-0.74903;0.50717;,
 0.08416;-0.60235;0.67662;,
 0.08508;-0.69097;0.39166;,
 0.08508;-0.50410;0.62222;,
 0.08416;-4.95460;4.15421;,
 -0.00747;-4.99098;4.12390;,
 -0.00747;-3.04206;2.26944;,
 0.08416;-2.98625;2.33836;,
 -0.09911;-4.95460;4.15421;,
 -0.09911;-2.98625;2.33836;,
 -0.00747;-0.81243;0.42888;,
 0.08416;-0.74903;0.50717;,
 -0.09911;-0.74903;0.50717;,
 -0.00747;-0.72853;0.34528;,
 0.08508;-0.69097;0.39166;,
 -0.10003;-0.69097;0.39166;,
 -0.01402;-5.39878;4.57652;,
 -0.00747;-4.99098;4.12390;,
 -0.10565;-4.92398;4.19203;,
 -0.09911;-4.95460;4.15421;,
 -0.00747;-0.72853;0.34528;,
 -0.00747;-0.50410;0.62222;,
 -0.10003;-0.69097;0.39166;,
 -0.10003;-0.50410;0.62222;;
 
 130;
 4;0,1,2,3;,
 4;1,4,5,2;,
 4;4,6,7,5;,
 4;3,2,8,9;,
 4;2,5,10,8;,
 4;5,7,11,10;,
 4;9,8,12,13;,
 4;8,10,14,12;,
 4;10,11,15,14;,
 4;13,12,16,17;,
 4;12,14,18,16;,
 4;14,15,19,18;,
 4;17,16,20,21;,
 4;16,18,22,20;,
 4;18,19,23,22;,
 4;21,20,24,25;,
 4;20,22,26,24;,
 4;22,23,27,26;,
 4;25,24,28,29;,
 4;24,26,30,28;,
 4;26,27,31,30;,
 4;29,28,32,33;,
 4;28,30,34,32;,
 4;30,31,35,34;,
 4;33,32,36,37;,
 4;32,34,38,36;,
 4;34,35,39,38;,
 4;40,41,42,43;,
 4;43,42,44,45;,
 4;45,44,46,47;,
 4;47,46,48,49;,
 4;49,48,50,51;,
 4;51,50,52,53;,
 4;53,52,54,55;,
 4;55,54,56,57;,
 4;57,56,58,59;,
 4;60,61,62,63;,
 4;61,64,65,62;,
 4;64,66,67,65;,
 4;63,62,68,69;,
 4;62,65,70,68;,
 4;65,67,71,70;,
 4;69,68,72,73;,
 4;68,70,74,72;,
 4;70,71,75,74;,
 4;73,72,76,77;,
 4;72,74,78,76;,
 4;74,75,79,78;,
 4;77,76,80,81;,
 4;76,78,82,80;,
 4;78,79,83,82;,
 4;81,80,84,85;,
 4;80,82,86,84;,
 4;82,83,87,86;,
 4;85,84,88,89;,
 4;84,86,90,88;,
 4;86,87,91,90;,
 4;89,88,92,93;,
 4;88,90,94,92;,
 4;90,91,95,94;,
 4;93,92,96,97;,
 4;92,94,98,96;,
 4;94,95,99,98;,
 4;100,101,102,103;,
 4;103,102,104,105;,
 4;105,104,106,107;,
 4;107,106,108,109;,
 4;109,108,110,111;,
 4;111,110,112,113;,
 4;113,112,114,115;,
 4;115,114,116,117;,
 4;117,116,118,119;,
 4;100,120,121,122;,
 4;120,123,124,121;,
 4;123,41,125,124;,
 4;126,127,128,119;,
 4;127,129,130,128;,
 4;129,131,58,130;,
 4;132,133,134,135;,
 4;133,136,137,134;,
 4;136,138,139,137;,
 4;140,141,142,143;,
 4;141,144,145,142;,
 4;144,146,147,145;,
 4;148,149,150,151;,
 4;149,152,153,150;,
 4;152,154,155,153;,
 4;156,157,158,159;,
 4;157,160,161,158;,
 4;160,162,163,161;,
 4;156,164,165,166;,
 4;164,167,168,165;,
 4;167,146,169,168;,
 4;166,165,170,171;,
 4;165,168,172,170;,
 4;168,169,173,172;,
 4;171,170,174,175;,
 4;170,172,176,174;,
 4;172,173,177,176;,
 4;178,179,180,159;,
 4;179,181,182,180;,
 4;181,183,147,182;,
 4;184,185,179,178;,
 4;185,186,181,179;,
 4;186,187,183,181;,
 4;188,189,185,184;,
 4;189,190,186,185;,
 4;190,191,187,186;,
 4;192,193,194,195;,
 4;195,194,196,197;,
 4;197,196,198,199;,
 4;200,201,202,203;,
 4;201,204,205,202;,
 4;203,202,206,207;,
 4;202,205,208,206;,
 4;207,206,209,210;,
 4;206,208,211,209;,
 4;212,213,214,215;,
 4;215,214,216,217;,
 4;217,216,218,219;,
 4;220,221,222,223;,
 4;221,224,225,222;,
 4;223,222,226,227;,
 4;222,225,228,226;,
 4;227,226,229,230;,
 4;226,228,231,229;,
 4;220,204,232,233;,
 4;233,232,234,235;,
 4;236,237,211,230;,
 4;238,239,237,236;;
 
 MeshMaterialList {
  10;
  130;
  1,
  1,
  1,
  0,
  5,
  0,
  0,
  0,
  0,
  0,
  5,
  0,
  0,
  0,
  0,
  0,
  5,
  0,
  0,
  0,
  0,
  0,
  5,
  0,
  0,
  0,
  0,
  1,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  1,
  1,
  1,
  0,
  5,
  0,
  0,
  0,
  0,
  0,
  5,
  0,
  0,
  0,
  0,
  0,
  5,
  0,
  0,
  0,
  0,
  0,
  5,
  0,
  0,
  0,
  0,
  1,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  9,
  9,
  0,
  9,
  9,
  9,
  9,
  0,
  0,
  9,
  9,
  0,
  9,
  9,
  9,
  9,
  0,
  0,
  9,
  9,
  0,
  0;;
  Material {
   0.000000;0.000000;0.000000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.200800;0.200800;0.200800;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.432800;0.432800;0.432800;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.000000;0.690400;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.558400;0.558400;0.558400;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.800000;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.605600;0.605600;0.605600;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.708800;0.166400;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.000000;0.000000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.783900;0.783900;0.783900;0.950000;;
   25.000000;
   0.250000;0.250000;0.250000;;
   0.000000;0.000000;0.000000;;
  }
 }
 MeshNormals {
  176;
  -0.941063;-0.212853;-0.262857;,
  -0.985156;-0.108030;-0.133409;,
  -0.985157;0.108022;0.133405;,
  -0.941065;-0.212852;-0.262850;,
  -0.985156;-0.108029;-0.133405;,
  -0.985157;0.108025;0.133403;,
  -0.941070;-0.212842;-0.262840;,
  -0.985157;-0.108025;-0.133400;,
  -0.985157;0.108025;0.133400;,
  -0.941071;-0.212842;-0.262839;,
  -0.985157;-0.108024;-0.133399;,
  -0.985158;0.108024;0.133396;,
  -0.941071;-0.212842;-0.262839;,
  -0.985157;-0.108024;-0.133399;,
  -0.985157;0.108025;0.133400;,
  -0.941073;-0.212841;-0.262832;,
  -0.985158;-0.108024;-0.133396;,
  -0.985157;0.108025;0.133400;,
  -0.941070;-0.212843;-0.262839;,
  -0.985157;-0.108025;-0.133399;,
  -0.985158;0.108024;0.133396;,
  -0.941068;-0.212844;-0.262848;,
  -0.985157;-0.108026;-0.133404;,
  -0.985157;0.108025;0.133403;,
  -0.937119;-0.140880;-0.319314;,
  -0.981206;-0.037866;-0.189212;,
  -0.981207;0.177201;0.076377;,
  -0.925313;-0.067728;-0.373107;,
  -0.969360;0.032571;-0.243474;,
  -0.969363;0.244915;0.018757;,
  -0.941068;0.212838;0.262850;,
  -0.941068;0.212844;0.262846;,
  -0.941071;0.212843;0.262839;,
  -0.941072;0.212842;0.262833;,
  -0.941070;0.212843;0.262840;,
  -0.941070;0.212843;0.262840;,
  -0.941073;0.212842;0.262832;,
  -0.941068;0.212844;0.262846;,
  -0.937123;0.283035;0.204184;,
  -0.925326;0.350846;0.143800;,
  0.000000;0.629296;0.777166;,
  0.985157;0.108023;0.133406;,
  0.985155;-0.108030;-0.133409;,
  0.000000;0.629313;0.777152;,
  0.985157;0.108026;0.133403;,
  0.985156;-0.108030;-0.133406;,
  0.985157;0.108025;0.133400;,
  0.985157;-0.108025;-0.133401;,
  0.000000;0.629327;0.777140;,
  0.985158;0.108024;0.133397;,
  0.985157;-0.108025;-0.133400;,
  0.000000;0.629327;0.777141;,
  0.985157;0.108025;0.133400;,
  0.985157;-0.108025;-0.133400;,
  0.000000;0.629313;0.777152;,
  0.985157;0.108025;0.133400;,
  0.985158;-0.108024;-0.133396;,
  0.000000;0.629327;0.777141;,
  0.985158;0.108025;0.133397;,
  0.985157;-0.108025;-0.133400;,
  0.000000;0.629327;0.777140;,
  0.985157;0.108026;0.133404;,
  0.985157;-0.108026;-0.133404;,
  0.000000;0.690439;0.723390;,
  0.981207;0.177201;0.076377;,
  0.981206;-0.037866;-0.189212;,
  0.000000;0.746976;0.664851;,
  0.969363;0.244915;0.018756;,
  0.969360;0.032571;-0.243474;,
  0.941063;-0.212854;-0.262858;,
  0.941065;-0.212852;-0.262851;,
  0.941070;-0.212843;-0.262841;,
  0.941070;-0.212843;-0.262839;,
  0.941070;-0.212843;-0.262839;,
  0.941072;-0.212842;-0.262833;,
  0.941070;-0.212844;-0.262840;,
  0.941067;-0.212845;-0.262849;,
  0.937118;-0.140880;-0.319315;,
  0.925313;-0.067727;-0.373107;,
  -0.450570;-0.666262;-0.594207;,
  -0.945094;-0.282169;-0.164860;,
  -0.945093;0.102602;0.310278;,
  -0.450566;0.442731;0.775228;,
  0.000000;0.517582;0.855634;,
  0.000000;0.517582;0.855634;,
  0.450585;0.442724;0.775221;,
  0.945099;0.102590;0.310262;,
  0.945100;-0.282155;-0.164845;,
  0.450588;-0.666256;-0.594199;,
  0.000000;-0.729357;-0.684133;,
  0.000000;-0.777164;0.629299;,
  0.000000;-0.777135;0.629334;,
  0.000000;-0.777164;0.629299;,
  0.000000;-0.777135;0.629334;,
  0.000000;0.777138;-0.629330;,
  0.000000;0.777152;-0.629312;,
  0.000000;0.777138;-0.629330;,
  -0.852798;-0.386020;-0.351744;,
  -0.902273;-0.285441;-0.323153;,
  -0.916608;-0.293063;-0.271925;,
  -0.902898;-0.348029;-0.252291;,
  -0.940140;-0.272973;-0.204013;,
  -0.000231;0.633916;0.773402;,
  -0.999434;-0.022368;-0.025143;,
  -0.000115;0.630847;0.775908;,
  -0.999992;-0.003071;0.002569;,
  0.000000;0.558167;0.829729;,
  -0.999968;-0.006142;0.005139;,
  0.000000;0.484392;0.874851;,
  -0.017994;0.633841;0.773254;,
  -0.008997;0.630835;0.775865;,
  0.000000;0.558167;0.829729;,
  0.895639;-0.340764;-0.285851;,
  0.749716;-0.503747;-0.429145;,
  0.916323;-0.265001;-0.300212;,
  0.652804;-0.501409;-0.567835;,
  0.916619;-0.293046;-0.271909;,
  0.678893;-0.535507;-0.502332;,
  0.902909;-0.348010;-0.252278;,
  0.631989;-0.622866;-0.461117;,
  0.941068;0.212839;0.262851;,
  0.941068;0.212845;0.262846;,
  0.941070;0.212843;0.262840;,
  0.941072;0.212842;0.262834;,
  0.941070;0.212843;0.262841;,
  0.941070;0.212844;0.262841;,
  0.941072;0.212842;0.262833;,
  0.941068;0.212844;0.262847;,
  0.937123;0.283036;0.204185;,
  0.925326;0.350846;0.143800;,
  0.000000;-0.629296;-0.777166;,
  0.000000;-0.629328;-0.777140;,
  0.000000;-0.629327;-0.777141;,
  0.000000;-0.629313;-0.777152;,
  0.000000;-0.629327;-0.777141;,
  0.000000;-0.629327;-0.777141;,
  0.000000;-0.629313;-0.777152;,
  0.000000;-0.629308;-0.777156;,
  0.000000;-0.564014;-0.825765;,
  0.000000;-0.494965;-0.868913;,
  0.000000;-0.777175;0.629285;,
  0.000000;-0.777154;0.629311;,
  0.000000;-0.777152;0.629313;,
  0.000000;-0.777171;0.629290;,
  0.000000;0.777076;-0.629407;,
  0.000000;0.777124;-0.629347;,
  0.000000;0.777153;-0.629312;,
  0.000000;0.777134;-0.629335;,
  0.000000;-0.777184;0.629274;,
  0.000000;-0.777164;0.629299;,
  0.000000;-0.777184;0.629274;,
  0.000000;-0.777127;0.629343;,
  0.000000;-0.777127;0.629344;,
  0.000000;-0.777184;0.629274;,
  0.000000;-0.777135;0.629334;,
  0.000000;0.777130;-0.629341;,
  0.000000;0.777158;-0.629305;,
  0.000000;0.777158;-0.629305;,
  0.000000;0.777130;-0.629341;,
  0.000000;0.777130;-0.629341;,
  0.017533;0.633792;0.773305;,
  0.008767;0.630809;0.775889;,
  0.000000;0.558167;0.829729;,
  0.975476;-0.196529;-0.099109;,
  0.999432;0.022401;0.025181;,
  0.999992;-0.003071;0.002569;,
  0.999968;-0.006142;0.005139;,
  -0.705767;-0.526054;-0.474511;,
  -0.652764;-0.501431;-0.567861;,
  -0.678854;-0.535533;-0.502357;,
  -0.631948;-0.622893;-0.461135;,
  0.874156;-0.421904;-0.240517;,
  -0.808217;-0.479655;-0.341638;,
  -0.000011;0.776893;-0.629633;,
  0.000111;0.776893;-0.629633;,
  -0.000133;0.776893;-0.629633;;
  130;
  4;0,1,4,3;,
  4;1,2,5,4;,
  4;2,30,31,5;,
  4;3,4,7,6;,
  4;4,5,8,7;,
  4;5,31,32,8;,
  4;6,7,10,9;,
  4;7,8,11,10;,
  4;8,32,33,11;,
  4;9,10,13,12;,
  4;10,11,14,13;,
  4;11,33,34,14;,
  4;12,13,16,15;,
  4;13,14,17,16;,
  4;14,34,35,17;,
  4;15,16,19,18;,
  4;16,17,20,19;,
  4;17,35,36,20;,
  4;18,19,22,21;,
  4;19,20,23,22;,
  4;20,36,37,23;,
  4;21,22,25,24;,
  4;22,23,26,25;,
  4;23,37,38,26;,
  4;24,25,28,27;,
  4;25,26,29,28;,
  4;26,38,39,29;,
  4;40,40,43,43;,
  4;43,43,43,43;,
  4;43,43,48,48;,
  4;48,48,51,51;,
  4;51,51,54,54;,
  4;54,54,57,57;,
  4;57,57,60,60;,
  4;60,60,63,63;,
  4;63,63,66,66;,
  4;120,41,44,121;,
  4;41,42,45,44;,
  4;42,69,70,45;,
  4;121,44,46,122;,
  4;44,45,47,46;,
  4;45,70,71,47;,
  4;122,46,49,123;,
  4;46,47,50,49;,
  4;47,71,72,50;,
  4;123,49,52,124;,
  4;49,50,53,52;,
  4;50,72,73,53;,
  4;124,52,55,125;,
  4;52,53,56,55;,
  4;53,73,74,56;,
  4;125,55,58,126;,
  4;55,56,59,58;,
  4;56,74,75,59;,
  4;126,58,61,127;,
  4;58,59,62,61;,
  4;59,75,76,62;,
  4;127,61,64,128;,
  4;61,62,65,64;,
  4;62,76,77,65;,
  4;128,64,67,129;,
  4;64,65,68,67;,
  4;65,77,78,68;,
  4;130,130,131,131;,
  4;131,131,132,132;,
  4;132,132,133,133;,
  4;133,133,134,134;,
  4;134,134,135,135;,
  4;135,135,136,136;,
  4;136,136,137,137;,
  4;137,137,138,138;,
  4;138,138,139,139;,
  4;140,141,141,140;,
  4;141,142,142,141;,
  4;142,143,143,142;,
  4;144,145,145,144;,
  4;145,146,146,145;,
  4;146,147,147,146;,
  4;79,80,80,79;,
  4;80,81,81,80;,
  4;81,82,82,81;,
  4;82,83,83,82;,
  4;83,84,84,83;,
  4;84,85,85,84;,
  4;85,86,86,85;,
  4;86,87,87,86;,
  4;87,88,88,87;,
  4;88,89,89,88;,
  4;89,89,89,89;,
  4;89,79,79,89;,
  4;148,149,90,150;,
  4;149,91,91,90;,
  4;91,151,152,91;,
  4;150,90,92,153;,
  4;90,91,93,92;,
  4;91,152,152,93;,
  4;153,92,92,150;,
  4;92,93,154,92;,
  4;93,152,151,154;,
  4;155,94,94,155;,
  4;94,95,95,94;,
  4;95,156,157,95;,
  4;158,96,94,155;,
  4;96,95,95,94;,
  4;95,156,156,95;,
  4;159,94,96,158;,
  4;94,95,95,96;,
  4;95,157,156,95;,
  4;97,101,103,98;,
  4;98,103,105,99;,
  4;99,105,107,100;,
  4;160,102,104,161;,
  4;102,109,110,104;,
  4;161,104,106,162;,
  4;104,110,111,106;,
  4;162,106,108,108;,
  4;106,111,108,108;,
  4;163,112,114,164;,
  4;164,114,116,165;,
  4;165,116,118,166;,
  4;112,113,115,114;,
  4;167,97,98,168;,
  4;114,115,117,116;,
  4;168,98,99,169;,
  4;116,117,119,118;,
  4;169,99,100,170;,
  4;112,163,171,113;,
  4;167,172,101,97;,
  4;173,173,174,174;,
  4;175,175,173,173;;
 }
 MeshTextureCoords {
  240;
  0.000000;0.000000;,
  0.333330;0.000000;,
  0.333330;0.111110;,
  0.000000;0.111110;,
  0.666670;0.000000;,
  0.666670;0.111110;,
  1.000000;0.000000;,
  1.000000;0.111110;,
  0.333330;0.222220;,
  0.000000;0.222220;,
  0.666670;0.222220;,
  1.000000;0.222220;,
  0.333330;0.333330;,
  0.000000;0.333330;,
  0.666670;0.333330;,
  1.000000;0.333330;,
  0.333330;0.444440;,
  0.000000;0.444440;,
  0.666670;0.444440;,
  1.000000;0.444440;,
  0.333330;0.555560;,
  0.000000;0.555560;,
  0.666670;0.555560;,
  1.000000;0.555560;,
  0.333330;0.666670;,
  0.000000;0.666670;,
  0.666670;0.666670;,
  1.000000;0.666670;,
  0.333330;0.777780;,
  0.000000;0.777780;,
  0.666670;0.777780;,
  1.000000;0.777780;,
  0.333330;0.888890;,
  0.000000;0.888890;,
  0.666670;0.888890;,
  1.000000;0.888890;,
  0.333330;1.000000;,
  0.000000;1.000000;,
  0.666670;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;0.111110;,
  0.000000;0.111110;,
  1.000000;0.222220;,
  0.000000;0.222220;,
  1.000000;0.333330;,
  0.000000;0.333330;,
  1.000000;0.444440;,
  0.000000;0.444440;,
  1.000000;0.555560;,
  0.000000;0.555560;,
  1.000000;0.666670;,
  0.000000;0.666670;,
  1.000000;0.777780;,
  0.000000;0.777780;,
  1.000000;0.888890;,
  0.000000;0.888890;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  0.333330;0.000000;,
  0.333330;0.111110;,
  0.000000;0.111110;,
  0.666670;0.000000;,
  0.666670;0.111110;,
  1.000000;0.000000;,
  1.000000;0.111110;,
  0.333330;0.222220;,
  0.000000;0.222220;,
  0.666670;0.222220;,
  1.000000;0.222220;,
  0.333330;0.333330;,
  0.000000;0.333330;,
  0.666670;0.333330;,
  1.000000;0.333330;,
  0.333330;0.444440;,
  0.000000;0.444440;,
  0.666670;0.444440;,
  1.000000;0.444440;,
  0.333330;0.555560;,
  0.000000;0.555560;,
  0.666670;0.555560;,
  1.000000;0.555560;,
  0.333330;0.666670;,
  0.000000;0.666670;,
  0.666670;0.666670;,
  1.000000;0.666670;,
  0.333330;0.777780;,
  0.000000;0.777780;,
  0.666670;0.777780;,
  1.000000;0.777780;,
  0.333330;0.888890;,
  0.000000;0.888890;,
  0.666670;0.888890;,
  1.000000;0.888890;,
  0.333330;1.000000;,
  0.000000;1.000000;,
  0.666670;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;0.111110;,
  0.000000;0.111110;,
  1.000000;0.222220;,
  0.000000;0.222220;,
  1.000000;0.333330;,
  0.000000;0.333330;,
  1.000000;0.444440;,
  0.000000;0.444440;,
  1.000000;0.555560;,
  0.000000;0.555560;,
  1.000000;0.666670;,
  0.000000;0.666670;,
  1.000000;0.777780;,
  0.000000;0.777780;,
  1.000000;0.888890;,
  0.000000;0.888890;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.333330;0.000000;,
  0.333330;1.000000;,
  0.000000;1.000000;,
  0.666670;0.000000;,
  0.666670;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.333330;0.000000;,
  0.333330;1.000000;,
  0.666670;0.000000;,
  0.666670;1.000000;,
  1.000000;0.000000;,
  0.000000;0.000000;,
  0.333330;0.000000;,
  0.333330;1.000000;,
  0.000000;1.000000;,
  0.666670;0.000000;,
  0.666670;1.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.333330;0.000000;,
  0.333330;1.000000;,
  0.000000;1.000000;,
  0.666670;0.000000;,
  0.666670;1.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.333330;0.000000;,
  0.333330;1.000000;,
  0.000000;1.000000;,
  0.666670;0.000000;,
  0.666670;1.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.333330;0.000000;,
  0.333330;1.000000;,
  0.000000;1.000000;,
  0.666670;0.000000;,
  0.666670;1.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.333330;0.000000;,
  0.333330;0.333330;,
  0.000000;0.333330;,
  0.666670;0.000000;,
  0.666670;0.333330;,
  1.000000;0.333330;,
  0.333330;0.666670;,
  0.000000;0.666670;,
  0.666670;0.666670;,
  1.000000;0.666670;,
  0.333330;1.000000;,
  0.000000;1.000000;,
  0.666670;1.000000;,
  1.000000;1.000000;,
  0.000000;0.666670;,
  0.333330;0.666670;,
  0.333330;1.000000;,
  0.666670;0.666670;,
  0.666670;1.000000;,
  1.000000;0.666670;,
  0.000000;0.333330;,
  0.333330;0.333330;,
  0.666670;0.333330;,
  1.000000;0.333330;,
  0.000000;0.000000;,
  0.333330;0.000000;,
  0.666670;0.000000;,
  1.000000;0.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;0.333330;,
  0.000000;0.333330;,
  1.000000;0.666670;,
  0.000000;0.666670;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  0.500000;0.000000;,
  0.500000;0.333330;,
  0.000000;0.333330;,
  1.000000;0.000000;,
  1.000000;0.333330;,
  0.500000;0.666670;,
  0.000000;0.666670;,
  1.000000;0.666670;,
  0.500000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;0.333330;,
  0.000000;0.333330;,
  1.000000;0.666670;,
  0.000000;0.666670;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  0.500000;0.000000;,
  0.500000;0.333330;,
  0.000000;0.333330;,
  1.000000;0.000000;,
  1.000000;0.333330;,
  0.500000;0.666670;,
  0.000000;0.666670;,
  1.000000;0.666670;,
  0.500000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  1.000000;0.500000;,
  0.000000;0.500000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.500000;,
  1.000000;0.500000;,
  0.000000;0.000000;,
  1.000000;0.000000;;
 }
}
