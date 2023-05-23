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
 0.00000;0.70000;0.00000;,
 0.00000;0.64315;-0.30495;,
 -0.21563;0.64315;-0.21564;,
 0.00000;0.70000;0.00000;,
 -0.30495;0.64315;0.00000;,
 0.00000;0.70000;0.00000;,
 -0.21563;0.64315;0.21563;,
 0.00000;0.70000;0.00000;,
 0.00000;0.64315;0.30495;,
 0.00000;0.70000;0.00000;,
 0.21563;0.64315;0.21563;,
 0.00000;0.70000;0.00000;,
 0.30494;0.64315;0.00000;,
 0.00000;0.70000;0.00000;,
 0.21563;0.64315;-0.21564;,
 0.00000;0.70000;0.00000;,
 0.00000;0.64315;-0.30495;,
 0.00000;0.48125;-0.56348;,
 -0.39844;0.48125;-0.39844;,
 -0.56348;0.48125;0.00000;,
 -0.39844;0.48125;0.39843;,
 0.00000;0.48125;0.56347;,
 0.39843;0.48125;0.39843;,
 0.56347;0.48125;0.00000;,
 0.39843;0.48125;-0.39844;,
 0.00000;0.48125;-0.56348;,
 0.00000;0.23896;-0.73622;,
 -0.52059;0.23896;-0.52059;,
 -0.73622;0.23896;0.00000;,
 -0.52059;0.23896;0.52058;,
 0.00000;0.23896;0.73621;,
 0.52058;0.23896;0.52058;,
 0.73621;0.23896;0.00000;,
 0.52058;0.23896;-0.52059;,
 0.00000;0.23896;-0.73622;,
 0.00000;-0.04685;-0.79688;,
 -0.56348;-0.04685;-0.56348;,
 -0.79688;-0.04685;0.00000;,
 -0.56348;-0.04685;0.56347;,
 0.00000;-0.04685;0.79687;,
 0.56347;-0.04685;0.56347;,
 0.79687;-0.04685;-0.00000;,
 0.56347;-0.04685;-0.56348;,
 0.00000;-0.04685;-0.79688;,
 0.00000;-0.33265;-0.73622;,
 -0.52059;-0.33265;-0.52059;,
 -0.73622;-0.33265;0.00000;,
 -0.52059;-0.33265;0.52058;,
 0.00000;-0.33265;0.73621;,
 0.52058;-0.33265;0.52058;,
 0.73621;-0.33265;-0.00000;,
 0.52058;-0.33265;-0.52059;,
 0.00000;-0.33265;-0.73622;,
 0.00000;-0.57495;-0.56348;,
 -0.39844;-0.57495;-0.39844;,
 -0.56348;-0.57495;0.00000;,
 -0.39844;-0.57495;0.39843;,
 0.00000;-0.57495;0.56347;,
 0.39843;-0.57495;0.39843;,
 0.56347;-0.57495;-0.00000;,
 0.39843;-0.57495;-0.39844;,
 0.00000;-0.57495;-0.56348;,
 0.00000;-0.73685;-0.30495;,
 -0.21563;-0.73685;-0.21564;,
 -0.30495;-0.73685;0.00000;,
 -0.21563;-0.73685;0.21563;,
 0.00000;-0.73685;0.30495;,
 0.21563;-0.73685;0.21563;,
 0.30494;-0.73685;-0.00000;,
 0.21563;-0.73685;-0.21564;,
 0.00000;-0.73685;-0.30495;,
 0.00000;-0.79369;-0.00000;,
 0.00000;-0.79369;-0.00000;,
 0.00000;-0.79369;-0.00000;,
 0.00000;-0.79369;-0.00000;,
 0.00000;-0.79369;-0.00000;,
 0.00000;-0.79369;-0.00000;,
 0.00000;-0.79369;-0.00000;,
 0.00000;-0.79369;-0.00000;,
 -0.09958;-0.33616;-0.52500;,
 0.10133;-0.33616;-0.48504;,
 0.10133;-0.65300;-0.48504;,
 -0.09958;-0.65300;-0.52500;,
 0.27165;-0.33616;-0.37123;,
 0.27165;-0.65300;-0.37123;,
 0.38546;-0.33616;-0.20091;,
 0.38546;-0.65300;-0.20091;,
 0.42542;-0.33616;-0.00000;,
 0.42542;-0.65300;-0.00000;,
 0.38546;-0.33616;0.20090;,
 0.38546;-0.65300;0.20090;,
 0.27165;-0.33616;0.37123;,
 0.27165;-0.65300;0.37123;,
 0.10133;-0.33616;0.48503;,
 0.10133;-0.65300;0.48503;,
 -0.09958;-0.33616;0.52500;,
 -0.09958;-0.65300;0.52500;,
 -0.30049;-0.33616;0.48503;,
 -0.30049;-0.65300;0.48503;,
 -0.47081;-0.33616;0.37123;,
 -0.47081;-0.65300;0.37123;,
 -0.58462;-0.33616;0.20090;,
 -0.58462;-0.65300;0.20090;,
 -0.62458;-0.33616;0.00000;,
 -0.62458;-0.65300;0.00000;,
 -0.58462;-0.33616;-0.20091;,
 -0.58462;-0.65300;-0.20091;,
 -0.47081;-0.33616;-0.37124;,
 -0.47081;-0.65300;-0.37124;,
 -0.30049;-0.33616;-0.48504;,
 -0.30049;-0.65300;-0.48504;,
 -0.09958;-0.33616;-0.52500;,
 -0.09958;-0.65300;-0.52500;,
 0.09128;-1.24770;-0.46079;,
 -0.09958;-1.24770;-0.49875;,
 0.25309;-1.24770;-0.35267;,
 0.36120;-1.24770;-0.19087;,
 0.39917;-1.24770;-0.00000;,
 0.36120;-1.24770;0.19086;,
 0.25309;-1.24770;0.35267;,
 0.09128;-1.24770;0.46078;,
 -0.09958;-1.24770;0.49875;,
 -0.29044;-1.24770;0.46078;,
 -0.45225;-1.24770;0.35267;,
 -0.56036;-1.24770;0.19086;,
 -0.59833;-1.24770;0.00000;,
 -0.56036;-1.24770;-0.19087;,
 -0.45225;-1.24770;-0.35267;,
 -0.29044;-1.24770;-0.46079;,
 -0.09958;-1.24770;-0.49875;,
 0.08174;-2.30358;-0.43775;,
 -0.09958;-2.30358;-0.47382;,
 0.23546;-2.30358;-0.33504;,
 0.33817;-2.30358;-0.18132;,
 0.37423;-2.30358;-0.00000;,
 0.33817;-2.30358;0.18132;,
 0.23546;-2.30358;0.33503;,
 0.08174;-2.30358;0.43774;,
 -0.09958;-2.30358;0.47381;,
 -0.28090;-2.30358;0.43774;,
 -0.43462;-2.30358;0.33503;,
 -0.53733;-2.30358;0.18132;,
 -0.57339;-2.30358;0.00000;,
 -0.53733;-2.30358;-0.18132;,
 -0.43462;-2.30358;-0.33504;,
 -0.28090;-2.30358;-0.43775;,
 -0.09958;-2.30358;-0.47382;,
 0.07267;-2.81586;-0.41586;,
 -0.09958;-2.81586;-0.45013;,
 0.21870;-2.81586;-0.31829;,
 0.31628;-2.81586;-0.17226;,
 0.35054;-2.81586;-0.00000;,
 0.31628;-2.81586;0.17225;,
 0.21870;-2.81586;0.31828;,
 0.07267;-2.81586;0.41585;,
 -0.09958;-2.81586;0.45012;,
 -0.27183;-2.81586;0.41585;,
 -0.41786;-2.81586;0.31828;,
 -0.51544;-2.81586;0.17225;,
 -0.54970;-2.81586;0.00000;,
 -0.51544;-2.81586;-0.17226;,
 -0.41786;-2.81586;-0.31829;,
 -0.27183;-2.81586;-0.41586;,
 -0.09958;-2.81586;-0.45013;,
 0.08174;-3.14635;-0.43775;,
 -0.09958;-3.14635;-0.47382;,
 0.23546;-3.14635;-0.33504;,
 0.33817;-3.14635;-0.18132;,
 0.37423;-3.14635;-0.00000;,
 0.33817;-3.14635;0.18132;,
 0.23546;-3.14635;0.33503;,
 0.08174;-3.14635;0.43774;,
 -0.09958;-3.14635;0.47381;,
 -0.28090;-3.14635;0.43774;,
 -0.43462;-3.14635;0.33503;,
 -0.53733;-3.14635;0.18132;,
 -0.57339;-3.14635;0.00000;,
 -0.53733;-3.14635;-0.18132;,
 -0.43462;-3.14635;-0.33504;,
 -0.28090;-3.14635;-0.43775;,
 -0.09958;-3.14635;-0.47382;,
 -0.09958;-0.33616;0.00000;,
 -0.09958;-0.33616;0.00000;,
 -0.09958;-0.33616;0.00000;,
 -0.09958;-0.33616;0.00000;,
 -0.09958;-0.33616;0.00000;,
 -0.09958;-0.33616;0.00000;,
 -0.09958;-0.33616;0.00000;,
 -0.09958;-0.33616;0.00000;,
 -0.09958;-0.33616;0.00000;,
 -0.09958;-0.33616;0.00000;,
 -0.09958;-0.33616;0.00000;,
 -0.09958;-0.33616;0.00000;,
 -0.09958;-0.33616;0.00000;,
 -0.09958;-0.33616;0.00000;,
 -0.09958;-0.33616;0.00000;,
 -0.09958;-0.33616;0.00000;,
 -0.09958;-3.14635;0.00000;,
 -0.09958;-3.14635;0.00000;,
 -0.09958;-3.14635;0.00000;,
 -0.09958;-3.14635;0.00000;,
 -0.09958;-3.14635;0.00000;,
 -0.09958;-3.14635;0.00000;,
 -0.09958;-3.14635;0.00000;,
 -0.09958;-3.14635;0.00000;,
 -0.09958;-3.14635;0.00000;,
 -0.09958;-3.14635;0.00000;,
 -0.09958;-3.14635;0.00000;,
 -0.09958;-3.14635;0.00000;,
 -0.09958;-3.14635;0.00000;,
 -0.09958;-3.14635;0.00000;,
 -0.09958;-3.14635;0.00000;,
 -0.09958;-3.14635;0.00000;;
 
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
  1;;
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
  156;
  0.000001;1.000000;0.000001;,
  0.000001;0.932350;-0.361556;,
  -0.255653;0.932352;-0.255657;,
  -0.361550;0.932352;0.000003;,
  -0.255657;0.932350;0.255660;,
  0.000001;0.932350;0.361557;,
  0.255664;0.932349;0.255657;,
  0.361561;0.932349;0.000003;,
  0.255659;0.932351;-0.255655;,
  0.000003;0.730011;-0.683435;,
  -0.483257;0.730015;-0.483261;,
  -0.683430;0.730016;0.000003;,
  -0.483258;0.730012;0.483263;,
  0.000002;0.730010;0.683437;,
  0.483265;0.730009;0.483262;,
  0.683437;0.730010;0.000003;,
  0.483264;0.730011;-0.483259;,
  0.000003;0.404609;-0.914490;,
  -0.646641;0.404611;-0.646641;,
  -0.914489;0.404611;0.000003;,
  -0.646639;0.404610;0.646644;,
  0.000003;0.404609;0.914490;,
  0.646642;0.404609;0.646642;,
  0.914490;0.404609;0.000003;,
  0.646644;0.404610;-0.646639;,
  0.000003;-0.000003;-1.000000;,
  -0.707107;-0.000003;-0.707107;,
  -1.000000;-0.000003;0.000003;,
  -0.707105;-0.000003;0.707109;,
  0.000003;-0.000003;1.000000;,
  0.707107;-0.000003;0.707107;,
  1.000000;-0.000003;0.000003;,
  0.707109;-0.000003;-0.707105;,
  0.000003;-0.404604;-0.914492;,
  -0.646643;-0.404605;-0.646643;,
  -0.914492;-0.404604;0.000003;,
  -0.646641;-0.404604;0.646646;,
  0.000003;-0.404604;0.914492;,
  0.646643;-0.404604;0.646643;,
  0.914492;-0.404605;0.000003;,
  0.646646;-0.404604;-0.646641;,
  0.000003;-0.730005;-0.683442;,
  -0.483262;-0.730009;-0.483265;,
  -0.683437;-0.730009;0.000003;,
  -0.483263;-0.730006;0.483268;,
  0.000002;-0.730004;0.683443;,
  0.483269;-0.730004;0.483266;,
  0.683443;-0.730004;0.000003;,
  0.483268;-0.730005;-0.483264;,
  0.000001;-0.932356;-0.361541;,
  -0.255642;-0.932358;-0.255646;,
  -0.361535;-0.932359;0.000003;,
  -0.255646;-0.932356;0.255649;,
  0.000001;-0.932356;0.361542;,
  0.255653;-0.932355;0.255646;,
  0.361545;-0.932355;0.000003;,
  0.255648;-0.932357;-0.255644;,
  0.000001;-1.000000;0.000001;,
  0.000000;1.000000;0.000000;,
  0.000000;0.000000;-1.000000;,
  0.382687;0.000000;-0.923878;,
  0.707107;0.000000;-0.707107;,
  0.923878;0.000000;-0.382687;,
  1.000000;0.000000;0.000005;,
  0.923882;0.000000;0.382678;,
  0.707102;0.000000;0.707112;,
  0.382690;0.000000;0.923877;,
  0.000000;0.000000;1.000000;,
  -0.382690;0.000000;0.923877;,
  -0.707102;0.000000;0.707112;,
  -0.923881;0.000000;0.382679;,
  -1.000000;0.000000;0.000005;,
  -0.923883;0.000000;-0.382674;,
  -0.707102;0.000000;-0.707112;,
  -0.382668;0.000000;-0.923886;,
  0.000000;-0.022054;-0.999757;,
  0.382591;-0.022054;-0.923654;,
  0.706936;-0.022054;-0.706933;,
  0.923653;-0.022056;-0.382594;,
  0.999757;-0.022057;0.000005;,
  0.923657;-0.022056;0.382586;,
  0.706931;-0.022054;0.706938;,
  0.382595;-0.022054;0.923653;,
  0.000000;-0.022054;0.999757;,
  -0.382595;-0.022054;0.923653;,
  -0.706931;-0.022055;0.706939;,
  -0.923657;-0.022056;0.382586;,
  -0.999757;-0.022057;0.000005;,
  -0.923657;-0.022057;-0.382585;,
  -0.706932;-0.022057;-0.706937;,
  -0.382577;-0.022056;-0.923660;,
  0.000000;-0.033854;-0.999427;,
  0.382462;-0.033854;-0.923351;,
  0.706704;-0.033854;-0.706699;,
  0.923351;-0.033856;-0.382462;,
  0.999427;-0.033858;0.000004;,
  0.923352;-0.033856;0.382460;,
  0.706698;-0.033855;0.706705;,
  0.382465;-0.033856;0.923350;,
  0.000000;-0.033856;0.999427;,
  -0.382465;-0.033856;0.923349;,
  -0.706698;-0.033855;0.706705;,
  -0.923352;-0.033856;0.382460;,
  -0.999427;-0.033857;0.000004;,
  -0.923352;-0.033857;-0.382459;,
  -0.706703;-0.033857;-0.706700;,
  -0.382458;-0.033856;-0.923352;,
  0.000000;-0.034906;-0.999391;,
  0.382453;-0.034907;-0.923316;,
  0.706673;-0.034907;-0.706679;,
  0.923320;-0.034906;-0.382441;,
  0.999391;-0.034905;0.000003;,
  0.923318;-0.034908;0.382447;,
  0.706666;-0.034910;0.706685;,
  0.382453;-0.034909;0.923315;,
  0.000000;-0.034908;0.999390;,
  -0.382453;-0.034909;0.923315;,
  -0.706666;-0.034910;0.706685;,
  -0.923318;-0.034907;0.382447;,
  -0.999391;-0.034905;0.000003;,
  -0.923320;-0.034906;-0.382441;,
  -0.706673;-0.034907;-0.706679;,
  -0.382453;-0.034907;-0.923316;,
  0.000000;0.012676;-0.999920;,
  0.382659;0.012677;-0.923803;,
  0.707042;0.012677;-0.707058;,
  0.923810;0.012676;-0.382642;,
  0.999920;0.012676;0.000003;,
  0.923806;0.012677;0.382652;,
  0.707036;0.012678;0.707064;,
  0.382659;0.012677;0.923803;,
  0.000000;0.012676;0.999920;,
  -0.382659;0.012677;0.923803;,
  -0.707036;0.012678;0.707064;,
  -0.923806;0.012677;0.382652;,
  -0.999920;0.012676;0.000003;,
  -0.923810;0.012676;-0.382642;,
  -0.707042;0.012677;-0.707058;,
  -0.382659;0.012677;-0.923803;,
  0.000000;0.071505;-0.997440;,
  0.381710;0.071507;-0.921512;,
  0.705288;0.071509;-0.705305;,
  0.921519;0.071504;-0.381693;,
  0.997440;0.071502;0.000003;,
  0.921515;0.071510;0.381703;,
  0.705283;0.071513;0.705310;,
  0.381710;0.071507;0.921512;,
  0.000000;0.071505;0.997440;,
  -0.381710;0.071508;0.921512;,
  -0.705283;0.071514;0.705310;,
  -0.921515;0.071510;0.381703;,
  -0.997440;0.071503;0.000003;,
  -0.921519;0.071504;-0.381693;,
  -0.705288;0.071509;-0.705305;,
  -0.381710;0.071507;-0.921512;,
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
  4;91,92,108,107;,
  4;92,93,109,108;,
  4;93,94,110,109;,
  4;94,95,111,110;,
  4;95,96,112,111;,
  4;96,97,113,112;,
  4;97,98,114,113;,
  4;98,99,115,114;,
  4;99,100,116,115;,
  4;100,101,117,116;,
  4;101,102,118,117;,
  4;102,103,119,118;,
  4;103,104,120,119;,
  4;104,105,121,120;,
  4;105,106,122,121;,
  4;106,91,107,122;,
  4;107,108,124,123;,
  4;108,109,125,124;,
  4;109,110,126,125;,
  4;110,111,127,126;,
  4;111,112,128,127;,
  4;112,113,129,128;,
  4;113,114,130,129;,
  4;114,115,131,130;,
  4;115,116,132,131;,
  4;116,117,133,132;,
  4;117,118,134,133;,
  4;118,119,135,134;,
  4;119,120,136,135;,
  4;120,121,137,136;,
  4;121,122,138,137;,
  4;122,107,123,138;,
  4;123,124,140,139;,
  4;124,125,141,140;,
  4;125,126,142,141;,
  4;126,127,143,142;,
  4;127,128,144,143;,
  4;128,129,145,144;,
  4;129,130,146,145;,
  4;130,131,147,146;,
  4;131,132,148,147;,
  4;132,133,149,148;,
  4;133,134,150,149;,
  4;134,135,151,150;,
  4;135,136,152,151;,
  4;136,137,153,152;,
  4;137,138,154,153;,
  4;138,123,139,154;,
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
  3;155,155,155;,
  3;155,155,155;,
  3;155,155,155;,
  3;155,155,155;,
  3;155,155,155;,
  3;155,155,155;,
  3;155,155,155;,
  3;155,155,155;,
  3;155,155,155;,
  3;155,155,155;,
  3;155,155,155;,
  3;155,155,155;,
  3;155,155,155;,
  3;155,155,155;,
  3;155,155,155;,
  3;155,155,155;;
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
