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
 144;
 -1.05000;0.40000;-1.45000;,
 -0.85791;0.32721;-1.25790;,
 -1.04092;-0.63872;-1.44091;,
 -1.23302;-0.56592;-1.63301;,
 -1.08120;-1.59717;-1.61818;,
 -1.26397;-1.52074;-1.80893;,
 -0.66581;0.25442;-1.06580;,
 -0.84882;-0.71151;-1.24882;,
 -0.89843;-1.67360;-1.42744;,
 -1.26397;-1.52074;-1.80893;,
 -1.08120;-1.59717;-1.61818;,
 -1.23269;-1.72577;-1.36121;,
 -1.42884;-1.61317;-1.56592;,
 -1.47932;-1.59717;-1.20354;,
 -1.66209;-1.52074;-1.39429;,
 -0.89843;-1.67360;-1.42744;,
 -1.03654;-1.83837;-1.15650;,
 -1.29655;-1.67360;-1.01280;,
 -1.66209;-1.52074;-1.39429;,
 -1.47932;-1.59717;-1.20354;,
 -1.43867;-0.63872;-1.04317;,
 -1.63076;-0.56592;-1.23526;,
 -1.25566;0.32721;-0.86015;,
 -1.44775;0.40000;-1.05225;,
 -1.29655;-1.67360;-1.01280;,
 -1.24657;-0.71151;-0.85107;,
 -1.06356;0.25442;-0.66806;,
 -1.44775;0.40000;-1.05225;,
 -1.25566;0.32721;-0.86015;,
 -1.10678;0.44968;-1.10903;,
 -1.31294;0.55692;-1.31519;,
 -0.85791;0.32721;-1.25790;,
 -1.05000;0.40000;-1.45000;,
 -1.06356;0.25442;-0.66806;,
 -0.90062;0.34244;-0.90287;,
 -0.66581;0.25442;-1.06580;,
 -1.31294;0.55692;-1.31519;,
 -1.44595;-0.53148;-1.44820;,
 -1.42884;-1.61317;-1.56592;,
 -1.05000;0.40000;-1.45000;,
 -1.23302;-0.56592;-1.63301;,
 -1.26397;-1.52074;-1.80893;,
 -0.90062;0.34244;-0.90287;,
 -1.03363;-0.74595;-1.03588;,
 -1.03654;-1.83837;-1.15650;,
 -0.66581;0.25442;-1.06580;,
 -0.84882;-0.71151;-1.24882;,
 -0.89843;-1.67360;-1.42744;,
 -0.89013;-0.93044;-1.59402;,
 -0.75558;-1.29417;-1.45360;,
 -0.98863;-1.50417;-1.69682;,
 -1.12319;-1.14044;-1.83725;,
 -1.15779;-1.65659;-1.87336;,
 -1.20784;-1.42899;-1.92560;,
 -0.79744;-1.71475;-1.49728;,
 -0.61670;-2.50959;-1.30866;,
 -0.80516;-2.30466;-1.50534;,
 -1.20784;-1.42899;-1.92560;,
 -1.15779;-1.65659;-1.87336;,
 -1.51640;-1.72463;-1.65731;,
 -1.56645;-1.49703;-1.70955;,
 -1.72400;-1.65659;-1.28365;,
 -1.77405;-1.42899;-1.33589;,
 -0.80516;-2.30466;-1.50534;,
 -1.16378;-2.37270;-1.28929;,
 -1.37138;-2.30466;-0.91563;,
 -1.77405;-1.42899;-1.33589;,
 -1.72400;-1.65659;-1.28365;,
 -1.55485;-1.50417;-1.10712;,
 -1.68940;-1.14044;-1.24754;,
 -1.32179;-1.29417;-0.86389;,
 -1.45635;-0.93044;-1.00431;,
 -1.37138;-2.30466;-0.91563;,
 -1.18292;-2.50959;-0.71895;,
 -1.36365;-1.71475;-0.90757;,
 -1.45635;-0.93044;-1.00431;,
 -1.32179;-1.29417;-0.86389;,
 -1.11420;-1.36221;-1.23755;,
 -1.24875;-0.99848;-1.37797;,
 -0.75558;-1.29417;-1.45360;,
 -0.89013;-0.93044;-1.59402;,
 -1.36365;-1.71475;-0.90757;,
 -1.15605;-1.78279;-1.28123;,
 -0.79744;-1.71475;-1.49728;,
 -1.24875;-0.99848;-1.37797;,
 -1.48180;-1.20848;-1.62120;,
 -1.56645;-1.49703;-1.70955;,
 -0.89013;-0.93044;-1.59402;,
 -1.12319;-1.14044;-1.83725;,
 -1.20784;-1.42899;-1.92560;,
 -1.15605;-1.78279;-1.28123;,
 -0.97532;-2.57763;-1.09261;,
 -1.16378;-2.37270;-1.28929;,
 -0.79744;-1.71475;-1.49728;,
 -0.61670;-2.50959;-1.30866;,
 -0.80516;-2.30466;-1.50534;,
 -1.18818;0.20950;-1.64120;,
 -1.12984;0.51739;-1.58287;,
 -0.40705;0.25857;-0.93963;,
 -0.47568;-0.10365;-1.00826;,
 0.27596;-0.00025;-0.25662;,
 0.20733;-0.36247;-0.32524;,
 -1.07150;0.82528;-1.52453;,
 -0.33842;0.62079;-0.87100;,
 0.34459;0.36197;-0.18798;,
 0.20733;-0.36247;-0.32524;,
 0.27596;-0.00025;-0.25662;,
 0.01080;-0.00025;0.00855;,
 -0.05783;-0.36247;-0.06008;,
 -0.25437;-0.00025;0.27372;,
 -0.32300;-0.36247;0.20509;,
 0.34459;0.36197;-0.18798;,
 0.07942;0.36197;0.07718;,
 -0.18574;0.36197;0.34235;,
 -0.32300;-0.36247;0.20509;,
 -0.25437;-0.00025;0.27372;,
 -0.93738;0.25857;-0.40930;,
 -1.00601;-0.10365;-0.47793;,
 -1.58062;0.51739;-1.13209;,
 -1.63896;0.20950;-1.19042;,
 -0.18574;0.36197;0.34235;,
 -0.86875;0.62079;-0.34067;,
 -1.52228;0.82528;-1.07375;,
 -1.63896;0.20950;-1.19042;,
 -1.58062;0.51739;-1.13209;,
 -1.58507;0.86437;-1.57300;,
 -1.41357;0.20950;-1.41581;,
 -1.12984;0.51739;-1.58287;,
 -1.18818;0.20950;-1.64120;,
 -1.52228;0.82528;-1.07375;,
 -1.29689;0.82528;-1.29914;,
 -1.07150;0.82528;-1.52453;,
 -1.41357;0.20950;-1.41581;,
 -0.74085;-0.10365;-0.74309;,
 -0.05783;-0.36247;-0.06008;,
 -1.18818;0.20950;-1.64120;,
 -0.47568;-0.10365;-1.00826;,
 0.20733;-0.36247;-0.32524;,
 -1.29689;0.82528;-1.29914;,
 -0.60359;0.62079;-0.60583;,
 0.07942;0.36197;0.07718;,
 -1.07150;0.82528;-1.52453;,
 -0.33842;0.62079;-0.87100;,
 0.34459;0.36197;-0.18798;;
 
 72;
 4;0,1,2,3;,
 4;3,2,4,5;,
 4;1,6,7,2;,
 4;2,7,8,4;,
 4;9,10,11,12;,
 4;12,11,13,14;,
 4;10,15,16,11;,
 4;11,16,17,13;,
 4;18,19,20,21;,
 4;21,20,22,23;,
 4;19,24,25,20;,
 4;20,25,26,22;,
 4;27,28,29,30;,
 4;30,29,31,32;,
 4;28,33,34,29;,
 4;29,34,35,31;,
 4;27,36,37,21;,
 4;21,37,38,14;,
 4;36,39,40,37;,
 4;37,40,41,38;,
 4;42,33,25,43;,
 4;43,25,17,44;,
 4;45,42,43,46;,
 4;46,43,44,47;,
 4;48,49,50,51;,
 4;51,50,52,53;,
 4;49,54,55,50;,
 4;50,55,56,52;,
 4;57,58,59,60;,
 4;60,59,61,62;,
 4;58,63,64,59;,
 4;59,64,65,61;,
 4;66,67,68,69;,
 4;69,68,70,71;,
 4;67,72,73,68;,
 4;68,73,74,70;,
 4;75,76,77,78;,
 4;78,77,79,80;,
 4;76,81,82,77;,
 4;77,82,83,79;,
 4;75,84,85,69;,
 4;69,85,86,62;,
 4;84,87,88,85;,
 4;85,88,89,86;,
 4;90,81,73,91;,
 4;91,73,65,92;,
 4;93,90,91,94;,
 4;94,91,92,95;,
 4;96,97,98,99;,
 4;99,98,100,101;,
 4;97,102,103,98;,
 4;98,103,104,100;,
 4;105,106,107,108;,
 4;108,107,109,110;,
 4;106,111,112,107;,
 4;107,112,113,109;,
 4;114,115,116,117;,
 4;117,116,118,119;,
 4;115,120,121,116;,
 4;116,121,122,118;,
 4;123,124,125,126;,
 4;126,125,127,128;,
 4;124,129,130,125;,
 4;125,130,131,127;,
 4;123,132,133,117;,
 4;117,133,134,110;,
 4;132,135,136,133;,
 4;133,136,137,134;,
 4;138,129,121,139;,
 4;139,121,113,140;,
 4;141,138,139,142;,
 4;142,139,140,143;;
 
 MeshMaterialList {
  10;
  72;
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
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
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
   0.235200;0.235200;0.235200;1.000000;;
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
   0.096900;0.096900;0.096900;1.000000;;
   12.000000;
   0.100000;0.100000;0.100000;;
   0.011400;0.011400;0.011400;;
  }
  Material {
   0.605600;0.605600;0.605600;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.000000;0.266400;0.620800;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.150400;0.392000;0.530400;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.336000;0.480000;0.674400;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.109600;0.000000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.354400;0.800000;0.106400;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
 }
 MeshNormals {
  150;
  0.707115;-0.000007;-0.707099;,
  0.719518;0.048901;-0.692750;,
  0.707107;-0.000000;-0.707107;,
  0.719264;0.047358;-0.693121;,
  0.707099;0.000007;-0.707115;,
  0.719008;0.045815;-0.693491;,
  0.729941;0.097674;-0.676495;,
  -0.232725;-0.946163;-0.224977;,
  0.729560;0.094594;-0.677343;,
  -0.232465;-0.946171;-0.225212;,
  0.729172;0.091513;-0.678184;,
  -0.232197;-0.946179;-0.225455;,
  -0.426449;-0.904302;-0.019478;,
  -0.718581;-0.043055;0.694109;,
  -0.452983;-0.891437;0.012058;,
  -0.718323;-0.041519;0.694470;,
  -0.478674;-0.876911;0.043570;,
  -0.718063;-0.039982;0.694829;,
  -0.707116;-0.000000;0.707097;,
  0.213485;0.953336;0.213481;,
  -0.707107;-0.000004;0.707106;,
  0.213496;0.953332;0.213491;,
  -0.707099;-0.000007;0.707115;,
  0.213507;0.953327;0.213500;,
  -0.703237;0.159208;-0.692900;,
  0.697513;-0.168539;0.696470;,
  0.722040;0.000002;-0.691851;,
  0.722043;-0.000001;-0.691848;,
  0.722047;0.000002;-0.691844;,
  0.722042;-0.000003;-0.691849;,
  0.722054;0.000002;-0.691837;,
  0.722041;-0.000006;-0.691850;,
  0.722047;-0.000003;-0.691844;,
  -0.718678;0.051817;-0.693410;,
  0.722038;-0.000009;-0.691854;,
  -0.635379;-0.467637;-0.614499;,
  0.722029;-0.000014;-0.691863;,
  -0.502843;-0.714646;-0.486240;,
  -0.869105;0.050453;-0.492048;,
  -0.722045;-0.000005;0.691847;,
  -0.816012;-0.441628;-0.372947;,
  -0.722043;0.000002;0.691848;,
  -0.688027;-0.677966;-0.258806;,
  -0.722042;0.000010;0.691850;,
  -0.722042;-0.000014;0.691849;,
  0.633927;0.471250;0.613237;,
  -0.722046;-0.000005;0.691845;,
  0.708804;0.170055;0.684601;,
  -0.722050;0.000004;0.691841;,
  0.716702;0.085249;0.692150;,
  -0.546875;0.651378;-0.525960;,
  0.682972;0.312023;0.660448;,
  0.667627;0.014526;-0.744354;,
  0.687639;0.007260;-0.726017;,
  0.667630;0.014531;-0.744352;,
  0.687641;0.007268;-0.726015;,
  0.667632;0.014536;-0.744350;,
  0.687643;0.007275;-0.726013;,
  0.707107;-0.000010;-0.707106;,
  0.683016;-0.258817;0.683010;,
  0.707109;-0.000001;-0.707104;,
  0.707111;0.000008;-0.707103;,
  0.683012;-0.258821;0.683012;,
  -0.726015;0.007277;0.687640;,
  0.683016;-0.258817;0.683010;,
  -0.726016;0.007274;0.687639;,
  0.683020;-0.258813;0.683007;,
  -0.726017;0.007272;0.687638;,
  -0.744345;0.014546;0.667636;,
  -0.709115;-0.018025;-0.704862;,
  -0.781032;0.300149;0.547630;,
  -0.554283;0.230324;-0.799825;,
  -0.768305;0.449002;0.456185;,
  -0.116099;0.981376;0.153042;,
  -0.202126;-0.958274;-0.202126;,
  0.163755;0.972815;0.163756;,
  -0.020032;-0.910902;-0.412137;,
  0.013149;-0.898790;-0.438183;,
  0.046304;-0.884947;-0.463384;,
  -0.728498;-0.086017;0.679626;,
  -0.728095;-0.082951;0.680438;,
  -0.727685;-0.079883;0.681244;,
  -0.054259;0.889945;0.452828;,
  -0.022655;0.903761;0.427438;,
  0.427443;0.903758;-0.022659;,
  0.452837;0.889941;-0.054257;,
  0.008992;0.915918;0.401264;,
  0.401266;0.915918;0.008981;,
  -0.841598;0.209911;-0.497645;,
  -0.690354;0.216410;-0.690346;,
  -0.765292;0.160132;-0.623447;,
  -0.713436;0.103098;-0.693095;,
  -0.670523;0.106489;-0.734207;,
  -0.497654;0.209914;-0.841592;,
  -0.634909;0.156895;-0.756488;,
  -0.753821;0.099342;-0.649527;,
  0.690527;-0.215248;0.690537;,
  0.734278;-0.214808;0.643967;,
  0.641886;-0.174828;0.746604;,
  0.536226;-0.131235;0.833810;,
  0.703017;-0.120443;0.700900;,
  0.643956;-0.214810;0.734287;,
  0.749245;-0.161292;0.642353;,
  0.837750;-0.104159;0.536028;,
  -0.522334;0.049899;-0.851280;,
  -0.396342;-0.450762;-0.799829;,
  -0.273681;-0.688880;-0.671225;,
  -0.722047;0.000003;0.691844;,
  -0.722040;0.000009;0.691851;,
  -0.722033;0.000016;0.691858;,
  0.814810;0.444909;0.371672;,
  0.874882;0.161302;0.456688;,
  0.485754;0.165245;0.858334;,
  0.394870;0.454346;0.798528;,
  0.877465;0.081016;0.472748;,
  0.502630;0.083167;0.860492;,
  -0.381841;0.848398;-0.366631;,
  -0.381842;0.848399;-0.366627;,
  -0.610044;0.647426;-0.456822;,
  -0.381842;0.848400;-0.366624;,
  -0.478960;0.649611;-0.590426;,
  0.857019;0.295108;0.422410;,
  -0.432476;-0.798897;-0.418006;,
  -0.615617;-0.761346;-0.203393;,
  0.449342;0.301717;0.840868;,
  -0.214301;-0.771729;-0.598756;,
  0.683020;-0.258813;0.683008;,
  0.683016;-0.258817;0.683010;,
  0.683012;-0.258821;0.683012;,
  -0.707111;0.000002;0.707102;,
  -0.707112;0.000002;0.707102;,
  -0.707112;0.000002;0.707102;,
  -0.871158;-0.020599;-0.490570;,
  -0.323302;0.341911;-0.882368;,
  -0.495885;-0.014149;-0.868273;,
  -0.612443;0.778381;0.137971;,
  -0.100038;0.644373;-0.758140;,
  -0.221081;-0.949867;-0.221081;,
  -0.221081;-0.949867;-0.221081;,
  -0.202126;-0.958274;-0.202126;,
  -0.183013;-0.965926;-0.183013;,
  -0.221081;-0.949867;-0.221081;,
  -0.202126;-0.958274;-0.202126;,
  0.144368;0.978936;0.144368;,
  0.163756;0.972815;0.163755;,
  0.183015;0.965926;0.183012;,
  0.183013;0.965926;0.183013;,
  0.144368;0.978936;0.144368;,
  0.163755;0.972815;0.163756;,
  0.183012;0.965926;0.183015;;
  72;
  4;0,2,3,1;,
  4;1,3,8,6;,
  4;2,4,5,3;,
  4;3,5,10,8;,
  4;76,77,9,7;,
  4;7,9,14,12;,
  4;77,78,11,9;,
  4;9,11,16,14;,
  4;79,80,15,13;,
  4;13,15,20,18;,
  4;80,81,17,15;,
  4;15,17,22,20;,
  4;82,83,21,19;,
  4;19,21,84,85;,
  4;83,86,23,21;,
  4;21,23,87,84;,
  4;88,89,24,90;,
  4;90,24,91,92;,
  4;89,93,94,24;,
  4;24,94,95,91;,
  4;96,97,98,25;,
  4;25,98,99,100;,
  4;101,96,25,102;,
  4;102,25,100,103;,
  4;26,28,29,27;,
  4;27,29,34,32;,
  4;28,30,31,29;,
  4;29,31,36,34;,
  4;104,105,35,33;,
  4;33,35,40,38;,
  4;105,106,37,35;,
  4;35,37,42,40;,
  4;107,108,41,39;,
  4;39,41,46,44;,
  4;108,109,43,41;,
  4;41,43,48,46;,
  4;110,111,47,45;,
  4;45,47,112,113;,
  4;111,114,49,47;,
  4;47,49,115,112;,
  4;116,117,50,118;,
  4;118,50,33,38;,
  4;117,119,120,50;,
  4;50,120,104,33;,
  4;49,114,121,51;,
  4;122,123,42,37;,
  4;115,49,51,124;,
  4;125,122,37,106;,
  4;52,54,55,53;,
  4;53,55,60,58;,
  4;54,56,57,55;,
  4;55,57,61,60;,
  4;126,127,59,59;,
  4;59,59,64,62;,
  4;127,128,59,59;,
  4;59,59,66,64;,
  4;129,130,65,63;,
  4;63,65,70,68;,
  4;130,131,67,65;,
  4;65,67,72,70;,
  4;132,132,71,69;,
  4;69,71,133,134;,
  4;70,72,73,135;,
  4;71,136,136,133;,
  4;137,138,74,139;,
  4;139,74,140,140;,
  4;138,141,142,74;,
  4;74,142,140,140;,
  4;73,143,144,75;,
  4;75,144,145,146;,
  4;147,73,75,148;,
  4;148,75,146,149;;
 }
 MeshTextureCoords {
  144;
  0.000000;0.000000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  0.500000;0.000000;,
  1.000000;0.500000;,
  1.000000;0.000000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  0.500000;0.000000;,
  1.000000;0.500000;,
  1.000000;0.000000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  0.500000;0.000000;,
  1.000000;0.500000;,
  1.000000;0.000000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  0.500000;0.000000;,
  1.000000;0.500000;,
  1.000000;0.000000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  1.000000;0.500000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  1.000000;0.500000;,
  0.000000;0.000000;,
  0.500000;0.000000;,
  1.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  0.500000;0.000000;,
  1.000000;0.500000;,
  1.000000;0.000000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  0.500000;0.000000;,
  1.000000;0.500000;,
  1.000000;0.000000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  0.500000;0.000000;,
  1.000000;0.500000;,
  1.000000;0.000000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  0.500000;0.000000;,
  1.000000;0.500000;,
  1.000000;0.000000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  1.000000;0.500000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  1.000000;0.500000;,
  0.000000;0.000000;,
  0.500000;0.000000;,
  1.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  0.500000;0.000000;,
  1.000000;0.500000;,
  1.000000;0.000000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  0.500000;0.000000;,
  1.000000;0.500000;,
  1.000000;0.000000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  0.500000;0.000000;,
  1.000000;0.500000;,
  1.000000;0.000000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  0.500000;0.000000;,
  1.000000;0.500000;,
  1.000000;0.000000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  1.000000;0.500000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  1.000000;0.500000;,
  0.000000;0.000000;,
  0.500000;0.000000;,
  1.000000;0.000000;;
 }
}
