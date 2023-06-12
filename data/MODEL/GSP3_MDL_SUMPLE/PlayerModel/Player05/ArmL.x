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
 233;
 0.00000;-0.30000;-0.36552;,
 0.00000;-0.41817;-0.34724;,
 -0.07561;-0.41817;-0.32081;,
 -0.13987;-0.30000;-0.33769;,
 -0.18826;-0.41817;-0.24554;,
 -0.25845;-0.30000;-0.25846;,
 -0.26353;-0.41817;-0.13289;,
 -0.33769;-0.30000;-0.13988;,
 -0.28996;-0.41817;0.00000;,
 -0.36551;-0.30000;0.00000;,
 -0.34342;-0.41817;0.13288;,
 -0.33769;-0.30000;0.13987;,
 -0.18826;-0.41817;0.41386;,
 -0.25845;-0.30000;0.25845;,
 -0.07561;-0.41817;0.48913;,
 -0.13987;-0.30000;0.33769;,
 0.00000;-0.41817;0.51556;,
 0.00000;-0.30000;0.36551;,
 0.09004;-0.53280;0.48913;,
 0.13988;-0.30000;0.33769;,
 0.20270;-0.53280;0.24553;,
 0.25846;-0.30000;0.25845;,
 0.35643;-0.41098;0.13288;,
 0.33769;-0.30000;0.13987;,
 0.38286;-0.41098;-0.00000;,
 0.36552;-0.30000;-0.00000;,
 0.27797;-0.53280;-0.13289;,
 0.33769;-0.30000;-0.13988;,
 0.20270;-0.53280;-0.24554;,
 0.25846;-0.30000;-0.25846;,
 0.09004;-0.53280;-0.32081;,
 0.13988;-0.30000;-0.33769;,
 0.00000;-0.41817;-0.34724;,
 0.00000;-0.30000;-0.36552;,
 0.00000;-0.79842;-0.31339;,
 -0.26955;-0.79842;-0.23283;,
 -0.37122;-0.79842;-0.16490;,
 -0.43915;-0.79842;-0.06323;,
 -0.46301;-0.79842;0.05670;,
 -0.50246;-0.79842;0.17662;,
 -0.42180;-0.79842;0.38992;,
 -0.32013;-0.79842;0.45785;,
 -0.04112;-0.79842;0.54061;,
 0.11993;-0.79842;0.28952;,
 0.22160;-0.79842;0.22159;,
 0.28953;-0.79842;0.11992;,
 0.31338;-0.79842;-0.00000;,
 0.28953;-0.79842;-0.11993;,
 0.24984;-0.79842;-0.30134;,
 0.11993;-0.79842;-0.46084;,
 0.00000;-0.79842;-0.31339;,
 0.28191;-1.12565;-0.57613;,
 0.23166;-1.12565;-0.59278;,
 0.12999;-1.12565;-0.52485;,
 -0.21985;-1.12565;-0.16045;,
 -0.38951;-1.12565;-0.04052;,
 -0.28952;-1.12565;0.11992;,
 -0.22159;-1.12565;0.22159;,
 -0.16200;-1.12565;0.36090;,
 0.00000;-1.12565;0.38476;,
 0.11993;-1.12565;0.36090;,
 0.22160;-1.12565;0.22159;,
 0.28953;-1.12565;0.11992;,
 0.31338;-1.12565;-0.00000;,
 0.28953;-1.12565;-0.11993;,
 0.47358;-1.12565;-0.23077;,
 0.40184;-1.12565;-0.55227;,
 0.28191;-1.12565;-0.57613;,
 0.00000;-1.51477;-0.29516;,
 -0.11295;-1.51477;-0.27269;,
 -0.20870;-1.51477;-0.20871;,
 -0.27268;-1.51477;-0.11295;,
 -0.29515;-1.51477;0.00000;,
 -0.27268;-1.51477;0.11295;,
 -0.20870;-1.51477;0.20870;,
 -0.11295;-1.51477;0.27268;,
 0.00000;-1.51477;0.29515;,
 0.11295;-1.51477;0.27268;,
 0.20871;-1.51477;0.20870;,
 0.27269;-1.51477;0.11295;,
 0.29515;-1.51477;-0.00000;,
 0.27269;-1.51477;-0.11295;,
 0.20871;-1.51477;-0.20871;,
 0.11295;-1.51477;-0.27269;,
 0.00000;-1.51477;-0.29516;,
 0.00000;-1.74948;-0.31069;,
 -0.11889;-1.61521;-0.28704;,
 -0.21968;-1.61521;-0.21969;,
 -0.28703;-1.61521;-0.11890;,
 -0.31068;-1.61521;0.00000;,
 -0.28703;-1.61521;0.11889;,
 -0.21968;-1.61521;0.21968;,
 -0.11889;-1.61521;0.28703;,
 0.00000;-1.74948;0.31068;,
 0.11890;-1.74948;0.28703;,
 0.21969;-1.74948;0.21968;,
 0.28704;-1.68406;0.11889;,
 0.31069;-1.67469;-0.00000;,
 0.28704;-1.61521;-0.11890;,
 0.21969;-1.74948;-0.21969;,
 0.11890;-1.74948;-0.28704;,
 0.00000;-1.74948;-0.31069;,
 0.00000;-0.30000;-0.00000;,
 0.00000;-0.30000;-0.00000;,
 0.00000;-0.30000;-0.00000;,
 0.00000;-0.30000;-0.00000;,
 0.00000;-0.30000;-0.00000;,
 0.00000;-0.30000;-0.00000;,
 0.00000;-0.30000;-0.00000;,
 0.00000;-0.30000;-0.00000;,
 0.00000;-0.30000;-0.00000;,
 0.00000;-0.30000;-0.00000;,
 0.00000;-0.30000;-0.00000;,
 0.00000;-0.30000;-0.00000;,
 0.00000;-0.30000;-0.00000;,
 0.00000;-0.30000;-0.00000;,
 0.00000;-0.30000;-0.00000;,
 0.00000;-0.30000;-0.00000;,
 0.00000;-1.74948;-0.00000;,
 0.00000;-1.74948;-0.00000;,
 0.00000;-1.74948;-0.00000;,
 0.00000;-1.74948;-0.00000;,
 0.00000;-1.74948;-0.00000;,
 0.00000;-1.74948;-0.00000;,
 0.00000;-1.74948;-0.00000;,
 0.00000;-1.74948;-0.00000;,
 0.00000;-1.74948;-0.00000;,
 0.00000;-1.74948;-0.00000;,
 0.00000;-1.74948;-0.00000;,
 0.00000;-1.74948;-0.00000;,
 0.00000;-1.74948;-0.00000;,
 0.00000;-1.74948;-0.00000;,
 0.00000;-1.74948;-0.00000;,
 0.00000;-1.74948;-0.00000;,
 -0.00600;0.44788;0.00000;,
 -0.00600;0.41363;-0.17221;,
 -0.12777;0.41363;-0.12177;,
 -0.00600;0.44788;0.00000;,
 -0.17820;0.41363;0.00000;,
 -0.00600;0.44788;0.00000;,
 -0.12777;0.41363;0.12177;,
 -0.00600;0.44788;0.00000;,
 -0.00600;0.41363;0.17220;,
 -0.00600;0.44788;0.00000;,
 0.11577;0.41363;0.12177;,
 -0.00600;0.44788;0.00000;,
 0.16621;0.41363;0.00000;,
 -0.00600;0.44788;0.00000;,
 0.11577;0.41363;-0.12177;,
 -0.00600;0.44788;0.00000;,
 -0.00600;0.41363;-0.17221;,
 -0.00600;0.31608;-0.31820;,
 -0.23100;0.31608;-0.22500;,
 -0.32419;0.31608;0.00000;,
 -0.23100;0.31608;0.22500;,
 -0.00600;0.31608;0.31819;,
 0.21900;0.31608;0.22500;,
 0.31220;0.31608;0.00000;,
 0.21900;0.31608;-0.22500;,
 -0.00600;0.31608;-0.31820;,
 -0.00600;0.17009;-0.41575;,
 -0.29997;0.17009;-0.29398;,
 -0.42174;0.17009;0.00000;,
 -0.29997;0.17009;0.29397;,
 -0.00600;0.17009;0.41574;,
 0.28798;0.17009;0.29397;,
 0.40975;0.17009;0.00000;,
 0.28798;0.17009;-0.29398;,
 -0.00600;0.17009;-0.41575;,
 -0.00600;-0.00212;-0.45000;,
 -0.32419;-0.00212;-0.31820;,
 -0.45600;-0.00212;0.00000;,
 -0.32419;-0.00212;0.31819;,
 -0.00600;-0.00212;0.45000;,
 0.31220;-0.00212;0.31819;,
 0.44400;-0.00212;-0.00000;,
 0.31220;-0.00212;-0.31820;,
 -0.00600;-0.00212;-0.45000;,
 -0.00600;-0.17433;-0.41575;,
 -0.29997;-0.17433;-0.29398;,
 -0.42174;-0.17433;0.00000;,
 -0.29997;-0.17433;0.29397;,
 -0.00600;-0.17433;0.41574;,
 0.28798;-0.17433;0.29397;,
 0.40975;-0.17433;-0.00000;,
 0.28798;-0.17433;-0.29398;,
 -0.00600;-0.17433;-0.41575;,
 -0.00600;-0.32032;-0.31820;,
 -0.23100;-0.32032;-0.22500;,
 -0.32419;-0.32032;0.00000;,
 -0.23100;-0.32032;0.22500;,
 -0.00600;-0.32032;0.31819;,
 0.21900;-0.32032;0.22500;,
 0.31220;-0.32032;-0.00000;,
 0.21900;-0.32032;-0.22500;,
 -0.00600;-0.32032;-0.31820;,
 -0.00600;-0.41787;-0.17221;,
 -0.07050;-0.41787;-0.12177;,
 -0.12093;-0.41787;0.00000;,
 -0.07050;-0.41787;0.12177;,
 -0.00600;-0.41787;0.17220;,
 0.07293;-0.53250;0.12177;,
 0.12337;-0.53250;-0.00000;,
 0.07293;-0.53250;-0.12177;,
 -0.00600;-0.41787;-0.17221;,
 -0.00600;-0.45212;0.00000;,
 -0.00600;-0.45212;0.00000;,
 -0.00600;-0.45212;0.00000;,
 -0.00600;-0.45212;0.00000;,
 -0.00600;-0.45212;0.00000;,
 -0.00600;-0.45212;0.00000;,
 -0.00600;-0.45212;0.00000;,
 -0.00600;-0.45212;0.00000;,
 0.10650;-1.66741;-0.29262;,
 0.24164;-1.10016;-0.48623;,
 0.74756;-0.20700;0.17822;,
 -0.04027;-1.10016;0.34789;,
 0.74756;-0.20700;0.17822;,
 -0.06069;-1.66741;0.27654;,
 0.74756;-0.20700;0.17822;,
 0.51767;-1.44543;0.38156;,
 0.74756;-0.20700;0.17822;,
 0.36597;-1.83989;-0.15033;,
 0.74756;-0.20700;0.17822;,
 0.10650;-1.66741;-0.29262;,
 0.74756;-0.20700;0.17822;,
 -0.06069;-1.66741;-0.00804;,
 0.24164;-1.10016;-0.48623;,
 0.10650;-1.66741;-0.29262;,
 -0.04027;-1.10016;0.34789;,
 -0.06069;-1.66741;0.27654;,
 0.51767;-1.44543;0.38156;,
 0.36597;-1.83989;-0.15033;;
 
 188;
 4;0,1,2,3;,
 4;3,2,4,5;,
 4;5,4,6,7;,
 4;7,6,8,9;,
 4;9,8,10,11;,
 4;11,10,12,13;,
 4;13,12,14,15;,
 4;15,14,16,17;,
 4;17,16,18,19;,
 4;19,18,20,21;,
 4;21,20,22,23;,
 4;23,22,24,25;,
 4;25,24,26,27;,
 4;27,26,28,29;,
 4;29,28,30,31;,
 4;31,30,32,33;,
 4;1,34,35,2;,
 4;2,35,36,4;,
 4;4,36,37,6;,
 4;6,37,38,8;,
 4;8,38,39,10;,
 4;10,39,40,12;,
 4;12,40,41,14;,
 4;14,41,42,16;,
 4;16,42,43,18;,
 4;18,43,44,20;,
 4;20,44,45,22;,
 4;22,45,46,24;,
 4;24,46,47,26;,
 4;26,47,48,28;,
 4;28,48,49,30;,
 4;30,49,50,32;,
 4;34,51,52,35;,
 4;35,52,53,36;,
 4;36,53,54,37;,
 4;37,54,55,38;,
 4;38,55,56,39;,
 4;39,56,57,40;,
 4;40,57,58,41;,
 4;41,58,59,42;,
 4;42,59,60,43;,
 4;43,60,61,44;,
 4;44,61,62,45;,
 4;45,62,63,46;,
 4;46,63,64,47;,
 4;47,64,65,48;,
 4;48,65,66,49;,
 4;49,66,67,50;,
 4;51,68,69,52;,
 4;52,69,70,53;,
 4;53,70,71,54;,
 4;54,71,72,55;,
 4;55,72,73,56;,
 4;56,73,74,57;,
 4;57,74,75,58;,
 4;58,75,76,59;,
 4;59,76,77,60;,
 4;60,77,78,61;,
 4;61,78,79,62;,
 4;62,79,80,63;,
 4;63,80,81,64;,
 4;64,81,82,65;,
 4;65,82,83,66;,
 4;66,83,84,67;,
 4;68,85,86,69;,
 4;69,86,87,70;,
 4;70,87,88,71;,
 4;71,88,89,72;,
 4;72,89,90,73;,
 4;73,90,91,74;,
 4;74,91,92,75;,
 4;75,92,93,76;,
 4;76,93,94,77;,
 4;77,94,95,78;,
 4;78,95,96,79;,
 4;79,96,97,80;,
 4;80,97,98,81;,
 4;81,98,99,82;,
 4;82,99,100,83;,
 4;83,100,101,84;,
 3;102,0,3;,
 3;103,3,5;,
 3;104,5,7;,
 3;105,7,9;,
 3;106,9,11;,
 3;107,11,13;,
 3;108,13,15;,
 3;109,15,17;,
 3;110,17,19;,
 3;111,19,21;,
 3;112,21,23;,
 3;113,23,25;,
 3;114,25,27;,
 3;115,27,29;,
 3;116,29,31;,
 3;117,31,33;,
 3;118,86,85;,
 3;119,87,86;,
 3;120,88,87;,
 3;121,89,88;,
 3;122,90,89;,
 3;123,91,90;,
 3;124,92,91;,
 3;125,93,92;,
 3;126,94,93;,
 3;127,95,94;,
 3;128,96,95;,
 3;129,97,96;,
 3;130,98,97;,
 3;131,99,98;,
 3;132,100,99;,
 3;133,101,100;,
 3;134,135,136;,
 3;137,136,138;,
 3;139,138,140;,
 3;141,140,142;,
 3;143,142,144;,
 3;145,144,146;,
 3;147,146,148;,
 3;149,148,150;,
 4;135,151,152,136;,
 4;136,152,153,138;,
 4;138,153,154,140;,
 4;140,154,155,142;,
 4;142,155,156,144;,
 4;144,156,157,146;,
 4;146,157,158,148;,
 4;148,158,159,150;,
 4;151,160,161,152;,
 4;152,161,162,153;,
 4;153,162,163,154;,
 4;154,163,164,155;,
 4;155,164,165,156;,
 4;156,165,166,157;,
 4;157,166,167,158;,
 4;158,167,168,159;,
 4;160,169,170,161;,
 4;161,170,171,162;,
 4;162,171,172,163;,
 4;163,172,173,164;,
 4;164,173,174,165;,
 4;165,174,175,166;,
 4;166,175,176,167;,
 4;167,176,177,168;,
 4;169,178,179,170;,
 4;170,179,180,171;,
 4;171,180,181,172;,
 4;172,181,182,173;,
 4;173,182,183,174;,
 4;174,183,184,175;,
 4;175,184,185,176;,
 4;176,185,186,177;,
 4;178,187,188,179;,
 4;179,188,189,180;,
 4;180,189,190,181;,
 4;181,190,191,182;,
 4;182,191,192,183;,
 4;183,192,193,184;,
 4;184,193,194,185;,
 4;185,194,195,186;,
 4;187,196,197,188;,
 4;188,197,198,189;,
 4;189,198,199,190;,
 4;190,199,200,191;,
 4;191,200,201,192;,
 4;192,201,202,193;,
 4;193,202,203,194;,
 4;194,203,204,195;,
 3;196,205,197;,
 3;197,206,198;,
 3;198,207,199;,
 3;199,208,200;,
 3;200,209,201;,
 3;201,210,202;,
 3;202,211,203;,
 3;203,212,204;,
 3;213,214,215;,
 3;214,216,217;,
 3;216,218,219;,
 3;218,220,221;,
 3;220,222,223;,
 3;222,224,225;,
 3;226,227,228;,
 3;226,229,227;,
 3;226,230,229;,
 3;226,231,230;,
 3;226,232,231;,
 3;226,228,232;;
 
 MeshMaterialList {
  10;
  188;
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
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
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
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  6,
  6,
  6,
  6,
  2,
  6,
  6,
  6,
  6,
  6,
  6,
  6;;
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
  198;
  0.000000;1.000000;0.000000;,
  -0.043411;-0.163879;-0.985525;,
  -0.392145;-0.295213;-0.871247;,
  -0.630257;-0.444003;-0.636897;,
  -0.790540;-0.515654;-0.330373;,
  -0.909154;-0.399297;-0.118326;,
  -0.965300;-0.103999;0.239541;,
  -0.690395;0.356469;0.629512;,
  -0.167183;0.921141;0.351496;,
  0.062985;0.927775;0.367787;,
  0.622716;0.289243;0.727024;,
  0.763042;-0.050256;0.644392;,
  0.900053;0.053063;0.432538;,
  0.995535;0.056994;-0.075244;,
  0.885616;-0.134724;-0.444448;,
  0.691529;-0.204097;-0.692916;,
  0.368253;-0.155114;-0.916695;,
  -0.187931;-0.079850;-0.978931;,
  -0.419013;-0.146236;-0.896127;,
  -0.697397;-0.137380;-0.703395;,
  -0.917737;-0.101118;-0.384102;,
  -0.979409;-0.016696;-0.201196;,
  -0.977225;0.158755;0.140809;,
  -0.696804;0.360603;0.620024;,
  -0.383077;0.461242;0.800317;,
  0.155043;0.387958;0.908543;,
  0.667843;0.070858;0.740921;,
  0.757681;-0.073228;0.648503;,
  0.898322;-0.035393;0.437909;,
  0.995976;-0.032391;-0.083565;,
  0.908709;-0.053741;-0.413956;,
  0.764040;0.011211;-0.645072;,
  0.283446;0.031976;-0.958455;,
  -0.267348;0.210993;-0.940216;,
  -0.382733;0.192590;-0.903562;,
  -0.688192;0.020799;-0.725230;,
  -0.870316;0.039425;-0.490912;,
  -0.966896;0.032693;-0.253067;,
  -0.983429;-0.080454;0.162461;,
  -0.789359;-0.132586;0.599444;,
  -0.463344;-0.166751;0.870348;,
  0.187565;-0.120494;0.974833;,
  0.658130;-0.043803;0.751629;,
  0.760446;-0.032015;0.648611;,
  0.909098;-0.061390;0.412035;,
  0.997158;-0.060272;-0.045208;,
  0.982350;0.092384;-0.162645;,
  0.877759;0.370719;-0.303490;,
  0.697782;0.476491;-0.534842;,
  -0.194399;0.416992;-0.887878;,
  -0.411306;0.191796;-0.891090;,
  -0.670104;-0.106775;-0.734547;,
  -0.799895;-0.151861;-0.580609;,
  -0.957779;-0.236267;-0.163822;,
  -0.876995;-0.308870;0.368076;,
  -0.767273;-0.346869;0.539420;,
  -0.473261;-0.358944;0.804477;,
  0.104817;-0.221898;0.969420;,
  0.551474;-0.056948;0.832246;,
  0.766096;-0.019861;0.642419;,
  0.923637;-0.023403;0.382554;,
  0.999726;-0.023404;0.000006;,
  0.999339;0.002259;0.036286;,
  0.966839;0.245460;0.070507;,
  0.725407;0.598144;-0.340602;,
  0.059967;-0.298678;-0.952468;,
  -0.333182;-0.150608;-0.930756;,
  -0.691155;0.042726;-0.721443;,
  -0.870192;0.053392;-0.489812;,
  -0.998724;0.014585;-0.048341;,
  -0.904810;0.039472;0.423983;,
  -0.756050;0.031879;0.653737;,
  -0.433280;-0.026328;0.900875;,
  0.015645;-0.070954;0.997357;,
  0.422796;-0.048987;0.904900;,
  0.734552;-0.000394;0.678552;,
  0.921647;0.019921;0.387518;,
  0.999479;0.031520;0.006934;,
  0.979751;-0.014818;-0.199670;,
  0.855310;-0.213687;-0.471999;,
  0.432133;-0.335239;-0.837183;,
  0.018544;0.087732;-0.995972;,
  -0.361997;0.131919;-0.922798;,
  -0.698811;0.152808;-0.698794;,
  -0.913026;0.152821;-0.378191;,
  -0.988255;0.152816;0.000004;,
  -0.913023;0.152803;0.378207;,
  -0.698804;0.152794;0.698804;,
  -0.361997;0.131919;0.922798;,
  0.018544;0.087733;0.995971;,
  0.381852;0.066031;0.921862;,
  0.698936;0.072350;0.711515;,
  0.916277;0.086634;0.391063;,
  0.993893;0.109483;0.013807;,
  0.914841;0.118390;-0.386069;,
  0.691144;0.087741;-0.717371;,
  0.381851;0.066031;-0.921862;,
  -0.190252;-0.979841;-0.060955;,
  -0.000003;1.000000;0.000003;,
  -0.000000;0.924739;-0.380602;,
  -0.269134;0.924739;-0.269118;,
  -0.380611;0.924735;-0.000000;,
  -0.269123;0.924741;0.269123;,
  -0.000000;0.924735;0.380611;,
  0.269118;0.924739;0.269134;,
  0.380602;0.924739;0.000000;,
  0.269128;0.924738;-0.269128;,
  -0.000002;0.709231;-0.704976;,
  -0.498505;0.709228;-0.498486;,
  -0.704989;0.709218;0.000002;,
  -0.498499;0.709224;0.498499;,
  -0.000002;0.709218;0.704989;,
  0.498486;0.709228;0.498506;,
  0.704976;0.709231;0.000002;,
  0.498493;0.709231;-0.498494;,
  -0.000005;0.384547;-0.923105;,
  -0.652738;0.384547;-0.652730;,
  -0.923105;0.384548;0.000005;,
  -0.652735;0.384543;0.652735;,
  -0.000005;0.384547;0.923105;,
  0.652731;0.384546;0.652738;,
  0.923105;0.384547;0.000005;,
  0.652733;0.384549;-0.652734;,
  -0.000006;0.000000;-1.000000;,
  -0.707105;0.000000;-0.707108;,
  -1.000000;0.000000;0.000006;,
  -0.707107;0.000000;0.707107;,
  -0.000006;-0.000000;1.000000;,
  0.707108;-0.000000;0.707105;,
  1.000000;0.000000;0.000006;,
  0.707107;0.000000;-0.707107;,
  -0.000005;-0.384548;-0.923105;,
  -0.652737;-0.384549;-0.652730;,
  -0.923104;-0.384550;0.000005;,
  -0.652735;-0.384546;0.652734;,
  -0.000004;-0.384550;0.923104;,
  0.652730;-0.384548;0.652738;,
  0.923105;-0.384549;0.000005;,
  0.652733;-0.384551;-0.652733;,
  -0.041971;-0.673005;-0.738447;,
  -0.479505;-0.743338;-0.466394;,
  -0.651155;-0.758945;0.000002;,
  -0.479499;-0.743333;0.466408;,
  -0.041975;-0.672988;0.738461;,
  0.518094;-0.626477;0.582327;,
  0.790904;-0.611940;0.000002;,
  0.518103;-0.626483;-0.582313;,
  -0.306541;-0.851360;-0.425698;,
  -0.284290;-0.928129;-0.240326;,
  -0.359935;-0.932978;-0.000000;,
  -0.284279;-0.928130;0.240334;,
  -0.306540;-0.851354;0.425711;,
  0.441257;-0.692626;0.570579;,
  0.747009;-0.664814;-0.000000;,
  0.441276;-0.692625;-0.570566;,
  -0.461559;-0.887110;0.000002;,
  0.772941;-0.139753;-0.618895;,
  0.909825;-0.310666;-0.275145;,
  -0.931437;0.305970;-0.196996;,
  0.051728;0.038554;0.997917;,
  -0.249441;0.201813;0.947127;,
  0.828789;-0.082312;-0.553474;,
  0.871662;-0.166963;-0.460790;,
  -0.954430;0.101932;-0.280488;,
  -0.347935;0.118710;-0.929973;,
  -0.118373;-0.284252;-0.951414;,
  0.091836;-0.634964;-0.767064;,
  0.034621;-0.620088;-0.783768;,
  0.628606;-0.666238;-0.401225;,
  -0.516348;-0.837682;-0.177969;,
  -0.410527;-0.911849;0.000000;,
  -0.280514;-0.917945;-0.280514;,
  -0.366507;-0.917946;-0.151817;,
  -0.396708;-0.917945;0.000003;,
  -0.366509;-0.917944;0.151822;,
  -0.280519;-0.917942;0.280519;,
  -0.516351;-0.837680;0.177973;,
  0.000000;-1.000000;-0.000000;,
  0.175965;-0.968540;-0.175973;,
  0.291695;-0.937804;-0.188248;,
  0.226172;-0.939591;-0.256933;,
  0.206532;-0.858002;-0.470295;,
  0.529388;-0.662945;0.529388;,
  0.290282;-0.911851;0.290282;,
  -0.674710;-0.736468;-0.048795;,
  -0.527743;-0.849404;0.000000;,
  -0.674708;-0.736470;0.048798;,
  -0.877793;0.302812;-0.371193;,
  -0.748874;0.612477;-0.253102;,
  0.346694;-0.129329;0.929020;,
  0.758566;-0.647507;-0.072886;,
  -0.861758;0.032510;-0.506277;,
  -0.999353;0.035975;0.000000;,
  -0.072044;-0.987978;0.136783;,
  0.358317;-0.933600;-0.000000;,
  -0.308530;-0.929589;0.201676;,
  -0.112144;-0.782587;0.612358;,
  -0.434314;-0.863867;-0.255157;;
  188;
  4;1,17,18,2;,
  4;2,18,19,3;,
  4;3,19,20,4;,
  4;4,20,21,5;,
  4;5,21,22,6;,
  4;6,22,23,7;,
  4;7,23,24,8;,
  4;8,24,25,9;,
  4;9,25,26,10;,
  4;10,26,27,11;,
  4;11,27,28,12;,
  4;12,28,29,13;,
  4;13,29,30,14;,
  4;14,30,31,15;,
  4;15,31,32,16;,
  4;16,32,17,1;,
  4;17,33,34,18;,
  4;18,34,35,19;,
  4;19,35,36,20;,
  4;20,36,37,21;,
  4;21,37,38,22;,
  4;22,38,39,23;,
  4;23,39,40,24;,
  4;24,40,41,25;,
  4;25,41,42,26;,
  4;26,42,43,27;,
  4;27,43,44,28;,
  4;28,44,45,29;,
  4;29,45,46,30;,
  4;30,46,47,31;,
  4;31,47,48,32;,
  4;32,164,33,17;,
  4;33,49,50,34;,
  4;34,50,51,35;,
  4;35,51,52,36;,
  4;36,52,53,37;,
  4;37,53,54,38;,
  4;38,54,55,39;,
  4;39,55,56,40;,
  4;40,56,57,41;,
  4;41,57,58,42;,
  4;42,58,59,43;,
  4;43,59,60,44;,
  4;44,60,61,45;,
  4;45,61,62,46;,
  4;46,62,63,47;,
  4;47,63,64,48;,
  4;164,165,49,33;,
  4;166,65,66,167;,
  4;50,66,67,51;,
  4;51,67,68,52;,
  4;52,68,69,53;,
  4;53,69,70,54;,
  4;54,70,71,55;,
  4;55,71,72,56;,
  4;56,72,73,57;,
  4;57,73,74,58;,
  4;58,74,75,59;,
  4;59,75,76,60;,
  4;60,76,77,61;,
  4;61,77,78,62;,
  4;62,78,79,63;,
  4;168,79,80,168;,
  4;165,80,65,166;,
  4;65,81,82,66;,
  4;66,82,83,67;,
  4;67,83,84,68;,
  4;68,84,85,69;,
  4;69,85,86,70;,
  4;70,86,87,71;,
  4;71,87,88,72;,
  4;72,88,89,73;,
  4;73,89,90,74;,
  4;74,90,91,75;,
  4;75,91,92,76;,
  4;76,92,93,77;,
  4;77,93,94,78;,
  4;78,94,95,79;,
  4;79,95,96,80;,
  4;80,96,81,65;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,8;,
  3;0,8,9;,
  3;0,9,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;97,169,170;,
  3;97,171,169;,
  3;97,172,171;,
  3;97,173,172;,
  3;97,174,173;,
  3;97,175,174;,
  3;97,176,175;,
  3;97,170,176;,
  3;97,177,170;,
  3;97,178,177;,
  3;97,179,178;,
  3;97,180,179;,
  3;97,181,180;,
  3;182,183,182;,
  3;97,177,183;,
  3;97,170,177;,
  3;98,99,100;,
  3;98,100,101;,
  3;98,101,102;,
  3;98,102,103;,
  3;98,103,104;,
  3;98,104,105;,
  3;98,105,106;,
  3;98,106,99;,
  4;99,107,108,100;,
  4;100,108,109,101;,
  4;101,109,110,102;,
  4;102,110,111,103;,
  4;103,111,112,104;,
  4;104,112,113,105;,
  4;105,113,114,106;,
  4;106,114,107,99;,
  4;107,115,116,108;,
  4;108,116,117,109;,
  4;109,117,118,110;,
  4;110,118,119,111;,
  4;111,119,120,112;,
  4;112,120,121,113;,
  4;113,121,122,114;,
  4;114,122,115,107;,
  4;115,123,124,116;,
  4;116,124,125,117;,
  4;117,125,126,118;,
  4;118,126,127,119;,
  4;119,127,128,120;,
  4;120,128,129,121;,
  4;121,129,130,122;,
  4;122,130,123,115;,
  4;123,131,132,124;,
  4;124,132,133,125;,
  4;125,133,134,126;,
  4;126,134,135,127;,
  4;127,135,136,128;,
  4;128,136,137,129;,
  4;129,137,138,130;,
  4;130,138,131,123;,
  4;131,139,140,132;,
  4;132,140,141,133;,
  4;133,141,142,134;,
  4;134,142,143,135;,
  4;135,143,144,136;,
  4;136,144,145,137;,
  4;137,145,146,138;,
  4;138,146,139,131;,
  4;139,147,148,140;,
  4;140,148,149,141;,
  4;141,149,150,142;,
  4;142,150,151,143;,
  4;143,151,152,144;,
  4;144,152,153,145;,
  4;145,153,154,146;,
  4;146,154,147,139;,
  3;147,155,148;,
  3;148,155,149;,
  3;149,155,150;,
  3;150,155,151;,
  3;151,155,184;,
  3;184,155,185;,
  3;185,155,186;,
  3;186,155,147;,
  3;156,157,162;,
  3;187,158,188;,
  3;189,159,159;,
  3;159,160,159;,
  3;190,161,162;,
  3;161,156,162;,
  3;163,187,191;,
  3;163,158,187;,
  3;163,192,158;,
  3;193,190,194;,
  3;193,195,196;,
  3;193,197,195;;
 }
 MeshTextureCoords {
  233;
  0.000000;0.000000;,
  0.000000;0.200000;,
  0.062500;0.200000;,
  0.062500;0.000000;,
  0.125000;0.200000;,
  0.125000;0.000000;,
  0.187500;0.200000;,
  0.187500;0.000000;,
  0.250000;0.200000;,
  0.250000;0.000000;,
  0.312500;0.200000;,
  0.312500;0.000000;,
  0.375000;0.200000;,
  0.375000;0.000000;,
  0.437500;0.200000;,
  0.437500;0.000000;,
  0.500000;0.200000;,
  0.500000;0.000000;,
  0.562500;0.200000;,
  0.562500;0.000000;,
  0.625000;0.200000;,
  0.625000;0.000000;,
  0.687500;0.200000;,
  0.687500;0.000000;,
  0.750000;0.200000;,
  0.750000;0.000000;,
  0.812500;0.200000;,
  0.812500;0.000000;,
  0.875000;0.200000;,
  0.875000;0.000000;,
  0.937500;0.200000;,
  0.937500;0.000000;,
  1.000000;0.200000;,
  1.000000;0.000000;,
  0.000000;0.400000;,
  0.062500;0.400000;,
  0.125000;0.400000;,
  0.187500;0.400000;,
  0.250000;0.400000;,
  0.312500;0.400000;,
  0.375000;0.400000;,
  0.437500;0.400000;,
  0.500000;0.400000;,
  0.562500;0.400000;,
  0.625000;0.400000;,
  0.687500;0.400000;,
  0.750000;0.400000;,
  0.812500;0.400000;,
  0.875000;0.400000;,
  0.937500;0.400000;,
  1.000000;0.400000;,
  0.000000;0.600000;,
  0.062500;0.600000;,
  0.125000;0.600000;,
  0.187500;0.600000;,
  0.250000;0.600000;,
  0.312500;0.600000;,
  0.375000;0.600000;,
  0.437500;0.600000;,
  0.500000;0.600000;,
  0.562500;0.600000;,
  0.625000;0.600000;,
  0.687500;0.600000;,
  0.750000;0.600000;,
  0.812500;0.600000;,
  0.875000;0.600000;,
  0.937500;0.600000;,
  1.000000;0.600000;,
  0.000000;0.800000;,
  0.062500;0.800000;,
  0.125000;0.800000;,
  0.187500;0.800000;,
  0.250000;0.800000;,
  0.312500;0.800000;,
  0.375000;0.800000;,
  0.437500;0.800000;,
  0.500000;0.800000;,
  0.562500;0.800000;,
  0.625000;0.800000;,
  0.687500;0.800000;,
  0.750000;0.800000;,
  0.812500;0.800000;,
  0.875000;0.800000;,
  0.937500;0.800000;,
  1.000000;0.800000;,
  0.000000;1.000000;,
  0.062500;1.000000;,
  0.125000;1.000000;,
  0.187500;1.000000;,
  0.250000;1.000000;,
  0.312500;1.000000;,
  0.375000;1.000000;,
  0.437500;1.000000;,
  0.500000;1.000000;,
  0.562500;1.000000;,
  0.625000;1.000000;,
  0.687500;1.000000;,
  0.750000;1.000000;,
  0.812500;1.000000;,
  0.875000;1.000000;,
  0.937500;1.000000;,
  1.000000;1.000000;,
  0.031250;0.000000;,
  0.093750;0.000000;,
  0.156250;0.000000;,
  0.218750;0.000000;,
  0.281250;0.000000;,
  0.343750;0.000000;,
  0.406250;0.000000;,
  0.468750;0.000000;,
  0.531250;0.000000;,
  0.593750;0.000000;,
  0.656250;0.000000;,
  0.718750;0.000000;,
  0.781250;0.000000;,
  0.843750;0.000000;,
  0.906250;0.000000;,
  0.968750;0.000000;,
  0.031250;1.000000;,
  0.093750;1.000000;,
  0.156250;1.000000;,
  0.218750;1.000000;,
  0.281250;1.000000;,
  0.343750;1.000000;,
  0.406250;1.000000;,
  0.468750;1.000000;,
  0.531250;1.000000;,
  0.593750;1.000000;,
  0.656250;1.000000;,
  0.718750;1.000000;,
  0.781250;1.000000;,
  0.843750;1.000000;,
  0.906250;1.000000;,
  0.968750;1.000000;,
  0.062500;0.000000;,
  0.000000;0.125000;,
  0.125000;0.125000;,
  0.187500;0.000000;,
  0.250000;0.125000;,
  0.312500;0.000000;,
  0.375000;0.125000;,
  0.437500;0.000000;,
  0.500000;0.125000;,
  0.562500;0.000000;,
  0.625000;0.125000;,
  0.687500;0.000000;,
  0.750000;0.125000;,
  0.812500;0.000000;,
  0.875000;0.125000;,
  0.937500;0.000000;,
  1.000000;0.125000;,
  0.000000;0.250000;,
  0.125000;0.250000;,
  0.250000;0.250000;,
  0.375000;0.250000;,
  0.500000;0.250000;,
  0.625000;0.250000;,
  0.750000;0.250000;,
  0.875000;0.250000;,
  1.000000;0.250000;,
  0.000000;0.375000;,
  0.125000;0.375000;,
  0.250000;0.375000;,
  0.375000;0.375000;,
  0.500000;0.375000;,
  0.625000;0.375000;,
  0.750000;0.375000;,
  0.875000;0.375000;,
  1.000000;0.375000;,
  0.000000;0.500000;,
  0.125000;0.500000;,
  0.250000;0.500000;,
  0.375000;0.500000;,
  0.500000;0.500000;,
  0.625000;0.500000;,
  0.750000;0.500000;,
  0.875000;0.500000;,
  1.000000;0.500000;,
  0.000000;0.625000;,
  0.125000;0.625000;,
  0.250000;0.625000;,
  0.375000;0.625000;,
  0.500000;0.625000;,
  0.625000;0.625000;,
  0.750000;0.625000;,
  0.875000;0.625000;,
  1.000000;0.625000;,
  0.000000;0.750000;,
  0.125000;0.750000;,
  0.250000;0.750000;,
  0.375000;0.750000;,
  0.500000;0.750000;,
  0.625000;0.750000;,
  0.750000;0.750000;,
  0.875000;0.750000;,
  1.000000;0.750000;,
  0.000000;0.875000;,
  0.125000;0.875000;,
  0.250000;0.875000;,
  0.375000;0.875000;,
  0.500000;0.875000;,
  0.625000;0.875000;,
  0.750000;0.875000;,
  0.875000;0.875000;,
  1.000000;0.875000;,
  0.062500;1.000000;,
  0.187500;1.000000;,
  0.312500;1.000000;,
  0.437500;1.000000;,
  0.562500;1.000000;,
  0.687500;1.000000;,
  0.812500;1.000000;,
  0.937500;1.000000;,
  0.000000;1.000000;,
  0.166670;1.000000;,
  0.083330;0.000000;,
  0.333330;1.000000;,
  0.166670;0.000000;,
  0.500000;1.000000;,
  0.250000;0.000000;,
  0.666670;1.000000;,
  0.333330;0.000000;,
  0.833330;1.000000;,
  0.416670;0.000000;,
  1.000000;1.000000;,
  0.500000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;;
 }
}
