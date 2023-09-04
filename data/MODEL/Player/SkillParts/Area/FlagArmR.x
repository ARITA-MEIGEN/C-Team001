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
 348;
 0.00000;0.57588;17.50000;,
 0.40721;0.40721;17.50000;,
 0.54295;0.54295;-43.06760;,
 0.00000;0.76785;-43.06760;,
 0.57589;0.00000;17.50000;,
 0.76785;0.00000;-43.06760;,
 0.40721;-0.40722;17.50000;,
 0.54295;-0.54295;-43.06760;,
 0.00000;-0.57588;17.50000;,
 0.00000;-0.76785;-43.06760;,
 -0.40721;-0.40722;17.50000;,
 -0.54295;-0.54295;-43.06760;,
 -0.57588;0.00000;17.50000;,
 -0.76784;0.00000;-43.06760;,
 -0.40721;0.40721;17.50000;,
 -0.54295;0.54295;-43.06760;,
 0.00000;0.57588;17.50000;,
 0.00000;0.76785;-43.06760;,
 0.00000;0.00000;17.50000;,
 0.00000;0.00000;17.50000;,
 0.00000;0.00000;17.50000;,
 0.00000;0.00000;17.50000;,
 0.00000;0.00000;17.50000;,
 0.00000;0.00000;17.50000;,
 0.00000;0.00000;17.50000;,
 0.00000;0.00000;17.50000;,
 0.00000;0.00000;-43.06760;,
 0.00000;0.00000;-43.06760;,
 0.00000;0.00000;-43.06760;,
 0.00000;0.00000;-43.06760;,
 0.00000;0.00000;-43.06760;,
 0.00000;0.00000;-43.06760;,
 0.00000;0.00000;-43.06760;,
 0.00000;0.00000;-43.06760;,
 0.00000;1.01032;-27.66905;,
 0.36968;0.89247;-27.60095;,
 0.33955;0.81975;-30.55438;,
 0.00000;0.94603;-30.55438;,
 0.71441;0.71440;-27.66905;,
 0.66895;0.66895;-30.55438;,
 0.71441;0.71440;-34.90672;,
 0.00000;1.01033;-34.90672;,
 0.89248;0.36967;-27.60095;,
 0.81975;0.33955;-30.55438;,
 1.01033;0.00000;-27.66905;,
 0.94603;0.00000;-30.55438;,
 1.01033;0.00000;-34.90672;,
 0.71441;0.71440;-34.90672;,
 0.89248;-0.36968;-27.60095;,
 0.81975;-0.33955;-30.55438;,
 0.71441;-0.71442;-27.66905;,
 0.66895;-0.66895;-30.55438;,
 0.71441;-0.71441;-34.90672;,
 1.01033;0.00000;-34.90672;,
 0.36968;-0.89248;-27.60095;,
 0.33955;-0.81975;-30.55438;,
 0.00000;-1.01033;-27.66905;,
 0.00000;-0.94603;-30.55438;,
 0.00000;-1.01033;-34.90672;,
 0.71441;-0.71441;-34.90672;,
 -0.36968;-0.89248;-27.60095;,
 -0.33955;-0.81975;-30.55438;,
 -0.71441;-0.71442;-27.66905;,
 -0.66894;-0.66895;-30.55438;,
 -0.71441;-0.71441;-34.90672;,
 0.00000;-1.01033;-34.90672;,
 -0.89248;-0.36968;-27.60095;,
 -0.81975;-0.33955;-30.55438;,
 -1.01032;0.00000;-27.66905;,
 -0.94602;0.00000;-30.55438;,
 -1.01032;0.00000;-34.90672;,
 -0.71441;-0.71441;-34.90672;,
 -0.89248;0.36967;-27.60095;,
 -0.81975;0.33955;-30.55438;,
 -0.71441;0.71440;-27.66905;,
 -0.66894;0.66895;-30.55438;,
 -0.71441;0.71440;-34.90672;,
 -1.01032;0.00000;-34.90672;,
 -0.36968;0.89247;-27.60095;,
 -0.33955;0.81975;-30.55438;,
 0.00000;1.01032;-27.66905;,
 0.00000;0.94603;-30.55438;,
 0.00000;1.01033;-34.90672;,
 -0.71441;0.71440;-34.90672;,
 0.00000;0.00000;-27.66905;,
 0.38091;0.38091;-27.51620;,
 0.00000;0.53869;-27.51620;,
 0.00000;0.00000;-27.66905;,
 0.53869;0.00000;-27.51620;,
 0.38091;0.38091;-27.51620;,
 0.00000;0.00000;-27.66905;,
 0.38091;-0.38092;-27.51620;,
 0.53869;0.00000;-27.51620;,
 0.00000;0.00000;-27.66905;,
 0.00000;-0.53870;-27.51620;,
 0.38091;-0.38092;-27.51620;,
 0.00000;0.00000;-27.66905;,
 -0.38091;-0.38092;-27.51620;,
 0.00000;-0.53870;-27.51620;,
 0.00000;0.00000;-27.66905;,
 -0.53869;0.00000;-27.51620;,
 -0.38091;-0.38092;-27.51620;,
 0.00000;0.00000;-27.66905;,
 -0.38091;0.38091;-27.51620;,
 -0.53869;0.00000;-27.51620;,
 0.00000;0.00000;-27.66905;,
 0.00000;0.53869;-27.51620;,
 -0.38091;0.38091;-27.51620;,
 0.00000;0.00000;-34.90672;,
 0.00000;1.01033;-34.90672;,
 0.71441;0.71440;-34.90672;,
 0.00000;0.00000;-34.90672;,
 0.71441;0.71440;-34.90672;,
 1.01033;0.00000;-34.90672;,
 0.00000;0.00000;-34.90672;,
 1.01033;0.00000;-34.90672;,
 0.71441;-0.71441;-34.90672;,
 0.00000;0.00000;-34.90672;,
 0.71441;-0.71441;-34.90672;,
 0.00000;-1.01033;-34.90672;,
 0.00000;0.00000;-34.90672;,
 0.00000;-1.01033;-34.90672;,
 -0.71441;-0.71441;-34.90672;,
 0.00000;0.00000;-34.90672;,
 -0.71441;-0.71441;-34.90672;,
 -1.01032;0.00000;-34.90672;,
 0.00000;0.00000;-34.90672;,
 -1.01032;0.00000;-34.90672;,
 -0.71441;0.71440;-34.90672;,
 0.00000;0.00000;-34.90672;,
 -0.71441;0.71440;-34.90672;,
 0.00000;1.01033;-34.90672;,
 0.00000;-1.01032;-41.08579;,
 0.36968;-0.89248;-41.15389;,
 0.33955;-0.81975;-38.20046;,
 0.00000;-0.94603;-38.20046;,
 0.71441;-0.71441;-41.08579;,
 0.66895;-0.66895;-38.20046;,
 0.71441;-0.71441;-33.84811;,
 0.00000;-1.01033;-33.84811;,
 0.89248;-0.36968;-41.15389;,
 0.81975;-0.33955;-38.20046;,
 1.01033;0.00001;-41.08579;,
 0.94603;0.00000;-38.20046;,
 1.01033;0.00000;-33.84811;,
 0.71441;-0.71441;-33.84811;,
 0.89248;0.36968;-41.15389;,
 0.81975;0.33955;-38.20046;,
 0.71441;0.71441;-41.08579;,
 0.66895;0.66894;-38.20046;,
 0.71441;0.71441;-33.84811;,
 1.01033;0.00000;-33.84811;,
 0.36968;0.89248;-41.15389;,
 0.33955;0.81975;-38.20046;,
 0.00000;1.01033;-41.08579;,
 0.00000;0.94603;-38.20046;,
 0.00000;1.01032;-33.84811;,
 0.71441;0.71441;-33.84811;,
 -0.36968;0.89248;-41.15389;,
 -0.33955;0.81975;-38.20046;,
 -0.71441;0.71441;-41.08579;,
 -0.66894;0.66894;-38.20046;,
 -0.71441;0.71441;-33.84811;,
 0.00000;1.01032;-33.84811;,
 -0.89248;0.36968;-41.15389;,
 -0.81975;0.33955;-38.20046;,
 -1.01032;0.00001;-41.08579;,
 -0.94602;0.00000;-38.20046;,
 -1.01032;0.00000;-33.84811;,
 -0.71441;0.71441;-33.84811;,
 -0.89248;-0.36968;-41.15389;,
 -0.81975;-0.33955;-38.20046;,
 -0.71441;-0.71441;-41.08579;,
 -0.66894;-0.66895;-38.20046;,
 -0.71441;-0.71441;-33.84811;,
 -1.01032;0.00000;-33.84811;,
 -0.36968;-0.89248;-41.15389;,
 -0.33955;-0.81975;-38.20046;,
 0.00000;-1.01032;-41.08579;,
 0.00000;-0.94603;-38.20046;,
 0.00000;-1.01033;-33.84811;,
 -0.71441;-0.71441;-33.84811;,
 0.00000;0.00001;-41.08579;,
 0.38091;-0.38092;-41.23865;,
 0.00000;-0.53869;-41.23865;,
 0.00000;0.00001;-41.08579;,
 0.53869;0.00001;-41.23865;,
 0.38091;-0.38092;-41.23865;,
 0.00000;0.00001;-41.08579;,
 0.38091;0.38091;-41.23865;,
 0.53869;0.00001;-41.23865;,
 0.00000;0.00001;-41.08579;,
 0.00000;0.53869;-41.23865;,
 0.38091;0.38091;-41.23865;,
 0.00000;0.00001;-41.08579;,
 -0.38091;0.38091;-41.23865;,
 0.00000;0.53869;-41.23865;,
 0.00000;0.00001;-41.08579;,
 -0.53869;0.00001;-41.23865;,
 -0.38091;0.38091;-41.23865;,
 0.00000;0.00001;-41.08579;,
 -0.38091;-0.38092;-41.23865;,
 -0.53869;0.00001;-41.23865;,
 0.00000;0.00001;-41.08579;,
 0.00000;-0.53869;-41.23865;,
 -0.38091;-0.38092;-41.23865;,
 0.00000;0.00000;-33.84811;,
 0.00000;-1.01033;-33.84811;,
 0.71441;-0.71441;-33.84811;,
 0.00000;0.00000;-33.84811;,
 0.71441;-0.71441;-33.84811;,
 1.01033;0.00000;-33.84811;,
 0.00000;0.00000;-33.84811;,
 1.01033;0.00000;-33.84811;,
 0.71441;0.71441;-33.84811;,
 0.00000;0.00000;-33.84811;,
 0.71441;0.71441;-33.84811;,
 0.00000;1.01032;-33.84811;,
 0.00000;0.00000;-33.84811;,
 0.00000;1.01032;-33.84811;,
 -0.71441;0.71441;-33.84811;,
 0.00000;0.00000;-33.84811;,
 -0.71441;0.71441;-33.84811;,
 -1.01032;0.00000;-33.84811;,
 0.00000;0.00000;-33.84811;,
 -1.01032;0.00000;-33.84811;,
 -0.71441;-0.71441;-33.84811;,
 0.00000;0.00000;-33.84811;,
 -0.71441;-0.71441;-33.84811;,
 0.00000;-1.01033;-33.84811;,
 0.00000;0.94603;-30.55438;,
 0.33955;0.81975;-30.55438;,
 0.66895;0.66895;-30.55438;,
 0.81975;0.33955;-30.55438;,
 0.94603;0.00000;-30.55438;,
 0.81975;-0.33955;-30.55438;,
 0.66895;-0.66895;-30.55438;,
 0.33955;-0.81975;-30.55438;,
 0.00000;-0.94603;-30.55438;,
 -0.33955;-0.81975;-30.55438;,
 -0.66894;-0.66895;-30.55438;,
 -0.81975;-0.33955;-30.55438;,
 -0.94602;0.00000;-30.55438;,
 -0.81975;0.33955;-30.55438;,
 -0.66894;0.66895;-30.55438;,
 -0.33955;0.81975;-30.55438;,
 0.00000;-0.94603;-38.20046;,
 0.33955;-0.81975;-38.20046;,
 0.66895;-0.66895;-38.20046;,
 0.81975;-0.33955;-38.20046;,
 0.94603;0.00000;-38.20046;,
 0.81975;0.33955;-38.20046;,
 0.66895;0.66894;-38.20046;,
 0.33955;0.81975;-38.20046;,
 0.00000;0.94603;-38.20046;,
 -0.33955;0.81975;-38.20046;,
 -0.66894;0.66894;-38.20046;,
 -0.81975;0.33955;-38.20046;,
 -0.94602;0.00000;-38.20046;,
 -0.81975;-0.33955;-38.20046;,
 -0.66894;-0.66895;-38.20046;,
 -0.33955;-0.81975;-38.20046;,
 0.00000;-1.54969;-41.38102;,
 0.00000;-0.03419;-51.48430;,
 1.07162;-1.10582;-41.38102;,
 0.00000;-0.03419;-51.48430;,
 1.51549;-0.03419;-41.38102;,
 0.00000;-0.03419;-51.48430;,
 1.07162;1.03742;-41.38102;,
 0.00000;-0.03419;-51.48430;,
 0.00000;1.48130;-41.38102;,
 0.00000;-0.03419;-51.48430;,
 -1.07161;1.03742;-41.38102;,
 0.00000;-0.03419;-51.48430;,
 -1.51548;-0.03419;-41.38102;,
 0.00000;-0.03419;-51.48430;,
 -1.07161;-1.10582;-41.38102;,
 0.00000;-0.03419;-51.48430;,
 0.00000;-1.54969;-41.38102;,
 0.00000;-0.03419;-41.38102;,
 0.00000;-1.54969;-41.38102;,
 1.07162;-1.10582;-41.38102;,
 1.51549;-0.03419;-41.38102;,
 1.07162;1.03742;-41.38102;,
 0.00000;1.48130;-41.38102;,
 -1.07161;1.03742;-41.38102;,
 -1.51548;-0.03419;-41.38102;,
 -1.07161;-1.10582;-41.38102;,
 0.32437;24.50747;-41.28801;,
 1.23160;25.49354;-40.82871;,
 0.11066;20.89491;-41.05418;,
 -0.22612;20.89491;-41.05418;,
 0.66596;16.18004;-41.52497;,
 0.32918;16.18004;-41.52497;,
 1.23809;12.62964;-40.76806;,
 0.90131;12.62964;-40.76806;,
 0.11066;6.75032;-41.30247;,
 -0.22612;6.75032;-41.30247;,
 -0.43944;2.46161;-41.92523;,
 -0.75772;3.53666;-40.85731;,
 0.13471;0.55339;-40.81233;,
 -0.13471;0.55339;-40.81233;,
 1.23160;25.49354;-40.82871;,
 0.56737;24.74207;-28.60656;,
 0.11066;20.89491;-27.13538;,
 0.11066;20.89491;-41.05418;,
 0.66596;16.18004;-27.60618;,
 0.66596;16.18004;-41.52497;,
 1.23809;11.47149;-26.84926;,
 1.23809;12.62964;-40.76806;,
 0.14799;7.33972;-28.11981;,
 0.11066;6.75032;-41.30247;,
 -0.43944;3.33287;-28.25342;,
 -0.43944;2.46161;-41.92523;,
 0.13471;0.55339;-27.88010;,
 0.13471;0.55339;-40.81233;,
 0.56737;24.74207;-28.60656;,
 0.32437;24.21744;-27.62131;,
 -0.22612;20.89491;-27.13538;,
 0.11066;20.89491;-27.13538;,
 0.32918;16.18004;-27.60618;,
 0.66596;16.18004;-27.60618;,
 0.90131;11.47149;-26.84926;,
 1.23809;11.47149;-26.84926;,
 -0.22612;6.75032;-27.38369;,
 0.14799;7.33972;-28.11981;,
 -0.77621;3.33287;-28.25342;,
 -0.43944;3.33287;-28.25342;,
 -0.13471;0.55339;-27.88010;,
 0.13471;0.55339;-27.88010;,
 0.32437;24.21744;-27.62131;,
 0.32437;24.50747;-41.28801;,
 -0.22612;20.89491;-41.05418;,
 -0.22612;20.89491;-27.13538;,
 0.32918;16.18004;-41.52497;,
 0.32918;16.18004;-27.60618;,
 0.90131;12.62964;-40.76806;,
 0.90131;11.47149;-26.84926;,
 -0.22612;6.75032;-41.30247;,
 -0.22612;6.75032;-27.38369;,
 -0.75772;3.53666;-40.85731;,
 -0.77621;3.33287;-28.25342;,
 -0.13471;0.55339;-40.81233;,
 -0.13471;0.55339;-27.88010;,
 1.23160;25.49354;-40.82871;,
 0.32437;24.50747;-41.28801;,
 -0.13471;0.55339;-40.81233;,
 0.13471;0.55339;-40.81233;;
 
 210;
 4;0,1,2,3;,
 4;1,4,5,2;,
 4;4,6,7,5;,
 4;6,8,9,7;,
 4;8,10,11,9;,
 4;10,12,13,11;,
 4;12,14,15,13;,
 4;14,16,17,15;,
 3;18,1,0;,
 3;19,4,1;,
 3;20,6,4;,
 3;21,8,6;,
 3;22,10,8;,
 3;23,12,10;,
 3;24,14,12;,
 3;25,16,14;,
 3;26,3,2;,
 3;27,2,5;,
 3;28,5,7;,
 3;29,7,9;,
 3;30,9,11;,
 3;31,11,13;,
 3;32,13,15;,
 3;33,15,17;,
 4;34,35,36,37;,
 4;35,38,39,36;,
 4;36,39,40,41;,
 4;38,42,43,39;,
 4;42,44,45,43;,
 4;43,45,46,47;,
 4;44,48,49,45;,
 4;48,50,51,49;,
 4;49,51,52,53;,
 4;50,54,55,51;,
 4;54,56,57,55;,
 4;55,57,58,59;,
 4;56,60,61,57;,
 4;60,62,63,61;,
 4;61,63,64,65;,
 4;62,66,67,63;,
 4;66,68,69,67;,
 4;67,69,70,71;,
 4;68,72,73,69;,
 4;72,74,75,73;,
 4;73,75,76,77;,
 4;74,78,79,75;,
 4;78,80,81,79;,
 4;79,81,82,83;,
 3;84,85,86;,
 3;85,35,86;,
 3;86,35,34;,
 3;85,38,35;,
 3;87,88,89;,
 3;88,42,89;,
 3;89,42,38;,
 3;88,44,42;,
 3;90,91,92;,
 3;91,48,92;,
 3;92,48,44;,
 3;91,50,48;,
 3;93,94,95;,
 3;94,54,95;,
 3;95,54,50;,
 3;94,56,54;,
 3;96,97,98;,
 3;97,60,98;,
 3;98,60,56;,
 3;97,62,60;,
 3;99,100,101;,
 3;100,66,101;,
 3;101,66,62;,
 3;100,68,66;,
 3;102,103,104;,
 3;103,72,104;,
 3;104,72,68;,
 3;103,74,72;,
 3;105,106,107;,
 3;106,78,107;,
 3;107,78,74;,
 3;106,80,78;,
 3;108,109,110;,
 3;111,112,113;,
 3;114,115,116;,
 3;117,118,119;,
 3;120,121,122;,
 3;123,124,125;,
 3;126,127,128;,
 3;129,130,131;,
 4;132,133,134,135;,
 4;133,136,137,134;,
 4;134,137,138,139;,
 4;136,140,141,137;,
 4;140,142,143,141;,
 4;141,143,144,145;,
 4;142,146,147,143;,
 4;146,148,149,147;,
 4;147,149,150,151;,
 4;148,152,153,149;,
 4;152,154,155,153;,
 4;153,155,156,157;,
 4;154,158,159,155;,
 4;158,160,161,159;,
 4;159,161,162,163;,
 4;160,164,165,161;,
 4;164,166,167,165;,
 4;165,167,168,169;,
 4;166,170,171,167;,
 4;170,172,173,171;,
 4;171,173,174,175;,
 4;172,176,177,173;,
 4;176,178,179,177;,
 4;177,179,180,181;,
 3;182,183,184;,
 3;183,133,184;,
 3;184,133,132;,
 3;183,136,133;,
 3;185,186,187;,
 3;186,140,187;,
 3;187,140,136;,
 3;186,142,140;,
 3;188,189,190;,
 3;189,146,190;,
 3;190,146,142;,
 3;189,148,146;,
 3;191,192,193;,
 3;192,152,193;,
 3;193,152,148;,
 3;192,154,152;,
 3;194,195,196;,
 3;195,158,196;,
 3;196,158,154;,
 3;195,160,158;,
 3;197,198,199;,
 3;198,164,199;,
 3;199,164,160;,
 3;198,166,164;,
 3;200,201,202;,
 3;201,170,202;,
 3;202,170,166;,
 3;201,172,170;,
 3;203,204,205;,
 3;204,176,205;,
 3;205,176,172;,
 3;204,178,176;,
 3;206,207,208;,
 3;209,210,211;,
 3;212,213,214;,
 3;215,216,217;,
 3;218,219,220;,
 3;221,222,223;,
 3;224,225,226;,
 3;227,228,229;,
 3;230,231,41;,
 3;232,233,47;,
 3;234,235,53;,
 3;236,237,59;,
 3;238,239,65;,
 3;240,241,71;,
 3;242,243,77;,
 3;244,245,83;,
 3;246,247,139;,
 3;248,249,145;,
 3;250,251,151;,
 3;252,253,157;,
 3;254,255,163;,
 3;256,257,169;,
 3;258,259,175;,
 3;260,261,181;,
 3;262,263,264;,
 3;264,265,266;,
 3;266,267,268;,
 3;268,269,270;,
 3;270,271,272;,
 3;272,273,274;,
 3;274,275,276;,
 3;276,277,278;,
 3;279,280,281;,
 3;279,281,282;,
 3;279,282,283;,
 3;279,283,284;,
 3;279,284,285;,
 3;279,285,286;,
 3;279,286,287;,
 3;279,287,280;,
 4;288,289,290,291;,
 4;291,290,292,293;,
 4;293,292,294,295;,
 4;295,294,296,297;,
 4;297,296,298,299;,
 4;299,298,300,301;,
 4;302,303,304,305;,
 4;305,304,306,307;,
 4;307,306,308,309;,
 4;309,308,310,311;,
 4;311,310,312,313;,
 4;313,312,314,315;,
 4;316,317,318,319;,
 4;319,318,320,321;,
 4;321,320,322,323;,
 4;323,322,324,325;,
 4;325,324,326,327;,
 4;327,326,328,329;,
 4;330,331,332,333;,
 4;333,332,334,335;,
 4;335,334,336,337;,
 4;337,336,338,339;,
 4;339,338,340,341;,
 4;341,340,342,343;,
 4;330,303,344,345;,
 4;346,347,314,343;;
 
 MeshMaterialList {
  22;
  210;
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  10,
  10,
  9,
  10,
  10,
  9,
  10,
  10,
  9,
  10,
  10,
  9,
  10,
  10,
  9,
  10,
  10,
  9,
  10,
  10,
  9,
  10,
  10,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  10,
  10,
  9,
  10,
  10,
  9,
  10,
  10,
  9,
  10,
  10,
  9,
  10,
  10,
  9,
  10,
  10,
  9,
  10,
  10,
  9,
  10,
  10,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  10,
  10,
  10,
  10,
  10,
  10,
  0,
  0,
  0,
  0,
  0,
  0,
  10,
  10,
  10,
  10,
  10,
  10,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0;;
  Material {
   0.800000;0.800000;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.078400;0.429600;0.800000;1.000000;;
   12.000000;
   0.120000;0.120000;0.120000;;
   0.011760;0.064440;0.120000;;
  }
  Material {
   0.357600;0.357600;0.357600;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.511200;0.511200;0.511200;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.000000;0.000000;0.000000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.166400;0.166400;0.166400;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.580000;0.527200;0.392000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.511200;0.464000;0.344800;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.455200;0.455200;0.455200;1.000000;;
   25.000000;
   0.220000;0.220000;0.220000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.006400;0.034400;0.062400;1.000000;;
   12.000000;
   0.120000;0.120000;0.120000;;
   0.000960;0.005160;0.009360;;
  }
  Material {
   0.024800;0.125600;0.235200;1.000000;;
   12.000000;
   0.120000;0.120000;0.120000;;
   0.003720;0.018840;0.035280;;
  }
  Material {
   0.800000;0.800000;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.545600;0.128800;0.930000;;
   15.000000;
   0.020000;0.020000;0.020000;;
   0.240000;0.163680;0.038640;;
  }
  Material {
   0.718400;0.021600;0.000000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.599760;0.487200;0.000000;1.000000;;
   20.000000;
   0.400000;0.400000;0.400000;;
   0.042840;0.034800;0.000000;;
  }
  Material {
   0.000000;0.360800;0.800000;0.800000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.417600;0.731200;0.718400;0.800000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.000000;0.000000;0.000000;1.000000;;
   5.000000;
   0.180000;0.180000;0.180000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.892800;0.747900;0.229500;1.000000;;
   8.000000;
   0.250000;0.250000;0.250000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.056800;0.460800;0.800000;1.000000;;
   11.000000;
   0.330000;0.330000;0.330000;;
   0.024850;0.201600;0.350000;;
  }
  Material {
   0.800000;0.800000;0.800000;0.550000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.000000;0.213600;0.448800;1.000000;;
   5.000000;
   0.250000;0.250000;0.250000;;
   0.000000;0.000000;0.000000;;
  }
 }
 MeshNormals {
  187;
  0.000000;0.000000;1.000000;,
  -0.000001;0.999995;0.003169;,
  0.707103;0.707103;0.003169;,
  0.999995;0.000001;0.003169;,
  0.707102;-0.707104;0.003169;,
  -0.000001;-0.999995;0.003169;,
  -0.707104;-0.707102;0.003169;,
  -0.999995;0.000001;0.003169;,
  -0.707105;0.707101;0.003169;,
  0.000000;0.000000;-1.000000;,
  -0.000001;0.999685;-0.025118;,
  0.382575;0.923619;-0.023766;,
  0.706884;0.706883;-0.025119;,
  -0.004557;0.999973;-0.005692;,
  0.378441;0.925610;-0.005352;,
  0.703866;0.710310;-0.005693;,
  0.136041;0.990610;0.013623;,
  0.796663;0.604270;0.013623;,
  0.923620;0.382573;-0.023767;,
  0.999684;0.000002;-0.025121;,
  0.922104;0.386906;-0.005353;,
  0.999973;0.004559;-0.005693;,
  0.990610;-0.136038;0.013624;,
  0.923621;-0.382568;-0.023768;,
  0.706883;-0.706885;-0.025122;,
  0.925613;-0.378433;-0.005353;,
  0.710309;-0.703867;-0.005694;,
  0.604268;-0.796665;0.013623;,
  0.382564;-0.923623;-0.023769;,
  -0.000001;-0.999684;-0.025122;,
  0.386899;-0.922107;-0.005354;,
  0.004558;-0.999973;-0.005693;,
  -0.136037;-0.990610;0.013624;,
  -0.382565;-0.923623;-0.023769;,
  -0.706883;-0.706885;-0.025121;,
  -0.378430;-0.925614;-0.005353;,
  -0.703866;-0.710310;-0.005694;,
  -0.796665;-0.604267;0.013623;,
  -0.923623;-0.382565;-0.023768;,
  -0.999684;0.000002;-0.025121;,
  -0.922107;-0.386899;-0.005353;,
  -0.999973;-0.004557;-0.005693;,
  -0.990610;0.136037;0.013623;,
  -0.923621;0.382569;-0.023767;,
  -0.706884;0.706883;-0.025119;,
  -0.925614;0.378432;-0.005353;,
  -0.710311;0.703865;-0.005693;,
  -0.604274;0.796660;0.013622;,
  -0.382577;0.923618;-0.023765;,
  -0.386910;0.922102;-0.005352;,
  0.000000;-0.000002;1.000000;,
  0.000000;0.069303;0.997596;,
  0.049006;0.049005;0.997596;,
  0.069305;-0.000000;0.997596;,
  0.049005;-0.049005;0.997596;,
  0.000000;-0.069306;0.997595;,
  -0.049005;-0.049005;0.997596;,
  -0.069305;-0.000000;0.997595;,
  -0.049006;0.049006;0.997595;,
  -0.000001;-0.999684;0.025120;,
  0.382565;-0.923623;0.023767;,
  0.706881;-0.706886;0.025120;,
  -0.004558;-0.999973;0.005692;,
  0.378430;-0.925614;0.005352;,
  0.703864;-0.710313;0.005693;,
  0.136036;-0.990610;-0.013624;,
  0.796662;-0.604271;-0.013624;,
  0.923621;-0.382569;0.023767;,
  0.999684;0.000002;0.025121;,
  0.922105;-0.386903;0.005353;,
  0.999973;-0.004556;0.005693;,
  0.990610;0.136040;-0.013624;,
  0.923619;0.382575;0.023768;,
  0.706885;0.706883;0.025121;,
  0.925611;0.378438;0.005353;,
  0.710312;0.703864;0.005693;,
  0.604274;0.796660;-0.013623;,
  0.382580;0.923616;0.023768;,
  -0.000001;0.999685;0.025120;,
  0.386914;0.922100;0.005353;,
  0.004555;0.999973;0.005694;,
  -0.136044;0.990609;-0.013622;,
  -0.382582;0.923616;0.023767;,
  -0.706885;0.706882;0.025121;,
  -0.378446;0.925608;0.005353;,
  -0.703867;0.710309;0.005693;,
  -0.796664;0.604268;-0.013623;,
  -0.923620;0.382571;0.023768;,
  -0.999684;0.000002;0.025121;,
  -0.922104;0.386905;0.005353;,
  -0.999973;0.004560;0.005693;,
  -0.990610;-0.136036;-0.013623;,
  -0.923623;-0.382566;0.023767;,
  -0.706881;-0.706886;0.025120;,
  -0.925615;-0.378429;0.005353;,
  -0.710308;-0.703868;0.005693;,
  -0.604268;-0.796665;-0.013623;,
  -0.382566;-0.923622;0.023767;,
  -0.386899;-0.922106;0.005353;,
  0.000000;-0.000003;-1.000000;,
  0.000000;-0.069317;-0.997595;,
  0.049013;-0.049013;-0.997595;,
  0.069314;-0.000001;-0.997595;,
  0.049012;0.049012;-0.997595;,
  0.000000;0.069313;-0.997595;,
  -0.049012;0.049012;-0.997595;,
  -0.069314;-0.000001;-0.997595;,
  -0.049013;-0.049014;-0.997595;,
  -0.000000;-0.988936;-0.148341;,
  0.699284;-0.699283;-0.148341;,
  0.988936;0.000001;-0.148340;,
  0.699284;0.699283;-0.148341;,
  -0.000000;0.988936;-0.148341;,
  -0.699286;0.699281;-0.148340;,
  -0.988937;0.000001;-0.148340;,
  -0.699286;-0.699281;-0.148341;,
  0.271588;-0.078155;-0.959235;,
  0.137640;0.010746;-0.990424;,
  0.000000;-0.055233;-0.998473;,
  0.000000;-0.059664;-0.998219;,
  -0.272302;0.059321;-0.960381;,
  -0.895572;-0.141098;-0.421951;,
  -0.868977;-0.364728;-0.334444;,
  -0.603090;-0.228056;-0.764377;,
  -0.635814;-0.462095;-0.618230;,
  0.894470;-0.058358;0.443304;,
  0.956123;0.004434;0.292931;,
  0.991663;0.128837;0.002543;,
  0.947557;-0.154420;0.279804;,
  0.863952;-0.259236;0.431722;,
  0.952608;-0.050497;0.299981;,
  0.970577;0.240629;-0.008883;,
  0.624169;0.073611;0.777814;,
  0.332056;-0.013699;0.943160;,
  0.000000;0.029929;0.999552;,
  0.309755;-0.095776;0.945980;,
  0.563899;-0.286436;0.774579;,
  0.297091;-0.055585;0.953230;,
  0.000000;0.133120;0.991100;,
  0.088804;0.214393;0.972702;,
  0.000000;0.308299;0.951289;,
  0.218001;0.218001;0.951289;,
  0.214394;0.088804;0.972702;,
  0.308300;-0.000001;0.951289;,
  0.214393;-0.088802;0.972702;,
  0.217999;-0.217997;0.951290;,
  0.088803;-0.214393;0.972702;,
  0.000000;-0.308302;0.951289;,
  -0.088803;-0.214394;0.972702;,
  -0.218000;-0.217999;0.951290;,
  -0.214394;-0.088801;0.972702;,
  -0.308302;-0.000001;0.951289;,
  -0.214395;0.088803;0.972702;,
  -0.218002;0.218002;0.951289;,
  -0.088804;0.214394;0.972702;,
  0.088812;-0.214418;-0.972696;,
  0.000000;-0.308327;-0.951280;,
  0.218017;-0.218016;-0.951282;,
  0.214417;-0.088813;-0.972696;,
  0.308323;-0.000001;-0.951282;,
  0.214416;0.088814;-0.972696;,
  0.218016;0.218017;-0.951282;,
  0.088814;0.214416;-0.972696;,
  0.000000;0.308322;-0.951282;,
  -0.088815;0.214416;-0.972696;,
  -0.218017;0.218019;-0.951281;,
  -0.214417;0.088813;-0.972696;,
  -0.308324;-0.000001;-0.951281;,
  -0.214418;-0.088812;-0.972696;,
  -0.218018;-0.218018;-0.951281;,
  -0.088813;-0.214419;-0.972696;,
  0.983752;-0.178517;0.019079;,
  0.999469;-0.031117;0.009646;,
  0.999205;-0.039849;-0.001246;,
  0.984013;-0.178093;-0.000801;,
  0.998600;0.052875;-0.001501;,
  0.000000;-0.099360;0.995052;,
  0.000000;0.158717;0.987324;,
  -0.929737;0.368206;0.003619;,
  -0.999794;0.020283;0.000808;,
  -0.991663;-0.128837;-0.002543;,
  -0.999390;0.034853;0.002282;,
  -0.982672;0.185285;0.005090;,
  -0.999628;-0.027266;-0.000903;,
  -0.976677;-0.214703;-0.002371;,
  -0.827374;0.561625;0.005464;,
  0.000000;-1.000000;-0.000000;;
  210;
  4;1,2,2,1;,
  4;2,3,3,2;,
  4;3,4,4,3;,
  4;4,5,5,4;,
  4;5,6,6,5;,
  4;6,7,7,6;,
  4;7,8,8,7;,
  4;8,1,1,8;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;9,9,9;,
  3;9,9,9;,
  3;9,9,9;,
  3;9,9,9;,
  3;9,9,9;,
  3;9,9,9;,
  3;9,9,9;,
  3;9,9,9;,
  4;10,11,14,13;,
  4;11,12,15,14;,
  4;14,15,17,16;,
  4;12,18,20,15;,
  4;18,19,21,20;,
  4;20,21,22,17;,
  4;19,23,25,21;,
  4;23,24,26,25;,
  4;25,26,27,22;,
  4;24,28,30,26;,
  4;28,29,31,30;,
  4;30,31,32,27;,
  4;29,33,35,31;,
  4;33,34,36,35;,
  4;35,36,37,32;,
  4;34,38,40,36;,
  4;38,39,41,40;,
  4;40,41,42,37;,
  4;39,43,45,41;,
  4;43,44,46,45;,
  4;45,46,47,42;,
  4;44,48,49,46;,
  4;48,10,13,49;,
  4;49,13,16,47;,
  3;50,52,51;,
  3;52,139,51;,
  3;51,139,140;,
  3;52,141,139;,
  3;50,53,52;,
  3;53,142,52;,
  3;52,142,141;,
  3;53,143,142;,
  3;50,54,53;,
  3;54,144,53;,
  3;53,144,143;,
  3;54,145,144;,
  3;50,55,54;,
  3;55,146,54;,
  3;54,146,145;,
  3;55,147,146;,
  3;50,56,55;,
  3;56,148,55;,
  3;55,148,147;,
  3;56,149,148;,
  3;50,57,56;,
  3;57,150,56;,
  3;56,150,149;,
  3;57,151,150;,
  3;50,58,57;,
  3;58,152,57;,
  3;57,152,151;,
  3;58,153,152;,
  3;50,51,58;,
  3;51,154,58;,
  3;58,154,153;,
  3;51,140,154;,
  3;9,9,9;,
  3;9,9,9;,
  3;9,9,9;,
  3;9,9,9;,
  3;9,9,9;,
  3;9,9,9;,
  3;9,9,9;,
  3;9,9,9;,
  4;59,60,63,62;,
  4;60,61,64,63;,
  4;63,64,66,65;,
  4;61,67,69,64;,
  4;67,68,70,69;,
  4;69,70,71,66;,
  4;68,72,74,70;,
  4;72,73,75,74;,
  4;74,75,76,71;,
  4;73,77,79,75;,
  4;77,78,80,79;,
  4;79,80,81,76;,
  4;78,82,84,80;,
  4;82,83,85,84;,
  4;84,85,86,81;,
  4;83,87,89,85;,
  4;87,88,90,89;,
  4;89,90,91,86;,
  4;88,92,94,90;,
  4;92,93,95,94;,
  4;94,95,96,91;,
  4;93,97,98,95;,
  4;97,59,62,98;,
  4;98,62,65,96;,
  3;99,101,100;,
  3;101,155,100;,
  3;100,155,156;,
  3;101,157,155;,
  3;99,102,101;,
  3;102,158,101;,
  3;101,158,157;,
  3;102,159,158;,
  3;99,103,102;,
  3;103,160,102;,
  3;102,160,159;,
  3;103,161,160;,
  3;99,104,103;,
  3;104,162,103;,
  3;103,162,161;,
  3;104,163,162;,
  3;99,105,104;,
  3;105,164,104;,
  3;104,164,163;,
  3;105,165,164;,
  3;99,106,105;,
  3;106,166,105;,
  3;105,166,165;,
  3;106,167,166;,
  3;99,107,106;,
  3;107,168,106;,
  3;106,168,167;,
  3;107,169,168;,
  3;99,100,107;,
  3;100,170,107;,
  3;107,170,169;,
  3;100,156,170;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;13,14,16;,
  3;15,20,17;,
  3;21,25,22;,
  3;26,30,27;,
  3;31,35,32;,
  3;36,40,37;,
  3;41,45,42;,
  3;46,49,47;,
  3;62,63,65;,
  3;64,69,66;,
  3;70,74,71;,
  3;75,79,76;,
  3;80,84,81;,
  3;85,89,86;,
  3;90,94,91;,
  3;95,98,96;,
  3;108,109,109;,
  3;109,109,110;,
  3;110,111,111;,
  3;111,111,112;,
  3;112,113,113;,
  3;113,113,114;,
  3;114,115,115;,
  3;115,115,108;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  4;116,116,117,117;,
  4;117,117,118,118;,
  4;118,118,119,119;,
  4;119,119,120,120;,
  4;120,120,123,121;,
  4;121,123,124,122;,
  4;171,125,126,172;,
  4;172,126,127,127;,
  4;127,127,128,173;,
  4;173,128,129,174;,
  4;174,129,130,175;,
  4;175,130,131,131;,
  4;125,132,133,126;,
  4;176,133,134,134;,
  4;134,134,135,177;,
  4;128,135,136,129;,
  4;129,136,137,130;,
  4;138,137,138,138;,
  4;178,178,179,179;,
  4;179,179,180,180;,
  4;180,180,181,181;,
  4;181,181,182,182;,
  4;182,182,121,183;,
  4;183,121,122,184;,
  4;178,185,185,178;,
  4;186,186,186,186;;
 }
 MeshTextureCoords {
  348;
  0.000000;0.000000;,
  0.125000;0.000000;,
  0.125000;1.000000;,
  0.000000;1.000000;,
  0.250000;0.000000;,
  0.250000;1.000000;,
  0.375000;0.000000;,
  0.375000;1.000000;,
  0.500000;0.000000;,
  0.500000;1.000000;,
  0.625000;0.000000;,
  0.625000;1.000000;,
  0.750000;0.000000;,
  0.750000;1.000000;,
  0.875000;0.000000;,
  0.875000;1.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.062500;0.000000;,
  0.187500;0.000000;,
  0.312500;0.000000;,
  0.437500;0.000000;,
  0.562500;0.000000;,
  0.687500;0.000000;,
  0.812500;0.000000;,
  0.937500;0.000000;,
  0.062500;1.000000;,
  0.187500;1.000000;,
  0.312500;1.000000;,
  0.437500;1.000000;,
  0.562500;1.000000;,
  0.687500;1.000000;,
  0.812500;1.000000;,
  0.937500;1.000000;,
  0.000000;0.000000;,
  0.062500;0.000000;,
  0.062500;0.500000;,
  0.000000;0.500000;,
  0.125000;0.000000;,
  0.125000;0.500000;,
  0.125000;1.000000;,
  0.062500;1.000000;,
  0.187500;0.000000;,
  0.187500;0.500000;,
  0.250000;0.000000;,
  0.250000;0.500000;,
  0.250000;1.000000;,
  0.187500;1.000000;,
  0.312500;0.000000;,
  0.312500;0.500000;,
  0.375000;0.000000;,
  0.375000;0.500000;,
  0.375000;1.000000;,
  0.312500;1.000000;,
  0.437500;0.000000;,
  0.437500;0.500000;,
  0.500000;0.000000;,
  0.500000;0.500000;,
  0.500000;1.000000;,
  0.437500;1.000000;,
  0.562500;0.000000;,
  0.562500;0.500000;,
  0.625000;0.000000;,
  0.625000;0.500000;,
  0.625000;1.000000;,
  0.562500;1.000000;,
  0.687500;0.000000;,
  0.687500;0.500000;,
  0.750000;0.000000;,
  0.750000;0.500000;,
  0.750000;1.000000;,
  0.687500;1.000000;,
  0.812500;0.000000;,
  0.812500;0.500000;,
  0.875000;0.000000;,
  0.875000;0.500000;,
  0.875000;1.000000;,
  0.812500;1.000000;,
  0.937500;0.000000;,
  0.937500;0.500000;,
  1.000000;0.000000;,
  1.000000;0.500000;,
  1.000000;1.000000;,
  0.937500;1.000000;,
  0.062500;0.000000;,
  0.093750;0.000000;,
  0.031250;0.000000;,
  0.187500;0.000000;,
  0.218750;0.000000;,
  0.156250;0.000000;,
  0.312500;0.000000;,
  0.343750;0.000000;,
  0.281250;0.000000;,
  0.437500;0.000000;,
  0.468750;0.000000;,
  0.406250;0.000000;,
  0.562500;0.000000;,
  0.593750;0.000000;,
  0.531250;0.000000;,
  0.687500;0.000000;,
  0.718750;0.000000;,
  0.656250;0.000000;,
  0.812500;0.000000;,
  0.843750;0.000000;,
  0.781250;0.000000;,
  0.937500;0.000000;,
  0.968750;0.000000;,
  0.906250;0.000000;,
  0.062500;1.000000;,
  0.031250;1.000000;,
  0.093750;1.000000;,
  0.187500;1.000000;,
  0.156250;1.000000;,
  0.218750;1.000000;,
  0.312500;1.000000;,
  0.281250;1.000000;,
  0.343750;1.000000;,
  0.437500;1.000000;,
  0.406250;1.000000;,
  0.468750;1.000000;,
  0.562500;1.000000;,
  0.531250;1.000000;,
  0.593750;1.000000;,
  0.687500;1.000000;,
  0.656250;1.000000;,
  0.718750;1.000000;,
  0.812500;1.000000;,
  0.781250;1.000000;,
  0.843750;1.000000;,
  0.937500;1.000000;,
  0.906250;1.000000;,
  0.968750;1.000000;,
  0.000000;0.000000;,
  0.062500;0.000000;,
  0.062500;0.500000;,
  0.000000;0.500000;,
  0.125000;0.000000;,
  0.125000;0.500000;,
  0.125000;1.000000;,
  0.062500;1.000000;,
  0.187500;0.000000;,
  0.187500;0.500000;,
  0.250000;0.000000;,
  0.250000;0.500000;,
  0.250000;1.000000;,
  0.187500;1.000000;,
  0.312500;0.000000;,
  0.312500;0.500000;,
  0.375000;0.000000;,
  0.375000;0.500000;,
  0.375000;1.000000;,
  0.312500;1.000000;,
  0.437500;0.000000;,
  0.437500;0.500000;,
  0.500000;0.000000;,
  0.500000;0.500000;,
  0.500000;1.000000;,
  0.437500;1.000000;,
  0.562500;0.000000;,
  0.562500;0.500000;,
  0.625000;0.000000;,
  0.625000;0.500000;,
  0.625000;1.000000;,
  0.562500;1.000000;,
  0.687500;0.000000;,
  0.687500;0.500000;,
  0.750000;0.000000;,
  0.750000;0.500000;,
  0.750000;1.000000;,
  0.687500;1.000000;,
  0.812500;0.000000;,
  0.812500;0.500000;,
  0.875000;0.000000;,
  0.875000;0.500000;,
  0.875000;1.000000;,
  0.812500;1.000000;,
  0.937500;0.000000;,
  0.937500;0.500000;,
  1.000000;0.000000;,
  1.000000;0.500000;,
  1.000000;1.000000;,
  0.937500;1.000000;,
  0.062500;0.000000;,
  0.093750;0.000000;,
  0.031250;0.000000;,
  0.187500;0.000000;,
  0.218750;0.000000;,
  0.156250;0.000000;,
  0.312500;0.000000;,
  0.343750;0.000000;,
  0.281250;0.000000;,
  0.437500;0.000000;,
  0.468750;0.000000;,
  0.406250;0.000000;,
  0.562500;0.000000;,
  0.593750;0.000000;,
  0.531250;0.000000;,
  0.687500;0.000000;,
  0.718750;0.000000;,
  0.656250;0.000000;,
  0.812500;0.000000;,
  0.843750;0.000000;,
  0.781250;0.000000;,
  0.937500;0.000000;,
  0.968750;0.000000;,
  0.906250;0.000000;,
  0.062500;1.000000;,
  0.031250;1.000000;,
  0.093750;1.000000;,
  0.187500;1.000000;,
  0.156250;1.000000;,
  0.218750;1.000000;,
  0.312500;1.000000;,
  0.281250;1.000000;,
  0.343750;1.000000;,
  0.437500;1.000000;,
  0.406250;1.000000;,
  0.468750;1.000000;,
  0.562500;1.000000;,
  0.531250;1.000000;,
  0.593750;1.000000;,
  0.687500;1.000000;,
  0.656250;1.000000;,
  0.718750;1.000000;,
  0.812500;1.000000;,
  0.781250;1.000000;,
  0.843750;1.000000;,
  0.937500;1.000000;,
  0.906250;1.000000;,
  0.968750;1.000000;,
  0.000000;0.750000;,
  0.031250;0.750000;,
  0.125000;0.750000;,
  0.156250;0.750000;,
  0.250000;0.750000;,
  0.281250;0.750000;,
  0.375000;0.750000;,
  0.406250;0.750000;,
  0.500000;0.750000;,
  0.531250;0.750000;,
  0.625000;0.750000;,
  0.656250;0.750000;,
  0.750000;0.750000;,
  0.781250;0.750000;,
  0.875000;0.750000;,
  0.906250;0.750000;,
  0.000000;0.750000;,
  0.031250;0.750000;,
  0.125000;0.750000;,
  0.156250;0.750000;,
  0.250000;0.750000;,
  0.281250;0.750000;,
  0.375000;0.750000;,
  0.406250;0.750000;,
  0.500000;0.750000;,
  0.531250;0.750000;,
  0.625000;0.750000;,
  0.656250;0.750000;,
  0.750000;0.750000;,
  0.781250;0.750000;,
  0.875000;0.750000;,
  0.906250;0.750000;,
  0.000000;1.000000;,
  0.062500;0.000000;,
  0.125000;1.000000;,
  0.125000;0.000000;,
  0.250000;1.000000;,
  0.187500;0.000000;,
  0.375000;1.000000;,
  0.250000;0.000000;,
  0.500000;1.000000;,
  0.312500;0.000000;,
  0.625000;1.000000;,
  0.375000;0.000000;,
  0.750000;1.000000;,
  0.437500;0.000000;,
  0.875000;1.000000;,
  0.500000;0.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;0.166670;,
  0.000000;0.166670;,
  1.000000;0.333330;,
  0.000000;0.333330;,
  1.000000;0.500000;,
  0.000000;0.500000;,
  1.000000;0.666670;,
  0.000000;0.666670;,
  1.000000;0.833330;,
  0.000000;0.833330;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;0.166670;,
  0.000000;0.166670;,
  1.000000;0.333330;,
  0.000000;0.333330;,
  1.000000;0.500000;,
  0.000000;0.500000;,
  1.000000;0.666670;,
  0.000000;0.666670;,
  1.000000;0.833330;,
  0.000000;0.833330;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;0.166670;,
  0.000000;0.166670;,
  1.000000;0.333330;,
  0.000000;0.333330;,
  1.000000;0.500000;,
  0.000000;0.500000;,
  1.000000;0.666670;,
  0.000000;0.666670;,
  1.000000;0.833330;,
  0.000000;0.833330;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;0.166670;,
  0.000000;0.166670;,
  1.000000;0.333330;,
  0.000000;0.333330;,
  1.000000;0.500000;,
  0.000000;0.500000;,
  1.000000;0.666670;,
  0.000000;0.666670;,
  1.000000;0.833330;,
  0.000000;0.833330;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;;
 }
}
