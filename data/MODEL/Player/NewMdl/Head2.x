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
 196;
 0.00384;11.56811;4.78340;,
 1.17591;8.29786;-1.66522;,
 0.04006;9.01093;-1.59183;,
 0.00384;11.56811;4.78340;,
 2.05184;8.50808;-0.40670;,
 0.00384;11.56811;4.78340;,
 1.82947;8.17940;1.20115;,
 0.00384;11.56811;4.78340;,
 0.00403;9.30873;2.02083;,
 2.60700;6.76437;-3.24505;,
 0.04725;8.21124;-3.16115;,
 4.23753;7.00487;-0.59797;,
 2.79201;7.73044;2.55976;,
 -0.01777;8.51141;3.78274;,
 2.97977;5.87541;-2.85755;,
 0.07717;6.53994;-6.11385;,
 6.14229;7.31965;1.16096;,
 3.95026;6.89746;2.76889;,
 -0.05297;5.46378;4.09629;,
 2.57582;5.52827;-3.88077;,
 0.01510;5.48272;-6.98974;,
 5.01990;5.90975;-0.54311;,
 3.46003;5.43015;2.81012;,
 -0.05553;4.39409;5.35470;,
 -0.01561;5.81312;-0.48718;,
 -0.01561;5.81312;-0.48718;,
 -0.01561;5.81312;-0.48718;,
 -0.01561;5.81312;-0.48718;,
 0.00955;8.44722;-0.12983;,
 1.13875;7.88823;0.61786;,
 0.00687;8.14883;-1.77889;,
 0.00955;8.44722;-0.12983;,
 1.24613;8.14883;-0.12983;,
 0.00955;8.44722;-0.12983;,
 1.13875;8.14883;1.03623;,
 0.00955;8.44722;-0.12983;,
 0.00687;8.14883;1.51923;,
 2.06986;7.29923;-2.28443;,
 0.01342;6.89564;-3.17690;,
 2.91048;7.29923;-0.12983;,
 2.06986;7.29923;2.02477;,
 0.00687;7.29921;2.91723;,
 2.69201;6.02758;-2.94495;,
 0.00687;6.02758;-4.11101;,
 3.79032;6.02758;-0.12983;,
 2.69201;6.02758;2.68529;,
 0.00687;6.02758;3.85135;,
 2.91048;5.26720;-3.17690;,
 0.00687;5.67754;-4.77179;,
 3.87109;5.69099;-0.12983;,
 2.74179;4.52763;2.91723;,
 0.00687;4.52763;4.17937;,
 2.67046;2.50899;-2.54231;,
 0.05004;0.55185;-4.12886;,
 3.54809;3.02766;-0.12983;,
 2.69156;2.66879;2.68569;,
 0.00687;3.02766;3.85135;,
 1.53631;1.75605;-2.28443;,
 0.00687;2.05909;-2.68406;,
 2.51946;1.75605;-0.12983;,
 2.06986;1.75605;2.02477;,
 0.00687;1.75603;2.91723;,
 0.86720;0.90640;-1.29589;,
 0.00687;0.90639;-1.77889;,
 1.59369;0.90640;-0.12983;,
 1.13875;0.90640;1.03623;,
 0.00687;0.90639;1.51923;,
 0.00687;0.60804;-0.12983;,
 0.00687;0.60804;-0.12983;,
 0.00687;0.60804;-0.12983;,
 0.00687;0.60804;-0.12983;,
 0.00687;-0.37508;1.09869;,
 1.35132;0.82719;2.31359;,
 0.00687;0.57470;2.84201;,
 0.00687;-0.37508;1.09869;,
 1.92172;0.40172;1.02988;,
 0.00687;-0.37508;1.09869;,
 1.32317;0.01501;-0.25714;,
 0.00687;-0.37508;1.09869;,
 0.00687;-0.48121;-0.08819;,
 1.55726;1.76014;3.70480;,
 0.00687;2.90468;5.11640;,
 2.96577;0.97397;1.33281;,
 2.54632;0.43130;-1.55546;,
 0.00687;-0.35278;-1.72029;,
 2.50232;4.08654;4.11784;,
 0.00687;5.85131;5.22104;,
 3.43106;2.13411;1.40549;,
 2.58277;1.20050;-2.08845;,
 0.00687;0.44399;-2.97032;,
 3.08485;6.73258;3.22109;,
 0.00687;7.95700;4.51817;,
 3.82311;3.69744;-0.68675;,
 2.67046;2.50899;-2.54231;,
 0.05004;0.55185;-4.12886;,
 0.00687;3.73317;-0.74582;,
 0.00687;3.73317;-0.74582;,
 0.00687;3.73317;-0.74582;,
 0.00687;3.73317;-0.74582;,
 0.00384;11.56811;4.78340;,
 0.04006;9.01093;-1.59183;,
 -1.10564;8.32243;-1.69162;,
 0.00384;11.56811;4.78340;,
 -2.01386;8.54237;-0.44355;,
 0.00384;11.56811;4.78340;,
 -1.82500;8.20338;1.17534;,
 0.00384;11.56811;4.78340;,
 0.00403;9.30873;2.02083;,
 0.04725;8.21124;-3.16115;,
 -2.54111;6.80952;-3.29360;,
 -4.22020;7.06043;-0.65769;,
 -2.81825;7.76724;2.52013;,
 -0.01777;8.51141;3.78274;,
 0.07717;6.53994;-6.11385;,
 -2.93325;5.93358;-2.92009;,
 -6.14229;7.40450;1.06977;,
 -4.01372;6.94974;2.71264;,
 -0.05297;5.46378;4.09629;,
 0.01510;5.48272;-6.98974;,
 -2.54248;5.59129;-3.94853;,
 -5.04137;5.97990;-0.61855;,
 -3.54787;5.48838;2.74756;,
 -0.05553;4.39409;5.35470;,
 -0.01561;5.81312;-0.48718;,
 -0.01561;5.81312;-0.48718;,
 -0.01561;5.81312;-0.48718;,
 -0.01561;5.81312;-0.48718;,
 0.00955;8.44722;-0.12983;,
 0.00687;8.14883;-1.77889;,
 -1.12501;7.88823;0.61786;,
 0.00955;8.44722;-0.12983;,
 -1.22704;8.14883;-0.12983;,
 0.00955;8.44722;-0.12983;,
 -1.12501;8.14883;1.03623;,
 0.00955;8.44722;-0.12983;,
 0.00687;8.14883;1.51923;,
 0.01342;6.89564;-3.17690;,
 -2.05611;7.29923;-2.28443;,
 -2.89673;7.29923;-0.12983;,
 -2.05611;7.29923;2.02477;,
 0.00687;7.29921;2.91723;,
 0.00687;6.02758;-4.11101;,
 -2.67826;6.02758;-2.94495;,
 -3.77658;6.02758;-0.12983;,
 -2.10659;6.02758;2.68529;,
 0.00687;6.02758;3.85135;,
 0.00687;5.67754;-4.77179;,
 -2.89673;5.26720;-3.17690;,
 -3.85734;5.69099;-0.12983;,
 -2.72805;4.52763;2.91723;,
 0.00687;4.52763;4.17937;,
 -2.65955;2.66879;-2.54231;,
 -3.53434;3.02766;-0.12983;,
 -2.67826;3.02766;2.68529;,
 0.00687;3.02766;3.85135;,
 0.00687;2.05909;-2.68406;,
 -1.76942;1.75605;-2.28443;,
 -2.50571;1.75605;-0.12983;,
 -2.05611;1.75605;2.02477;,
 0.00687;1.75603;2.91723;,
 0.00687;0.90639;-1.77889;,
 -0.96771;0.90640;-1.29589;,
 -1.57994;0.90640;-0.12983;,
 -1.12501;0.90640;1.03623;,
 0.00687;0.90639;1.51923;,
 0.00687;0.60804;-0.12983;,
 0.00687;0.60804;-0.12983;,
 0.00687;0.60804;-0.12983;,
 0.00687;0.60804;-0.12983;,
 0.00687;-0.37508;1.09869;,
 0.00687;0.57470;2.84201;,
 -1.33758;0.82719;2.31359;,
 0.00687;-0.37508;1.09869;,
 -1.90797;0.40172;1.02988;,
 0.00687;-0.37508;1.09869;,
 -1.30942;0.01501;-0.25714;,
 0.00687;-0.37508;1.09869;,
 0.00687;-0.48121;-0.08819;,
 0.00687;2.90468;5.11640;,
 -1.54352;1.76014;3.70480;,
 -2.95202;0.97397;1.33281;,
 -2.53258;0.43130;-1.55546;,
 0.00687;-0.35278;-1.72029;,
 0.00687;5.85131;5.22104;,
 -2.48857;4.08654;4.11784;,
 -3.41731;2.13411;0.52733;,
 -2.56902;1.20050;-2.08845;,
 0.00687;0.44399;-2.97032;,
 0.00687;7.95700;4.51817;,
 -3.07110;6.73258;3.22109;,
 -3.80937;3.69744;-0.68675;,
 -2.65955;2.66879;-2.54231;,
 0.00687;3.73317;-0.74582;,
 0.00687;3.73317;-0.74582;,
 0.00687;3.73317;-0.74582;,
 0.00687;3.73317;-0.74582;;
 
 144;
 3;0,1,2;,
 3;3,4,1;,
 3;5,6,4;,
 3;7,8,6;,
 4;2,1,9,10;,
 4;1,4,11,9;,
 4;4,6,12,11;,
 4;6,8,13,12;,
 4;10,9,14,15;,
 4;9,11,16,14;,
 4;11,12,17,16;,
 4;12,13,18,17;,
 4;15,14,19,20;,
 4;14,16,21,19;,
 4;16,17,22,21;,
 4;17,18,23,22;,
 3;24,20,19;,
 3;25,19,21;,
 3;26,21,22;,
 3;27,22,23;,
 3;28,29,30;,
 3;31,32,29;,
 3;33,34,32;,
 3;35,36,34;,
 4;30,29,37,38;,
 4;29,32,39,37;,
 4;32,34,40,39;,
 4;34,36,41,40;,
 4;38,37,42,43;,
 4;37,39,44,42;,
 4;39,40,45,44;,
 4;40,41,46,45;,
 4;43,42,47,48;,
 4;42,44,49,47;,
 4;44,45,50,49;,
 4;45,46,51,50;,
 4;48,47,52,53;,
 4;47,49,54,52;,
 4;49,50,55,54;,
 4;50,51,56,55;,
 4;53,52,57,58;,
 4;52,54,59,57;,
 4;54,55,60,59;,
 4;55,56,61,60;,
 4;58,57,62,63;,
 4;57,59,64,62;,
 4;59,60,65,64;,
 4;60,61,66,65;,
 3;63,62,67;,
 3;62,64,68;,
 3;64,65,69;,
 3;65,66,70;,
 3;71,72,73;,
 3;74,75,72;,
 3;76,77,75;,
 3;78,79,77;,
 4;73,72,80,81;,
 4;72,75,82,80;,
 4;75,77,83,82;,
 4;77,79,84,83;,
 4;81,80,85,86;,
 4;80,82,87,85;,
 4;82,83,88,87;,
 4;83,84,89,88;,
 4;86,85,90,91;,
 4;85,87,92,90;,
 4;87,88,93,92;,
 4;88,89,94,93;,
 3;95,91,90;,
 3;96,90,92;,
 3;97,92,93;,
 3;98,93,94;,
 3;99,100,101;,
 3;102,101,103;,
 3;104,103,105;,
 3;106,105,107;,
 4;100,108,109,101;,
 4;101,109,110,103;,
 4;103,110,111,105;,
 4;105,111,112,107;,
 4;108,113,114,109;,
 4;109,114,115,110;,
 4;110,115,116,111;,
 4;111,116,117,112;,
 4;113,118,119,114;,
 4;114,119,120,115;,
 4;115,120,121,116;,
 4;116,121,122,117;,
 3;123,119,118;,
 3;124,120,119;,
 3;125,121,120;,
 3;126,122,121;,
 3;127,128,129;,
 3;130,129,131;,
 3;132,131,133;,
 3;134,133,135;,
 4;128,136,137,129;,
 4;129,137,138,131;,
 4;131,138,139,133;,
 4;133,139,140,135;,
 4;136,141,142,137;,
 4;137,142,143,138;,
 4;138,143,144,139;,
 4;139,144,145,140;,
 4;141,146,147,142;,
 4;142,147,148,143;,
 4;143,148,149,144;,
 4;144,149,150,145;,
 4;146,53,151,147;,
 4;147,151,152,148;,
 4;148,152,153,149;,
 4;149,153,154,150;,
 4;53,155,156,151;,
 4;151,156,157,152;,
 4;152,157,158,153;,
 4;153,158,159,154;,
 4;155,160,161,156;,
 4;156,161,162,157;,
 4;157,162,163,158;,
 4;158,163,164,159;,
 3;160,165,161;,
 3;161,166,162;,
 3;162,167,163;,
 3;163,168,164;,
 3;169,170,171;,
 3;172,171,173;,
 3;174,173,175;,
 3;176,175,177;,
 4;170,178,179,171;,
 4;171,179,180,173;,
 4;173,180,181,175;,
 4;175,181,182,177;,
 4;178,183,184,179;,
 4;179,184,185,180;,
 4;180,185,186,181;,
 4;181,186,187,182;,
 4;183,188,189,184;,
 4;184,189,190,185;,
 4;185,190,191,186;,
 4;186,191,94,187;,
 3;192,189,188;,
 3;193,190,189;,
 3;194,191,190;,
 3;195,94,191;;
 
 MeshMaterialList {
  22;
  144;
  11,
  11,
  0,
  4,
  11,
  0,
  11,
  0,
  0,
  0,
  11,
  4,
  11,
  11,
  4,
  3,
  11,
  3,
  3,
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
  4,
  4,
  0,
  0,
  0,
  0,
  0,
  0,
  11,
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
  0,
  0,
  0,
  0,
  11,
  11,
  0,
  0,
  11,
  11,
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
  0,
  4,
  11,
  0,
  11,
  0,
  0,
  0,
  11,
  4,
  11,
  11,
  4,
  3,
  11,
  3,
  3,
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
  4,
  4,
  0,
  0,
  0,
  0,
  0,
  0,
  11,
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
  0,
  0,
  0,
  0,
  11,
  11,
  0,
  0,
  11,
  11,
  0,
  11,
  11,
  11,
  11,
  11,
  11,
  11;;
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
  188;
  0.652503;0.733851;-0.188953;,
  0.472980;0.805486;-0.357046;,
  0.434826;0.819364;-0.373589;,
  0.445563;0.865900;-0.227355;,
  0.674414;0.714123;0.187597;,
  -0.191042;-0.759831;0.621418;,
  0.569680;0.641071;-0.514289;,
  0.575449;0.637220;-0.512648;,
  0.503586;0.834014;-0.225437;,
  0.399252;0.907449;0.130896;,
  0.425309;0.633653;0.646217;,
  0.665521;0.485602;-0.566809;,
  0.663702;0.476438;-0.576634;,
  0.570160;0.708199;-0.416379;,
  0.214435;0.975487;0.049416;,
  0.306163;0.313886;0.898743;,
  0.676519;0.520123;-0.521339;,
  0.662179;0.509081;-0.549869;,
  0.647083;0.497457;-0.577771;,
  0.312938;-0.949685;0.012955;,
  0.323297;0.363905;0.873528;,
  0.027681;-0.998099;-0.055067;,
  0.284143;0.958651;0.015827;,
  0.399116;0.874882;-0.274387;,
  -0.219815;-0.910950;-0.349071;,
  0.263950;0.940327;0.214745;,
  0.149999;0.924762;0.349737;,
  0.273544;0.771240;-0.574772;,
  0.222612;0.798592;-0.559190;,
  -0.557597;0.677134;-0.480183;,
  0.487622;0.745718;0.454015;,
  0.279595;0.709069;0.647339;,
  0.324860;0.626764;-0.708261;,
  0.622421;0.555866;-0.551005;,
  0.911690;0.410823;0.006754;,
  0.664831;0.390047;0.637073;,
  0.374335;0.374120;0.848474;,
  0.487968;0.251506;-0.835842;,
  0.772375;0.172518;-0.611289;,
  0.998270;0.058459;0.006360;,
  0.734475;0.022074;0.678277;,
  0.405090;0.007266;0.914248;,
  0.901573;-0.432516;-0.009788;,
  0.681360;-0.428266;0.593580;,
  0.348265;-0.408264;0.843820;,
  0.150772;-0.878987;0.452382;,
  0.442962;-0.874032;-0.199632;,
  0.674001;-0.737653;-0.039888;,
  0.501518;-0.756129;0.420415;,
  0.250417;-0.739641;0.624678;,
  0.149172;-0.888258;-0.434449;,
  0.277413;-0.901870;-0.331169;,
  0.414741;-0.908931;-0.042834;,
  0.287828;-0.925269;0.247045;,
  0.149983;-0.924787;0.349677;,
  0.137335;-0.990467;-0.010644;,
  0.361829;-0.891884;0.271335;,
  0.341359;-0.939789;0.016447;,
  0.288640;-0.796526;0.531256;,
  0.320627;-0.811907;0.487857;,
  0.383656;-0.881653;0.274765;,
  0.372903;-0.926116;0.057030;,
  0.355620;-0.860649;-0.364442;,
  0.361494;-0.501406;0.786075;,
  0.477616;-0.571748;0.667073;,
  0.697394;-0.662725;0.272831;,
  0.579221;-0.789243;-0.203956;,
  0.467370;-0.663384;-0.584368;,
  0.472652;0.020482;0.881011;,
  0.714252;-0.099392;0.692795;,
  0.957931;-0.262783;0.115383;,
  0.751837;-0.508626;-0.419572;,
  0.483398;0.229066;0.844900;,
  0.784280;0.103648;0.611688;,
  0.983984;-0.178214;0.003898;,
  0.777438;-0.428340;-0.460559;,
  -0.011926;0.785722;-0.618465;,
  -0.635228;0.745983;-0.199986;,
  -0.449095;0.814782;-0.366666;,
  -0.413556;0.826845;-0.381181;,
  -0.429573;0.872229;-0.233843;,
  -0.666585;0.724259;0.176391;,
  0.172522;-0.762469;0.623600;,
  -0.545554;0.650514;-0.528396;,
  -0.553355;0.648569;-0.522645;,
  -0.485119;0.843082;-0.232104;,
  -0.387182;0.913645;0.123866;,
  -0.425620;0.641151;0.638571;,
  -0.632991;0.523054;-0.570734;,
  -0.635270;0.509631;-0.580266;,
  -0.542920;0.727902;-0.418803;,
  -0.196420;0.979523;0.044204;,
  -0.315841;0.316417;0.894497;,
  -0.632457;0.583378;-0.509576;,
  -0.626074;0.558723;-0.543931;,
  -0.618545;0.533045;-0.577291;,
  -0.327516;-0.944807;0.008503;,
  -0.333370;0.362186;0.870451;,
  -0.043786;-0.997406;-0.057126;,
  -0.283160;0.958942;0.015837;,
  -0.397745;0.875650;-0.273928;,
  0.219934;-0.911450;-0.347689;,
  -0.263810;0.940505;0.214138;,
  -0.149951;0.924812;0.349625;,
  -0.272893;0.771569;-0.574640;,
  -0.221210;0.798337;-0.560111;,
  0.561960;0.672606;-0.481458;,
  -0.515071;0.703151;0.490185;,
  -0.308828;0.681555;0.663406;,
  -0.324368;0.627310;-0.708002;,
  -0.622210;0.556197;-0.550908;,
  -0.904202;0.422371;0.063410;,
  -0.644519;0.382484;0.662043;,
  -0.413877;0.371839;0.830928;,
  -0.487241;0.245801;-0.837960;,
  -0.771972;0.168121;-0.613020;,
  -0.994556;0.097394;0.037054;,
  -0.715410;0.075954;0.694564;,
  -0.429913;0.035975;0.902153;,
  -0.917349;-0.398082;-0.000984;,
  -0.692499;-0.392536;0.605278;,
  -0.374338;-0.374123;0.848471;,
  -0.265458;-0.906012;0.329657;,
  -0.487139;-0.844533;-0.222397;,
  -0.707904;-0.706004;-0.020749;,
  -0.524738;-0.726288;0.444021;,
  -0.279606;-0.709065;0.647339;,
  -0.131042;-0.891289;-0.434088;,
  -0.277137;-0.907081;-0.316859;,
  -0.421545;-0.906407;-0.026959;,
  -0.287829;-0.925269;0.247044;,
  -0.149984;-0.924787;0.349677;,
  -0.134458;-0.990900;-0.006189;,
  -0.361831;-0.891884;0.271334;,
  -0.341361;-0.939789;0.016447;,
  -0.288640;-0.796526;0.531256;,
  -0.320628;-0.811907;0.487857;,
  -0.383657;-0.881653;0.274764;,
  -0.372904;-0.926115;0.057030;,
  -0.355621;-0.860648;-0.364442;,
  -0.361495;-0.501406;0.786075;,
  -0.513201;-0.557736;0.652346;,
  -0.722367;-0.648485;0.240111;,
  -0.571514;-0.793811;-0.207932;,
  -0.473348;-0.645128;-0.599793;,
  -0.472654;0.020482;0.881010;,
  -0.742453;-0.085390;0.664433;,
  -0.964672;-0.251440;0.078646;,
  -0.748336;-0.503430;-0.431915;,
  0.564125;-0.418036;-0.712046;,
  -0.483399;0.229065;0.844899;,
  -0.788596;0.083647;0.609195;,
  -0.981331;-0.192293;-0.003552;,
  -0.787032;-0.402307;-0.467686;,
  0.022172;0.795790;-0.605167;,
  0.934162;0.301533;0.190837;,
  0.464038;0.857612;0.221745;,
  0.287979;0.262790;0.920874;,
  0.704497;-0.584907;0.401955;,
  0.274816;-0.951829;0.136003;,
  -0.043554;-0.997774;0.050492;,
  -0.011691;-0.997132;0.074769;,
  0.115351;-0.965437;-0.233722;,
  0.067637;0.989006;-0.131501;,
  0.726774;0.685461;0.044076;,
  -0.058748;-0.914367;0.400601;,
  0.187402;-0.729033;-0.658325;,
  0.046484;0.779111;-0.625160;,
  0.031682;0.785276;-0.618335;,
  0.016597;0.814920;-0.579335;,
  -0.055789;0.784662;-0.617408;,
  -0.505519;-0.022539;-0.862521;,
  -0.931619;0.318342;0.175343;,
  -0.455416;0.864287;0.213552;,
  -0.297370;0.269705;0.915877;,
  -0.720478;-0.573871;0.389339;,
  -0.290822;-0.948091;0.128628;,
  -0.008669;-0.997491;0.070256;,
  0.018044;-0.998545;0.050822;,
  -0.126569;-0.963729;-0.234961;,
  -0.065824;0.988920;-0.133057;,
  -0.751605;0.654828;0.079304;,
  -0.164265;-0.734902;-0.657978;,
  -0.031682;0.785276;-0.618335;,
  -0.046484;0.779111;-0.625160;,
  -0.016361;0.832890;-0.553197;,
  0.076558;0.803845;-0.589891;,
  0.167163;0.719305;-0.674282;;
  144;
  3;0,2,1;,
  3;0,3,2;,
  3;0,4,155;,
  3;5,5,5;,
  4;1,2,7,6;,
  4;2,3,8,7;,
  4;3,4,9,8;,
  4;4,156,10,9;,
  4;6,7,12,11;,
  4;7,8,13,12;,
  4;8,9,14,13;,
  4;157,10,15,15;,
  4;11,12,17,16;,
  4;12,13,18,17;,
  4;158,158,19,159;,
  4;15,15,20,20;,
  3;21,160,161;,
  3;21,161,159;,
  3;21,159,19;,
  3;21,19,162;,
  3;22,23,23;,
  3;24,24,24;,
  3;22,25,163;,
  3;22,26,25;,
  4;23,23,28,27;,
  4;29,163,29,28;,
  4;163,25,30,164;,
  4;25,26,31,30;,
  4;27,28,33,32;,
  4;28,164,34,33;,
  4;164,30,35,34;,
  4;30,31,36,35;,
  4;32,33,38,37;,
  4;33,34,39,38;,
  4;34,35,40,39;,
  4;35,36,41,40;,
  4;37,38,75,149;,
  4;38,39,42,75;,
  4;39,40,43,42;,
  4;40,41,44,43;,
  4;165,45,46,45;,
  4;75,42,47,46;,
  4;42,43,48,47;,
  4;43,44,49,48;,
  4;166,46,51,50;,
  4;46,47,52,51;,
  4;47,48,53,52;,
  4;48,49,54,53;,
  3;50,51,55;,
  3;51,52,55;,
  3;52,53,55;,
  3;53,54,55;,
  3;56,59,58;,
  3;56,60,59;,
  3;56,61,60;,
  3;56,57,61;,
  4;58,59,64,63;,
  4;59,60,65,64;,
  4;60,61,66,65;,
  4;61,57,62,66;,
  4;63,64,69,68;,
  4;64,65,70,69;,
  4;65,66,71,70;,
  4;66,62,67,71;,
  4;68,69,73,72;,
  4;69,70,74,73;,
  4;70,71,75,74;,
  4;71,67,149,75;,
  3;76,167,168;,
  3;76,168,169;,
  3;76,169,170;,
  3;76,170,171;,
  3;77,78,79;,
  3;77,79,80;,
  3;77,172,81;,
  3;82,82,82;,
  4;78,83,84,79;,
  4;79,84,85,80;,
  4;80,85,86,81;,
  4;81,86,87,173;,
  4;83,88,89,84;,
  4;84,89,90,85;,
  4;85,90,91,86;,
  4;174,92,92,87;,
  4;88,93,94,89;,
  4;89,94,95,90;,
  4;175,176,96,175;,
  4;92,97,97,92;,
  3;98,177,178;,
  3;98,176,177;,
  3;98,96,176;,
  3;98,179,96;,
  3;99,100,100;,
  3;101,101,101;,
  3;99,180,102;,
  3;99,102,103;,
  4;100,104,105,100;,
  4;106,105,106,180;,
  4;180,181,107,102;,
  4;102,107,108,103;,
  4;104,109,110,105;,
  4;105,110,111,181;,
  4;181,111,112,107;,
  4;107,112,113,108;,
  4;109,114,115,110;,
  4;110,115,116,111;,
  4;111,116,117,112;,
  4;112,117,118,113;,
  4;114,171,153,115;,
  4;115,153,119,116;,
  4;116,119,120,117;,
  4;117,120,121,118;,
  4;165,122,123,122;,
  4;153,123,124,119;,
  4;119,124,125,120;,
  4;120,125,126,121;,
  4;182,127,128,123;,
  4;123,128,129,124;,
  4;124,129,130,125;,
  4;125,130,131,126;,
  3;127,132,128;,
  3;128,132,129;,
  3;129,132,130;,
  3;130,132,131;,
  3;133,135,136;,
  3;133,136,137;,
  3;133,137,138;,
  3;133,138,134;,
  4;135,140,141,136;,
  4;136,141,142,137;,
  4;137,142,143,138;,
  4;138,143,139,134;,
  4;140,145,146,141;,
  4;141,146,147,142;,
  4;142,147,148,143;,
  4;143,148,144,139;,
  4;145,150,151,146;,
  4;146,151,152,147;,
  4;147,152,153,148;,
  4;148,153,171,144;,
  3;154,183,184;,
  3;154,185,183;,
  3;154,186,185;,
  3;154,187,186;;
 }
 MeshTextureCoords {
  196;
  0.062500;0.000000;,
  0.125000;0.125000;,
  0.000000;0.125000;,
  0.187500;0.000000;,
  0.250000;0.125000;,
  0.312500;0.000000;,
  0.375000;0.125000;,
  0.437500;0.000000;,
  0.500000;0.125000;,
  0.125000;0.250000;,
  0.000000;0.250000;,
  0.250000;0.250000;,
  0.375000;0.250000;,
  0.500000;0.250000;,
  0.125000;0.375000;,
  0.000000;0.375000;,
  0.250000;0.375000;,
  0.375000;0.375000;,
  0.500000;0.375000;,
  0.125000;0.500000;,
  0.000000;0.500000;,
  0.250000;0.500000;,
  0.375000;0.500000;,
  0.500000;0.500000;,
  0.062500;0.625000;,
  0.187500;0.625000;,
  0.312500;0.625000;,
  0.437500;0.625000;,
  0.062500;0.000000;,
  0.125000;0.125000;,
  0.000000;0.125000;,
  0.187500;0.000000;,
  0.250000;0.125000;,
  0.312500;0.000000;,
  0.375000;0.125000;,
  0.437500;0.000000;,
  0.500000;0.125000;,
  0.125000;0.250000;,
  0.000000;0.250000;,
  0.250000;0.250000;,
  0.375000;0.250000;,
  0.500000;0.250000;,
  0.125000;0.375000;,
  0.000000;0.375000;,
  0.250000;0.375000;,
  0.375000;0.375000;,
  0.500000;0.375000;,
  0.125000;0.500000;,
  0.000000;0.500000;,
  0.250000;0.500000;,
  0.375000;0.500000;,
  0.500000;0.500000;,
  0.125000;0.625000;,
  0.000000;0.625000;,
  0.250000;0.625000;,
  0.375000;0.625000;,
  0.500000;0.625000;,
  0.125000;0.750000;,
  0.000000;0.750000;,
  0.250000;0.750000;,
  0.375000;0.750000;,
  0.500000;0.750000;,
  0.125000;0.875000;,
  0.000000;0.875000;,
  0.250000;0.875000;,
  0.375000;0.875000;,
  0.500000;0.875000;,
  0.062500;1.000000;,
  0.187500;1.000000;,
  0.312500;1.000000;,
  0.437500;1.000000;,
  0.562500;0.000000;,
  0.625000;0.125000;,
  0.500000;0.125000;,
  0.687500;0.000000;,
  0.750000;0.125000;,
  0.812500;0.000000;,
  0.875000;0.125000;,
  0.937500;0.000000;,
  1.000000;0.125000;,
  0.625000;0.250000;,
  0.500000;0.250000;,
  0.750000;0.250000;,
  0.875000;0.250000;,
  1.000000;0.250000;,
  0.625000;0.375000;,
  0.500000;0.375000;,
  0.750000;0.375000;,
  0.875000;0.375000;,
  1.000000;0.375000;,
  0.625000;0.500000;,
  0.500000;0.500000;,
  0.750000;0.500000;,
  0.875000;0.500000;,
  1.000000;0.500000;,
  0.562500;0.625000;,
  0.687500;0.625000;,
  0.812500;0.625000;,
  0.937500;0.625000;,
  0.062500;0.000000;,
  0.000000;0.125000;,
  0.125000;0.125000;,
  0.187500;0.000000;,
  0.250000;0.125000;,
  0.312500;0.000000;,
  0.375000;0.125000;,
  0.437500;0.000000;,
  0.500000;0.125000;,
  0.000000;0.250000;,
  0.125000;0.250000;,
  0.250000;0.250000;,
  0.375000;0.250000;,
  0.500000;0.250000;,
  0.000000;0.375000;,
  0.125000;0.375000;,
  0.250000;0.375000;,
  0.375000;0.375000;,
  0.500000;0.375000;,
  0.000000;0.500000;,
  0.125000;0.500000;,
  0.250000;0.500000;,
  0.375000;0.500000;,
  0.500000;0.500000;,
  0.062500;0.625000;,
  0.187500;0.625000;,
  0.312500;0.625000;,
  0.437500;0.625000;,
  0.062500;0.000000;,
  0.000000;0.125000;,
  0.125000;0.125000;,
  0.187500;0.000000;,
  0.250000;0.125000;,
  0.312500;0.000000;,
  0.375000;0.125000;,
  0.437500;0.000000;,
  0.500000;0.125000;,
  0.000000;0.250000;,
  0.125000;0.250000;,
  0.250000;0.250000;,
  0.375000;0.250000;,
  0.500000;0.250000;,
  0.000000;0.375000;,
  0.125000;0.375000;,
  0.250000;0.375000;,
  0.375000;0.375000;,
  0.500000;0.375000;,
  0.000000;0.500000;,
  0.125000;0.500000;,
  0.250000;0.500000;,
  0.375000;0.500000;,
  0.500000;0.500000;,
  0.125000;0.625000;,
  0.250000;0.625000;,
  0.375000;0.625000;,
  0.500000;0.625000;,
  0.000000;0.750000;,
  0.125000;0.750000;,
  0.250000;0.750000;,
  0.375000;0.750000;,
  0.500000;0.750000;,
  0.000000;0.875000;,
  0.125000;0.875000;,
  0.250000;0.875000;,
  0.375000;0.875000;,
  0.500000;0.875000;,
  0.062500;1.000000;,
  0.187500;1.000000;,
  0.312500;1.000000;,
  0.437500;1.000000;,
  0.562500;0.000000;,
  0.500000;0.125000;,
  0.625000;0.125000;,
  0.687500;0.000000;,
  0.750000;0.125000;,
  0.812500;0.000000;,
  0.875000;0.125000;,
  0.937500;0.000000;,
  1.000000;0.125000;,
  0.500000;0.250000;,
  0.625000;0.250000;,
  0.750000;0.250000;,
  0.875000;0.250000;,
  1.000000;0.250000;,
  0.500000;0.375000;,
  0.625000;0.375000;,
  0.750000;0.375000;,
  0.875000;0.375000;,
  1.000000;0.375000;,
  0.500000;0.500000;,
  0.625000;0.500000;,
  0.750000;0.500000;,
  0.875000;0.500000;,
  0.562500;0.625000;,
  0.687500;0.625000;,
  0.812500;0.625000;,
  0.937500;0.625000;;
 }
}