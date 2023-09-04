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
 212;
 -1.92900;-12.50000;-5.80000;,
 -0.63785;-12.50000;-5.80000;,
 -0.70557;-13.04475;-6.05134;,
 -2.13215;-13.04475;-6.05134;,
 0.65331;-12.50000;-5.80000;,
 0.72103;-13.04475;-6.05134;,
 1.94446;-12.50000;-5.80000;,
 2.14762;-13.04475;-6.05134;,
 -0.70557;-14.76883;-6.28638;,
 -2.13215;-14.76883;-6.28638;,
 0.72103;-14.76883;-6.28638;,
 2.14762;-14.76883;-6.28638;,
 1.94446;-12.50000;-5.80000;,
 1.40124;-11.91033;-3.49055;,
 2.14762;-13.04475;-3.50579;,
 2.14762;-13.04475;-6.05134;,
 1.08827;-11.32066;-2.25127;,
 2.14762;-13.04475;-1.42194;,
 1.08827;-10.73099;0.37689;,
 2.14762;-13.04475;0.66191;,
 1.94446;-12.18318;2.49443;,
 2.14762;-13.04475;2.74578;,
 2.14762;-14.76883;-3.62331;,
 2.14762;-14.76883;-6.28638;,
 2.14762;-14.76883;-1.42194;,
 2.14762;-14.76883;0.77944;,
 2.14762;-14.76883;2.98082;,
 1.94446;-12.18318;2.49443;,
 0.65331;-12.18318;2.49443;,
 0.72103;-13.04475;2.74578;,
 2.14762;-13.04475;2.74578;,
 -0.63785;-12.18318;2.49443;,
 -0.70557;-13.04475;2.74578;,
 -1.92900;-12.18318;2.49443;,
 -2.13215;-13.04475;2.74578;,
 0.72103;-14.76883;2.98082;,
 2.14762;-14.76883;2.98082;,
 -0.70557;-14.76883;2.98082;,
 -2.13215;-14.76883;2.98082;,
 -1.92900;-12.18318;2.49443;,
 -1.07281;-10.73099;0.37689;,
 -2.13215;-13.04475;0.66191;,
 -2.13215;-13.04475;2.74578;,
 -1.07281;-11.32066;-2.25127;,
 -2.13215;-13.04475;-1.42194;,
 -1.38578;-11.91033;-3.49055;,
 -2.13215;-13.04475;-3.50579;,
 -1.92900;-12.50000;-5.80000;,
 -2.13215;-13.04475;-6.05134;,
 -2.13215;-14.76883;0.77944;,
 -2.13215;-14.76883;2.98082;,
 -2.13215;-14.76883;-1.42194;,
 -2.13215;-14.76883;-3.62331;,
 -2.13215;-14.76883;-6.28638;,
 -0.63785;-12.18318;2.49443;,
 -0.35246;-10.73099;0.37689;,
 -1.07281;-10.73099;0.37689;,
 0.65331;-12.18318;2.49443;,
 0.36792;-10.73099;0.37689;,
 1.08827;-10.73099;0.37689;,
 -0.35246;-11.32066;-2.25127;,
 -1.07281;-11.32066;-2.25127;,
 0.36792;-11.32066;-2.25127;,
 1.08827;-11.32066;-2.25127;,
 -0.45677;-11.91033;-3.49055;,
 -1.38578;-11.91033;-3.49055;,
 0.47223;-11.91033;-3.49055;,
 1.40124;-11.91033;-3.49055;,
 -0.63785;-12.50000;-5.80000;,
 -1.92900;-12.50000;-5.80000;,
 0.65331;-12.50000;-5.80000;,
 1.94446;-12.50000;-5.80000;,
 -2.13215;-14.76883;0.77944;,
 -0.70557;-14.76883;0.77944;,
 -0.70557;-14.76883;2.98082;,
 0.72103;-14.76883;0.77944;,
 0.72103;-14.76883;2.98082;,
 2.14762;-14.76883;0.77944;,
 -2.13215;-14.76883;-1.42194;,
 -0.70557;-14.76883;-1.42194;,
 0.72103;-14.76883;-1.42194;,
 2.14762;-14.76883;-1.42194;,
 -2.13215;-14.76883;-3.62331;,
 -0.70557;-14.76883;-3.62331;,
 0.72103;-14.76883;-3.62331;,
 2.14762;-14.76883;-3.62331;,
 -2.13215;-14.76883;-6.28638;,
 -0.70557;-14.76883;-6.28638;,
 0.72103;-14.76883;-6.28638;,
 2.14762;-14.76883;-6.28638;,
 -1.13689;-1.47397;-0.46311;,
 1.13755;-1.47397;-0.46311;,
 1.13755;-1.47397;-1.22029;,
 -1.13689;-1.47397;-1.22029;,
 -0.94054;-2.58747;-2.23459;,
 0.94122;-2.58747;-2.23459;,
 0.98442;-4.15406;-2.86119;,
 -0.98374;-4.15406;-2.86119;,
 0.78658;-5.72112;-2.08538;,
 -0.78590;-5.72112;-2.08538;,
 1.07288;-11.07890;-3.06651;,
 -1.07222;-11.07890;-3.06651;,
 -1.34034;-11.84601;-1.22029;,
 1.34102;-11.84601;-1.22029;,
 1.34102;-11.84601;1.17588;,
 -1.34034;-11.84601;1.17588;,
 -1.07222;-11.07890;3.02210;,
 1.07288;-11.07890;3.02210;,
 0.78658;-5.02311;2.34162;,
 -0.78590;-5.02311;2.34162;,
 0.98442;-3.45605;1.47844;,
 -0.98374;-3.45605;1.47844;,
 0.94122;-2.58747;0.55119;,
 -0.94054;-2.58747;0.55119;,
 2.01651;-2.58747;-0.55501;,
 2.10908;-3.45605;0.05894;,
 2.10908;-4.15406;-1.44170;,
 2.01651;-2.58747;-1.12840;,
 1.68514;-5.02311;1.31003;,
 1.68514;-5.72112;-1.05379;,
 2.29864;-11.07890;1.49995;,
 2.29864;-11.07890;-1.54436;,
 -2.29798;-11.07890;1.49995;,
 -1.68447;-5.02311;1.31003;,
 -1.68447;-5.72112;-1.05379;,
 -2.29798;-11.07890;-1.54436;,
 -2.10841;-3.45605;0.05894;,
 -2.10841;-4.15406;-1.44170;,
 -2.01584;-2.58747;-0.55501;,
 -2.01584;-2.58747;-1.12840;,
 -1.13689;-1.47397;-1.22029;,
 1.13755;-1.47397;-1.22029;,
 0.94122;-2.58747;-2.23459;,
 -1.07222;-11.07890;-3.06651;,
 1.07288;-11.07890;-3.06651;,
 1.34102;-11.84601;-1.22029;,
 -0.94054;-2.58747;0.55119;,
 0.94122;-2.58747;0.55119;,
 1.13755;-1.47397;-0.46311;,
 -1.34034;-11.84601;1.17588;,
 1.34102;-11.84601;1.17588;,
 1.07288;-11.07890;3.02210;,
 2.01651;-2.58747;-1.12840;,
 2.29864;-11.07890;-1.54436;,
 2.29864;-11.07890;1.49995;,
 -2.01584;-2.58747;-1.12840;,
 -2.01584;-2.58747;-0.55501;,
 -2.29798;-11.07890;-1.54436;,
 0.78658;-5.72112;-2.08538;,
 1.68514;-5.72112;-1.05379;,
 0.98442;-4.15406;-2.86119;,
 2.10908;-4.15406;-1.44170;,
 0.78658;-5.02311;2.34162;,
 1.68514;-5.02311;1.31003;,
 0.98442;-3.45605;1.47844;,
 2.10908;-3.45605;0.05894;,
 -0.78590;-5.72112;-2.08538;,
 -1.68447;-5.72112;-1.05379;,
 -0.98374;-4.15406;-2.86119;,
 -2.10841;-4.15406;-1.44170;,
 -0.78590;-5.02311;2.34162;,
 -1.68447;-5.02311;1.31003;,
 -0.98374;-3.45605;1.47844;,
 -2.10841;-3.45605;0.05894;,
 -1.29934;0.11289;-1.22029;,
 0.00034;0.11289;-1.22029;,
 0.00034;-2.11412;-1.22029;,
 -1.29934;-2.11412;-1.22029;,
 1.30002;0.11289;-1.22029;,
 1.30002;-2.11412;-1.22029;,
 0.00034;-4.34112;-1.22029;,
 -1.29934;-4.34112;-1.22029;,
 1.30002;-4.34112;-1.22029;,
 1.30002;0.11289;-1.22029;,
 1.30002;0.11289;-0.02220;,
 1.30002;-2.11412;-0.02220;,
 1.30002;-2.11412;-1.22029;,
 1.30002;0.11289;1.17588;,
 1.30002;-2.11412;1.17588;,
 1.30002;-4.34112;-0.02220;,
 1.30002;-4.34112;-1.22029;,
 1.30002;-4.34112;1.17588;,
 1.30002;0.11289;1.17588;,
 0.00034;0.11289;1.17588;,
 0.00034;-2.11412;1.17588;,
 1.30002;-2.11412;1.17588;,
 -1.29934;0.11289;1.17588;,
 -1.29934;-2.11412;1.17588;,
 0.00034;-4.34112;1.17588;,
 1.30002;-4.34112;1.17588;,
 -1.29934;-4.34112;1.17588;,
 -1.29934;0.11289;1.17588;,
 -1.29934;0.11289;-0.02220;,
 -1.29934;-2.11412;-0.02220;,
 -1.29934;-2.11412;1.17588;,
 -1.29934;0.11289;-1.22029;,
 -1.29934;-2.11412;-1.22029;,
 -1.29934;-4.34112;-0.02220;,
 -1.29934;-4.34112;1.17588;,
 -1.29934;-4.34112;-1.22029;,
 0.00034;0.11289;-0.02220;,
 -1.29934;0.11289;-0.02220;,
 1.30002;0.11289;-0.02220;,
 0.00034;0.11289;-1.22029;,
 -1.29934;0.11289;-1.22029;,
 1.30002;0.11289;-1.22029;,
 -1.29934;-4.34112;-0.02220;,
 0.00034;-4.34112;-0.02220;,
 1.30002;-4.34112;-0.02220;,
 -1.29934;-4.34112;-1.22029;,
 0.00034;-4.34112;-1.22029;,
 1.30002;-4.34112;-1.22029;;
 
 118;
 4;0,1,2,3;,
 4;1,4,5,2;,
 4;4,6,7,5;,
 4;3,2,8,9;,
 4;2,5,10,8;,
 4;5,7,11,10;,
 4;12,13,14,15;,
 4;13,16,17,14;,
 4;16,18,19,17;,
 4;18,20,21,19;,
 4;15,14,22,23;,
 4;14,17,24,22;,
 4;17,19,25,24;,
 4;19,21,26,25;,
 4;27,28,29,30;,
 4;28,31,32,29;,
 4;31,33,34,32;,
 4;30,29,35,36;,
 4;29,32,37,35;,
 4;32,34,38,37;,
 4;39,40,41,42;,
 4;40,43,44,41;,
 4;43,45,46,44;,
 4;45,47,48,46;,
 4;42,41,49,50;,
 4;41,44,51,49;,
 4;44,46,52,51;,
 4;46,48,53,52;,
 4;39,54,55,56;,
 4;54,57,58,55;,
 4;57,20,59,58;,
 4;56,55,60,61;,
 4;55,58,62,60;,
 4;58,59,63,62;,
 4;61,60,64,65;,
 4;60,62,66,64;,
 4;62,63,67,66;,
 4;65,64,68,69;,
 4;64,66,70,68;,
 4;66,67,71,70;,
 4;72,73,74,50;,
 4;73,75,76,74;,
 4;75,77,26,76;,
 4;78,79,73,72;,
 4;79,80,75,73;,
 4;80,81,77,75;,
 4;82,83,79,78;,
 4;83,84,80,79;,
 4;84,85,81,80;,
 4;86,87,83,82;,
 4;87,88,84,83;,
 4;88,89,85,84;,
 4;90,91,92,93;,
 4;94,95,96,97;,
 4;97,96,98,99;,
 4;99,98,100,101;,
 4;102,103,104,105;,
 4;106,107,108,109;,
 4;109,108,110,111;,
 4;111,110,112,113;,
 4;114,115,116,117;,
 4;115,118,119,116;,
 4;118,120,121,119;,
 4;122,123,124,125;,
 4;123,126,127,124;,
 4;126,128,129,127;,
 4;130,131,132,94;,
 4;133,134,135,102;,
 4;136,137,138,90;,
 4;139,140,141,106;,
 4;131,138,114,142;,
 4;140,135,143,144;,
 4;90,130,145,146;,
 4;102,139,122,147;,
 4;134,148,149,143;,
 4;148,150,151,149;,
 4;150,132,142,151;,
 4;152,141,144,153;,
 4;154,152,153,155;,
 4;137,154,155,114;,
 4;156,133,147,157;,
 4;158,156,157,159;,
 4;94,158,159,145;,
 4;106,160,161,122;,
 4;160,162,163,161;,
 4;162,136,146,163;,
 3;131,142,132;,
 3;94,145,130;,
 3;134,143,135;,
 3;137,114,138;,
 3;102,147,133;,
 3;140,144,141;,
 3;90,146,136;,
 3;106,122,139;,
 4;164,165,166,167;,
 4;165,168,169,166;,
 4;167,166,170,171;,
 4;166,169,172,170;,
 4;173,174,175,176;,
 4;174,177,178,175;,
 4;176,175,179,180;,
 4;175,178,181,179;,
 4;182,183,184,185;,
 4;183,186,187,184;,
 4;185,184,188,189;,
 4;184,187,190,188;,
 4;191,192,193,194;,
 4;192,195,196,193;,
 4;194,193,197,198;,
 4;193,196,199,197;,
 4;191,183,200,201;,
 4;183,177,202,200;,
 4;201,200,203,204;,
 4;200,202,205,203;,
 4;206,207,188,198;,
 4;207,208,181,188;,
 4;209,210,207,206;,
 4;210,211,208,207;;
 
 MeshMaterialList {
  22;
  118;
  11,
  0,
  11,
  9,
  0,
  9,
  11,
  11,
  11,
  11,
  9,
  9,
  9,
  9,
  11,
  0,
  11,
  9,
  9,
  9,
  11,
  11,
  11,
  11,
  9,
  9,
  9,
  9,
  11,
  0,
  11,
  11,
  11,
  11,
  11,
  0,
  11,
  11,
  0,
  11,
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
  11,
  0,
  0,
  0,
  4,
  11,
  10,
  0,
  11,
  11,
  11,
  11,
  11,
  11,
  0,
  4,
  11,
  4,
  11,
  4,
  11,
  4,
  11,
  11,
  11,
  11,
  10,
  10,
  11,
  11,
  11,
  11,
  10,
  10,
  11,
  11,
  4,
  10,
  4,
  4,
  10,
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
  90;
  0.000000;0.768535;-0.639808;,
  0.000000;0.768535;-0.639808;,
  0.000000;0.280093;-0.959973;,
  0.000000;0.280093;-0.959973;,
  0.000000;0.135079;-0.990835;,
  0.000000;0.135079;-0.990835;,
  0.870317;0.492439;0.007227;,
  0.870139;0.491625;-0.034097;,
  0.921287;0.385683;-0.049796;,
  0.967079;0.254451;0.003734;,
  0.967033;0.254040;-0.017619;,
  0.980175;0.196502;-0.025370;,
  1.000000;0.000000;0.000000;,
  0.946614;0.319195;-0.045129;,
  0.000000;0.586524;0.809932;,
  0.986563;0.161771;-0.022872;,
  0.000000;0.208139;0.978099;,
  0.000000;0.208139;0.978099;,
  0.000000;0.135079;0.990835;,
  0.000000;0.586524;0.809932;,
  -0.921286;0.385683;-0.049796;,
  -0.870139;0.491625;-0.034097;,
  -0.870317;0.492440;0.007227;,
  0.000000;0.208139;0.978099;,
  -0.980175;0.196502;-0.025370;,
  -0.967033;0.254040;-0.017619;,
  -0.967079;0.254451;0.003734;,
  0.000000;0.135079;0.990835;,
  -1.000000;0.000000;0.000000;,
  0.000000;0.981965;0.189063;,
  0.000000;0.981965;0.189063;,
  0.000000;0.945258;-0.326325;,
  0.000000;0.945258;-0.326325;,
  0.000000;0.940380;-0.340126;,
  0.000000;-1.000000;-0.000000;,
  -0.421390;0.812618;0.402596;,
  0.421388;0.812619;0.402595;,
  -0.421389;0.812618;-0.402596;,
  0.421387;0.812619;-0.402595;,
  -0.374228;0.468742;-0.800147;,
  0.374228;0.468743;-0.800146;,
  -0.426807;-0.062572;-0.902176;,
  0.426807;-0.062572;-0.902175;,
  -0.424472;-0.136449;-0.895100;,
  0.424473;-0.136450;-0.895100;,
  -0.417043;0.181535;-0.890573;,
  0.417044;0.181535;-0.890573;,
  -0.298259;-0.931514;-0.208141;,
  0.298261;-0.931514;-0.208142;,
  -0.298259;-0.931514;0.208141;,
  0.298261;-0.931514;0.208142;,
  -0.420298;0.117554;0.899739;,
  0.420299;0.117554;0.899739;,
  -0.417984;0.267087;0.868305;,
  0.417985;0.267087;0.868305;,
  -0.375406;0.549608;0.746325;,
  0.375407;0.549608;0.746325;,
  -0.338788;0.636721;0.692682;,
  0.338788;0.636722;0.692682;,
  0.831593;0.456732;0.315988;,
  0.922393;0.178361;0.342606;,
  0.931955;0.067117;0.356308;,
  0.861720;-0.405040;0.305584;,
  0.859931;0.371473;-0.350039;,
  0.942744;-0.081301;-0.323457;,
  0.943757;-0.089937;-0.318172;,
  0.864287;-0.392391;-0.314703;,
  -0.861719;-0.405042;0.305584;,
  -0.931955;0.067119;0.356308;,
  -0.922392;0.178363;0.342606;,
  -0.831594;0.456730;0.315988;,
  -0.864286;-0.392393;-0.314703;,
  -0.943757;-0.089935;-0.318174;,
  -0.942743;-0.081300;-0.323458;,
  -0.859931;0.371471;-0.350040;,
  0.000000;0.000000;-1.000000;,
  0.000000;0.000000;1.000000;,
  0.000000;1.000000;0.000000;,
  0.891645;0.451847;0.028334;,
  0.972534;0.232304;0.014567;,
  -0.946614;0.319195;-0.045129;,
  -0.986563;0.161771;-0.022872;,
  -0.891645;0.451847;0.028334;,
  -0.972534;0.232304;0.014567;,
  0.000000;0.981965;0.189063;,
  0.000000;0.940380;-0.340126;,
  -0.253194;-0.879787;-0.402328;,
  0.253196;-0.879786;-0.402329;,
  0.253196;-0.879786;0.402329;,
  -0.253194;-0.879787;0.402328;;
  118;
  4;0,1,3,2;,
  4;1,1,3,3;,
  4;1,1,3,3;,
  4;2,3,5,4;,
  4;3,3,5,5;,
  4;3,3,5,5;,
  4;78,6,9,79;,
  4;6,7,10,9;,
  4;7,8,11,10;,
  4;8,13,15,11;,
  4;79,9,12,12;,
  4;9,10,12,12;,
  4;10,11,12,12;,
  4;11,15,12,12;,
  4;19,14,16,23;,
  4;14,14,17,16;,
  4;14,19,23,17;,
  4;23,16,18,18;,
  4;16,17,18,18;,
  4;17,23,27,18;,
  4;80,20,24,81;,
  4;20,21,25,24;,
  4;21,22,26,25;,
  4;22,82,83,26;,
  4;81,24,28,28;,
  4;24,25,28,28;,
  4;25,26,28,28;,
  4;26,83,28,28;,
  4;19,14,29,30;,
  4;14,14,30,29;,
  4;14,19,84,30;,
  4;30,29,31,31;,
  4;29,30,32,31;,
  4;30,84,31,32;,
  4;31,31,33,85;,
  4;31,32,33,33;,
  4;32,31,85,33;,
  4;85,33,1,0;,
  4;33,33,1,1;,
  4;33,85,1,1;,
  4;34,34,34,34;,
  4;34,34,34,34;,
  4;34,34,34,34;,
  4;34,34,34,34;,
  4;34,34,34,34;,
  4;34,34,34,34;,
  4;34,34,34,34;,
  4;34,34,34,34;,
  4;34,34,34,34;,
  4;34,34,34,34;,
  4;34,34,34,34;,
  4;34,34,34,34;,
  4;35,36,38,37;,
  4;39,40,42,41;,
  4;41,42,44,43;,
  4;43,44,46,45;,
  4;47,48,50,49;,
  4;51,52,54,53;,
  4;53,54,56,55;,
  4;55,56,58,57;,
  4;59,60,64,63;,
  4;60,61,65,64;,
  4;61,62,66,65;,
  4;67,68,72,71;,
  4;68,69,73,72;,
  4;69,70,74,73;,
  4;37,38,40,39;,
  4;86,87,48,47;,
  4;57,58,36,35;,
  4;49,50,88,89;,
  4;38,36,59,63;,
  4;50,48,66,62;,
  4;35,37,74,70;,
  4;47,49,67,71;,
  4;46,44,65,66;,
  4;44,42,64,65;,
  4;42,40,63,64;,
  4;54,52,62,61;,
  4;56,54,61,60;,
  4;58,56,60,59;,
  4;43,45,71,72;,
  4;41,43,72,73;,
  4;39,41,73,74;,
  4;51,53,68,67;,
  4;53,55,69,68;,
  4;55,57,70,69;,
  3;38,63,40;,
  3;39,74,37;,
  3;87,66,48;,
  3;58,59,36;,
  3;47,71,86;,
  3;50,62,88;,
  3;35,70,57;,
  3;89,67,49;,
  4;75,75,75,75;,
  4;75,75,75,75;,
  4;75,75,75,75;,
  4;75,75,75,75;,
  4;12,12,12,12;,
  4;12,12,12,12;,
  4;12,12,12,12;,
  4;12,12,12,12;,
  4;76,76,76,76;,
  4;76,76,76,76;,
  4;76,76,76,76;,
  4;76,76,76,76;,
  4;28,28,28,28;,
  4;28,28,28,28;,
  4;28,28,28,28;,
  4;28,28,28,28;,
  4;77,77,77,77;,
  4;77,77,77,77;,
  4;77,77,77,77;,
  4;77,77,77,77;,
  4;34,34,34,34;,
  4;34,34,34,34;,
  4;34,34,34,34;,
  4;34,34,34,34;;
 }
 MeshTextureCoords {
  212;
  0.000000;0.000000;,
  0.333330;0.000000;,
  0.333330;0.500000;,
  0.000000;0.500000;,
  0.666670;0.000000;,
  0.666670;0.500000;,
  1.000000;0.000000;,
  1.000000;0.500000;,
  0.333330;1.000000;,
  0.000000;1.000000;,
  0.666670;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.250000;0.000000;,
  0.250000;0.500000;,
  0.000000;0.500000;,
  0.500000;0.000000;,
  0.500000;0.500000;,
  0.750000;0.000000;,
  0.750000;0.500000;,
  1.000000;0.000000;,
  1.000000;0.500000;,
  0.250000;1.000000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  0.750000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.333330;0.000000;,
  0.333330;0.500000;,
  0.000000;0.500000;,
  0.666670;0.000000;,
  0.666670;0.500000;,
  1.000000;0.000000;,
  1.000000;0.500000;,
  0.333330;1.000000;,
  0.000000;1.000000;,
  0.666670;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.250000;0.000000;,
  0.250000;0.500000;,
  0.000000;0.500000;,
  0.500000;0.000000;,
  0.500000;0.500000;,
  0.750000;0.000000;,
  0.750000;0.500000;,
  1.000000;0.000000;,
  1.000000;0.500000;,
  0.250000;1.000000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  0.750000;1.000000;,
  1.000000;1.000000;,
  0.333330;0.000000;,
  0.333330;0.250000;,
  0.000000;0.250000;,
  0.666670;0.000000;,
  0.666670;0.250000;,
  1.000000;0.250000;,
  0.333330;0.500000;,
  0.000000;0.500000;,
  0.666670;0.500000;,
  1.000000;0.500000;,
  0.333330;0.750000;,
  0.000000;0.750000;,
  0.666670;0.750000;,
  1.000000;0.750000;,
  0.333330;1.000000;,
  0.000000;1.000000;,
  0.666670;1.000000;,
  1.000000;1.000000;,
  0.000000;0.750000;,
  0.333330;0.750000;,
  0.333330;1.000000;,
  0.666670;0.750000;,
  0.666670;1.000000;,
  1.000000;0.750000;,
  0.000000;0.500000;,
  0.333330;0.500000;,
  0.666670;0.500000;,
  1.000000;0.500000;,
  0.000000;0.250000;,
  0.333330;0.250000;,
  0.666670;0.250000;,
  1.000000;0.250000;,
  0.000000;0.000000;,
  0.333330;0.000000;,
  0.666670;0.000000;,
  1.000000;0.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
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
  0.333330;0.000000;,
  0.333330;1.000000;,
  0.000000;1.000000;,
  0.666670;0.000000;,
  0.666670;1.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.333330;0.000000;,
  0.333330;1.000000;,
  0.000000;1.000000;,
  0.666670;0.000000;,
  0.666670;1.000000;,
  1.000000;0.000000;,
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
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.500000;0.000000;,
  0.500000;0.500000;,
  0.000000;0.500000;,
  1.000000;0.000000;,
  1.000000;0.500000;,
  0.500000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.500000;0.000000;,
  0.500000;0.500000;,
  0.000000;0.500000;,
  1.000000;0.000000;,
  1.000000;0.500000;,
  0.500000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.500000;0.000000;,
  0.500000;0.500000;,
  0.000000;0.500000;,
  1.000000;0.000000;,
  1.000000;0.500000;,
  0.500000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.500000;0.000000;,
  0.500000;0.500000;,
  0.000000;0.500000;,
  1.000000;0.000000;,
  1.000000;0.500000;,
  0.500000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.500000;0.500000;,
  0.000000;0.500000;,
  1.000000;0.500000;,
  0.500000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  1.000000;0.500000;,
  0.000000;0.000000;,
  0.500000;0.000000;,
  1.000000;0.000000;;
 }
}
