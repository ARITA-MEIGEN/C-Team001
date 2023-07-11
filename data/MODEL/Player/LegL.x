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
 120;
 6.13756;-32.50000;-9.65300;,
 7.19971;-35.75502;-10.60724;,
 -7.20030;-35.75502;-10.60724;,
 -6.13815;-32.50000;-9.65300;,
 7.19971;-41.50002;-9.65300;,
 -7.20030;-41.50002;-9.65300;,
 -6.13815;-32.50000;-9.65300;,
 -7.20030;-35.75502;-10.60724;,
 -7.20030;-35.75502;10.50124;,
 -6.13815;-32.50000;9.54700;,
 -7.20030;-41.50002;-9.65300;,
 -7.20030;-41.50002;9.54700;,
 -6.13815;-32.50000;9.54700;,
 -7.20030;-35.75502;10.50124;,
 7.19971;-35.75502;10.50124;,
 6.13756;-32.50000;9.54700;,
 -7.20030;-41.50002;9.54700;,
 7.19971;-41.50002;9.54700;,
 6.13756;-32.50000;9.54700;,
 7.19971;-35.75502;10.50124;,
 7.19971;-35.75502;-10.60724;,
 6.13756;-32.50000;-9.65300;,
 7.19971;-41.50002;9.54700;,
 7.19971;-41.50002;-9.65300;,
 6.13756;-32.50000;-9.65300;,
 -6.13815;-32.50000;-9.65300;,
 7.19971;-41.50002;-9.65300;,
 -7.20030;-41.50002;-9.65300;,
 -6.93562;0.04970;-4.24400;,
 6.13238;0.04970;-4.24400;,
 6.13238;-3.66280;-3.24926;,
 -6.93562;-3.66280;-3.24926;,
 6.13238;-6.38050;-0.53150;,
 -6.93562;-6.38050;-0.53150;,
 6.13238;-7.37530;3.18100;,
 -6.93562;-7.37530;3.18100;,
 6.13238;-6.38050;6.89351;,
 -6.93562;-6.38050;6.89351;,
 6.13238;-3.66280;9.61127;,
 -6.93562;-3.66280;9.61127;,
 6.13238;0.04970;10.60600;,
 -6.93562;0.04970;10.60600;,
 6.13238;3.76220;9.61127;,
 -6.93562;3.76220;9.61127;,
 6.13238;6.47996;6.89351;,
 -6.93562;6.47996;6.89351;,
 6.13238;7.47470;3.18100;,
 -6.93562;7.47470;3.18100;,
 6.13238;6.47996;-0.53150;,
 -6.93562;6.47996;-0.53150;,
 6.13238;3.76227;-3.24926;,
 -6.93562;3.76227;-3.24926;,
 6.13238;0.04970;-4.24400;,
 -6.93562;0.04970;-4.24400;,
 -6.93562;0.04970;3.18100;,
 -6.93562;0.04970;3.18100;,
 -6.93562;0.04970;3.18100;,
 -6.93562;0.04970;3.18100;,
 -6.93562;0.04970;3.18100;,
 -6.93562;0.04970;3.18100;,
 -6.93562;0.04970;3.18100;,
 -6.93562;0.04970;3.18100;,
 -6.93562;0.04970;3.18100;,
 -6.93562;0.04970;3.18100;,
 -6.93562;0.04970;3.18100;,
 -6.93562;0.04970;3.18100;,
 6.13238;0.04970;3.18100;,
 6.13238;0.04970;3.18100;,
 6.13238;0.04970;3.18100;,
 6.13238;0.04970;3.18100;,
 6.13238;0.04970;3.18100;,
 6.13238;0.04970;3.18100;,
 6.13238;0.04970;3.18100;,
 6.13238;0.04970;3.18100;,
 6.13238;0.04970;3.18100;,
 6.13238;0.04970;3.18100;,
 6.13238;0.04970;3.18100;,
 6.13238;0.04970;3.18100;,
 3.06438;-0.63670;5.74600;,
 3.06438;-0.63670;0.61600;,
 -3.09162;-0.63670;0.61600;,
 -3.09162;-0.63670;5.74600;,
 3.06438;-3.32998;-1.94900;,
 2.61230;-31.71274;-1.94900;,
 -2.63557;-31.71274;-1.94900;,
 -3.09162;-3.32998;-1.94900;,
 3.06438;-34.40596;0.61600;,
 3.06438;-34.40596;5.74600;,
 -3.09162;-34.40596;5.74600;,
 -3.09162;-34.40596;0.61600;,
 2.61230;-31.71274;8.31100;,
 3.06438;-3.32998;8.31100;,
 -3.09162;-3.32998;8.31100;,
 -2.63557;-31.71274;8.31100;,
 -6.16954;-3.32998;5.74600;,
 -6.16954;-3.32998;0.61600;,
 -5.25953;-31.71274;0.61600;,
 -5.25953;-31.71274;5.74600;,
 5.23626;-31.71274;5.74600;,
 5.23626;-31.71274;0.61600;,
 6.14238;-3.32998;0.61600;,
 6.14238;-3.32998;5.74600;,
 3.06438;-0.63670;0.61600;,
 -3.09162;-3.32998;-1.94900;,
 -3.09162;-0.63670;0.61600;,
 2.61230;-31.71274;-1.94900;,
 -3.09162;-34.40596;0.61600;,
 -2.63557;-31.71274;-1.94900;,
 3.06438;-3.32998;8.31100;,
 -3.09162;-0.63670;5.74600;,
 -3.09162;-3.32998;8.31100;,
 3.06438;-34.40596;5.74600;,
 -2.63557;-31.71274;8.31100;,
 -3.09162;-34.40596;5.74600;,
 -6.16954;-3.32998;0.61600;,
 -5.25953;-31.71274;5.74600;,
 -5.25953;-31.71274;0.61600;,
 6.14238;-3.32998;5.74600;,
 6.14238;-3.32998;0.61600;,
 5.23626;-31.71274;0.61600;;
 
 72;
 4;0,1,2,3;,
 4;1,4,5,2;,
 4;6,7,8,9;,
 4;7,10,11,8;,
 4;12,13,14,15;,
 4;13,16,17,14;,
 4;18,19,20,21;,
 4;19,22,23,20;,
 4;18,24,25,9;,
 4;26,22,11,27;,
 4;28,29,30,31;,
 4;31,30,32,33;,
 4;33,32,34,35;,
 4;35,34,36,37;,
 4;37,36,38,39;,
 4;39,38,40,41;,
 4;41,40,42,43;,
 4;43,42,44,45;,
 4;45,44,46,47;,
 4;47,46,48,49;,
 4;49,48,50,51;,
 4;51,50,52,53;,
 3;54,28,31;,
 3;55,31,33;,
 3;56,33,35;,
 3;57,35,37;,
 3;58,37,39;,
 3;59,39,41;,
 3;60,41,43;,
 3;61,43,45;,
 3;62,45,47;,
 3;63,47,49;,
 3;64,49,51;,
 3;65,51,53;,
 3;66,30,29;,
 3;67,32,30;,
 3;68,34,32;,
 3;69,36,34;,
 3;70,38,36;,
 3;71,40,38;,
 3;72,42,40;,
 3;73,44,42;,
 3;74,46,44;,
 3;75,48,46;,
 3;76,50,48;,
 3;77,52,50;,
 4;78,79,80,81;,
 4;82,83,84,85;,
 4;86,87,88,89;,
 4;90,91,92,93;,
 4;94,95,96,97;,
 4;98,99,100,101;,
 4;102,82,103,104;,
 4;105,86,106,107;,
 4;108,78,109,110;,
 4;111,90,112,113;,
 4;104,114,94,109;,
 4;113,115,116,106;,
 4;78,117,118,102;,
 4;86,119,98,111;,
 4;107,116,114,103;,
 4;110,94,115,112;,
 4;82,118,119,105;,
 4;90,98,117,108;,
 3;104,103,114;,
 3;82,102,118;,
 3;107,106,116;,
 3;110,109,94;,
 3;86,105,119;,
 3;113,112,115;,
 3;78,108,117;,
 3;90,111,98;;
 
 MeshMaterialList {
  14;
  72;
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  0,
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
  0,
  3,
  0,
  3,
  3,
  3,
  0,
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
  50;
  0.000000;0.281320;-0.959614;,
  0.000000;0.060250;-0.998183;,
  0.000000;-0.163854;-0.986485;,
  -0.950667;0.310212;0.000000;,
  -0.987590;0.157055;0.000000;,
  -1.000000;0.000000;0.000000;,
  0.000000;0.281320;0.959614;,
  0.000000;0.060250;0.998183;,
  0.000000;-0.163854;0.986485;,
  0.000000;-0.000003;-1.000000;,
  0.000000;-0.500003;-0.866023;,
  0.000000;-0.866026;-0.499999;,
  0.000000;-1.000000;-0.000000;,
  0.000000;-0.866026;0.499999;,
  0.000000;-0.500002;0.866024;,
  0.000000;-0.000000;1.000000;,
  0.000000;0.499997;0.866027;,
  0.000000;0.866027;0.499997;,
  0.000000;1.000000;-0.000000;,
  0.000000;0.866030;-0.499992;,
  0.000000;0.500001;-0.866025;,
  1.000000;0.000000;0.000000;,
  0.333929;0.861750;0.381941;,
  -0.333935;0.861748;0.381941;,
  0.333929;0.861750;-0.381941;,
  -0.333935;0.861748;-0.381941;,
  0.335225;0.357149;-0.871819;,
  -0.335233;0.357125;-0.871826;,
  0.360161;-0.336937;-0.869918;,
  -0.360224;-0.336759;-0.869961;,
  0.406873;-0.823641;-0.395057;,
  -0.407199;-0.823403;-0.395217;,
  0.406873;-0.823641;0.395057;,
  -0.407199;-0.823403;0.395217;,
  0.360161;-0.336937;0.869918;,
  -0.360224;-0.336759;0.869961;,
  0.335225;0.357149;0.871819;,
  -0.335233;0.357125;0.871826;,
  -0.834337;0.379841;0.399503;,
  -0.862378;-0.328669;0.385073;,
  -0.834337;0.379841;-0.399503;,
  -0.862378;-0.328669;-0.385073;,
  0.862251;-0.329034;0.385045;,
  0.834311;0.379903;0.399497;,
  0.862251;-0.329034;-0.385045;,
  0.834311;0.379903;-0.399497;,
  0.950667;0.310212;0.000000;,
  0.987590;0.157055;0.000000;,
  0.000000;1.000000;0.000000;,
  0.000000;-1.000000;-0.000000;;
  72;
  4;0,1,1,0;,
  4;1,2,2,1;,
  4;3,4,4,3;,
  4;4,5,5,4;,
  4;6,7,7,6;,
  4;7,8,8,7;,
  4;46,47,47,46;,
  4;47,21,21,47;,
  4;48,48,48,48;,
  4;49,49,49,49;,
  4;9,9,10,10;,
  4;10,10,11,11;,
  4;11,11,12,12;,
  4;12,12,13,13;,
  4;13,13,14,14;,
  4;14,14,15,15;,
  4;15,15,16,16;,
  4;16,16,17,17;,
  4;17,17,18,18;,
  4;18,18,19,19;,
  4;19,19,20,20;,
  4;20,20,9,9;,
  3;5,5,5;,
  3;5,5,5;,
  3;5,5,5;,
  3;5,5,5;,
  3;5,5,5;,
  3;5,5,5;,
  3;5,5,5;,
  3;5,5,5;,
  3;5,5,5;,
  3;5,5,5;,
  3;5,5,5;,
  3;5,5,5;,
  3;21,21,21;,
  3;21,21,21;,
  3;21,21,21;,
  3;21,21,21;,
  3;21,21,21;,
  3;21,21,21;,
  3;21,21,21;,
  3;21,21,21;,
  3;21,21,21;,
  3;21,21,21;,
  3;21,21,21;,
  3;21,21,21;,
  4;22,24,25,23;,
  4;26,28,29,27;,
  4;30,32,33,31;,
  4;34,36,37,35;,
  4;38,40,41,39;,
  4;42,44,45,43;,
  4;24,26,27,25;,
  4;28,30,31,29;,
  4;36,22,23,37;,
  4;32,34,35,33;,
  4;25,40,38,23;,
  4;33,39,41,31;,
  4;22,43,45,24;,
  4;30,44,42,32;,
  4;29,41,40,27;,
  4;37,38,39,35;,
  4;26,45,44,28;,
  4;34,42,43,36;,
  3;25,27,40;,
  3;26,24,45;,
  3;29,31,41;,
  3;37,23,38;,
  3;30,28,44;,
  3;33,35,39;,
  3;22,36,43;,
  3;34,32,42;;
 }
 MeshTextureCoords {
  120;
  0.000000;0.000000;,
  0.000000;0.500000;,
  1.000000;0.500000;,
  1.000000;0.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.500000;,
  1.000000;0.500000;,
  1.000000;0.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.500000;,
  1.000000;0.500000;,
  1.000000;0.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.500000;,
  1.000000;0.500000;,
  1.000000;0.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;1.000000;,
  0.083330;1.000000;,
  0.083330;0.000000;,
  0.166670;1.000000;,
  0.166670;0.000000;,
  0.250000;1.000000;,
  0.250000;0.000000;,
  0.333330;1.000000;,
  0.333330;0.000000;,
  0.416670;1.000000;,
  0.416670;0.000000;,
  0.500000;1.000000;,
  0.500000;0.000000;,
  0.583330;1.000000;,
  0.583330;0.000000;,
  0.666670;1.000000;,
  0.666670;0.000000;,
  0.750000;1.000000;,
  0.750000;0.000000;,
  0.833330;1.000000;,
  0.833330;0.000000;,
  0.916670;1.000000;,
  0.916670;0.000000;,
  1.000000;1.000000;,
  1.000000;0.000000;,
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
  0.000000;1.000000;,
  1.000000;1.000000;,
  1.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  1.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  1.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  1.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  1.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  1.000000;0.000000;,
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
