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
 92;
 5.44900;0.00000;-7.42500;,
 5.44900;-3.71250;-6.43026;,
 -5.44100;-3.71250;-6.43026;,
 -5.44100;0.00000;-7.42500;,
 5.44900;-6.43020;-3.71250;,
 -5.44100;-6.43020;-3.71250;,
 5.44900;-7.42500;-0.00000;,
 -5.44100;-7.42500;0.00000;,
 5.44900;-6.43020;3.71250;,
 -5.44100;-6.43020;3.71250;,
 5.44900;-3.71250;6.43026;,
 -5.44100;-3.71250;6.43026;,
 5.44900;0.00000;7.42500;,
 -5.44100;0.00000;7.42500;,
 5.44900;3.71250;6.43026;,
 -5.44100;3.71250;6.43026;,
 5.44900;6.43027;3.71250;,
 -5.44100;6.43027;3.71250;,
 5.44900;7.42500;0.00000;,
 -5.44100;7.42500;0.00000;,
 5.44900;6.43027;-3.71250;,
 -5.44100;6.43027;-3.71250;,
 5.44900;3.71250;-6.43026;,
 -5.44100;3.71250;-6.43026;,
 5.44900;0.00000;-7.42500;,
 -5.44100;0.00000;-7.42500;,
 5.44900;0.00000;0.00000;,
 5.44900;0.00000;0.00000;,
 5.44900;0.00000;0.00000;,
 5.44900;0.00000;0.00000;,
 5.44900;0.00000;0.00000;,
 5.44900;0.00000;0.00000;,
 5.44900;0.00000;0.00000;,
 5.44900;0.00000;0.00000;,
 5.44900;0.00000;0.00000;,
 5.44900;0.00000;0.00000;,
 5.44900;0.00000;0.00000;,
 5.44900;0.00000;0.00000;,
 -5.44100;0.00000;0.00000;,
 -5.44100;0.00000;0.00000;,
 -5.44100;0.00000;0.00000;,
 -5.44100;0.00000;0.00000;,
 -5.44100;0.00000;0.00000;,
 -5.44100;0.00000;0.00000;,
 -5.44100;0.00000;0.00000;,
 -5.44100;0.00000;0.00000;,
 -5.44100;0.00000;0.00000;,
 -5.44100;0.00000;0.00000;,
 -5.44100;0.00000;0.00000;,
 -5.44100;0.00000;0.00000;,
 -2.88440;-0.68646;2.56500;,
 2.24560;-0.68646;2.56500;,
 2.24560;-0.68646;-2.56500;,
 -2.88440;-0.68646;-2.56500;,
 -2.88440;-3.37968;-5.13000;,
 2.24560;-3.37968;-5.13000;,
 2.24560;-19.53918;-5.13000;,
 -2.88440;-19.53918;-5.13000;,
 -2.88440;-22.23246;-2.56500;,
 2.24560;-22.23246;-2.56500;,
 2.24560;-22.23246;2.56500;,
 -2.88440;-22.23246;2.56500;,
 -2.88440;-19.53918;5.13000;,
 2.24560;-19.53918;5.13000;,
 2.24560;-3.37968;5.13000;,
 -2.88440;-3.37968;5.13000;,
 4.81060;-3.37968;2.56500;,
 4.81060;-19.53918;2.56500;,
 4.81060;-19.53918;-2.56500;,
 4.81060;-3.37968;-2.56500;,
 -5.44940;-19.53918;2.56500;,
 -5.44940;-3.37968;2.56500;,
 -5.44940;-3.37968;-2.56500;,
 -5.44940;-19.53918;-2.56500;,
 -2.88440;-0.68646;-2.56500;,
 2.24560;-0.68646;-2.56500;,
 2.24560;-3.37968;-5.13000;,
 -2.88440;-19.53918;-5.13000;,
 2.24560;-19.53918;-5.13000;,
 2.24560;-22.23246;-2.56500;,
 -2.88440;-3.37968;5.13000;,
 2.24560;-3.37968;5.13000;,
 2.24560;-0.68646;2.56500;,
 -2.88440;-22.23246;2.56500;,
 2.24560;-22.23246;2.56500;,
 2.24560;-19.53918;5.13000;,
 4.81060;-3.37968;-2.56500;,
 4.81060;-19.53918;-2.56500;,
 4.81060;-19.53918;2.56500;,
 -5.44940;-3.37968;-2.56500;,
 -5.44940;-3.37968;2.56500;,
 -5.44940;-19.53918;-2.56500;;
 
 62;
 4;0,1,2,3;,
 4;1,4,5,2;,
 4;4,6,7,5;,
 4;6,8,9,7;,
 4;8,10,11,9;,
 4;10,12,13,11;,
 4;12,14,15,13;,
 4;14,16,17,15;,
 4;16,18,19,17;,
 4;18,20,21,19;,
 4;20,22,23,21;,
 4;22,24,25,23;,
 3;26,1,0;,
 3;27,4,1;,
 3;28,6,4;,
 3;29,8,6;,
 3;30,10,8;,
 3;31,12,10;,
 3;32,14,12;,
 3;33,16,14;,
 3;34,18,16;,
 3;35,20,18;,
 3;36,22,20;,
 3;37,24,22;,
 3;38,3,2;,
 3;39,2,5;,
 3;40,5,7;,
 3;41,7,9;,
 3;42,9,11;,
 3;43,11,13;,
 3;44,13,15;,
 3;45,15,17;,
 3;46,17,19;,
 3;47,19,21;,
 3;48,21,23;,
 3;49,23,25;,
 4;50,51,52,53;,
 4;54,55,56,57;,
 4;58,59,60,61;,
 4;62,63,64,65;,
 4;66,67,68,69;,
 4;70,71,72,73;,
 4;74,75,76,54;,
 4;77,78,79,58;,
 4;80,81,82,50;,
 4;83,84,85,62;,
 4;75,82,66,86;,
 4;84,79,87,88;,
 4;50,74,89,90;,
 4;58,83,70,91;,
 4;78,76,86,87;,
 4;81,85,88,66;,
 4;54,77,91,89;,
 4;62,80,90,70;,
 3;75,86,76;,
 3;54,89,74;,
 3;78,87,79;,
 3;81,66,82;,
 3;58,91,77;,
 3;84,88,85;,
 3;50,90,80;,
 3;62,70,83;;
 
 MeshMaterialList {
  14;
  62;
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
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
   0.044000;0.232000;0.432800;1.000000;;
   12.000000;
   0.120000;0.120000;0.120000;;
   0.006600;0.034800;0.064920;;
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
 }
 MeshNormals {
  38;
  1.000000;0.000000;0.000000;,
  0.000000;-0.000000;-1.000000;,
  0.000000;-0.500002;-0.866024;,
  0.000000;-0.866026;-0.499999;,
  0.000000;-1.000000;-0.000000;,
  0.000000;-0.866026;0.499999;,
  0.000000;-0.500002;0.866024;,
  0.000000;-0.000000;1.000000;,
  0.000000;0.499997;0.866027;,
  0.000000;0.866027;0.499997;,
  0.000000;1.000000;0.000000;,
  0.000000;0.866027;-0.499997;,
  0.000000;0.499997;-0.866027;,
  -1.000000;0.000000;0.000000;,
  -0.377301;0.845747;0.377301;,
  0.377301;0.845747;0.377301;,
  -0.377301;0.845747;-0.377301;,
  0.377301;0.845747;-0.377301;,
  -0.368278;0.355362;-0.859121;,
  0.368278;0.355362;-0.859121;,
  -0.368279;-0.355357;-0.859123;,
  0.368279;-0.355357;-0.859123;,
  -0.377304;-0.845744;-0.377304;,
  0.377304;-0.845744;-0.377304;,
  -0.377304;-0.845744;0.377304;,
  0.377304;-0.845744;0.377304;,
  -0.368279;-0.355357;0.859123;,
  0.368279;-0.355357;0.859123;,
  -0.368278;0.355362;0.859121;,
  0.368278;0.355362;0.859121;,
  0.859121;0.355362;0.368278;,
  0.859123;-0.355357;0.368279;,
  0.859121;0.355362;-0.368278;,
  0.859123;-0.355357;-0.368279;,
  -0.859123;-0.355357;0.368279;,
  -0.859121;0.355362;0.368278;,
  -0.859123;-0.355357;-0.368279;,
  -0.859121;0.355362;-0.368278;;
  62;
  4;1,2,2,1;,
  4;2,3,3,2;,
  4;3,4,4,3;,
  4;4,5,5,4;,
  4;5,6,6,5;,
  4;6,7,7,6;,
  4;7,8,8,7;,
  4;8,9,9,8;,
  4;9,10,10,9;,
  4;10,11,11,10;,
  4;11,12,12,11;,
  4;12,1,1,12;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;13,13,13;,
  3;13,13,13;,
  3;13,13,13;,
  3;13,13,13;,
  3;13,13,13;,
  3;13,13,13;,
  3;13,13,13;,
  3;13,13,13;,
  3;13,13,13;,
  3;13,13,13;,
  3;13,13,13;,
  3;13,13,13;,
  4;14,15,17,16;,
  4;18,19,21,20;,
  4;22,23,25,24;,
  4;26,27,29,28;,
  4;30,31,33,32;,
  4;34,35,37,36;,
  4;16,17,19,18;,
  4;20,21,23,22;,
  4;28,29,15,14;,
  4;24,25,27,26;,
  4;17,15,30,32;,
  4;25,23,33,31;,
  4;14,16,37,35;,
  4;22,24,34,36;,
  4;21,19,32,33;,
  4;29,27,31,30;,
  4;18,20,36,37;,
  4;26,28,35,34;,
  3;17,32,19;,
  3;18,37,16;,
  3;21,33,23;,
  3;29,30,15;,
  3;22,36,20;,
  3;25,31,27;,
  3;14,35,28;,
  3;26,34,24;;
 }
 MeshTextureCoords {
  92;
  0.000000;0.000000;,
  0.083330;0.000000;,
  0.083330;1.000000;,
  0.000000;1.000000;,
  0.166670;0.000000;,
  0.166670;1.000000;,
  0.250000;0.000000;,
  0.250000;1.000000;,
  0.333330;0.000000;,
  0.333330;1.000000;,
  0.416670;0.000000;,
  0.416670;1.000000;,
  0.500000;0.000000;,
  0.500000;1.000000;,
  0.583330;0.000000;,
  0.583330;1.000000;,
  0.666670;0.000000;,
  0.666670;1.000000;,
  0.750000;0.000000;,
  0.750000;1.000000;,
  0.833330;0.000000;,
  0.833330;1.000000;,
  0.916670;0.000000;,
  0.916670;1.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.041670;0.000000;,
  0.125000;0.000000;,
  0.208330;0.000000;,
  0.291670;0.000000;,
  0.375000;0.000000;,
  0.458330;0.000000;,
  0.541670;0.000000;,
  0.625000;0.000000;,
  0.708330;0.000000;,
  0.791670;0.000000;,
  0.875000;0.000000;,
  0.958330;0.000000;,
  0.041670;1.000000;,
  0.125000;1.000000;,
  0.208330;1.000000;,
  0.291670;1.000000;,
  0.375000;1.000000;,
  0.458330;1.000000;,
  0.541670;1.000000;,
  0.625000;1.000000;,
  0.708330;1.000000;,
  0.791670;1.000000;,
  0.875000;1.000000;,
  0.958330;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
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
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;;
 }
}
