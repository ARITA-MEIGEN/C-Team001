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
 -1.26900;0.00000;-1.32200;,
 -0.49893;0.00000;-1.48269;,
 -0.48377;-1.05277;-1.94818;,
 -1.54768;-1.05277;-1.73703;,
 0.74449;0.00000;-1.48269;,
 0.58015;-1.05277;-1.94818;,
 1.81090;0.00000;-1.32200;,
 1.64406;-1.05277;-1.73703;,
 -0.67107;-2.50034;-2.43523;,
 -2.00096;-2.50034;-2.17131;,
 0.65881;-2.50034;-2.43523;,
 1.98872;-2.50034;-2.17131;,
 -0.67107;-3.81631;-2.43523;,
 -2.00096;-3.81631;-2.17131;,
 0.65881;-3.81631;-2.43523;,
 1.72794;-3.53002;-2.17131;,
 1.81090;0.00000;-1.32200;,
 2.08150;0.00000;-0.44063;,
 1.89412;-1.05277;-0.57898;,
 1.64406;-1.05277;-1.73703;,
 2.08150;0.00000;0.44076;,
 1.89412;-1.05277;0.57910;,
 1.81090;0.00000;1.32212;,
 1.64406;-1.05277;1.73715;,
 2.29441;-2.50034;-0.72372;,
 1.98872;-2.50034;-2.17131;,
 2.29441;-2.50034;0.72384;,
 1.98872;-2.50034;2.17143;,
 1.99152;-3.53002;-0.72372;,
 1.72794;-3.53002;-2.17131;,
 1.99152;-3.53002;0.72384;,
 1.72794;-3.53002;1.94935;,
 1.81090;0.00000;1.32212;,
 0.74449;0.00000;1.48282;,
 0.58015;-1.05277;1.94830;,
 1.64406;-1.05277;1.73715;,
 -0.49893;0.00000;1.48282;,
 -0.48377;-1.05277;1.94830;,
 -1.26900;0.00000;1.32212;,
 -1.54768;-1.05277;1.73715;,
 0.65881;-2.50034;2.43535;,
 1.98872;-2.50034;2.17143;,
 -0.67107;-2.50034;2.43535;,
 -2.00096;-2.50034;2.17143;,
 0.39803;-3.53002;2.18628;,
 1.72794;-3.53002;1.94935;,
 -0.67107;-3.81631;2.18628;,
 -2.00096;-3.81631;1.94935;,
 -1.26900;0.00000;1.32212;,
 -1.49551;0.00000;0.44076;,
 -1.81276;-1.05277;0.57910;,
 -1.54768;-1.05277;1.73715;,
 -1.49551;0.00000;-0.44063;,
 -1.81276;-1.05277;-0.57898;,
 -1.26900;0.00000;-1.32200;,
 -1.54768;-1.05277;-1.73703;,
 -2.33920;-2.50034;0.72384;,
 -2.00096;-2.50034;2.17143;,
 -2.33920;-2.50034;-0.72372;,
 -2.00096;-2.50034;-2.17131;,
 -2.33920;-3.81631;0.72384;,
 -2.00096;-3.81631;1.94935;,
 -2.33920;-3.81631;-0.72372;,
 -2.00096;-3.81631;-2.17131;,
 -0.49893;0.00000;1.48282;,
 -0.60113;0.00000;0.49432;,
 -1.49551;0.00000;0.44076;,
 0.74449;0.00000;1.48282;,
 0.84297;0.00000;0.49432;,
 2.08150;0.00000;0.44076;,
 -0.60113;0.00000;-0.49420;,
 -1.49551;0.00000;-0.44063;,
 0.84297;0.00000;-0.49420;,
 2.08150;0.00000;-0.44063;,
 -0.49893;0.00000;-1.48269;,
 -1.26900;0.00000;-1.32200;,
 0.74449;0.00000;-1.48269;,
 1.81090;0.00000;-1.32200;,
 -2.33920;-3.81631;0.72384;,
 -0.79466;-3.81631;0.81183;,
 -0.67107;-3.81631;2.18628;,
 0.44698;-3.53002;0.81183;,
 0.39803;-3.53002;2.18628;,
 1.99152;-3.53002;0.72384;,
 -2.33920;-3.81631;-0.72372;,
 -0.79466;-3.81631;-0.81171;,
 0.44698;-3.53002;-0.81171;,
 1.99152;-3.53002;-0.72372;,
 -2.00096;-3.81631;-2.17131;,
 -0.67107;-3.81631;-2.43523;,
 0.65881;-3.81631;-2.43523;,
 1.72794;-3.53002;-2.17131;,
 -2.08395;-1.83116;-2.00536;,
 -0.73959;-1.83116;-2.00536;,
 -0.73959;-4.12830;-2.00536;,
 -2.38569;-3.83326;-2.00536;,
 -0.71193;-4.60969;-2.00536;,
 -1.91075;-5.92021;-2.00536;,
 0.14611;-6.49142;-2.00536;,
 -0.39406;-7.16200;-2.00536;,
 -0.73959;-1.83116;-2.00536;,
 -0.73959;-1.83116;-0.42078;,
 -0.73959;-4.12830;-0.42078;,
 -0.73959;-4.12830;-2.00536;,
 -0.71193;-4.60969;-0.42078;,
 -0.71193;-4.60969;-2.00536;,
 0.14611;-6.49142;-0.42078;,
 0.14611;-6.49142;-2.00536;,
 -0.73959;-1.83116;-0.42078;,
 -2.08395;-1.83116;-0.42078;,
 -2.38569;-3.83326;-0.42078;,
 -0.73959;-4.12830;-0.42078;,
 -1.91075;-5.92021;-0.42078;,
 -0.71193;-4.60969;-0.42078;,
 -0.39406;-7.16200;-0.42078;,
 0.14611;-6.49142;-0.42078;,
 -2.08395;-1.83116;-0.42078;,
 -2.08395;-1.83116;-2.00536;,
 -2.38569;-3.83326;-2.00536;,
 -2.38569;-3.83326;-0.42078;,
 -1.91075;-5.92021;-2.00536;,
 -1.91075;-5.92021;-0.42078;,
 -0.39406;-7.16200;-2.00536;,
 -0.39406;-7.16200;-0.42078;,
 -0.73959;-1.83116;-2.00536;,
 -2.08395;-1.83116;-2.00536;,
 -0.39406;-7.16200;-2.00536;,
 0.14611;-6.49142;-2.00536;,
 -1.90994;-1.49994;0.06975;,
 -0.56559;-1.49994;0.06975;,
 -0.56559;-3.79706;0.06975;,
 -2.21164;-3.50207;0.06975;,
 -0.53793;-4.27852;0.06975;,
 -1.73672;-5.58901;0.06975;,
 0.32011;-6.16020;0.06975;,
 -0.22005;-6.83077;0.06975;,
 -0.56559;-1.49994;0.06975;,
 -0.56559;-1.49994;1.65436;,
 -0.56559;-3.79706;1.65436;,
 -0.56559;-3.79706;0.06975;,
 -0.53793;-4.27852;1.65436;,
 -0.53793;-4.27852;0.06975;,
 0.32011;-6.16020;1.65436;,
 0.32011;-6.16020;0.06975;,
 -0.56559;-1.49994;1.65436;,
 -1.90994;-1.49994;1.65436;,
 -2.21164;-3.50207;1.65436;,
 -0.56559;-3.79706;1.65436;,
 -1.73672;-5.58901;1.65436;,
 -0.53793;-4.27852;1.65436;,
 -0.22005;-6.83077;1.65436;,
 0.32011;-6.16020;1.65436;,
 -1.90994;-1.49994;1.65436;,
 -1.90994;-1.49994;0.06975;,
 -2.21164;-3.50207;0.06975;,
 -2.21164;-3.50207;1.65436;,
 -1.73672;-5.58901;0.06975;,
 -1.73672;-5.58901;1.65436;,
 -0.22005;-6.83077;0.06975;,
 -0.22005;-6.83077;1.65436;,
 -0.56559;-1.49994;0.06975;,
 -1.90994;-1.49994;0.06975;,
 -0.22005;-6.83077;0.06975;,
 0.32011;-6.16020;0.06975;,
 1.66043;-2.30031;-1.37925;,
 2.31610;-3.53689;-1.37925;,
 1.09669;-4.27233;-1.37925;,
 0.61388;-2.74027;-1.37925;,
 2.38500;-5.08419;-1.37925;,
 1.17636;-4.60248;-1.37925;,
 1.46530;-6.40872;-1.37925;,
 0.90386;-6.13825;-1.37925;,
 0.61388;-2.74027;-1.37925;,
 1.09669;-4.27233;-1.37925;,
 1.09669;-4.27233;-0.11155;,
 0.61388;-2.74027;-0.11155;,
 1.17636;-4.60248;-1.37925;,
 1.17636;-4.60248;-0.11155;,
 0.90386;-6.13825;-1.37925;,
 0.90386;-6.13825;-0.11155;,
 0.61388;-2.74027;-0.11155;,
 1.09669;-4.27233;-0.11155;,
 2.31610;-3.53689;-0.11155;,
 1.66043;-2.30031;-0.11155;,
 1.17636;-4.60248;-0.11155;,
 2.38500;-5.08419;-0.11155;,
 0.90386;-6.13825;-0.11155;,
 1.46530;-6.40872;-0.11155;,
 1.66043;-2.30031;-0.11155;,
 2.31610;-3.53689;-0.11155;,
 2.31610;-3.53689;-1.37925;,
 1.66043;-2.30031;-1.37925;,
 2.38500;-5.08419;-0.11155;,
 2.38500;-5.08419;-1.37925;,
 1.46530;-6.40872;-0.11155;,
 1.46530;-6.40872;-1.37925;,
 1.66043;-2.30031;-1.37925;,
 0.61388;-2.74027;-1.37925;,
 1.46530;-6.40872;-1.37925;,
 0.90386;-6.13825;-1.37925;;
 
 96;
 4;0,1,2,3;,
 4;1,4,5,2;,
 4;4,6,7,5;,
 4;3,2,8,9;,
 4;2,5,10,8;,
 4;5,7,11,10;,
 4;9,8,12,13;,
 4;8,10,14,12;,
 4;10,11,15,14;,
 4;16,17,18,19;,
 4;17,20,21,18;,
 4;20,22,23,21;,
 4;19,18,24,25;,
 4;18,21,26,24;,
 4;21,23,27,26;,
 4;25,24,28,29;,
 4;24,26,30,28;,
 4;26,27,31,30;,
 4;32,33,34,35;,
 4;33,36,37,34;,
 4;36,38,39,37;,
 4;35,34,40,41;,
 4;34,37,42,40;,
 4;37,39,43,42;,
 4;41,40,44,45;,
 4;40,42,46,44;,
 4;42,43,47,46;,
 4;48,49,50,51;,
 4;49,52,53,50;,
 4;52,54,55,53;,
 4;51,50,56,57;,
 4;50,53,58,56;,
 4;53,55,59,58;,
 4;57,56,60,61;,
 4;56,58,62,60;,
 4;58,59,63,62;,
 4;48,64,65,66;,
 4;64,67,68,65;,
 4;67,22,69,68;,
 4;66,65,70,71;,
 4;65,68,72,70;,
 4;68,69,73,72;,
 4;71,70,74,75;,
 4;70,72,76,74;,
 4;72,73,77,76;,
 4;78,79,80,61;,
 4;79,81,82,80;,
 4;81,83,31,82;,
 4;84,85,79,78;,
 4;85,86,81,79;,
 4;86,87,83,81;,
 4;88,89,85,84;,
 4;89,90,86,85;,
 4;90,91,87,86;,
 4;92,93,94,95;,
 4;95,94,96,97;,
 4;97,96,98,99;,
 4;100,101,102,103;,
 4;103,102,104,105;,
 4;105,104,106,107;,
 4;108,109,110,111;,
 4;111,110,112,113;,
 4;113,112,114,115;,
 4;116,117,118,119;,
 4;119,118,120,121;,
 4;121,120,122,123;,
 4;116,101,124,125;,
 4;126,127,106,123;,
 4;128,129,130,131;,
 4;131,130,132,133;,
 4;133,132,134,135;,
 4;136,137,138,139;,
 4;139,138,140,141;,
 4;141,140,142,143;,
 4;144,145,146,147;,
 4;147,146,148,149;,
 4;149,148,150,151;,
 4;152,153,154,155;,
 4;155,154,156,157;,
 4;157,156,158,159;,
 4;152,137,160,161;,
 4;162,163,142,159;,
 4;164,165,166,167;,
 4;165,168,169,166;,
 4;168,170,171,169;,
 4;172,173,174,175;,
 4;173,176,177,174;,
 4;176,178,179,177;,
 4;180,181,182,183;,
 4;181,184,185,182;,
 4;184,186,187,185;,
 4;188,189,190,191;,
 4;189,192,193,190;,
 4;192,194,195,193;,
 4;188,196,197,175;,
 4;198,194,179,199;;
 
 MeshMaterialList {
  22;
  96;
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
  103;
  -0.182985;0.398164;-0.898878;,
  -0.091881;0.402982;-0.910584;,
  0.080422;0.383072;-0.920211;,
  -0.183316;0.366659;-0.912116;,
  -0.092072;0.365901;-0.926088;,
  0.086521;0.352761;-0.931705;,
  -0.191832;0.169830;-0.966622;,
  -0.096298;0.166474;-0.981332;,
  0.102359;0.157246;-0.982240;,
  -0.194656;0.000000;-0.980871;,
  -0.097797;0.000000;-0.995206;,
  0.109244;-0.012392;-0.993938;,
  0.160285;0.359088;-0.919437;,
  0.982106;-0.139385;-0.126645;,
  0.982106;-0.139385;0.126646;,
  0.172319;0.340839;-0.924195;,
  0.990764;0.069878;-0.116206;,
  0.990764;0.069877;0.116207;,
  0.203893;0.151251;-0.967239;,
  0.994887;0.001673;-0.100980;,
  0.994486;-0.003362;0.104814;,
  0.217163;-0.024633;-0.975825;,
  0.957761;-0.271928;-0.093532;,
  0.954189;-0.281781;0.100609;,
  0.962666;-0.101121;0.251097;,
  0.080424;0.383066;0.920213;,
  -0.091884;0.402976;0.910586;,
  0.968826;0.091837;0.230091;,
  0.086522;0.352758;0.931706;,
  -0.092074;0.365899;0.926089;,
  0.977991;0.001475;0.208643;,
  0.101360;0.044067;0.993873;,
  -0.088699;0.070236;0.993579;,
  0.939340;-0.278498;0.200197;,
  0.102081;-0.237176;0.966089;,
  -0.079109;-0.192964;0.978012;,
  -0.182991;0.398159;0.898879;,
  -0.945597;0.305212;0.112657;,
  -0.945597;0.305212;-0.112657;,
  -0.183319;0.366657;0.912117;,
  -0.938700;0.326915;0.109404;,
  -0.938700;0.326915;-0.109404;,
  -0.189074;0.083508;0.978405;,
  -0.978025;0.172444;0.117178;,
  -0.977793;0.177088;-0.112075;,
  -0.182222;-0.173227;0.967878;,
  -0.992188;-0.009671;0.124372;,
  -0.993421;0.000000;-0.114518;,
  0.000000;1.000000;0.000000;,
  0.117412;-0.993082;-0.001383;,
  0.084967;-0.996090;0.024200;,
  0.111306;-0.992574;0.049065;,
  0.000000;0.000000;-1.000000;,
  1.000000;0.000000;0.000000;,
  0.999588;0.028693;0.000000;,
  0.970715;0.240234;0.000000;,
  0.909872;0.414888;0.000000;,
  0.000000;0.000000;1.000000;,
  0.999588;0.028690;0.000000;,
  0.970715;0.240236;0.000000;,
  0.909868;0.414897;0.000000;,
  -0.953761;-0.300566;0.000000;,
  -0.963494;-0.267731;0.000000;,
  -0.999532;-0.030585;0.000000;,
  -0.984621;0.174706;0.000000;,
  0.962666;-0.101120;-0.251095;,
  0.968826;0.091837;-0.230090;,
  0.979564;0.011470;-0.200803;,
  0.947686;-0.259245;-0.186236;,
  0.160289;0.359084;0.919438;,
  0.172321;0.340836;0.924195;,
  0.189722;0.031494;0.981333;,
  0.178585;-0.262186;0.948349;,
  -0.921327;0.317890;0.223838;,
  -0.916943;0.334561;0.217448;,
  -0.921327;0.317891;-0.223837;,
  -0.916943;0.334562;-0.217448;,
  -0.957669;0.168982;0.233056;,
  -0.958390;0.178423;-0.222833;,
  -0.968876;-0.019192;0.246801;,
  -0.973771;0.000000;-0.227529;,
  0.000000;-1.000000;-0.000000;,
  0.121762;-0.992555;-0.002768;,
  0.052735;-0.997372;0.049684;,
  0.056855;-0.997214;0.048279;,
  0.109293;-0.989197;0.097699;,
  0.105192;-0.989501;0.099108;,
  -0.988833;0.149029;0.000000;,
  -0.999312;-0.037081;0.000000;,
  -0.850298;-0.526302;0.000000;,
  -0.633501;-0.773742;0.000000;,
  0.778765;-0.627316;-0.000000;,
  -0.988836;0.149007;0.000000;,
  -0.999312;-0.037088;0.000000;,
  -0.850298;-0.526301;0.000000;,
  -0.633497;-0.773745;0.000000;,
  0.778765;-0.627315;-0.000000;,
  0.883489;0.468451;0.000000;,
  0.964825;0.262892;0.000000;,
  0.960719;-0.277524;-0.000000;,
  0.821402;-0.570349;-0.000000;,
  -0.387538;0.921854;0.000000;,
  -0.434007;-0.900909;0.000000;;
  96;
  4;0,1,4,3;,
  4;1,2,5,4;,
  4;2,12,15,5;,
  4;3,4,7,6;,
  4;4,5,8,7;,
  4;5,15,18,8;,
  4;6,7,10,9;,
  4;7,8,11,10;,
  4;8,18,21,11;,
  4;65,13,16,66;,
  4;13,14,17,16;,
  4;14,24,27,17;,
  4;66,16,19,67;,
  4;16,17,20,19;,
  4;17,27,30,20;,
  4;67,19,22,68;,
  4;19,20,23,22;,
  4;20,30,33,23;,
  4;69,25,28,70;,
  4;25,26,29,28;,
  4;26,36,39,29;,
  4;70,28,31,71;,
  4;28,29,32,31;,
  4;29,39,42,32;,
  4;71,31,34,72;,
  4;31,32,35,34;,
  4;32,42,45,35;,
  4;73,37,40,74;,
  4;37,38,41,40;,
  4;38,75,76,41;,
  4;74,40,43,77;,
  4;40,41,44,43;,
  4;41,76,78,44;,
  4;77,43,46,79;,
  4;43,44,47,46;,
  4;44,78,80,47;,
  4;48,48,48,48;,
  4;48,48,48,48;,
  4;48,48,48,48;,
  4;48,48,48,48;,
  4;48,48,48,48;,
  4;48,48,48,48;,
  4;48,48,48,48;,
  4;48,48,48,48;,
  4;48,48,48,48;,
  4;81,49,82,81;,
  4;49,49,82,82;,
  4;49,81,81,82;,
  4;81,50,49,81;,
  4;50,51,49,49;,
  4;51,83,81,49;,
  4;81,84,50,81;,
  4;84,85,51,50;,
  4;85,86,83,51;,
  4;52,52,52,52;,
  4;52,52,52,52;,
  4;52,52,52,52;,
  4;53,53,54,54;,
  4;54,54,55,55;,
  4;55,55,56,56;,
  4;57,57,57,57;,
  4;57,57,57,57;,
  4;57,57,57,57;,
  4;87,87,88,88;,
  4;88,88,89,89;,
  4;89,89,90,90;,
  4;48,48,48,48;,
  4;91,91,91,91;,
  4;52,52,52,52;,
  4;52,52,52,52;,
  4;52,52,52,52;,
  4;53,53,58,58;,
  4;58,58,59,59;,
  4;59,59,60,60;,
  4;57,57,57,57;,
  4;57,57,57,57;,
  4;57,57,57,57;,
  4;92,92,93,93;,
  4;93,93,94,94;,
  4;94,94,95,95;,
  4;48,48,48,48;,
  4;96,96,96,96;,
  4;52,52,52,52;,
  4;52,52,52,52;,
  4;52,52,52,52;,
  4;61,62,62,61;,
  4;62,63,63,62;,
  4;63,64,64,63;,
  4;57,57,57,57;,
  4;57,57,57,57;,
  4;57,57,57,57;,
  4;97,98,98,97;,
  4;98,99,99,98;,
  4;99,100,100,99;,
  4;101,101,101,101;,
  4;102,102,102,102;;
 }
 MeshTextureCoords {
  200;
  0.000000;0.000000;,
  0.333330;0.000000;,
  0.333330;0.333330;,
  0.000000;0.333330;,
  0.666670;0.000000;,
  0.666670;0.333330;,
  1.000000;0.000000;,
  1.000000;0.333330;,
  0.333330;0.666670;,
  0.000000;0.666670;,
  0.666670;0.666670;,
  1.000000;0.666670;,
  0.333330;1.000000;,
  0.000000;1.000000;,
  0.666670;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.333330;0.000000;,
  0.333330;0.333330;,
  0.000000;0.333330;,
  0.666670;0.000000;,
  0.666670;0.333330;,
  1.000000;0.000000;,
  1.000000;0.333330;,
  0.333330;0.666670;,
  0.000000;0.666670;,
  0.666670;0.666670;,
  1.000000;0.666670;,
  0.333330;1.000000;,
  0.000000;1.000000;,
  0.666670;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.333330;0.000000;,
  0.333330;0.333330;,
  0.000000;0.333330;,
  0.666670;0.000000;,
  0.666670;0.333330;,
  1.000000;0.000000;,
  1.000000;0.333330;,
  0.333330;0.666670;,
  0.000000;0.666670;,
  0.666670;0.666670;,
  1.000000;0.666670;,
  0.333330;1.000000;,
  0.000000;1.000000;,
  0.666670;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.333330;0.000000;,
  0.333330;0.333330;,
  0.000000;0.333330;,
  0.666670;0.000000;,
  0.666670;0.333330;,
  1.000000;0.000000;,
  1.000000;0.333330;,
  0.333330;0.666670;,
  0.000000;0.666670;,
  0.666670;0.666670;,
  1.000000;0.666670;,
  0.333330;1.000000;,
  0.000000;1.000000;,
  0.666670;1.000000;,
  1.000000;1.000000;,
  0.333330;0.000000;,
  0.333330;0.333330;,
  0.000000;0.333330;,
  0.666670;0.000000;,
  0.666670;0.333330;,
  1.000000;0.333330;,
  0.333330;0.666670;,
  0.000000;0.666670;,
  0.666670;0.666670;,
  1.000000;0.666670;,
  0.333330;1.000000;,
  0.000000;1.000000;,
  0.666670;1.000000;,
  1.000000;1.000000;,
  0.000000;0.666670;,
  0.333330;0.666670;,
  0.333330;1.000000;,
  0.666670;0.666670;,
  0.666670;1.000000;,
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
  1.000000;0.000000;;
 }
}