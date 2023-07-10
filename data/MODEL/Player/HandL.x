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
 1.26100;0.00000;-1.29800;,
 1.17952;-0.69469;-1.36437;,
 0.40426;-0.69469;-1.53018;,
 0.55958;0.00000;-1.45574;,
 -0.37100;-0.69469;-1.53018;,
 -0.57301;0.00000;-1.45574;,
 -1.14626;-0.69469;-1.36437;,
 -1.54436;0.00000;-1.29800;,
 1.50982;-1.64989;-1.70540;,
 0.54075;-1.64989;-1.91266;,
 -0.42832;-1.64989;-1.91266;,
 -1.39741;-1.64989;-1.70540;,
 1.50982;-2.51826;-1.70540;,
 0.54075;-2.51826;-1.91266;,
 -0.42832;-2.51826;-1.91266;,
 -1.20739;-2.32934;-1.70540;,
 -1.54436;0.00000;-1.29800;,
 -1.14626;-0.69469;-1.36437;,
 -1.32849;-0.69469;-0.45495;,
 -1.79084;0.00000;-0.43283;,
 -1.32849;-0.69469;0.45448;,
 -1.79084;0.00000;0.43235;,
 -1.14626;-0.69469;1.36389;,
 -1.54436;0.00000;1.29752;,
 -1.39741;-1.64989;-1.70540;,
 -1.62017;-1.64989;-0.56862;,
 -1.62017;-1.64989;0.56814;,
 -1.39741;-1.64989;1.70493;,
 -1.20739;-2.32934;-1.70540;,
 -1.39946;-2.32934;-0.56862;,
 -1.39946;-2.32934;0.56814;,
 -1.20739;-2.32934;1.53054;,
 -1.54436;0.00000;1.29752;,
 -1.14626;-0.69469;1.36389;,
 -0.37100;-0.69469;1.52971;,
 -0.57301;0.00000;1.45526;,
 0.40426;-0.69469;1.52971;,
 0.55958;0.00000;1.45526;,
 1.17952;-0.69469;1.36389;,
 1.26100;0.00000;1.29752;,
 -1.39741;-1.64989;1.70493;,
 -0.42832;-1.64989;1.91218;,
 0.54075;-1.64989;1.91218;,
 1.50982;-1.64989;1.70493;,
 -1.20739;-2.32934;1.53054;,
 -0.23830;-2.32934;1.71659;,
 0.54075;-2.51826;1.71659;,
 1.50982;-2.51826;1.53054;,
 1.26100;0.00000;1.29752;,
 1.17952;-0.69469;1.36389;,
 1.37269;-0.69469;0.45448;,
 1.46732;0.00000;0.43235;,
 1.37269;-0.69469;-0.45495;,
 1.46732;0.00000;-0.43283;,
 1.17952;-0.69469;-1.36437;,
 1.26100;0.00000;-1.29800;,
 1.50982;-1.64989;1.70493;,
 1.75630;-1.64989;0.56814;,
 1.75630;-1.64989;-0.56862;,
 1.50982;-1.64989;-1.70540;,
 1.50982;-2.51826;1.53054;,
 1.75630;-2.51826;0.56814;,
 1.75630;-2.51826;-0.56862;,
 1.50982;-2.51826;-1.70540;,
 1.46732;0.00000;0.43235;,
 0.65266;0.00000;0.48494;,
 0.55958;0.00000;1.45526;,
 -0.66271;0.00000;0.48494;,
 -0.57301;0.00000;1.45526;,
 -1.79084;0.00000;0.43235;,
 1.46732;0.00000;-0.43283;,
 0.65266;0.00000;-0.48541;,
 -0.66271;0.00000;-0.48541;,
 -1.79084;0.00000;-0.43283;,
 1.26100;0.00000;-1.29800;,
 0.55958;0.00000;-1.45574;,
 -0.57301;0.00000;-1.45574;,
 -1.54436;0.00000;-1.29800;,
 1.75630;-2.51826;0.56814;,
 0.54075;-2.51826;1.71659;,
 0.63080;-2.51826;0.63724;,
 -0.23830;-2.32934;1.71659;,
 -0.27397;-2.32934;0.63724;,
 -1.39946;-2.32934;0.56814;,
 1.75630;-2.51826;-0.56862;,
 0.63080;-2.51826;-0.63772;,
 -0.27397;-2.32934;-0.63772;,
 -1.39946;-2.32934;-0.56862;,
 1.50982;-2.51826;-1.70540;,
 0.54075;-2.51826;-1.91266;,
 -0.42832;-2.51826;-1.91266;,
 -1.20739;-2.32934;-1.70540;,
 1.57030;-1.20833;-1.57509;,
 1.79016;-2.52945;-1.57509;,
 0.59067;-2.72413;-1.57509;,
 0.59067;-1.20833;-1.57509;,
 1.44409;-3.90657;-1.57509;,
 0.57052;-3.04181;-1.57509;,
 0.33889;-4.72598;-1.57509;,
 -0.05473;-4.28349;-1.57509;,
 0.59067;-1.20833;-1.57509;,
 0.59067;-2.72413;-1.57509;,
 0.59067;-2.72413;-0.33072;,
 0.59067;-1.20833;-0.33072;,
 0.57052;-3.04181;-1.57509;,
 0.57052;-3.04181;-0.33072;,
 -0.05473;-4.28349;-1.57509;,
 -0.05473;-4.28349;-0.33072;,
 0.59067;-1.20833;-0.33072;,
 0.59067;-2.72413;-0.33072;,
 1.79016;-2.52945;-0.33072;,
 1.57030;-1.20833;-0.33072;,
 0.57052;-3.04181;-0.33072;,
 1.44409;-3.90657;-0.33072;,
 -0.05473;-4.28349;-0.33072;,
 0.33889;-4.72598;-0.33072;,
 1.57030;-1.20833;-0.33072;,
 1.79016;-2.52945;-0.33072;,
 1.79016;-2.52945;-1.57509;,
 1.57030;-1.20833;-1.57509;,
 1.44409;-3.90657;-0.33072;,
 1.44409;-3.90657;-1.57509;,
 0.33889;-4.72598;-0.33072;,
 0.33889;-4.72598;-1.57509;,
 1.57030;-1.20833;-1.57509;,
 0.59067;-1.20833;-1.57509;,
 0.33889;-4.72598;-1.57509;,
 -0.05473;-4.28349;-1.57509;,
 1.44350;-0.98977;0.05449;,
 1.66334;-2.31091;0.05449;,
 0.46388;-2.50556;0.05449;,
 0.46388;-0.98977;0.05449;,
 1.31727;-3.68802;0.05449;,
 0.44373;-2.82327;0.05449;,
 0.21209;-4.50742;0.05449;,
 -0.18152;-4.06493;0.05449;,
 0.46388;-0.98977;0.05449;,
 0.46388;-2.50556;0.05449;,
 0.46388;-2.50556;1.29888;,
 0.46388;-0.98977;1.29888;,
 0.44373;-2.82327;0.05449;,
 0.44373;-2.82327;1.29888;,
 -0.18152;-4.06493;0.05449;,
 -0.18152;-4.06493;1.29888;,
 0.46388;-0.98977;1.29888;,
 0.46388;-2.50556;1.29888;,
 1.66334;-2.31091;1.29888;,
 1.44350;-0.98977;1.29888;,
 0.44373;-2.82327;1.29888;,
 1.31727;-3.68802;1.29888;,
 -0.18152;-4.06493;1.29888;,
 0.21209;-4.50742;1.29888;,
 1.44350;-0.98977;1.29888;,
 1.66334;-2.31091;1.29888;,
 1.66334;-2.31091;0.05449;,
 1.44350;-0.98977;0.05449;,
 1.31727;-3.68802;1.29888;,
 1.31727;-3.68802;0.05449;,
 0.21209;-4.50742;1.29888;,
 0.21209;-4.50742;0.05449;,
 1.44350;-0.98977;0.05449;,
 0.46388;-0.98977;0.05449;,
 0.21209;-4.50742;0.05449;,
 -0.18152;-4.06493;0.05449;,
 -1.15819;-1.51790;-1.08340;,
 -0.39559;-1.80822;-1.08340;,
 -0.74740;-2.81918;-1.08340;,
 -1.63597;-2.33388;-1.08340;,
 -0.80546;-3.03703;-1.08340;,
 -1.68619;-3.35491;-1.08340;,
 -0.60689;-4.05044;-1.08340;,
 -1.01601;-4.22892;-1.08340;,
 -0.39559;-1.80822;-1.08340;,
 -0.39559;-1.80822;-0.08789;,
 -0.74740;-2.81918;-0.08789;,
 -0.74740;-2.81918;-1.08340;,
 -0.80546;-3.03703;-0.08789;,
 -0.80546;-3.03703;-1.08340;,
 -0.60689;-4.05044;-0.08789;,
 -0.60689;-4.05044;-1.08340;,
 -0.39559;-1.80822;-0.08789;,
 -1.15819;-1.51790;-0.08789;,
 -1.63597;-2.33388;-0.08789;,
 -0.74740;-2.81918;-0.08789;,
 -1.68619;-3.35491;-0.08789;,
 -0.80546;-3.03703;-0.08789;,
 -1.01601;-4.22892;-0.08789;,
 -0.60689;-4.05044;-0.08789;,
 -1.15819;-1.51790;-0.08789;,
 -1.15819;-1.51790;-1.08340;,
 -1.63597;-2.33388;-1.08340;,
 -1.63597;-2.33388;-0.08789;,
 -1.68619;-3.35491;-1.08340;,
 -1.68619;-3.35491;-0.08789;,
 -1.01601;-4.22892;-1.08340;,
 -1.01601;-4.22892;-0.08789;,
 -0.39559;-1.80822;-1.08340;,
 -1.15819;-1.51790;-1.08340;,
 -1.01601;-4.22892;-1.08340;,
 -0.60689;-4.05044;-1.08340;;
 
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
   0.056471;0.291765;0.545882;1.000000;;
   12.000000;
   0.120000;0.120000;0.120000;;
   0.008471;0.043765;0.081882;;
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
  0.213859;0.062629;-0.974855;,
  0.107577;0.085101;-0.990548;,
  -0.092838;0.065210;-0.993543;,
  0.206201;0.228722;-0.951403;,
  0.103412;0.236350;-0.966149;,
  -0.096355;0.222967;-0.970052;,
  0.204998;0.198109;-0.958503;,
  0.102958;0.194733;-0.975438;,
  -0.109563;0.184014;-0.976798;,
  0.209141;0.000000;-0.977885;,
  0.105154;0.000000;-0.994456;,
  -0.117377;-0.014712;-0.992979;,
  -0.184718;0.023199;-0.982518;,
  -0.839982;-0.532988;-0.101748;,
  -0.839982;-0.532988;0.101748;,
  -0.192451;0.202236;-0.960241;,
  -0.986060;-0.127206;-0.107261;,
  -0.986060;-0.127206;0.107261;,
  -0.218164;0.176498;-0.959819;,
  -0.995580;0.001871;-0.093898;,
  -0.995233;-0.003646;0.097453;,
  -0.233105;-0.029217;-0.972012;,
  -0.950647;-0.298028;-0.086305;,
  -0.946625;-0.308701;0.092758;,
  -0.838371;-0.506134;0.202391;,
  -0.092838;0.065210;0.993543;,
  0.107577;0.085101;0.990548;,
  -0.971193;-0.108163;0.212334;,
  -0.096355;0.222966;0.970052;,
  0.103412;0.236350;0.966149;,
  -0.980961;0.001609;0.194196;,
  -0.108900;0.050834;0.992752;,
  0.095259;0.081211;0.992134;,
  -0.934007;-0.305795;0.184716;,
  -0.108384;-0.278633;0.954262;,
  0.084547;-0.227728;0.970047;,
  0.213859;0.062629;0.974855;,
  0.986310;-0.122899;0.109948;,
  0.986310;-0.122899;-0.109948;,
  0.206201;0.228722;0.951403;,
  0.985294;0.133091;0.107153;,
  0.985294;0.133091;-0.107153;,
  0.202887;0.096394;0.974446;,
  0.976010;0.188632;0.108734;,
  0.975527;0.193772;-0.103920;,
  0.194639;-0.204323;0.959358;,
  0.993217;-0.010706;0.115784;,
  0.994307;0.000000;-0.106556;,
  0.000000;1.000000;0.000000;,
  -0.106724;-0.994288;-0.001165;,
  -0.077165;-0.996810;0.020364;,
  -0.101179;-0.994007;0.041394;,
  0.000000;0.000000;-1.000000;,
  -1.000000;0.000000;0.000000;,
  -0.999499;0.031665;0.000000;,
  -0.965115;0.261825;0.000000;,
  -0.893155;0.449750;0.000000;,
  0.000000;-0.000000;1.000000;,
  -0.999499;0.031663;0.000000;,
  -0.965115;0.261828;0.000000;,
  -0.893151;0.449758;0.000000;,
  0.944447;-0.328665;-0.000000;,
  0.956025;-0.293287;-0.000000;,
  0.999440;-0.033469;-0.000000;,
  0.981340;0.192282;0.000000;,
  -0.838371;-0.506134;-0.202391;,
  -0.971193;-0.108163;-0.212334;,
  -0.982309;0.012567;-0.186847;,
  -0.943020;-0.284857;-0.171957;,
  -0.184718;0.023199;0.982518;,
  -0.192451;0.202236;0.960241;,
  -0.203821;0.036066;0.978344;,
  -0.189296;-0.306869;0.932737;,
  0.969683;-0.109320;0.218548;,
  0.966754;0.141682;0.212869;,
  0.966754;0.141682;-0.212869;,
  0.969683;-0.109320;-0.218548;,
  0.958540;0.185228;0.216543;,
  0.958613;0.195658;-0.206833;,
  0.972959;-0.021267;0.229998;,
  0.977292;0.000000;-0.211899;,
  0.000000;-1.000000;-0.000000;,
  -0.110709;-0.993850;-0.002331;,
  -0.048075;-0.997959;0.042030;,
  -0.051587;-0.997841;0.040643;,
  -0.099454;-0.991616;0.082499;,
  -0.095954;-0.991845;0.083888;,
  0.986433;0.164163;0.000000;,
  0.999174;-0.040637;-0.000000;,
  0.831215;-0.555951;-0.000000;,
  0.595580;-0.803296;-0.000000;,
  -0.747168;-0.664635;0.000000;,
  0.986436;0.164146;0.000000;,
  0.999174;-0.040646;-0.000000;,
  0.831215;-0.555952;-0.000000;,
  0.595579;-0.803297;-0.000000;,
  -0.747165;-0.664639;0.000000;,
  -0.862951;0.505287;0.000000;,
  -0.958408;0.285402;0.000000;,
  -0.954592;-0.297917;0.000000;,
  -0.793561;-0.608490;0.000000;,
  0.355781;0.934569;0.000000;,
  0.399850;-0.916580;-0.000000;;
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