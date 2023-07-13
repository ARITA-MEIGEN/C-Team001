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
 200;
 1.57650;0.00000;-1.62200;,
 1.47465;-0.86836;-1.70496;,
 0.50557;-0.86836;-1.91222;,
 0.69972;0.00000;-1.81917;,
 -0.46350;-0.86836;-1.91222;,
 -0.71601;0.00000;-1.81917;,
 -1.43258;-0.86836;-1.70496;,
 -1.93020;0.00000;-1.62200;,
 1.88752;-2.06236;-2.13125;,
 0.67619;-2.06236;-2.39033;,
 -0.53515;-2.06236;-2.39033;,
 -1.74651;-2.06236;-2.13125;,
 1.88752;-3.14782;-2.13125;,
 0.67619;-3.14782;-2.39033;,
 -0.53515;-3.14782;-2.39033;,
 -1.50899;-2.91167;-2.13125;,
 -1.93020;0.00000;-1.62200;,
 -1.43258;-0.86836;-1.70496;,
 -1.66036;-0.86836;-0.56819;,
 -2.23830;0.00000;-0.54054;,
 -1.66036;-0.86836;0.56860;,
 -2.23830;0.00000;0.54094;,
 -1.43258;-0.86836;1.70536;,
 -1.93020;0.00000;1.62240;,
 -1.74651;-2.06236;-2.13125;,
 -2.02496;-2.06236;-0.71027;,
 -2.02496;-2.06236;0.71068;,
 -1.74651;-2.06236;2.13166;,
 -1.50899;-2.91167;-2.13125;,
 -1.74907;-2.91167;-0.71027;,
 -1.74907;-2.91167;0.71068;,
 -1.50899;-2.91167;1.91368;,
 -1.93020;0.00000;1.62240;,
 -1.43258;-0.86836;1.70536;,
 -0.46350;-0.86836;1.91264;,
 -0.71601;0.00000;1.81957;,
 0.50557;-0.86836;1.91264;,
 0.69972;0.00000;1.81957;,
 1.47465;-0.86836;1.70536;,
 1.57650;0.00000;1.62240;,
 -1.74651;-2.06236;2.13166;,
 -0.53515;-2.06236;2.39072;,
 0.67619;-2.06236;2.39072;,
 1.88752;-2.06236;2.13166;,
 -1.50899;-2.91167;1.91368;,
 -0.29763;-2.91167;2.14624;,
 0.67619;-3.14782;2.14624;,
 1.88752;-3.14782;1.91368;,
 1.57650;0.00000;1.62240;,
 1.47465;-0.86836;1.70536;,
 1.71611;-0.86836;0.56860;,
 1.83440;0.00000;0.54094;,
 1.71611;-0.86836;-0.56819;,
 1.83440;0.00000;-0.54054;,
 1.47465;-0.86836;-1.70496;,
 1.57650;0.00000;-1.62200;,
 1.88752;-2.06236;2.13166;,
 2.19562;-2.06236;0.71068;,
 2.19562;-2.06236;-0.71027;,
 1.88752;-2.06236;-2.13125;,
 1.88752;-3.14782;1.91368;,
 2.19562;-3.14782;0.71068;,
 2.19562;-3.14782;-0.71027;,
 1.88752;-3.14782;-2.13125;,
 1.83440;0.00000;0.54094;,
 0.81607;0.00000;0.60668;,
 0.69972;0.00000;1.81957;,
 -0.82814;0.00000;0.60668;,
 -0.71601;0.00000;1.81957;,
 -2.23830;0.00000;0.54094;,
 1.83440;0.00000;-0.54054;,
 0.81607;0.00000;-0.60626;,
 -0.82814;0.00000;-0.60626;,
 -2.23830;0.00000;-0.54054;,
 1.57650;0.00000;-1.62200;,
 0.69972;0.00000;-1.81917;,
 -0.71601;0.00000;-1.81917;,
 -1.93020;0.00000;-1.62200;,
 2.19562;-3.14782;0.71068;,
 0.67619;-3.14782;2.14624;,
 0.78875;-3.14782;0.79705;,
 -0.29763;-2.91167;2.14624;,
 -0.34221;-2.91167;0.79705;,
 -1.74907;-2.91167;0.71068;,
 2.19562;-3.14782;-0.71027;,
 0.78875;-3.14782;-0.79665;,
 -0.34221;-2.91167;-0.79665;,
 -1.74907;-2.91167;-0.71027;,
 1.88752;-3.14782;-2.13125;,
 0.67619;-3.14782;-2.39033;,
 -0.53515;-3.14782;-2.39033;,
 -1.50899;-2.91167;-2.13125;,
 1.96312;-1.51041;-1.96836;,
 2.23795;-3.16181;-1.96836;,
 0.73859;-3.40516;-1.96836;,
 0.73859;-1.51041;-1.96836;,
 1.80536;-4.88321;-1.96836;,
 0.71340;-3.80226;-1.96836;,
 0.42386;-5.90747;-1.96836;,
 -0.06816;-5.35436;-1.96836;,
 0.73859;-1.51041;-1.96836;,
 0.73859;-3.40516;-1.96836;,
 0.73859;-3.40516;-0.41290;,
 0.73859;-1.51041;-0.41290;,
 0.71340;-3.80226;-1.96836;,
 0.71340;-3.80226;-0.41290;,
 -0.06816;-5.35436;-1.96836;,
 -0.06816;-5.35436;-0.41290;,
 0.73859;-1.51041;-0.41290;,
 0.73859;-3.40516;-0.41290;,
 2.23795;-3.16181;-0.41290;,
 1.96312;-1.51041;-0.41290;,
 0.71340;-3.80226;-0.41290;,
 1.80536;-4.88321;-0.41290;,
 -0.06816;-5.35436;-0.41290;,
 0.42386;-5.90747;-0.41290;,
 1.96312;-1.51041;-0.41290;,
 2.23795;-3.16181;-0.41290;,
 2.23795;-3.16181;-1.96836;,
 1.96312;-1.51041;-1.96836;,
 1.80536;-4.88321;-0.41290;,
 1.80536;-4.88321;-1.96836;,
 0.42386;-5.90747;-0.41290;,
 0.42386;-5.90747;-1.96836;,
 1.96312;-1.51041;-1.96836;,
 0.73859;-1.51041;-1.96836;,
 0.42386;-5.90747;-1.96836;,
 -0.06816;-5.35436;-1.96836;,
 1.80462;-1.23721;0.06861;,
 2.07943;-2.88864;0.06861;,
 0.58010;-3.13195;0.06861;,
 0.58010;-1.23721;0.06861;,
 1.64684;-4.61002;0.06861;,
 0.55491;-3.52909;0.06861;,
 0.26536;-5.63427;0.06861;,
 -0.22665;-5.08116;0.06861;,
 0.58010;-1.23721;0.06861;,
 0.58010;-3.13195;0.06861;,
 0.58010;-3.13195;1.62410;,
 0.58010;-1.23721;1.62410;,
 0.55491;-3.52909;0.06861;,
 0.55491;-3.52909;1.62410;,
 -0.22665;-5.08116;0.06861;,
 -0.22665;-5.08116;1.62410;,
 0.58010;-1.23721;1.62410;,
 0.58010;-3.13195;1.62410;,
 2.07943;-2.88864;1.62410;,
 1.80462;-1.23721;1.62410;,
 0.55491;-3.52909;1.62410;,
 1.64684;-4.61002;1.62410;,
 -0.22665;-5.08116;1.62410;,
 0.26536;-5.63427;1.62410;,
 1.80462;-1.23721;1.62410;,
 2.07943;-2.88864;1.62410;,
 2.07943;-2.88864;0.06861;,
 1.80462;-1.23721;0.06861;,
 1.64684;-4.61002;1.62410;,
 1.64684;-4.61002;0.06861;,
 0.26536;-5.63427;1.62410;,
 0.26536;-5.63427;0.06861;,
 1.80462;-1.23721;0.06861;,
 0.58010;-1.23721;0.06861;,
 0.26536;-5.63427;0.06861;,
 -0.22665;-5.08116;0.06861;,
 -1.44749;-1.89737;-1.35375;,
 -0.49424;-2.26027;-1.35375;,
 -0.93400;-3.52397;-1.35375;,
 -2.04471;-2.91735;-1.35375;,
 -1.00658;-3.79629;-1.35375;,
 -2.10749;-4.19364;-1.35375;,
 -0.75836;-5.06305;-1.35375;,
 -1.26976;-5.28615;-1.35375;,
 -0.49424;-2.26027;-1.35375;,
 -0.49424;-2.26027;-0.10936;,
 -0.93400;-3.52397;-0.10936;,
 -0.93400;-3.52397;-1.35375;,
 -1.00658;-3.79629;-0.10936;,
 -1.00658;-3.79629;-1.35375;,
 -0.75836;-5.06305;-0.10936;,
 -0.75836;-5.06305;-1.35375;,
 -0.49424;-2.26027;-0.10936;,
 -1.44749;-1.89737;-0.10936;,
 -2.04471;-2.91735;-0.10936;,
 -0.93400;-3.52397;-0.10936;,
 -2.10749;-4.19364;-0.10936;,
 -1.00658;-3.79629;-0.10936;,
 -1.26976;-5.28615;-0.10936;,
 -0.75836;-5.06305;-0.10936;,
 -1.44749;-1.89737;-0.10936;,
 -1.44749;-1.89737;-1.35375;,
 -2.04471;-2.91735;-1.35375;,
 -2.04471;-2.91735;-0.10936;,
 -2.10749;-4.19364;-1.35375;,
 -2.10749;-4.19364;-0.10936;,
 -1.26976;-5.28615;-1.35375;,
 -1.26976;-5.28615;-0.10936;,
 -0.49424;-2.26027;-1.35375;,
 -1.44749;-1.89737;-1.35375;,
 -1.26976;-5.28615;-1.35375;,
 -0.75836;-5.06305;-1.35375;;
 
 96;
 4;0,1,2,3;,
 4;3,2,4,5;,
 4;5,4,6,7;,
 4;1,8,9,2;,
 4;2,9,10,4;,
 4;4,10,11,6;,
 4;8,12,13,9;,
 4;9,13,14,10;,
 4;10,14,15,11;,
 4;16,17,18,19;,
 4;19,18,20,21;,
 4;21,20,22,23;,
 4;17,24,25,18;,
 4;18,25,26,20;,
 4;20,26,27,22;,
 4;24,28,29,25;,
 4;25,29,30,26;,
 4;26,30,31,27;,
 4;32,33,34,35;,
 4;35,34,36,37;,
 4;37,36,38,39;,
 4;33,40,41,34;,
 4;34,41,42,36;,
 4;36,42,43,38;,
 4;40,44,45,41;,
 4;41,45,46,42;,
 4;42,46,47,43;,
 4;48,49,50,51;,
 4;51,50,52,53;,
 4;53,52,54,55;,
 4;49,56,57,50;,
 4;50,57,58,52;,
 4;52,58,59,54;,
 4;56,60,61,57;,
 4;57,61,62,58;,
 4;58,62,63,59;,
 4;48,64,65,66;,
 4;66,65,67,68;,
 4;68,67,69,23;,
 4;64,70,71,65;,
 4;65,71,72,67;,
 4;67,72,73,69;,
 4;70,74,75,71;,
 4;71,75,76,72;,
 4;72,76,77,73;,
 4;78,60,79,80;,
 4;80,79,81,82;,
 4;82,81,31,83;,
 4;84,78,80,85;,
 4;85,80,82,86;,
 4;86,82,83,87;,
 4;88,84,85,89;,
 4;89,85,86,90;,
 4;90,86,87,91;,
 4;92,93,94,95;,
 4;93,96,97,94;,
 4;96,98,99,97;,
 4;100,101,102,103;,
 4;101,104,105,102;,
 4;104,106,107,105;,
 4;108,109,110,111;,
 4;109,112,113,110;,
 4;112,114,115,113;,
 4;116,117,118,119;,
 4;117,120,121,118;,
 4;120,122,123,121;,
 4;116,124,125,103;,
 4;126,122,107,127;,
 4;128,129,130,131;,
 4;129,132,133,130;,
 4;132,134,135,133;,
 4;136,137,138,139;,
 4;137,140,141,138;,
 4;140,142,143,141;,
 4;144,145,146,147;,
 4;145,148,149,146;,
 4;148,150,151,149;,
 4;152,153,154,155;,
 4;153,156,157,154;,
 4;156,158,159,157;,
 4;152,160,161,139;,
 4;162,158,143,163;,
 4;164,165,166,167;,
 4;167,166,168,169;,
 4;169,168,170,171;,
 4;172,173,174,175;,
 4;175,174,176,177;,
 4;177,176,178,179;,
 4;180,181,182,183;,
 4;183,182,184,185;,
 4;185,184,186,187;,
 4;188,189,190,191;,
 4;191,190,192,193;,
 4;193,192,194,195;,
 4;188,173,196,197;,
 4;198,199,178,195;;
 
 MeshMaterialList {
  15;
  96;
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  2,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3;;
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
   0.213600;0.213600;0.213600;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.288800;0.288800;0.288800;1.000000;;
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
   0.056800;0.292000;0.545600;1.000000;;
   12.000000;
   0.120000;0.120000;0.120000;;
   0.008520;0.043800;0.081840;;
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
 }
 MeshNormals {
  103;
  0.213857;0.062627;-0.974855;,
  0.107577;0.085099;-0.990548;,
  -0.092837;0.065209;-0.993544;,
  0.206200;0.228722;-0.951403;,
  0.103412;0.236351;-0.966149;,
  -0.096354;0.222967;-0.970052;,
  0.205000;0.198110;-0.958503;,
  0.102959;0.194735;-0.975437;,
  -0.109564;0.184016;-0.976798;,
  0.209145;0.000000;-0.977885;,
  0.105156;0.000000;-0.994456;,
  -0.117378;-0.014711;-0.992978;,
  -0.184715;0.023198;-0.982518;,
  -0.839983;-0.532988;-0.101749;,
  -0.839983;-0.532987;0.101750;,
  -0.192450;0.202236;-0.960241;,
  -0.986059;-0.127207;-0.107263;,
  -0.986059;-0.127207;0.107264;,
  -0.218165;0.176499;-0.959819;,
  -0.995580;0.001870;-0.093899;,
  -0.995233;-0.003648;0.097455;,
  -0.233109;-0.029216;-0.972012;,
  -0.950648;-0.298027;-0.086305;,
  -0.946626;-0.308700;0.092757;,
  -0.838370;-0.506135;0.202396;,
  -0.092840;0.065218;0.993543;,
  0.107580;0.085109;0.990547;,
  -0.971191;-0.108164;0.212339;,
  -0.096356;0.222969;0.970052;,
  0.103413;0.236353;0.966148;,
  -0.980961;0.001610;0.194198;,
  -0.108899;0.050834;0.992752;,
  0.095258;0.081211;0.992135;,
  -0.934008;-0.305793;0.184714;,
  -0.108381;-0.278631;0.954263;,
  0.084544;-0.227727;0.970048;,
  0.213863;0.062633;0.974854;,
  0.986310;-0.122900;0.109950;,
  0.986310;-0.122901;-0.109949;,
  0.206204;0.228724;0.951402;,
  0.985294;0.133093;0.107154;,
  0.985294;0.133093;-0.107154;,
  0.202885;0.096395;0.974446;,
  0.976009;0.188634;0.108734;,
  0.975527;0.193774;-0.103921;,
  0.194633;-0.204321;0.959360;,
  0.993217;-0.010706;0.115783;,
  0.994307;0.000000;-0.106556;,
  0.000000;1.000000;0.000000;,
  -0.106726;-0.994288;-0.001165;,
  -0.077166;-0.996810;0.020364;,
  -0.101181;-0.994007;0.041395;,
  0.000000;0.000000;-1.000000;,
  -1.000000;0.000000;0.000000;,
  -0.999498;0.031667;0.000000;,
  -0.965115;0.261827;0.000000;,
  -0.893155;0.449750;0.000000;,
  0.000000;-0.000000;1.000000;,
  -0.999499;0.031664;0.000000;,
  -0.965115;0.261827;0.000000;,
  -0.893152;0.449755;0.000000;,
  0.944447;-0.328664;-0.000000;,
  0.956021;-0.293297;-0.000000;,
  0.999439;-0.033478;-0.000000;,
  0.981339;0.192286;0.000000;,
  -0.838369;-0.506136;-0.202395;,
  -0.971191;-0.108165;-0.212339;,
  -0.982308;0.012568;-0.186850;,
  -0.943021;-0.284854;-0.171957;,
  -0.184721;0.023203;0.982517;,
  -0.192453;0.202238;0.960240;,
  -0.203818;0.036068;0.978344;,
  -0.189290;-0.306866;0.932739;,
  0.969682;-0.109321;0.218552;,
  0.966753;0.141685;0.212872;,
  0.966753;0.141684;-0.212872;,
  0.969682;-0.109323;-0.218551;,
  0.958540;0.185231;0.216543;,
  0.958612;0.195661;-0.206834;,
  0.972959;-0.021266;0.229996;,
  0.977292;0.000000;-0.211899;,
  0.000000;-1.000000;-0.000000;,
  -0.110711;-0.993850;-0.002330;,
  -0.048076;-0.997959;0.042030;,
  -0.051588;-0.997841;0.040643;,
  -0.099455;-0.991616;0.082500;,
  -0.095955;-0.991844;0.083889;,
  0.986433;0.164162;0.000000;,
  0.999174;-0.040636;-0.000000;,
  0.831215;-0.555952;-0.000000;,
  0.595576;-0.803299;-0.000000;,
  -0.747161;-0.664643;0.000000;,
  0.986436;0.164145;0.000000;,
  0.999174;-0.040645;-0.000000;,
  0.831215;-0.555951;-0.000000;,
  0.595579;-0.803297;-0.000000;,
  -0.747170;-0.664633;0.000000;,
  -0.862953;0.505284;0.000000;,
  -0.958407;0.285405;0.000000;,
  -0.954593;-0.297914;0.000000;,
  -0.793560;-0.608492;0.000000;,
  0.355787;0.934567;0.000000;,
  0.399860;-0.916576;-0.000000;;
  96;
  4;0,3,4,1;,
  4;1,4,5,2;,
  4;2,5,15,12;,
  4;3,6,7,4;,
  4;4,7,8,5;,
  4;5,8,18,15;,
  4;6,9,10,7;,
  4;7,10,11,8;,
  4;8,11,21,18;,
  4;65,66,16,13;,
  4;13,16,17,14;,
  4;14,17,27,24;,
  4;66,67,19,16;,
  4;16,19,20,17;,
  4;17,20,30,27;,
  4;67,68,22,19;,
  4;19,22,23,20;,
  4;20,23,33,30;,
  4;69,70,28,25;,
  4;25,28,29,26;,
  4;26,29,39,36;,
  4;70,71,31,28;,
  4;28,31,32,29;,
  4;29,32,42,39;,
  4;71,72,34,31;,
  4;31,34,35,32;,
  4;32,35,45,42;,
  4;73,74,40,37;,
  4;37,40,41,38;,
  4;38,41,75,76;,
  4;74,77,43,40;,
  4;40,43,44,41;,
  4;41,44,78,75;,
  4;77,79,46,43;,
  4;43,46,47,44;,
  4;44,47,80,78;,
  4;48,48,48,48;,
  4;48,48,48,48;,
  4;48,48,48,48;,
  4;48,48,48,48;,
  4;48,48,48,48;,
  4;48,48,48,48;,
  4;48,48,48,48;,
  4;48,48,48,48;,
  4;48,48,48,48;,
  4;81,81,82,49;,
  4;49,82,82,49;,
  4;49,82,81,81;,
  4;81,81,49,50;,
  4;50,49,49,51;,
  4;51,49,81,83;,
  4;81,81,50,84;,
  4;84,50,51,85;,
  4;85,51,83,86;,
  4;52,52,52,52;,
  4;52,52,52,52;,
  4;52,52,52,52;,
  4;53,54,54,53;,
  4;54,55,55,54;,
  4;55,56,56,55;,
  4;57,57,57,57;,
  4;57,57,57,57;,
  4;57,57,57,57;,
  4;87,88,88,87;,
  4;88,89,89,88;,
  4;89,90,90,89;,
  4;48,48,48,48;,
  4;91,91,91,91;,
  4;52,52,52,52;,
  4;52,52,52,52;,
  4;52,52,52,52;,
  4;53,58,58,53;,
  4;58,59,59,58;,
  4;59,60,60,59;,
  4;57,57,57,57;,
  4;57,57,57,57;,
  4;57,57,57,57;,
  4;92,93,93,92;,
  4;93,94,94,93;,
  4;94,95,95,94;,
  4;48,48,48,48;,
  4;96,96,96,96;,
  4;52,52,52,52;,
  4;52,52,52,52;,
  4;52,52,52,52;,
  4;61,61,62,62;,
  4;62,62,63,63;,
  4;63,63,64,64;,
  4;57,57,57,57;,
  4;57,57,57,57;,
  4;57,57,57,57;,
  4;97,97,98,98;,
  4;98,98,99,99;,
  4;99,99,100,100;,
  4;101,101,101,101;,
  4;102,102,102,102;;
 }
 MeshTextureCoords {
  200;
  0.000000;0.000000;,
  0.000000;0.333330;,
  0.333330;0.333330;,
  0.333330;0.000000;,
  0.666670;0.333330;,
  0.666670;0.000000;,
  1.000000;0.333330;,
  1.000000;0.000000;,
  0.000000;0.666670;,
  0.333330;0.666670;,
  0.666670;0.666670;,
  1.000000;0.666670;,
  0.000000;1.000000;,
  0.333330;1.000000;,
  0.666670;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.333330;,
  0.333330;0.333330;,
  0.333330;0.000000;,
  0.666670;0.333330;,
  0.666670;0.000000;,
  1.000000;0.333330;,
  1.000000;0.000000;,
  0.000000;0.666670;,
  0.333330;0.666670;,
  0.666670;0.666670;,
  1.000000;0.666670;,
  0.000000;1.000000;,
  0.333330;1.000000;,
  0.666670;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.333330;,
  0.333330;0.333330;,
  0.333330;0.000000;,
  0.666670;0.333330;,
  0.666670;0.000000;,
  1.000000;0.333330;,
  1.000000;0.000000;,
  0.000000;0.666670;,
  0.333330;0.666670;,
  0.666670;0.666670;,
  1.000000;0.666670;,
  0.000000;1.000000;,
  0.333330;1.000000;,
  0.666670;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.333330;,
  0.333330;0.333330;,
  0.333330;0.000000;,
  0.666670;0.333330;,
  0.666670;0.000000;,
  1.000000;0.333330;,
  1.000000;0.000000;,
  0.000000;0.666670;,
  0.333330;0.666670;,
  0.666670;0.666670;,
  1.000000;0.666670;,
  0.000000;1.000000;,
  0.333330;1.000000;,
  0.666670;1.000000;,
  1.000000;1.000000;,
  0.000000;0.333330;,
  0.333330;0.333330;,
  0.333330;0.000000;,
  0.666670;0.333330;,
  0.666670;0.000000;,
  1.000000;0.333330;,
  0.000000;0.666670;,
  0.333330;0.666670;,
  0.666670;0.666670;,
  1.000000;0.666670;,
  0.000000;1.000000;,
  0.333330;1.000000;,
  0.666670;1.000000;,
  1.000000;1.000000;,
  0.000000;0.666670;,
  0.333330;1.000000;,
  0.333330;0.666670;,
  0.666670;1.000000;,
  0.666670;0.666670;,
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
  0.000000;0.333330;,
  1.000000;0.333330;,
  1.000000;0.000000;,
  0.000000;0.666670;,
  1.000000;0.666670;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.333330;,
  1.000000;0.333330;,
  1.000000;0.000000;,
  0.000000;0.666670;,
  1.000000;0.666670;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.333330;,
  1.000000;0.333330;,
  1.000000;0.000000;,
  0.000000;0.666670;,
  1.000000;0.666670;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.333330;,
  1.000000;0.333330;,
  1.000000;0.000000;,
  0.000000;0.666670;,
  1.000000;0.666670;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.333330;,
  1.000000;0.333330;,
  1.000000;0.000000;,
  0.000000;0.666670;,
  1.000000;0.666670;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.333330;,
  1.000000;0.333330;,
  1.000000;0.000000;,
  0.000000;0.666670;,
  1.000000;0.666670;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.333330;,
  1.000000;0.333330;,
  1.000000;0.000000;,
  0.000000;0.666670;,
  1.000000;0.666670;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.333330;,
  1.000000;0.333330;,
  1.000000;0.000000;,
  0.000000;0.666670;,
  1.000000;0.666670;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
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
  1.000000;0.000000;,
  1.000000;0.333330;,
  0.000000;0.333330;,
  1.000000;0.666670;,
  0.000000;0.666670;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;0.333330;,
  0.000000;0.333330;,
  1.000000;0.666670;,
  0.000000;0.666670;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;0.333330;,
  0.000000;0.333330;,
  1.000000;0.666670;,
  0.000000;0.666670;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;;
 }
}
