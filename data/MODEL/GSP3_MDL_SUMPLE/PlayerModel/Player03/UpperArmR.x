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
 213;
 -0.35000;-0.70000;0.00000;,
 -0.32431;-0.65252;-0.27561;,
 -0.16613;-0.74997;-0.19489;,
 -0.35000;-0.70000;0.00000;,
 -0.10062;-0.79032;0.00000;,
 -0.35000;-0.70000;0.00000;,
 -0.16613;-0.74997;0.19488;,
 -0.35000;-0.70000;0.00000;,
 -0.32431;-0.65252;0.27560;,
 -0.35000;-0.70000;0.00000;,
 -0.48249;-0.55508;0.19488;,
 -0.35000;-0.70000;0.00000;,
 -0.54802;-0.51471;0.00000;,
 -0.35000;-0.70000;0.00000;,
 -0.48249;-0.55508;-0.19489;,
 -0.35000;-0.70000;0.00000;,
 -0.32431;-0.65252;-0.27561;,
 -0.25115;-0.51732;-0.50925;,
 0.04112;-0.69737;-0.36010;,
 0.16218;-0.77194;-0.00000;,
 0.04112;-0.69737;0.36009;,
 -0.25115;-0.51732;0.50925;,
 -0.54343;-0.33727;0.36009;,
 -0.66450;-0.26269;0.00000;,
 -0.54343;-0.33727;-0.36010;,
 -0.25115;-0.51732;-0.50925;,
 -0.14167;-0.31497;-0.66538;,
 0.24021;-0.55022;-0.47050;,
 0.39839;-0.64766;-0.00000;,
 0.24021;-0.55022;0.47049;,
 -0.14167;-0.31497;0.66537;,
 -0.52354;-0.07973;0.47049;,
 -0.68172;0.01771;0.00000;,
 -0.52354;-0.07973;-0.47050;,
 -0.14167;-0.31497;-0.66538;,
 -0.01251;-0.07630;-0.72020;,
 0.40083;-0.33092;-0.50925;,
 0.57203;-0.43639;-0.00000;,
 0.40083;-0.33092;0.50925;,
 -0.01251;-0.07630;0.72019;,
 -0.42586;0.17833;0.50925;,
 -0.59706;0.28380;0.00000;,
 -0.42586;0.17833;-0.50925;,
 -0.01251;-0.07630;-0.72020;,
 0.11664;0.16239;-0.66538;,
 0.49851;-0.07285;-0.47050;,
 0.65669;-0.17029;-0.00000;,
 0.49851;-0.07285;0.47049;,
 0.11664;0.16239;0.66537;,
 -0.26524;0.39763;0.47049;,
 -0.42342;0.49507;0.00000;,
 -0.26524;0.39763;-0.47050;,
 0.11664;0.16239;-0.66538;,
 0.22612;0.36474;-0.50925;,
 0.51840;0.18469;-0.36010;,
 0.63947;0.11010;0.00000;,
 0.51840;0.18469;0.36009;,
 0.22612;0.36474;0.50925;,
 -0.06615;0.54479;0.36009;,
 -0.18721;0.61936;0.00000;,
 -0.06615;0.54479;-0.36010;,
 0.22612;0.36474;-0.50925;,
 0.29928;0.49993;-0.27561;,
 0.45746;0.40250;-0.19489;,
 0.52299;0.36214;0.00000;,
 0.45746;0.40250;0.19488;,
 0.29928;0.49993;0.27560;,
 0.14110;0.59737;0.19488;,
 0.07559;0.63774;0.00000;,
 0.14110;0.59737;-0.19489;,
 0.29928;0.49993;-0.27561;,
 0.32498;0.54742;0.00000;,
 0.32498;0.54742;0.00000;,
 0.32498;0.54742;0.00000;,
 0.32498;0.54742;0.00000;,
 0.32498;0.54742;0.00000;,
 0.32498;0.54742;0.00000;,
 0.32498;0.54742;0.00000;,
 0.32498;0.54742;0.00000;,
 -0.21698;-0.46513;-0.40613;,
 -0.06156;-0.46513;-0.37521;,
 -0.06933;-0.80736;-0.35645;,
 -0.21698;-0.80736;-0.38582;,
 0.07019;-0.46513;-0.28718;,
 0.05583;-0.80736;-0.27282;,
 0.15823;-0.46513;-0.15542;,
 0.13947;-0.80736;-0.14765;,
 0.18914;-0.46513;-0.00000;,
 0.16884;-0.80736;-0.00000;,
 0.15823;-0.46513;0.15541;,
 0.13947;-0.80736;0.14764;,
 0.07019;-0.46513;0.28717;,
 0.05583;-0.80736;0.27281;,
 -0.06156;-0.46513;0.37521;,
 -0.06933;-0.80736;0.35645;,
 -0.21698;-0.46513;0.40612;,
 -0.21698;-0.80736;0.38581;,
 -0.37240;-0.46513;0.37521;,
 -0.36463;-0.80736;0.35645;,
 -0.50416;-0.46513;0.28717;,
 -0.48980;-0.80736;0.27281;,
 -0.59219;-0.46513;0.15541;,
 -0.57343;-0.80736;0.14764;,
 -0.62311;-0.46513;0.00000;,
 -0.60280;-0.80736;0.00000;,
 -0.59219;-0.46513;-0.15542;,
 -0.57343;-0.80736;-0.14765;,
 -0.50416;-0.46513;-0.28718;,
 -0.48980;-0.80736;-0.27282;,
 -0.37240;-0.46513;-0.37521;,
 -0.36463;-0.80736;-0.35645;,
 -0.21698;-0.46513;-0.40613;,
 -0.21698;-0.80736;-0.38582;,
 -0.06933;-1.21023;-0.35645;,
 -0.21698;-1.21023;-0.38582;,
 0.05583;-1.21023;-0.27282;,
 0.13947;-1.21023;-0.14765;,
 0.16884;-1.21023;-0.00000;,
 0.13947;-1.21023;0.14764;,
 0.05583;-1.21023;0.27281;,
 -0.06933;-1.21023;0.35645;,
 -0.21698;-1.21023;0.38581;,
 -0.36463;-1.21023;0.35645;,
 -0.48980;-1.21023;0.27281;,
 -0.57343;-1.21023;0.14764;,
 -0.60280;-1.21023;0.00000;,
 -0.57343;-1.21023;-0.14765;,
 -0.48980;-1.21023;-0.27282;,
 -0.36463;-1.21023;-0.35645;,
 -0.21698;-1.21023;-0.38582;,
 -0.06933;-1.61310;-0.35645;,
 -0.21698;-1.61310;-0.38582;,
 0.05583;-1.61310;-0.27282;,
 0.13947;-1.61310;-0.14765;,
 0.16884;-1.61310;-0.00000;,
 0.13947;-1.61310;0.14764;,
 0.05583;-1.61310;0.27281;,
 -0.06933;-1.61310;0.35645;,
 -0.21698;-1.61310;0.38581;,
 -0.36463;-1.61310;0.35645;,
 -0.48980;-1.61310;0.27281;,
 -0.57343;-1.61310;0.14764;,
 -0.60280;-1.61310;0.00000;,
 -0.57343;-1.61310;-0.14765;,
 -0.48980;-1.61310;-0.27282;,
 -0.36463;-1.61310;-0.35645;,
 -0.21698;-1.61310;-0.38582;,
 -0.06933;-2.01596;-0.35645;,
 -0.21698;-2.01596;-0.38582;,
 0.05583;-2.01596;-0.27282;,
 0.13947;-2.01596;-0.14765;,
 0.16884;-2.01596;-0.00000;,
 0.13947;-2.01596;0.14764;,
 0.05583;-2.01596;0.27281;,
 -0.06933;-2.01596;0.35645;,
 -0.21698;-2.01596;0.38581;,
 -0.36463;-2.01596;0.35645;,
 -0.48980;-2.01596;0.27281;,
 -0.57343;-2.01596;0.14764;,
 -0.60280;-2.01596;0.00000;,
 -0.57343;-2.01596;-0.14765;,
 -0.48980;-2.01596;-0.27282;,
 -0.36463;-2.01596;-0.35645;,
 -0.21698;-2.01596;-0.38582;,
 -0.06156;-2.14726;-0.37521;,
 -0.21698;-2.14726;-0.40613;,
 0.07019;-2.14726;-0.28718;,
 0.15823;-2.14726;-0.15542;,
 0.18914;-2.14726;-0.00000;,
 0.15823;-2.14726;0.15541;,
 0.07019;-2.14726;0.28717;,
 -0.06156;-2.14726;0.37521;,
 -0.21698;-2.14726;0.40612;,
 -0.37240;-2.14726;0.37521;,
 -0.50416;-2.14726;0.28717;,
 -0.59219;-2.14726;0.15541;,
 -0.62311;-2.14726;0.00000;,
 -0.59219;-2.14726;-0.15542;,
 -0.50416;-2.14726;-0.28718;,
 -0.37240;-2.14726;-0.37521;,
 -0.21698;-2.14726;-0.40613;,
 -0.21698;-0.46513;0.00000;,
 -0.21698;-0.46513;0.00000;,
 -0.21698;-0.46513;0.00000;,
 -0.21698;-0.46513;0.00000;,
 -0.21698;-0.46513;0.00000;,
 -0.21698;-0.46513;0.00000;,
 -0.21698;-0.46513;0.00000;,
 -0.21698;-0.46513;0.00000;,
 -0.21698;-0.46513;0.00000;,
 -0.21698;-0.46513;0.00000;,
 -0.21698;-0.46513;0.00000;,
 -0.21698;-0.46513;0.00000;,
 -0.21698;-0.46513;0.00000;,
 -0.21698;-0.46513;0.00000;,
 -0.21698;-0.46513;0.00000;,
 -0.21698;-0.46513;0.00000;,
 -0.21698;-2.14726;0.00000;,
 -0.21698;-2.14726;0.00000;,
 -0.21698;-2.14726;0.00000;,
 -0.21698;-2.14726;0.00000;,
 -0.21698;-2.14726;0.00000;,
 -0.21698;-2.14726;0.00000;,
 -0.21698;-2.14726;0.00000;,
 -0.21698;-2.14726;0.00000;,
 -0.21698;-2.14726;0.00000;,
 -0.21698;-2.14726;0.00000;,
 -0.21698;-2.14726;0.00000;,
 -0.21698;-2.14726;0.00000;,
 -0.21698;-2.14726;0.00000;,
 -0.21698;-2.14726;0.00000;,
 -0.21698;-2.14726;0.00000;,
 -0.21698;-2.14726;0.00000;;
 
 176;
 3;0,1,2;,
 3;3,2,4;,
 3;5,4,6;,
 3;7,6,8;,
 3;9,8,10;,
 3;11,10,12;,
 3;13,12,14;,
 3;15,14,16;,
 4;1,17,18,2;,
 4;2,18,19,4;,
 4;4,19,20,6;,
 4;6,20,21,8;,
 4;8,21,22,10;,
 4;10,22,23,12;,
 4;12,23,24,14;,
 4;14,24,25,16;,
 4;17,26,27,18;,
 4;18,27,28,19;,
 4;19,28,29,20;,
 4;20,29,30,21;,
 4;21,30,31,22;,
 4;22,31,32,23;,
 4;23,32,33,24;,
 4;24,33,34,25;,
 4;26,35,36,27;,
 4;27,36,37,28;,
 4;28,37,38,29;,
 4;29,38,39,30;,
 4;30,39,40,31;,
 4;31,40,41,32;,
 4;32,41,42,33;,
 4;33,42,43,34;,
 4;35,44,45,36;,
 4;36,45,46,37;,
 4;37,46,47,38;,
 4;38,47,48,39;,
 4;39,48,49,40;,
 4;40,49,50,41;,
 4;41,50,51,42;,
 4;42,51,52,43;,
 4;44,53,54,45;,
 4;45,54,55,46;,
 4;46,55,56,47;,
 4;47,56,57,48;,
 4;48,57,58,49;,
 4;49,58,59,50;,
 4;50,59,60,51;,
 4;51,60,61,52;,
 4;53,62,63,54;,
 4;54,63,64,55;,
 4;55,64,65,56;,
 4;56,65,66,57;,
 4;57,66,67,58;,
 4;58,67,68,59;,
 4;59,68,69,60;,
 4;60,69,70,61;,
 3;62,71,63;,
 3;63,72,64;,
 3;64,73,65;,
 3;65,74,66;,
 3;66,75,67;,
 3;67,76,68;,
 3;68,77,69;,
 3;69,78,70;,
 4;79,80,81,82;,
 4;80,83,84,81;,
 4;83,85,86,84;,
 4;85,87,88,86;,
 4;87,89,90,88;,
 4;89,91,92,90;,
 4;91,93,94,92;,
 4;93,95,96,94;,
 4;95,97,98,96;,
 4;97,99,100,98;,
 4;99,101,102,100;,
 4;101,103,104,102;,
 4;103,105,106,104;,
 4;105,107,108,106;,
 4;107,109,110,108;,
 4;109,111,112,110;,
 4;82,81,113,114;,
 4;81,84,115,113;,
 4;84,86,116,115;,
 4;86,88,117,116;,
 4;88,90,118,117;,
 4;90,92,119,118;,
 4;92,94,120,119;,
 4;94,96,121,120;,
 4;96,98,122,121;,
 4;98,100,123,122;,
 4;100,102,124,123;,
 4;102,104,125,124;,
 4;104,106,126,125;,
 4;106,108,127,126;,
 4;108,110,128,127;,
 4;110,112,129,128;,
 4;114,113,130,131;,
 4;113,115,132,130;,
 4;115,116,133,132;,
 4;116,117,134,133;,
 4;117,118,135,134;,
 4;118,119,136,135;,
 4;119,120,137,136;,
 4;120,121,138,137;,
 4;121,122,139,138;,
 4;122,123,140,139;,
 4;123,124,141,140;,
 4;124,125,142,141;,
 4;125,126,143,142;,
 4;126,127,144,143;,
 4;127,128,145,144;,
 4;128,129,146,145;,
 4;131,130,147,148;,
 4;130,132,149,147;,
 4;132,133,150,149;,
 4;133,134,151,150;,
 4;134,135,152,151;,
 4;135,136,153,152;,
 4;136,137,154,153;,
 4;137,138,155,154;,
 4;138,139,156,155;,
 4;139,140,157,156;,
 4;140,141,158,157;,
 4;141,142,159,158;,
 4;142,143,160,159;,
 4;143,144,161,160;,
 4;144,145,162,161;,
 4;145,146,163,162;,
 4;148,147,164,165;,
 4;147,149,166,164;,
 4;149,150,167,166;,
 4;150,151,168,167;,
 4;151,152,169,168;,
 4;152,153,170,169;,
 4;153,154,171,170;,
 4;154,155,172,171;,
 4;155,156,173,172;,
 4;156,157,174,173;,
 4;157,158,175,174;,
 4;158,159,176,175;,
 4;159,160,177,176;,
 4;160,161,178,177;,
 4;161,162,179,178;,
 4;162,163,180,179;,
 3;181,80,79;,
 3;182,83,80;,
 3;183,85,83;,
 3;184,87,85;,
 3;185,89,87;,
 3;186,91,89;,
 3;187,93,91;,
 3;188,95,93;,
 3;189,97,95;,
 3;190,99,97;,
 3;191,101,99;,
 3;192,103,101;,
 3;193,105,103;,
 3;194,107,105;,
 3;195,109,107;,
 3;196,111,109;,
 3;197,165,164;,
 3;198,164,166;,
 3;199,166,167;,
 3;200,167,168;,
 3;201,168,169;,
 3;202,169,170;,
 3;203,170,171;,
 3;204,171,172;,
 3;205,172,173;,
 3;206,173,174;,
 3;207,174,175;,
 3;208,175,176;,
 3;209,176,177;,
 3;210,177,178;,
 3;211,178,179;,
 3;212,179,180;;
 
 MeshMaterialList {
  7;
  176;
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
  4;;
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
   1.000000;1.000000;1.000000;1.000000;;
   0.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
 }
 MeshNormals {
  148;
  -0.523368;-0.852107;0.000003;,
  -0.484885;-0.789908;-0.375410;,
  -0.242971;-0.932140;-0.268479;,
  -0.140738;-0.990047;0.000002;,
  -0.242975;-0.932139;0.268478;,
  -0.484887;-0.789909;0.375405;,
  -0.716931;-0.646454;0.260972;,
  -0.809354;-0.587322;0.000003;,
  -0.716931;-0.646455;-0.260971;,
  -0.372285;-0.610282;-0.699256;,
  0.081299;-0.862964;-0.498682;,
  0.270651;-0.962678;0.000003;,
  0.081298;-0.862965;0.498681;,
  -0.372287;-0.610284;0.699254;,
  -0.802416;-0.352169;0.481773;,
  -0.969006;-0.247036;0.000004;,
  -0.802415;-0.352171;-0.481773;,
  -0.202138;-0.333329;-0.920887;,
  0.390810;-0.652637;-0.649101;,
  0.630291;-0.776359;0.000003;,
  0.390807;-0.652637;0.649103;,
  -0.202139;-0.333330;0.920886;,
  -0.773515;-0.008213;0.633725;,
  -0.992619;0.121272;0.000003;,
  -0.773516;-0.008210;-0.633724;,
  -0.000001;-0.000003;-1.000000;,
  0.632187;-0.343530;-0.694498;,
  0.878673;-0.477425;0.000002;,
  0.632183;-0.343528;0.694502;,
  -0.000000;-0.000003;1.000000;,
  -0.632182;0.343527;0.694503;,
  -0.878671;0.477427;0.000002;,
  -0.632186;0.343529;-0.694499;,
  0.202135;0.333325;-0.920888;,
  0.773518;0.008215;-0.633721;,
  0.992620;-0.121265;0.000003;,
  0.773517;0.008218;0.633723;,
  0.202136;0.333327;0.920888;,
  -0.390819;0.652627;0.649106;,
  -0.630303;0.776349;0.000002;,
  -0.390823;0.652626;-0.649104;,
  0.372285;0.610295;-0.699246;,
  0.802414;0.352172;-0.481774;,
  0.969007;0.247031;0.000003;,
  0.802414;0.352171;0.481776;,
  0.372285;0.610293;0.699247;,
  -0.081293;0.862964;0.498682;,
  -0.270637;0.962681;0.000005;,
  -0.081286;0.862966;-0.498680;,
  0.484859;0.789919;-0.375420;,
  0.716924;0.646453;-0.260996;,
  0.809358;0.587316;0.000002;,
  0.716922;0.646454;0.260999;,
  0.484861;0.789918;0.375419;,
  0.242962;0.932132;0.268513;,
  0.140759;0.990044;0.000005;,
  0.242967;0.932132;-0.268510;,
  0.523347;0.852120;0.000003;,
  0.000000;1.000000;0.000000;,
  -0.000000;-0.059235;-0.998244;,
  0.382018;-0.059234;-0.922255;,
  0.705859;-0.059232;-0.705872;,
  0.922258;-0.059227;-0.382012;,
  0.998245;-0.059221;0.000006;,
  0.922255;-0.059227;0.382018;,
  0.705878;-0.059232;0.705853;,
  0.382013;-0.059235;0.922257;,
  -0.000000;-0.059235;0.998244;,
  -0.381997;-0.059234;0.922264;,
  -0.705884;-0.059233;0.705846;,
  -0.922259;-0.059234;0.382007;,
  -0.998244;-0.059236;0.000006;,
  -0.922262;-0.059234;-0.382001;,
  -0.705865;-0.059233;-0.705865;,
  -0.382001;-0.059233;-0.922262;,
  -0.000000;-0.029632;-0.999561;,
  0.382520;-0.029631;-0.923472;,
  0.706790;-0.029630;-0.706803;,
  0.923471;-0.029627;-0.382522;,
  0.999561;-0.029624;0.000006;,
  0.923469;-0.029627;0.382528;,
  0.706809;-0.029630;0.706784;,
  0.382516;-0.029631;0.923474;,
  -0.000000;-0.029631;0.999561;,
  -0.382499;-0.029631;0.923481;,
  -0.706816;-0.029630;0.706777;,
  -0.923476;-0.029631;0.382510;,
  -0.999561;-0.029632;0.000006;,
  -0.923479;-0.029631;-0.382504;,
  -0.706796;-0.029630;-0.706796;,
  -0.382504;-0.029631;-0.923479;,
  0.000000;0.000000;-1.000000;,
  0.382687;0.000000;-0.923878;,
  0.707100;0.000000;-0.707113;,
  0.923874;0.000000;-0.382696;,
  1.000000;0.000000;0.000006;,
  0.923872;0.000000;0.382702;,
  0.707120;0.000000;0.707094;,
  0.382683;0.000000;0.923880;,
  0.000000;0.000000;1.000000;,
  -0.382666;0.000000;0.923887;,
  -0.707126;0.000000;0.707087;,
  -0.923882;0.000000;0.382676;,
  -1.000000;0.000000;0.000006;,
  -0.923885;0.000000;-0.382670;,
  -0.707107;0.000000;-0.707107;,
  -0.382670;0.000000;-0.923885;,
  0.382687;0.000000;-0.923878;,
  0.707100;0.000000;-0.707113;,
  0.923874;0.000000;-0.382696;,
  1.000000;0.000000;0.000006;,
  0.000000;0.000000;1.000000;,
  -0.707126;0.000000;0.707087;,
  -0.923882;0.000000;0.382676;,
  -1.000000;0.000000;0.000006;,
  -0.000000;0.076668;-0.997057;,
  0.381562;0.076666;-0.921158;,
  0.705019;0.076664;-0.705032;,
  0.921159;0.076657;-0.381563;,
  0.997058;0.076649;0.000006;,
  0.921156;0.076657;0.381569;,
  0.705038;0.076663;0.705013;,
  0.381558;0.076666;0.921160;,
  -0.000000;0.076666;0.997057;,
  -0.381541;0.076666;0.921167;,
  -0.705045;0.076664;0.705007;,
  -0.921163;0.076666;0.381551;,
  -0.997057;0.076668;0.000006;,
  -0.921165;0.076665;-0.381546;,
  -0.705026;0.076664;-0.705026;,
  -0.381545;0.076665;-0.921165;,
  -0.000000;0.152850;-0.988249;,
  0.378193;0.152846;-0.913021;,
  0.698792;0.152842;-0.698805;,
  0.913027;0.152828;-0.378188;,
  0.988255;0.152814;0.000006;,
  0.913024;0.152828;0.378193;,
  0.698811;0.152841;0.698786;,
  0.378188;0.152847;0.913023;,
  -0.000000;0.152848;0.988250;,
  -0.378172;0.152847;0.913030;,
  -0.698817;0.152843;0.698780;,
  -0.913026;0.152846;0.378183;,
  -0.988249;0.152851;0.000006;,
  -0.913028;0.152846;-0.378177;,
  -0.698799;0.152844;-0.698798;,
  -0.378177;0.152845;-0.913028;,
  0.000000;-1.000000;-0.000000;;
  176;
  3;0,1,2;,
  3;0,2,3;,
  3;0,3,4;,
  3;0,4,5;,
  3;0,5,6;,
  3;0,6,7;,
  3;0,7,8;,
  3;0,8,1;,
  4;1,9,10,2;,
  4;2,10,11,3;,
  4;3,11,12,4;,
  4;4,12,13,5;,
  4;5,13,14,6;,
  4;6,14,15,7;,
  4;7,15,16,8;,
  4;8,16,9,1;,
  4;9,17,18,10;,
  4;10,18,19,11;,
  4;11,19,20,12;,
  4;12,20,21,13;,
  4;13,21,22,14;,
  4;14,22,23,15;,
  4;15,23,24,16;,
  4;16,24,17,9;,
  4;17,25,26,18;,
  4;18,26,27,19;,
  4;19,27,28,20;,
  4;20,28,29,21;,
  4;21,29,30,22;,
  4;22,30,31,23;,
  4;23,31,32,24;,
  4;24,32,25,17;,
  4;25,33,34,26;,
  4;26,34,35,27;,
  4;27,35,36,28;,
  4;28,36,37,29;,
  4;29,37,38,30;,
  4;30,38,39,31;,
  4;31,39,40,32;,
  4;32,40,33,25;,
  4;33,41,42,34;,
  4;34,42,43,35;,
  4;35,43,44,36;,
  4;36,44,45,37;,
  4;37,45,46,38;,
  4;38,46,47,39;,
  4;39,47,48,40;,
  4;40,48,41,33;,
  4;41,49,50,42;,
  4;42,50,51,43;,
  4;43,51,52,44;,
  4;44,52,53,45;,
  4;45,53,54,46;,
  4;46,54,55,47;,
  4;47,55,56,48;,
  4;48,56,49,41;,
  3;49,57,50;,
  3;50,57,51;,
  3;51,57,52;,
  3;52,57,53;,
  3;53,57,54;,
  3;54,57,55;,
  3;55,57,56;,
  3;56,57,49;,
  4;59,60,76,75;,
  4;60,61,77,76;,
  4;61,62,78,77;,
  4;62,63,79,78;,
  4;63,64,80,79;,
  4;64,65,81,80;,
  4;65,66,82,81;,
  4;66,67,83,82;,
  4;67,68,84,83;,
  4;68,69,85,84;,
  4;69,70,86,85;,
  4;70,71,87,86;,
  4;71,72,88,87;,
  4;72,73,89,88;,
  4;73,74,90,89;,
  4;74,59,75,90;,
  4;75,76,92,91;,
  4;76,77,93,92;,
  4;77,78,94,93;,
  4;78,79,95,94;,
  4;79,80,96,95;,
  4;80,81,97,96;,
  4;81,82,98,97;,
  4;82,83,99,98;,
  4;83,84,100,99;,
  4;84,85,101,100;,
  4;85,86,102,101;,
  4;86,87,103,102;,
  4;87,88,104,103;,
  4;88,89,105,104;,
  4;89,90,106,105;,
  4;90,75,91,106;,
  4;91,92,107,91;,
  4;92,93,108,107;,
  4;93,94,109,108;,
  4;94,95,110,109;,
  4;95,96,96,110;,
  4;96,97,97,96;,
  4;97,98,98,97;,
  4;98,99,111,98;,
  4;99,100,100,111;,
  4;100,101,112,100;,
  4;101,102,113,112;,
  4;102,103,114,113;,
  4;103,104,104,114;,
  4;104,105,105,104;,
  4;105,106,106,105;,
  4;106,91,91,106;,
  4;91,107,116,115;,
  4;107,108,117,116;,
  4;108,109,118,117;,
  4;109,110,119,118;,
  4;110,96,120,119;,
  4;96,97,121,120;,
  4;97,98,122,121;,
  4;98,111,123,122;,
  4;111,100,124,123;,
  4;100,112,125,124;,
  4;112,113,126,125;,
  4;113,114,127,126;,
  4;114,104,128,127;,
  4;104,105,129,128;,
  4;105,106,130,129;,
  4;106,91,115,130;,
  4;115,116,132,131;,
  4;116,117,133,132;,
  4;117,118,134,133;,
  4;118,119,135,134;,
  4;119,120,136,135;,
  4;120,121,137,136;,
  4;121,122,138,137;,
  4;122,123,139,138;,
  4;123,124,140,139;,
  4;124,125,141,140;,
  4;125,126,142,141;,
  4;126,127,143,142;,
  4;127,128,144,143;,
  4;128,129,145,144;,
  4;129,130,146,145;,
  4;130,115,131,146;,
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
  3;147,147,147;,
  3;147,147,147;,
  3;147,147,147;,
  3;147,147,147;,
  3;147,147,147;,
  3;147,147,147;,
  3;147,147,147;,
  3;147,147,147;,
  3;147,147,147;,
  3;147,147,147;,
  3;147,147,147;,
  3;147,147,147;,
  3;147,147,147;,
  3;147,147,147;,
  3;147,147,147;,
  3;147,147,147;;
 }
 MeshTextureCoords {
  213;
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
  0.000000;0.000000;,
  0.062500;0.000000;,
  0.062500;0.200000;,
  0.000000;0.200000;,
  0.125000;0.000000;,
  0.125000;0.200000;,
  0.187500;0.000000;,
  0.187500;0.200000;,
  0.250000;0.000000;,
  0.250000;0.200000;,
  0.312500;0.000000;,
  0.312500;0.200000;,
  0.375000;0.000000;,
  0.375000;0.200000;,
  0.437500;0.000000;,
  0.437500;0.200000;,
  0.500000;0.000000;,
  0.500000;0.200000;,
  0.562500;0.000000;,
  0.562500;0.200000;,
  0.625000;0.000000;,
  0.625000;0.200000;,
  0.687500;0.000000;,
  0.687500;0.200000;,
  0.750000;0.000000;,
  0.750000;0.200000;,
  0.812500;0.000000;,
  0.812500;0.200000;,
  0.875000;0.000000;,
  0.875000;0.200000;,
  0.937500;0.000000;,
  0.937500;0.200000;,
  1.000000;0.000000;,
  1.000000;0.200000;,
  0.062500;0.400000;,
  0.000000;0.400000;,
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
  0.062500;0.600000;,
  0.000000;0.600000;,
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
  0.062500;0.800000;,
  0.000000;0.800000;,
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
  0.062500;1.000000;,
  0.000000;1.000000;,
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
  0.968750;1.000000;;
 }
}
