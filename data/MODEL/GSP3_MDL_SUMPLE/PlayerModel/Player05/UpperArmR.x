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
 278;
 -0.32500;-0.70000;0.00000;,
 -0.29931;-0.65252;-0.27561;,
 -0.14113;-0.74997;-0.19489;,
 -0.32500;-0.70000;0.00000;,
 -0.07562;-0.79032;0.00000;,
 -0.32500;-0.70000;0.00000;,
 -0.14113;-0.74997;0.19488;,
 -0.32500;-0.70000;0.00000;,
 -0.29931;-0.65252;0.27560;,
 -0.32500;-0.70000;0.00000;,
 -0.45749;-0.55508;0.19488;,
 -0.32500;-0.70000;0.00000;,
 -0.52302;-0.51471;0.00000;,
 -0.32500;-0.70000;0.00000;,
 -0.45749;-0.55508;-0.19489;,
 -0.32500;-0.70000;0.00000;,
 -0.29931;-0.65252;-0.27561;,
 0.32428;0.49993;-0.27561;,
 0.34998;0.54742;0.00000;,
 0.48246;0.40250;-0.19489;,
 0.34998;0.54742;0.00000;,
 0.54799;0.36214;0.00000;,
 0.34998;0.54742;0.00000;,
 0.48246;0.40250;0.19488;,
 0.34998;0.54742;0.00000;,
 0.32428;0.49993;0.27560;,
 0.34998;0.54742;0.00000;,
 0.16610;0.59737;0.19488;,
 0.34998;0.54742;0.00000;,
 0.10059;0.63774;0.00000;,
 0.34998;0.54742;0.00000;,
 0.16610;0.59737;-0.19489;,
 0.34998;0.54742;0.00000;,
 0.32428;0.49993;-0.27561;,
 -0.19198;-0.46513;0.00000;,
 -0.03656;-0.46513;-0.37521;,
 -0.19198;-0.46513;-0.40613;,
 -0.19198;-0.46513;0.00000;,
 0.09519;-0.46513;-0.28718;,
 -0.19198;-0.46513;0.00000;,
 0.18323;-0.46513;-0.15542;,
 -0.19198;-0.46513;0.00000;,
 0.21414;-0.46513;-0.00000;,
 -0.19198;-0.46513;0.00000;,
 0.18323;-0.46513;0.15541;,
 -0.19198;-0.46513;0.00000;,
 0.09519;-0.46513;0.28717;,
 -0.19198;-0.46513;0.00000;,
 -0.03656;-0.46513;0.37521;,
 -0.19198;-0.46513;0.00000;,
 -0.19198;-0.46513;0.40612;,
 -0.19198;-0.46513;0.00000;,
 -0.34740;-0.46513;0.37521;,
 -0.19198;-0.46513;0.00000;,
 -0.47916;-0.46513;0.28717;,
 -0.19198;-0.46513;0.00000;,
 -0.56719;-0.46513;0.15541;,
 -0.19198;-0.46513;0.00000;,
 -0.59811;-0.46513;0.00000;,
 -0.19198;-0.46513;0.00000;,
 -0.56719;-0.46513;-0.15542;,
 -0.19198;-0.46513;0.00000;,
 -0.47916;-0.46513;-0.28718;,
 -0.19198;-0.46513;0.00000;,
 -0.34740;-0.46513;-0.37521;,
 -0.19198;-0.46513;0.00000;,
 -0.19198;-0.46513;-0.40613;,
 -0.19198;-2.14726;0.00000;,
 -0.19198;-2.08161;-0.39597;,
 0.02378;-2.08161;-0.32292;,
 -0.19198;-2.14726;0.00000;,
 0.02378;-2.08161;-0.32292;,
 0.17385;-2.08161;-0.15153;,
 -0.19198;-2.14726;0.00000;,
 0.20399;-2.08161;-0.00000;,
 -0.19198;-2.14726;0.00000;,
 0.17385;-2.08161;0.15152;,
 -0.19198;-2.14726;0.00000;,
 0.08801;-2.08161;0.27999;,
 -0.19198;-2.14726;0.00000;,
 -0.04044;-2.08161;0.36583;,
 -0.19198;-2.14726;0.00000;,
 -0.19198;-2.08161;0.39596;,
 -0.19198;-2.14726;0.00000;,
 -0.34352;-2.08161;0.36583;,
 -0.19198;-2.14726;0.00000;,
 -0.47198;-2.08161;0.27999;,
 -0.19198;-2.14726;0.00000;,
 -0.55781;-2.08161;0.15152;,
 -0.19198;-2.14726;0.00000;,
 -0.58796;-2.08161;0.00000;,
 -0.19198;-2.14726;0.00000;,
 -0.55781;-2.08161;-0.15153;,
 -0.19198;-2.14726;0.00000;,
 -0.47198;-2.08161;-0.28000;,
 -0.19198;-2.14726;0.00000;,
 -0.34352;-2.08161;-0.36583;,
 -0.19198;-2.14726;0.00000;,
 -0.19198;-2.08161;-0.39597;,
 -0.22615;-0.51732;-0.50925;,
 0.06612;-0.69737;-0.36010;,
 0.18718;-0.77194;-0.00000;,
 0.06612;-0.69737;0.36009;,
 -0.22615;-0.51732;0.50925;,
 -0.51843;-0.33727;0.36009;,
 -0.63950;-0.26269;0.00000;,
 -0.51843;-0.33727;-0.36010;,
 -0.22615;-0.51732;-0.50925;,
 -0.11667;-0.31497;-0.66538;,
 0.26521;-0.55022;-0.47050;,
 0.42339;-0.64766;-0.00000;,
 0.26521;-0.55022;0.47049;,
 -0.11667;-0.31497;0.66537;,
 -0.49854;-0.07973;0.47049;,
 -0.65672;0.01771;0.00000;,
 -0.49854;-0.07973;-0.47050;,
 -0.11667;-0.31497;-0.66538;,
 0.01249;-0.07630;-0.72020;,
 0.42583;-0.33092;-0.50925;,
 0.59703;-0.43639;-0.00000;,
 0.42583;-0.33092;0.50925;,
 0.01249;-0.07630;0.72019;,
 -0.40086;0.17833;0.50925;,
 -0.57206;0.28380;0.00000;,
 -0.40086;0.17833;-0.50925;,
 0.01249;-0.07630;-0.72020;,
 0.14164;0.16239;-0.66538;,
 0.52351;-0.07285;-0.47050;,
 0.68169;-0.17029;-0.00000;,
 0.52351;-0.07285;0.47049;,
 0.14164;0.16239;0.66537;,
 -0.24024;0.39763;0.47049;,
 -0.39842;0.49507;0.00000;,
 -0.24024;0.39763;-0.47050;,
 0.14164;0.16239;-0.66538;,
 0.25112;0.36474;-0.50925;,
 0.54340;0.18469;-0.36010;,
 0.66447;0.11011;0.00000;,
 0.54340;0.18469;0.36009;,
 0.25112;0.36474;0.50925;,
 -0.04115;0.54479;0.36009;,
 -0.16221;0.61936;0.00000;,
 -0.04115;0.54479;-0.36010;,
 0.25112;0.36474;-0.50925;,
 0.01825;-0.80736;-0.31464;,
 -0.19198;-0.80736;-0.38582;,
 0.16447;-0.80736;-0.14765;,
 0.01825;-0.80736;-0.31464;,
 0.17915;-0.80736;0.07382;,
 0.01825;-0.80736;0.31463;,
 0.17915;-0.80736;0.07382;,
 -0.26581;-0.80736;0.37113;,
 0.01825;-0.80736;0.31463;,
 -0.46480;-0.80736;0.27281;,
 -0.26581;-0.80736;0.37113;,
 -0.56311;-0.80736;0.07382;,
 -0.54843;-0.80736;-0.14765;,
 -0.56311;-0.80736;0.07382;,
 -0.40221;-0.80736;-0.31464;,
 -0.40221;-0.80736;-0.31464;,
 -0.19198;-0.80736;-0.38582;,
 0.01825;-1.21023;-0.31464;,
 -0.19198;-1.21023;-0.38582;,
 0.16447;-1.21023;-0.14765;,
 0.01825;-1.21023;-0.31464;,
 0.17915;-1.21023;0.07382;,
 0.01825;-1.21023;0.31463;,
 0.17915;-1.21023;0.07382;,
 -0.26581;-1.21023;0.37113;,
 0.01825;-1.21023;0.31463;,
 -0.46480;-1.21023;0.27281;,
 -0.26581;-1.21023;0.37113;,
 -0.56311;-1.21023;0.07382;,
 -0.54843;-1.21023;-0.14765;,
 -0.56311;-1.21023;0.07382;,
 -0.40221;-1.21023;-0.31464;,
 -0.19198;-1.21023;-0.38582;,
 -0.40221;-1.21023;-0.31464;,
 0.01825;-1.61310;-0.31464;,
 -0.19198;-1.61310;-0.38582;,
 0.16447;-1.61310;-0.14765;,
 0.01825;-1.61310;-0.31464;,
 0.17915;-1.61310;0.07382;,
 0.01825;-1.61310;0.31463;,
 0.17915;-1.61310;0.07382;,
 -0.26581;-1.61310;0.37113;,
 0.01825;-1.61310;0.31463;,
 -0.46480;-1.61310;0.27281;,
 -0.26581;-1.61310;0.37113;,
 -0.56311;-1.61310;0.07382;,
 -0.54843;-1.61310;-0.14765;,
 -0.56311;-1.61310;0.07382;,
 -0.40221;-1.61310;-0.31464;,
 -0.19198;-1.61310;-0.38582;,
 -0.40221;-1.61310;-0.31464;,
 0.02378;-2.08161;-0.32292;,
 -0.19198;-2.08161;-0.39597;,
 0.17385;-2.08161;-0.15153;,
 0.02378;-2.08161;-0.32292;,
 0.20399;-2.08161;-0.00000;,
 0.17385;-2.08161;0.15152;,
 0.08801;-2.08161;0.27999;,
 -0.04044;-2.08161;0.36583;,
 -0.19198;-2.08161;0.39596;,
 -0.34352;-2.08161;0.36583;,
 -0.47198;-2.08161;0.27999;,
 -0.55781;-2.08161;0.15152;,
 -0.58796;-2.08161;0.00000;,
 -0.55781;-2.08161;-0.15153;,
 -0.47198;-2.08161;-0.28000;,
 -0.34352;-2.08161;-0.36583;,
 -0.19198;-2.08161;-0.39597;,
 0.44762;1.10615;-0.77058;,
 0.44762;0.85615;-0.77058;,
 0.16031;0.15921;-0.77058;,
 -0.26328;1.00751;-0.77058;,
 -0.78742;0.10045;-0.77058;,
 -0.54513;0.87810;-0.77058;,
 -0.25529;-1.39955;-0.65233;,
 -0.48960;-1.39955;-0.65233;,
 -0.54513;0.87810;-0.77058;,
 -0.78742;0.10045;-0.77058;,
 -0.99687;0.10045;-0.01180;,
 -0.73835;0.87810;-0.01180;,
 -0.99687;0.10045;0.65359;,
 -0.73835;0.87810;0.65359;,
 -0.48960;-1.39955;-0.65233;,
 -0.67910;-1.41765;-0.11452;,
 -0.67910;-1.39955;0.30736;,
 -0.73835;0.87810;0.65359;,
 -0.99687;0.10045;0.65359;,
 0.01434;0.15921;0.65359;,
 -0.43762;1.00751;0.65359;,
 0.32090;0.85615;0.65359;,
 0.32090;1.10615;0.65359;,
 -0.67910;-1.39955;0.30736;,
 -0.42910;-1.39955;0.30736;,
 0.32090;1.10615;0.65359;,
 0.32090;0.85615;0.65359;,
 0.32090;0.85615;-0.01180;,
 0.32090;1.10615;-0.01180;,
 0.44762;0.85615;-0.77058;,
 0.44762;1.10615;-0.77058;,
 0.01434;0.15921;0.65359;,
 0.01434;0.15921;-0.01180;,
 0.16031;0.15921;-0.77058;,
 0.32090;1.10615;-0.01180;,
 -0.43762;1.00751;-0.01180;,
 -0.73835;0.87810;-0.01180;,
 0.44762;1.10615;-0.77058;,
 -0.26328;1.00751;-0.77058;,
 -0.54513;0.87810;-0.77058;,
 0.01434;0.15921;-0.01180;,
 -0.42910;-1.41765;-0.11452;,
 -0.67910;-1.41765;-0.11452;,
 0.16031;0.15921;-0.77058;,
 -0.25529;-1.39955;-0.65233;,
 -0.48960;-1.39955;-0.65233;,
 -0.36355;-1.55296;-0.29262;,
 -1.62452;0.52983;0.02651;,
 -0.38589;-0.98571;-0.22349;,
 -1.62452;0.52983;0.02651;,
 -0.38589;-0.98571;0.27651;,
 -1.62452;0.52983;0.02651;,
 -0.36355;-1.55296;0.27654;,
 -1.62452;0.52983;0.02651;,
 -0.77582;-1.76946;0.13425;,
 -1.62452;0.52983;0.02651;,
 -0.77582;-1.76946;-0.15033;,
 -1.62452;0.52983;0.02651;,
 -0.36355;-1.55296;-0.29262;,
 -0.36355;-1.55296;-0.00804;,
 -0.36355;-1.55296;-0.29262;,
 -0.38589;-0.98571;-0.22349;,
 -0.38589;-0.98571;0.27651;,
 -0.36355;-1.55296;0.27654;,
 -0.77582;-1.76946;0.13425;,
 -0.77582;-1.76946;-0.15033;;
 
 268;
 3;0,1,2;,
 3;3,2,4;,
 3;5,4,6;,
 3;7,6,8;,
 3;9,8,10;,
 3;11,10,12;,
 3;13,12,14;,
 3;15,14,16;,
 3;17,18,19;,
 3;19,20,21;,
 3;21,22,23;,
 3;23,24,25;,
 3;25,26,27;,
 3;27,28,29;,
 3;29,30,31;,
 3;31,32,33;,
 3;34,35,36;,
 3;37,38,35;,
 3;39,40,38;,
 3;41,42,40;,
 3;43,44,42;,
 3;45,46,44;,
 3;47,48,46;,
 3;49,50,48;,
 3;51,52,50;,
 3;53,54,52;,
 3;55,56,54;,
 3;57,58,56;,
 3;59,60,58;,
 3;61,62,60;,
 3;63,64,62;,
 3;65,66,64;,
 3;67,68,69;,
 3;70,71,72;,
 3;73,72,74;,
 3;75,74,76;,
 3;77,76,78;,
 3;79,78,80;,
 3;81,80,82;,
 3;83,82,84;,
 3;85,84,86;,
 3;87,86,88;,
 3;89,88,90;,
 3;91,90,92;,
 3;93,92,94;,
 3;95,94,96;,
 3;97,96,98;,
 3;99,100,2;,
 3;99,2,1;,
 3;100,101,4;,
 3;100,4,2;,
 3;101,102,6;,
 3;101,6,4;,
 3;102,103,8;,
 3;102,8,6;,
 3;103,104,10;,
 3;103,10,8;,
 3;104,105,12;,
 3;104,12,10;,
 3;12,105,106;,
 3;12,106,14;,
 3;106,107,16;,
 3;106,16,14;,
 3;108,109,100;,
 3;108,100,99;,
 3;109,110,101;,
 3;109,101,100;,
 3;110,111,102;,
 3;110,102,101;,
 3;111,112,103;,
 3;111,103,102;,
 3;112,113,104;,
 3;112,104,103;,
 3;113,114,105;,
 3;113,105,104;,
 3;114,115,106;,
 3;114,106,105;,
 3;115,116,107;,
 3;115,107,106;,
 3;117,118,109;,
 3;117,109,108;,
 3;118,119,110;,
 3;118,110,109;,
 3;119,120,111;,
 3;119,111,110;,
 3;120,121,112;,
 3;120,112,111;,
 3;121,122,113;,
 3;121,113,112;,
 3;122,123,114;,
 3;122,114,113;,
 3;123,124,115;,
 3;123,115,114;,
 3;124,125,116;,
 3;124,116,115;,
 3;126,127,118;,
 3;126,118,117;,
 3;127,128,119;,
 3;127,119,118;,
 3;128,129,120;,
 3;128,120,119;,
 3;129,130,121;,
 3;129,121,120;,
 3;130,131,122;,
 3;130,122,121;,
 3;131,132,123;,
 3;131,123,122;,
 3;132,133,124;,
 3;132,124,123;,
 3;133,134,125;,
 3;133,125,124;,
 3;135,136,127;,
 3;135,127,126;,
 3;136,137,128;,
 3;136,128,127;,
 3;137,138,129;,
 3;137,129,128;,
 3;138,139,130;,
 3;138,130,129;,
 3;139,140,131;,
 3;139,131,130;,
 3;140,141,132;,
 3;140,132,131;,
 3;141,142,133;,
 3;141,133,132;,
 3;142,143,134;,
 3;142,134,133;,
 3;17,19,136;,
 3;17,136,135;,
 3;19,21,137;,
 3;19,137,136;,
 3;21,23,138;,
 3;21,138,137;,
 3;23,25,139;,
 3;23,139,138;,
 3;25,27,140;,
 3;25,140,139;,
 3;27,29,141;,
 3;27,141,140;,
 3;29,31,142;,
 3;29,142,141;,
 3;31,33,143;,
 3;31,143,142;,
 3;35,144,145;,
 3;35,145,36;,
 3;38,144,35;,
 3;40,146,147;,
 3;40,147,38;,
 3;40,42,148;,
 3;40,148,146;,
 3;44,148,42;,
 3;46,149,150;,
 3;46,150,44;,
 3;48,149,46;,
 3;50,151,152;,
 3;50,152,48;,
 3;52,151,50;,
 3;54,153,154;,
 3;54,154,52;,
 3;56,155,153;,
 3;56,153,54;,
 3;58,155,56;,
 3;60,156,157;,
 3;60,157,58;,
 3;62,158,156;,
 3;62,156,60;,
 3;62,64,159;,
 3;66,160,159;,
 3;66,159,64;,
 3;144,161,162;,
 3;144,162,145;,
 3;146,163,164;,
 3;146,164,147;,
 3;148,165,163;,
 3;148,163,146;,
 3;149,166,167;,
 3;149,167,150;,
 3;151,168,169;,
 3;151,169,152;,
 3;153,170,171;,
 3;153,171,154;,
 3;155,172,170;,
 3;155,170,153;,
 3;156,173,174;,
 3;156,174,157;,
 3;158,175,173;,
 3;158,173,156;,
 3;160,176,177;,
 3;160,177,159;,
 3;161,178,179;,
 3;161,179,162;,
 3;163,180,181;,
 3;163,181,164;,
 3;165,182,180;,
 3;165,180,163;,
 3;166,183,184;,
 3;166,184,167;,
 3;168,185,186;,
 3;168,186,169;,
 3;170,187,188;,
 3;170,188,171;,
 3;172,189,187;,
 3;172,187,170;,
 3;173,190,191;,
 3;173,191,174;,
 3;175,192,190;,
 3;175,190,173;,
 3;176,193,194;,
 3;176,194,177;,
 3;178,195,196;,
 3;178,196,179;,
 3;180,197,198;,
 3;180,198,181;,
 3;182,199,197;,
 3;182,197,180;,
 3;184,200,199;,
 3;183,201,200;,
 3;183,200,184;,
 3;186,202,201;,
 3;185,203,202;,
 3;185,202,186;,
 3;188,204,203;,
 3;187,205,204;,
 3;187,204,188;,
 3;189,206,205;,
 3;189,205,187;,
 3;191,207,206;,
 3;190,208,207;,
 3;190,207,191;,
 3;192,209,208;,
 3;192,208,190;,
 3;194,210,209;,
 3;193,211,210;,
 3;193,210,194;,
 4;212,213,214,215;,
 4;215,214,216,217;,
 4;214,218,219,216;,
 4;220,221,222,223;,
 4;223,222,224,225;,
 4;221,226,227,222;,
 4;222,227,228,224;,
 4;229,230,231,232;,
 4;232,231,233,234;,
 4;230,235,236,231;,
 4;237,238,239,240;,
 4;240,239,241,242;,
 4;238,243,244,239;,
 4;239,244,245,241;,
 4;237,246,247,232;,
 4;232,247,248,225;,
 4;246,249,250,247;,
 4;247,250,251,248;,
 4;252,243,236,253;,
 4;253,236,228,254;,
 4;255,252,253,256;,
 4;256,253,254,257;,
 3;258,259,260;,
 3;260,261,262;,
 3;262,263,264;,
 3;264,265,266;,
 3;266,267,268;,
 3;268,269,270;,
 3;271,272,273;,
 3;271,273,274;,
 3;271,274,275;,
 3;271,275,276;,
 3;271,276,277;,
 3;271,277,272;;
 
 MeshMaterialList {
  10;
  268;
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
  6,
  1,
  6,
  1,
  4,
  4,
  4,
  1,
  6,
  1,
  6,
  1,
  1,
  6,
  6,
  1,
  1,
  6,
  6,
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
  185;
  -0.523368;-0.852107;0.000003;,
  -0.517285;-0.751291;-0.409851;,
  -0.240891;-0.913920;-0.326683;,
  -0.098523;-0.994047;-0.046513;,
  -0.180458;-0.948179;0.261517;,
  -0.434729;-0.800576;0.412418;,
  -0.702788;-0.636321;0.318094;,
  -0.845906;-0.533332;0.000003;,
  -0.716930;-0.646456;-0.260972;,
  -0.388796;-0.601182;-0.698153;,
  0.069861;-0.856595;-0.511238;,
  0.270602;-0.962536;-0.017298;,
  0.092741;-0.869062;0.485933;,
  -0.355614;-0.619185;0.700106;,
  -0.791988;-0.357654;0.494812;,
  -0.975567;-0.209919;0.064838;,
  -0.827682;-0.357783;-0.432357;,
  -0.210941;-0.328959;-0.920483;,
  0.385918;-0.649352;-0.655293;,
  0.630271;-0.776337;-0.007709;,
  0.395687;-0.655876;0.642852;,
  -0.193306;-0.337676;0.921199;,
  -0.767479;-0.010381;0.640990;,
  -0.992578;0.121271;0.009089;,
  -0.779472;-0.006050;-0.626408;,
  -0.000001;-0.000004;-1.000000;,
  0.633295;-0.342866;-0.693816;,
  0.878671;-0.477427;0.001192;,
  0.631076;-0.344191;0.695180;,
  0.000001;-0.000003;1.000000;,
  -0.631076;0.344188;0.695182;,
  -0.878668;0.477432;0.001192;,
  -0.633290;0.342869;-0.693818;,
  0.210935;0.328957;-0.920486;,
  0.779472;0.006053;-0.626407;,
  0.992579;-0.121265;0.009088;,
  0.767482;0.010385;0.640987;,
  0.193302;0.337674;0.921200;,
  -0.395697;0.655870;0.642852;,
  -0.630285;0.776326;-0.007708;,
  -0.385936;0.649338;-0.655297;,
  0.388801;0.601194;-0.698140;,
  0.812590;0.346582;-0.468593;,
  0.968876;0.246994;0.016522;,
  0.791986;0.357653;0.494815;,
  0.355609;0.619193;0.700102;,
  -0.092736;0.869069;0.485920;,
  -0.270606;0.962535;-0.017287;,
  -0.069840;0.856595;-0.511241;,
  0.517257;0.751304;-0.409863;,
  0.757200;0.602190;-0.253012;,
  0.830892;0.554687;0.044053;,
  0.702772;0.636331;0.318110;,
  0.434708;0.800591;0.412412;,
  0.180458;0.948173;0.261541;,
  0.098545;0.994045;-0.046505;,
  0.240901;0.913911;-0.326700;,
  0.523346;0.852120;0.000003;,
  0.000000;1.000000;0.000000;,
  -0.022325;-0.040210;-0.998942;,
  0.569505;-0.054949;-0.820149;,
  0.895648;-0.023650;-0.444135;,
  0.978747;-0.070838;0.192446;,
  0.554552;-0.073630;0.828885;,
  -0.158071;-0.059818;0.985614;,
  -0.690582;-0.040210;0.722136;,
  -0.982636;-0.054961;0.177215;,
  -0.931456;-0.040211;-0.361624;,
  -0.539765;-0.054954;-0.840020;,
  0.000000;0.000000;-1.000000;,
  0.555563;0.000000;-0.831474;,
  0.923885;0.000000;-0.382670;,
  0.966023;0.000000;0.258457;,
  0.555571;0.000000;0.831469;,
  -0.130910;0.000000;0.991394;,
  -0.707121;0.000000;0.707093;,
  -0.980787;0.000000;0.195083;,
  -0.923885;0.000000;-0.382670;,
  -0.555564;0.000000;-0.831474;,
  0.022083;0.018358;-0.999588;,
  0.555539;0.010624;-0.831423;,
  0.923836;0.010831;-0.382635;,
  0.972380;0.031183;0.231312;,
  0.554944;0.041078;0.830873;,
  -0.140694;0.037354;0.989348;,
  -0.722448;0.018364;0.691181;,
  -0.976712;0.027767;0.212751;,
  -0.915048;0.018364;-0.402927;,
  -0.570325;0.027764;-0.820950;,
  0.092598;-0.986012;-0.138586;,
  0.146738;-0.986469;-0.073120;,
  0.163561;-0.986533;0.000001;,
  0.062590;-0.986534;0.151110;,
  0.000000;-0.986533;0.163565;,
  -0.062587;-0.986534;0.151111;,
  -0.151112;-0.986533;0.062594;,
  -0.163557;-0.986534;0.000001;,
  -0.062588;-0.986533;-0.151111;,
  0.011400;-0.986469;-0.163551;,
  0.151112;-0.986533;0.062593;,
  0.115661;-0.986533;0.115652;,
  -0.115660;-0.986533;0.115649;,
  -0.151111;-0.986533;-0.062592;,
  -0.115655;-0.986534;-0.115650;,
  -0.005320;-0.999954;0.007964;,
  0.000000;0.000000;-1.000000;,
  0.000795;-0.025934;-0.999663;,
  0.002384;-0.077749;-0.996970;,
  -0.735014;0.671467;-0.094270;,
  0.001193;-0.038904;-0.999242;,
  -0.988572;0.055188;-0.140284;,
  -0.967947;-0.203006;-0.147876;,
  -0.736654;0.676269;0.000000;,
  0.000000;0.000000;1.000000;,
  -0.998399;0.056522;0.002283;,
  -0.978469;-0.206348;0.004407;,
  0.006400;-0.222601;0.974889;,
  0.996579;0.000000;0.082645;,
  0.975746;-0.202168;0.083951;,
  0.002145;-0.074618;0.997210;,
  0.937526;-0.332663;0.101884;,
  -0.268290;0.962828;-0.031354;,
  0.955865;-0.267487;0.121541;,
  -0.183068;0.039677;-0.982299;,
  -0.054916;0.118660;-0.991415;,
  0.968616;0.248561;0.000000;,
  -0.251665;-0.036264;0.967135;,
  -0.295235;-0.064308;0.953258;,
  -0.938132;-0.346278;0.000000;,
  0.999225;0.039352;0.000000;,
  0.360895;-0.078295;-0.929314;,
  -0.108936;-0.087246;-0.990213;,
  0.702863;-0.101526;-0.704042;,
  0.919041;-0.102265;-0.380664;,
  0.994832;-0.101534;0.000831;,
  0.919423;-0.101541;0.379936;,
  0.746845;-0.115360;0.654916;,
  0.381472;-0.101544;0.918786;,
  0.064985;-0.115366;0.991195;,
  -0.379931;-0.101539;0.919425;,
  -0.623165;-0.087252;0.777208;,
  -0.912321;-0.078306;0.401919;,
  -0.994829;-0.101562;0.000832;,
  -0.956530;-0.087256;-0.278275;,
  -0.720466;-0.078304;-0.689055;,
  -0.381460;-0.101521;-0.918794;,
  0.627404;0.021161;-0.778407;,
  0.153362;0.021405;-0.987938;,
  0.946755;0.042870;-0.319087;,
  0.998600;0.052894;0.000323;,
  0.894874;0.063150;0.441829;,
  0.705919;0.052887;0.706315;,
  0.320338;0.063149;0.945196;,
  -0.000316;0.052874;0.998601;,
  -0.402942;0.035716;0.914529;,
  -0.779608;0.042465;0.624826;,
  -0.922705;0.052892;0.381860;,
  -0.999113;0.035726;-0.022299;,
  -0.875630;0.042469;-0.481112;,
  -0.705905;0.052899;-0.706328;,
  -0.361712;0.035709;-0.931606;,
  -0.726831;0.660690;-0.187631;,
  -0.958706;0.052740;-0.279465;,
  -0.934860;-0.194931;-0.296712;,
  0.003220;-0.112006;0.993702;,
  1.000000;0.000000;0.000000;,
  0.978611;-0.205718;-0.000000;,
  0.966007;-0.197199;0.167161;,
  0.986340;0.000000;0.164724;,
  0.941002;-0.338388;0.002918;,
  0.924818;-0.323662;0.199887;,
  -0.128957;0.991650;0.000000;,
  -0.131067;0.991286;-0.013142;,
  -0.264651;0.964344;0.000000;,
  -0.133153;0.990747;-0.026282;,
  -0.271665;0.960346;-0.062713;,
  0.962133;-0.272518;0.005822;,
  0.000000;-0.999989;0.004617;,
  0.000000;-0.999081;0.042864;,
  0.936736;-0.258857;0.235624;,
  0.000000;-0.999434;-0.033636;,
  0.774297;0.632822;0.000000;,
  -0.207371;-0.008115;0.978229;,
  -0.307056;-0.040209;-0.950842;,
  0.464931;-0.885347;-0.000000;;
  268;
  3;0,1,2;,
  3;0,2,3;,
  3;0,3,4;,
  3;0,4,5;,
  3;0,5,6;,
  3;0,6,7;,
  3;0,7,8;,
  3;0,8,1;,
  3;49,57,50;,
  3;50,57,51;,
  3;51,57,52;,
  3;52,57,53;,
  3;53,57,54;,
  3;54,57,55;,
  3;55,57,56;,
  3;56,57,49;,
  3;58,58,58;,
  3;58,58,58;,
  3;58,58,58;,
  3;58,58,58;,
  3;58,58,58;,
  3;58,58,58;,
  3;58,58,58;,
  3;58,58,58;,
  3;58,58,58;,
  3;58,58,58;,
  3;58,58,58;,
  3;58,58,58;,
  3;58,58,58;,
  3;58,58,58;,
  3;58,58,58;,
  3;58,58,58;,
  3;104,98,89;,
  3;104,89,90;,
  3;104,90,91;,
  3;104,91,99;,
  3;104,99,100;,
  3;104,100,92;,
  3;104,92,93;,
  3;104,93,94;,
  3;104,94,101;,
  3;104,101,95;,
  3;104,95,96;,
  3;104,96,102;,
  3;104,102,103;,
  3;104,103,97;,
  3;104,97,98;,
  3;9,10,2;,
  3;9,2,1;,
  3;10,11,3;,
  3;10,3,2;,
  3;11,12,4;,
  3;11,4,3;,
  3;12,13,5;,
  3;12,5,4;,
  3;13,14,6;,
  3;13,6,5;,
  3;14,15,7;,
  3;14,7,6;,
  3;7,15,16;,
  3;7,16,8;,
  3;16,9,1;,
  3;16,1,8;,
  3;17,18,10;,
  3;17,10,9;,
  3;18,19,11;,
  3;18,11,10;,
  3;19,20,12;,
  3;19,12,11;,
  3;20,21,13;,
  3;20,13,12;,
  3;21,22,14;,
  3;21,14,13;,
  3;22,23,15;,
  3;22,15,14;,
  3;23,24,16;,
  3;23,16,15;,
  3;24,17,9;,
  3;24,9,16;,
  3;25,26,18;,
  3;25,18,17;,
  3;26,27,19;,
  3;26,19,18;,
  3;27,28,20;,
  3;27,20,19;,
  3;28,29,21;,
  3;28,21,20;,
  3;29,30,22;,
  3;29,22,21;,
  3;30,31,23;,
  3;30,23,22;,
  3;31,32,24;,
  3;31,24,23;,
  3;32,25,17;,
  3;32,17,24;,
  3;33,34,26;,
  3;33,26,25;,
  3;34,35,27;,
  3;34,27,26;,
  3;35,36,28;,
  3;35,28,27;,
  3;36,37,29;,
  3;36,29,28;,
  3;37,38,30;,
  3;37,30,29;,
  3;38,39,31;,
  3;38,31,30;,
  3;39,40,32;,
  3;39,32,31;,
  3;40,33,25;,
  3;40,25,32;,
  3;41,42,34;,
  3;41,34,33;,
  3;42,43,35;,
  3;42,35,34;,
  3;43,44,36;,
  3;43,36,35;,
  3;44,45,37;,
  3;44,37,36;,
  3;45,46,38;,
  3;45,38,37;,
  3;46,47,39;,
  3;46,39,38;,
  3;47,48,40;,
  3;47,40,39;,
  3;48,41,33;,
  3;48,33,40;,
  3;49,50,42;,
  3;49,42,41;,
  3;50,51,43;,
  3;50,43,42;,
  3;51,52,44;,
  3;51,44,43;,
  3;52,53,45;,
  3;52,45,44;,
  3;53,54,46;,
  3;53,46,45;,
  3;54,55,47;,
  3;54,47,46;,
  3;55,56,48;,
  3;55,48,47;,
  3;56,49,41;,
  3;56,41,48;,
  3;130,60,59;,
  3;130,59,131;,
  3;132,60,130;,
  3;133,61,60;,
  3;133,60,132;,
  3;133,134,62;,
  3;133,62,61;,
  3;135,62,134;,
  3;136,63,62;,
  3;136,62,135;,
  3;137,63,136;,
  3;138,64,63;,
  3;138,63,137;,
  3;139,64,138;,
  3;140,65,64;,
  3;140,64,139;,
  3;141,66,65;,
  3;141,65,140;,
  3;142,66,141;,
  3;143,67,66;,
  3;143,66,142;,
  3;144,68,67;,
  3;144,67,143;,
  3;144,145,68;,
  3;131,59,68;,
  3;131,68,145;,
  3;60,70,69;,
  3;60,69,59;,
  3;61,71,70;,
  3;61,70,60;,
  3;62,72,71;,
  3;62,71,61;,
  3;63,73,72;,
  3;63,72,62;,
  3;64,74,73;,
  3;64,73,63;,
  3;65,75,74;,
  3;65,74,64;,
  3;66,76,75;,
  3;66,75,65;,
  3;67,77,76;,
  3;67,76,66;,
  3;68,78,77;,
  3;68,77,67;,
  3;59,69,78;,
  3;59,78,68;,
  3;70,80,79;,
  3;70,79,69;,
  3;71,81,80;,
  3;71,80,70;,
  3;72,82,81;,
  3;72,81,71;,
  3;73,83,82;,
  3;73,82,72;,
  3;74,84,83;,
  3;74,83,73;,
  3;75,85,84;,
  3;75,84,74;,
  3;76,86,85;,
  3;76,85,75;,
  3;77,87,86;,
  3;77,86,76;,
  3;78,88,87;,
  3;78,87,77;,
  3;69,79,88;,
  3;69,88,78;,
  3;80,146,147;,
  3;80,147,79;,
  3;81,148,146;,
  3;81,146,80;,
  3;82,149,148;,
  3;82,148,81;,
  3;82,150,149;,
  3;83,151,150;,
  3;83,150,82;,
  3;83,152,151;,
  3;84,153,152;,
  3;84,152,83;,
  3;84,154,153;,
  3;85,155,154;,
  3;85,154,84;,
  3;86,156,155;,
  3;86,155,85;,
  3;86,157,156;,
  3;87,158,157;,
  3;87,157,86;,
  3;88,159,158;,
  3;88,158,87;,
  3;88,160,159;,
  3;79,147,160;,
  3;79,160,88;,
  4;105,105,106,105;,
  4;105,106,109,105;,
  4;106,107,107,109;,
  4;161,162,110,108;,
  4;108,110,114,112;,
  4;162,163,111,110;,
  4;110,111,115,114;,
  4;113,164,119,113;,
  4;113,119,113,113;,
  4;164,116,116,119;,
  4;165,166,118,117;,
  4;117,118,167,168;,
  4;166,169,120,118;,
  4;118,120,170,167;,
  4;171,172,121,173;,
  4;173,121,108,112;,
  4;172,174,175,121;,
  4;121,175,161,108;,
  4;120,169,176,122;,
  4;177,178,178,177;,
  4;170,120,122,179;,
  4;180,177,177,180;,
  3;123,123,124;,
  3;125,181,125;,
  3;182,126,126;,
  3;126,126,127;,
  3;128,128,128;,
  3;183,123,123;,
  3;129,129,125;,
  3;129,125,125;,
  3;129,125,129;,
  3;184,184,184;,
  3;184,184,184;,
  3;184,184,184;;
 }
 MeshTextureCoords {
  278;
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
  0.000000;0.875000;,
  0.062500;1.000000;,
  0.125000;0.875000;,
  0.187500;1.000000;,
  0.250000;0.875000;,
  0.312500;1.000000;,
  0.375000;0.875000;,
  0.437500;1.000000;,
  0.500000;0.875000;,
  0.562500;1.000000;,
  0.625000;0.875000;,
  0.687500;1.000000;,
  0.750000;0.875000;,
  0.812500;1.000000;,
  0.875000;0.875000;,
  0.937500;1.000000;,
  1.000000;0.875000;,
  0.031250;0.000000;,
  0.062500;0.000000;,
  0.000000;0.000000;,
  0.093750;0.000000;,
  0.125000;0.000000;,
  0.156250;0.000000;,
  0.187500;0.000000;,
  0.218750;0.000000;,
  0.250000;0.000000;,
  0.281250;0.000000;,
  0.312500;0.000000;,
  0.343750;0.000000;,
  0.375000;0.000000;,
  0.406250;0.000000;,
  0.437500;0.000000;,
  0.468750;0.000000;,
  0.500000;0.000000;,
  0.531250;0.000000;,
  0.562500;0.000000;,
  0.593750;0.000000;,
  0.625000;0.000000;,
  0.656250;0.000000;,
  0.687500;0.000000;,
  0.718750;0.000000;,
  0.750000;0.000000;,
  0.781250;0.000000;,
  0.812500;0.000000;,
  0.843750;0.000000;,
  0.875000;0.000000;,
  0.906250;0.000000;,
  0.937500;0.000000;,
  0.968750;0.000000;,
  1.000000;0.000000;,
  0.031250;1.000000;,
  0.000000;1.000000;,
  0.062500;1.000000;,
  0.156250;1.000000;,
  0.125000;1.000000;,
  0.187500;1.000000;,
  0.218750;1.000000;,
  0.250000;1.000000;,
  0.281250;1.000000;,
  0.312500;1.000000;,
  0.343750;1.000000;,
  0.375000;1.000000;,
  0.406250;1.000000;,
  0.437500;1.000000;,
  0.468750;1.000000;,
  0.500000;1.000000;,
  0.531250;1.000000;,
  0.562500;1.000000;,
  0.593750;1.000000;,
  0.625000;1.000000;,
  0.656250;1.000000;,
  0.687500;1.000000;,
  0.718750;1.000000;,
  0.750000;1.000000;,
  0.781250;1.000000;,
  0.812500;1.000000;,
  0.843750;1.000000;,
  0.875000;1.000000;,
  0.906250;1.000000;,
  0.937500;1.000000;,
  0.968750;1.000000;,
  1.000000;1.000000;,
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
  0.062500;0.200000;,
  0.000000;0.200000;,
  0.187500;0.200000;,
  0.125000;0.200000;,
  0.250000;0.200000;,
  0.375000;0.200000;,
  0.312500;0.200000;,
  0.500000;0.200000;,
  0.437500;0.200000;,
  0.625000;0.200000;,
  0.562500;0.200000;,
  0.687500;0.200000;,
  0.812500;0.200000;,
  0.750000;0.200000;,
  0.875000;0.200000;,
  0.937500;0.200000;,
  1.000000;0.200000;,
  0.062500;0.400000;,
  0.000000;0.400000;,
  0.187500;0.400000;,
  0.125000;0.400000;,
  0.250000;0.400000;,
  0.375000;0.400000;,
  0.312500;0.400000;,
  0.500000;0.400000;,
  0.437500;0.400000;,
  0.625000;0.400000;,
  0.562500;0.400000;,
  0.687500;0.400000;,
  0.812500;0.400000;,
  0.750000;0.400000;,
  0.875000;0.400000;,
  1.000000;0.400000;,
  0.937500;0.400000;,
  0.062500;0.600000;,
  0.000000;0.600000;,
  0.187500;0.600000;,
  0.125000;0.600000;,
  0.250000;0.600000;,
  0.375000;0.600000;,
  0.312500;0.600000;,
  0.500000;0.600000;,
  0.437500;0.600000;,
  0.625000;0.600000;,
  0.562500;0.600000;,
  0.687500;0.600000;,
  0.812500;0.600000;,
  0.750000;0.600000;,
  0.875000;0.600000;,
  1.000000;0.600000;,
  0.937500;0.600000;,
  0.062500;0.800000;,
  0.000000;0.800000;,
  0.187500;0.800000;,
  0.125000;0.800000;,
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
  0.000000;0.000000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  0.500000;0.000000;,
  1.000000;0.500000;,
  1.000000;0.000000;,
  0.500000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  0.500000;0.000000;,
  1.000000;0.500000;,
  1.000000;0.000000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  0.500000;0.000000;,
  1.000000;0.500000;,
  1.000000;0.000000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  0.500000;0.000000;,
  1.000000;0.500000;,
  1.000000;0.000000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  1.000000;0.500000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  1.000000;0.500000;,
  0.000000;0.000000;,
  0.500000;0.000000;,
  1.000000;0.000000;,
  0.000000;1.000000;,
  0.083330;0.000000;,
  0.166670;1.000000;,
  0.166670;0.000000;,
  0.333330;1.000000;,
  0.250000;0.000000;,
  0.500000;1.000000;,
  0.333330;0.000000;,
  0.666670;1.000000;,
  0.416670;0.000000;,
  0.833330;1.000000;,
  0.500000;0.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;;
 }
}
