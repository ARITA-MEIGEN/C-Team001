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
 0.00000;-0.00674;-5.43369;,
 3.93268;-0.00674;-4.57909;,
 7.51130;-8.79488;-5.71979;,
 0.00000;-13.88854;-7.91187;,
 6.81162;-0.00674;-2.93347;,
 9.45470;-8.79488;-4.02999;,
 7.86540;-0.00674;0.25597;,
 10.91736;-8.79488;0.91481;,
 6.81162;-0.00674;3.72391;,
 9.45470;-8.79488;4.66939;,
 3.93268;-0.00674;6.05873;,
 7.51130;-8.79488;7.61561;,
 0.00000;-0.00674;6.91335;,
 0.00000;-8.79488;8.68385;,
 -3.93268;-0.00674;6.05873;,
 -7.51130;-8.79488;7.61561;,
 -6.81162;-0.00674;3.72391;,
 -9.45470;-8.79488;4.66939;,
 -7.86540;-0.00674;0.25597;,
 -10.91736;-8.79488;0.91481;,
 -6.81162;-0.00674;-2.93347;,
 -9.45470;-8.79488;-4.02999;,
 -3.93268;-0.00674;-4.57909;,
 -7.51130;-8.79488;-5.71979;,
 0.00000;-0.00674;-5.43369;,
 0.00000;-13.88854;-7.91187;,
 4.27712;-17.90546;-6.73479;,
 0.00868;-18.54594;-7.13619;,
 7.40820;-15.85080;-3.74117;,
 8.55424;-15.85080;0.34821;,
 7.40820;-15.85080;4.43759;,
 4.27712;-17.90546;6.25495;,
 0.00000;-17.90546;7.35069;,
 -4.27712;-17.90546;6.25495;,
 -7.40820;-15.85080;4.43759;,
 -8.55424;-15.85080;0.34823;,
 -7.40820;-15.85080;-3.74117;,
 -4.27712;-17.90546;-6.73479;,
 0.00868;-18.54594;-7.13619;,
 0.00000;-0.00674;0.25597;,
 0.00000;-0.00674;0.25597;,
 0.00000;-0.00674;0.25597;,
 0.00000;-0.00674;0.25597;,
 0.00000;-0.00674;0.25597;,
 0.00000;-0.00674;0.25597;,
 0.00000;-0.00674;0.25597;,
 0.00000;-0.00674;0.25597;,
 0.00000;-0.00674;0.25597;,
 0.00000;-0.00674;0.25597;,
 0.00000;-0.00674;0.25597;,
 0.00000;-0.00674;0.25597;,
 0.00000;-18.46944;0.34821;,
 0.00000;-18.46944;0.34821;,
 0.00000;-18.46944;0.34821;,
 0.00000;-18.46944;0.34821;,
 0.00000;-18.46944;0.34821;,
 0.00000;-18.46944;0.34821;,
 0.00000;-18.46944;0.34821;,
 0.00000;-18.46944;0.34821;,
 0.00000;-18.46944;0.34821;,
 0.00000;-18.46944;0.34821;,
 0.00000;-18.46944;0.34821;,
 0.00000;-18.46944;0.34821;;
 
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
  0,
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
  0,
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
  45;
  0.000000;1.000000;0.000000;,
  0.000000;0.194464;-0.980910;,
  0.379035;0.246774;-0.891872;,
  0.768316;0.312163;-0.558788;,
  0.945544;0.325224;0.013285;,
  0.812306;0.332438;0.479212;,
  0.459889;0.287497;0.840148;,
  0.000000;0.213291;0.976989;,
  -0.459889;0.287497;0.840148;,
  -0.812306;0.332438;0.479212;,
  -0.945544;0.325224;0.013285;,
  -0.768316;0.312163;-0.558788;,
  -0.379035;0.246774;-0.891872;,
  0.000051;0.058561;-0.998284;,
  0.430385;0.053118;-0.901081;,
  0.835442;0.029342;-0.548795;,
  0.999800;0.010543;0.016990;,
  0.865013;0.016163;0.501489;,
  0.489192;0.023365;0.871863;,
  0.000000;0.022054;0.999757;,
  -0.489192;0.023365;0.871863;,
  -0.865013;0.016163;0.501489;,
  -0.999800;0.010543;0.016990;,
  -0.835442;0.029341;-0.548795;,
  -0.430341;0.053061;-0.901106;,
  0.000102;-0.078707;-0.996898;,
  0.464980;-0.147063;-0.873021;,
  0.731741;-0.552634;-0.398938;,
  0.695637;-0.718317;0.010493;,
  0.680374;-0.697665;0.224399;,
  0.483416;-0.242866;0.841026;,
  0.000000;-0.170708;0.985322;,
  -0.483416;-0.242866;0.841026;,
  -0.680374;-0.697664;0.224399;,
  -0.695637;-0.718317;0.010494;,
  -0.682422;-0.685801;-0.252939;,
  -0.464885;-0.147181;-0.873052;,
  0.000049;-0.999978;0.006551;,
  0.000279;-0.999948;0.010221;,
  0.284779;-0.953772;0.096022;,
  0.414302;-0.892338;0.179127;,
  0.236756;-0.968354;-0.078978;,
  0.000000;-0.996772;0.080280;,
  -0.236756;-0.968354;-0.078978;,
  -0.284514;-0.953868;0.095855;;
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
