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
 63;
 0.00000;0.00000;-4.00504;,
 2.45793;0.00000;-3.47091;,
 4.69456;-5.49259;-4.18385;,
 0.00000;-5.49259;-5.55390;,
 4.25726;0.00000;-2.44240;,
 5.90919;-5.49259;-3.12772;,
 4.91587;0.00000;-0.44900;,
 6.82335;-5.49259;-0.03722;,
 4.25726;0.00000;2.45363;,
 5.90919;-5.49259;3.04456;,
 2.45793;0.00000;3.91290;,
 4.69456;-5.49259;4.88594;,
 0.00000;0.00000;4.44703;,
 0.00000;-5.49259;5.55360;,
 -2.45793;0.00000;3.91290;,
 -4.69456;-5.49259;4.88594;,
 -4.25726;0.00000;2.45363;,
 -5.90919;-5.49259;3.04456;,
 -4.91587;0.00000;-0.44900;,
 -6.82335;-5.49259;-0.03722;,
 -4.25726;0.00000;-2.44240;,
 -5.90919;-5.49259;-3.12772;,
 -2.45793;0.00000;-3.47091;,
 -4.69456;-5.49259;-4.18385;,
 0.00000;0.00000;-4.00504;,
 0.00000;-5.49259;-5.55390;,
 2.67320;-11.18670;-4.81823;,
 0.00543;-11.58700;-5.06910;,
 4.63012;-9.90253;-2.94721;,
 5.34640;-9.90253;-0.39135;,
 4.63012;-9.90253;2.16451;,
 2.67320;-11.18670;4.03553;,
 0.00000;-11.18670;4.72037;,
 -2.67320;-11.18670;4.03553;,
 -4.63012;-9.90253;2.16451;,
 -5.34640;-9.90253;-0.39134;,
 -4.63012;-9.90253;-2.94721;,
 -2.67320;-11.18670;-4.81823;,
 0.00543;-11.58700;-5.06910;,
 0.00000;0.00000;-0.44900;,
 0.00000;0.00000;-0.44900;,
 0.00000;0.00000;-0.44900;,
 0.00000;0.00000;-0.44900;,
 0.00000;0.00000;-0.44900;,
 0.00000;0.00000;-0.44900;,
 0.00000;0.00000;-0.44900;,
 0.00000;0.00000;-0.44900;,
 0.00000;0.00000;-0.44900;,
 0.00000;0.00000;-0.44900;,
 0.00000;0.00000;-0.44900;,
 0.00000;0.00000;-0.44900;,
 0.00000;-11.53919;-0.39135;,
 0.00000;-11.53919;-0.39135;,
 0.00000;-11.53919;-0.39135;,
 0.00000;-11.53919;-0.39135;,
 0.00000;-11.53919;-0.39135;,
 0.00000;-11.53919;-0.39135;,
 0.00000;-11.53919;-0.39135;,
 0.00000;-11.53919;-0.39135;,
 0.00000;-11.53919;-0.39135;,
 0.00000;-11.53919;-0.39135;,
 0.00000;-11.53919;-0.39135;,
 0.00000;-11.53919;-0.39135;;
 
 48;
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
 4;3,2,26,27;,
 4;2,5,28,26;,
 4;5,7,29,28;,
 4;7,9,30,29;,
 4;9,11,31,30;,
 4;11,13,32,31;,
 4;13,15,33,32;,
 4;15,17,34,33;,
 4;17,19,35,34;,
 4;19,21,36,35;,
 4;21,23,37,36;,
 4;23,25,38,37;,
 3;39,1,0;,
 3;40,4,1;,
 3;41,6,4;,
 3;42,8,6;,
 3;43,10,8;,
 3;44,12,10;,
 3;45,14,12;,
 3;46,16,14;,
 3;47,18,16;,
 3;48,20,18;,
 3;49,22,20;,
 3;50,24,22;,
 3;51,27,26;,
 3;52,26,28;,
 3;53,28,29;,
 3;54,29,30;,
 3;55,30,31;,
 3;56,31,32;,
 3;57,32,33;,
 3;58,33,34;,
 3;59,34,35;,
 3;60,35,36;,
 3;61,36,37;,
 3;62,37,38;;
 
 MeshMaterialList {
  22;
  48;
  11,
  9,
  2,
  9,
  0,
  11,
  11,
  0,
  9,
  2,
  9,
  11,
  11,
  0,
  2,
  9,
  0,
  11,
  11,
  0,
  9,
  2,
  0,
  11,
  11,
  11,
  11,
  11,
  11,
  11,
  11,
  11,
  11,
  11,
  11,
  11,
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
  2;;
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
   0.050400;0.266400;0.496000;1.000000;;
   12.000000;
   0.120000;0.120000;0.120000;;
   0.007560;0.039960;0.074400;;
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
  45;
  0.000000;1.000000;0.000000;,
  0.000000;0.256510;-0.966542;,
  0.402872;0.274595;-0.873093;,
  0.768317;0.312163;-0.558788;,
  0.946218;0.322696;-0.023189;,
  0.829123;0.335896;0.446911;,
  0.459889;0.287497;0.840148;,
  0.000000;0.213291;0.976989;,
  -0.459889;0.287497;0.840148;,
  -0.829123;0.335896;0.446911;,
  -0.946218;0.322696;-0.023189;,
  -0.768317;0.312163;-0.558788;,
  -0.402872;0.274595;-0.873093;,
  0.000050;0.110434;-0.993883;,
  0.442347;0.079167;-0.893343;,
  0.835442;0.029341;-0.548794;,
  0.999901;0.005174;-0.013070;,
  0.892289;-0.002268;0.451459;,
  0.510290;0.010039;0.859944;,
  0.000000;0.022054;0.999757;,
  -0.510290;0.010039;0.859944;,
  -0.892289;-0.002268;0.451459;,
  -0.999901;0.005174;-0.013070;,
  -0.835443;0.029341;-0.548794;,
  -0.442303;0.079143;-0.893367;,
  0.000099;-0.036548;-0.999332;,
  0.464448;-0.125782;-0.876622;,
  0.731741;-0.552634;-0.398938;,
  0.693380;-0.720572;-0.000879;,
  0.675877;-0.709864;0.198198;,
  0.519649;-0.274252;0.809167;,
  0.000000;-0.170708;0.985322;,
  -0.519649;-0.274252;0.809167;,
  -0.675877;-0.709864;0.198199;,
  -0.693380;-0.720572;-0.000878;,
  -0.682422;-0.685800;-0.252938;,
  -0.464358;-0.125836;-0.876663;,
  0.000049;-0.999903;0.013895;,
  0.000280;-0.999948;0.010221;,
  0.284780;-0.953772;0.096022;,
  0.414304;-0.892337;0.179128;,
  0.222449;-0.973287;-0.056830;,
  0.000000;-0.997631;0.068794;,
  -0.222449;-0.973287;-0.056830;,
  -0.284515;-0.953867;0.095855;;
  48;
  4;1,2,14,13;,
  4;2,3,15,14;,
  4;3,4,16,15;,
  4;4,5,17,16;,
  4;5,6,18,17;,
  4;6,7,19,18;,
  4;7,8,20,19;,
  4;8,9,21,20;,
  4;9,10,22,21;,
  4;10,11,23,22;,
  4;11,12,24,23;,
  4;12,1,13,24;,
  4;13,14,26,25;,
  4;14,15,27,26;,
  4;15,16,28,27;,
  4;16,17,29,28;,
  4;17,18,30,29;,
  4;18,19,31,30;,
  4;19,20,32,31;,
  4;20,21,33,32;,
  4;21,22,34,33;,
  4;22,23,35,34;,
  4;23,24,36,35;,
  4;24,13,25,36;,
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
  3;37,38,39;,
  3;37,39,40;,
  3;37,27,28;,
  3;37,28,29;,
  3;37,29,41;,
  3;37,41,42;,
  3;37,42,43;,
  3;37,43,33;,
  3;37,33,34;,
  3;37,34,35;,
  3;37,35,44;,
  3;37,44,38;;
 }
 MeshTextureCoords {
  63;
  0.000000;0.000000;,
  0.083330;0.000000;,
  0.083330;0.500000;,
  0.000000;0.500000;,
  0.166670;0.000000;,
  0.166670;0.500000;,
  0.250000;0.000000;,
  0.250000;0.500000;,
  0.333330;0.000000;,
  0.333330;0.500000;,
  0.416670;0.000000;,
  0.416670;0.500000;,
  0.500000;0.000000;,
  0.500000;0.500000;,
  0.583330;0.000000;,
  0.583330;0.500000;,
  0.666670;0.000000;,
  0.666670;0.500000;,
  0.750000;0.000000;,
  0.750000;0.500000;,
  0.833330;0.000000;,
  0.833330;0.500000;,
  0.916670;0.000000;,
  0.916670;0.500000;,
  1.000000;0.000000;,
  1.000000;0.500000;,
  0.083330;1.000000;,
  0.000000;1.000000;,
  0.166670;1.000000;,
  0.250000;1.000000;,
  0.333330;1.000000;,
  0.416670;1.000000;,
  0.500000;1.000000;,
  0.583330;1.000000;,
  0.666670;1.000000;,
  0.750000;1.000000;,
  0.833330;1.000000;,
  0.916670;1.000000;,
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
  0.958330;1.000000;;
 }
}
