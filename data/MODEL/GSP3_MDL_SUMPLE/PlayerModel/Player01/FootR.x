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
 156;
 0.37500;0.00000;0.43032;,
 0.03398;0.00005;0.43037;,
 0.58299;-0.40865;1.11736;,
 0.56981;-0.19567;0.59706;,
 -0.00149;0.00028;0.43037;,
 -0.00085;-0.23220;1.03545;,
 0.56365;-0.60449;1.13125;,
 0.73828;-0.60909;0.78866;,
 -0.00150;-0.60563;1.04015;,
 -0.00167;-0.01891;-1.00693;,
 0.04143;-0.01914;-1.00693;,
 0.33642;-0.24695;-1.54056;,
 -0.00178;-0.23494;-1.63661;,
 0.37484;-0.01778;-0.90119;,
 0.48671;-0.21701;-1.00194;,
 0.33643;-0.64849;-2.16624;,
 -0.00190;-0.64859;-2.17729;,
 0.66857;-0.63416;-1.08944;,
 0.37488;-0.01370;-0.59540;,
 0.37493;-0.00820;-0.18382;,
 0.55952;-0.20506;-0.10677;,
 0.48671;-0.21701;-1.00194;,
 0.37493;-0.00751;-0.13207;,
 0.45843;-0.27647;-0.01600;,
 0.37500;0.00000;0.43032;,
 0.56981;-0.19567;0.59706;,
 0.74139;-0.62043;-0.06050;,
 0.66857;-0.63416;-1.08944;,
 0.62691;-0.61604;0.26718;,
 0.73828;-0.60909;0.78866;,
 0.37484;-0.01778;-0.90119;,
 0.04143;-0.01914;-1.00693;,
 0.10740;0.03126;-0.52350;,
 0.37488;-0.01370;-0.59540;,
 -0.00161;0.03150;-0.52349;,
 0.03391;0.03579;-0.18435;,
 0.37493;-0.00820;-0.18382;,
 -0.00156;0.03603;-0.18435;,
 0.03397;0.04227;0.30050;,
 0.37493;-0.00751;-0.13207;,
 -0.00150;0.04250;0.30051;,
 0.03398;0.00005;0.43037;,
 0.37500;0.00000;0.43032;,
 -0.00149;0.00028;0.43037;,
 0.56337;-0.63414;-1.08943;,
 -0.00177;-0.63406;-1.08936;,
 0.33643;-0.64849;-2.16624;,
 0.74139;-0.62043;-0.06050;,
 0.56350;-0.62040;-0.06048;,
 0.66857;-0.63416;-1.08944;,
 -0.00165;-0.72317;-0.05904;,
 0.62691;-0.61604;0.26718;,
 0.56356;-0.61389;0.42692;,
 -0.00158;-0.61382;0.42699;,
 0.73828;-0.60909;0.78866;,
 0.56365;-0.60449;1.13125;,
 -0.00150;-0.60563;1.04015;,
 0.48671;-0.21701;-1.00194;,
 0.66857;-0.63416;-1.08944;,
 -0.37800;0.00010;0.43042;,
 -0.60016;-0.19551;0.59721;,
 -0.50970;-0.40850;1.11751;,
 -0.03697;0.00006;0.43038;,
 -0.00207;-0.23220;1.03545;,
 -0.00149;0.00028;0.43037;,
 -0.76870;-0.60888;0.78884;,
 -0.59398;-0.60433;1.13140;,
 -0.00150;-0.60563;1.04015;,
 -0.00167;-0.01891;-1.00693;,
 -0.00178;-0.23494;-1.63661;,
 -0.33997;-0.24686;-1.54046;,
 -0.04478;-0.01913;-1.00692;,
 -0.51747;-0.21687;-1.00181;,
 -0.37816;-0.01767;-0.90108;,
 -0.00190;-0.64859;-2.17729;,
 -0.34024;-0.64840;-2.16616;,
 -0.69946;-0.63397;-1.08926;,
 -0.37813;-0.01359;-0.59530;,
 -0.51747;-0.21687;-1.00181;,
 -0.59005;-0.20490;-0.10663;,
 -0.37807;-0.00810;-0.18372;,
 -0.56519;-0.27633;-0.01587;,
 -0.37807;-0.00741;-0.13197;,
 -0.60016;-0.19551;0.59721;,
 -0.37800;0.00010;0.43042;,
 -0.69946;-0.63397;-1.08926;,
 -0.77203;-0.62022;-0.06030;,
 -0.65747;-0.61586;0.26735;,
 -0.76870;-0.60888;0.78884;,
 -0.37816;-0.01767;-0.90108;,
 -0.37813;-0.01359;-0.59530;,
 -0.11062;0.03129;-0.52346;,
 -0.04478;-0.01913;-1.00692;,
 -0.00161;0.03150;-0.52349;,
 -0.37807;-0.00810;-0.18372;,
 -0.03704;0.03580;-0.18434;,
 -0.00156;0.03603;-0.18435;,
 -0.37807;-0.00741;-0.13197;,
 -0.03698;0.04228;0.30051;,
 -0.00150;0.04250;0.30051;,
 -0.37800;0.00010;0.43042;,
 -0.03697;0.00006;0.43038;,
 -0.00149;0.00028;0.43037;,
 -0.59426;-0.63398;-1.08929;,
 -0.34024;-0.64840;-2.16616;,
 -0.00177;-0.63406;-1.08936;,
 -0.77203;-0.62022;-0.06030;,
 -0.69946;-0.63397;-1.08926;,
 -0.59413;-0.62024;-0.06033;,
 -0.00165;-0.72317;-0.05904;,
 -0.65747;-0.61586;0.26735;,
 -0.59407;-0.61373;0.42707;,
 -0.00158;-0.61382;0.42699;,
 -0.76870;-0.60888;0.78884;,
 -0.59398;-0.60433;1.13140;,
 -0.00150;-0.60563;1.04015;,
 -0.51747;-0.21687;-1.00181;,
 -0.69946;-0.63397;-1.08926;,
 0.10718;0.02641;-0.88986;,
 -0.00098;0.08706;-0.93305;,
 -0.00240;-0.22264;-0.79606;,
 0.10396;-0.31566;-0.81502;,
 -0.00098;0.08706;-0.93305;,
 -0.00134;-0.14028;-1.40548;,
 -0.01139;-0.37330;-1.32439;,
 -0.00240;-0.22264;-0.79606;,
 -0.00134;-0.14028;-1.40548;,
 0.10718;0.02641;-0.88986;,
 0.10396;-0.31566;-0.81502;,
 -0.01139;-0.37330;-1.32439;,
 0.10396;-0.31566;-0.81502;,
 -0.00240;-0.22264;-0.79606;,
 -0.00134;-0.14028;-1.40548;,
 -0.01139;-0.37330;-1.32439;,
 -0.01139;-0.37330;-1.32439;,
 -0.00098;0.08706;-0.93305;,
 0.10718;0.02641;-0.88986;,
 -0.11049;0.02644;-0.88983;,
 -0.10735;-0.31563;-0.81500;,
 -0.00096;-0.22264;-0.79606;,
 -0.00233;0.08706;-0.93305;,
 -0.00233;0.08706;-0.93305;,
 -0.00096;-0.22264;-0.79606;,
 0.00786;-0.37330;-1.32439;,
 -0.00215;-0.14028;-1.40548;,
 -0.00215;-0.14028;-1.40548;,
 0.00786;-0.37330;-1.32439;,
 -0.10735;-0.31563;-0.81500;,
 -0.11049;0.02644;-0.88983;,
 -0.10735;-0.31563;-0.81500;,
 -0.00096;-0.22264;-0.79606;,
 -0.00215;-0.14028;-1.40548;,
 0.00786;-0.37330;-1.32439;,
 0.00786;-0.37330;-1.32439;,
 -0.11049;0.02644;-0.88983;,
 -0.00233;0.08706;-0.93305;;
 
 74;
 4;0,1,2,3;,
 4;1,4,5,2;,
 4;3,2,6,7;,
 4;2,5,8,6;,
 4;9,10,11,12;,
 4;10,13,14,11;,
 4;12,11,15,16;,
 4;11,14,17,15;,
 4;18,19,20,21;,
 4;19,22,23,20;,
 4;22,24,25,23;,
 4;21,20,26,27;,
 4;20,23,28,26;,
 4;23,25,29,28;,
 4;30,31,32,33;,
 4;31,9,34,32;,
 4;33,32,35,36;,
 4;32,34,37,35;,
 4;36,35,38,39;,
 4;35,37,40,38;,
 4;39,38,41,42;,
 4;38,40,43,41;,
 4;44,45,16,46;,
 4;47,48,44,49;,
 4;48,50,45,44;,
 4;51,52,48,47;,
 4;52,53,50,48;,
 4;54,55,52,51;,
 4;55,56,53,52;,
 3;57,30,18;,
 3;58,44,46;,
 4;59,60,61,62;,
 4;62,61,63,64;,
 4;60,65,66,61;,
 4;61,66,67,63;,
 4;68,69,70,71;,
 4;71,70,72,73;,
 4;69,74,75,70;,
 4;70,75,76,72;,
 4;77,78,79,80;,
 4;80,79,81,82;,
 4;82,81,83,84;,
 4;78,85,86,79;,
 4;79,86,87,81;,
 4;81,87,88,83;,
 4;89,90,91,92;,
 4;92,91,93,68;,
 4;90,94,95,91;,
 4;91,95,96,93;,
 4;94,97,98,95;,
 4;95,98,99,96;,
 4;97,100,101,98;,
 4;98,101,102,99;,
 4;103,104,74,105;,
 4;106,107,103,108;,
 4;108,103,105,109;,
 4;110,106,108,111;,
 4;111,108,109,112;,
 4;113,110,111,114;,
 4;114,111,112,115;,
 3;116,77,89;,
 3;117,104,103;,
 4;118,119,120,121;,
 4;122,123,124,125;,
 4;126,127,128,129;,
 4;130,131,124,129;,
 3;132,133,134;,
 3;132,135,136;,
 4;137,138,139,140;,
 4;141,142,143,144;,
 4;145,146,147,148;,
 4;149,146,143,150;,
 3;151,152,153;,
 3;151,154,155;;
 
 MeshMaterialList {
  10;
  74;
  9,
  4,
  0,
  4,
  9,
  9,
  0,
  0,
  9,
  1,
  9,
  0,
  0,
  0,
  9,
  0,
  9,
  0,
  0,
  1,
  4,
  0,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  4,
  0,
  4,
  9,
  9,
  0,
  0,
  9,
  1,
  9,
  0,
  0,
  0,
  9,
  0,
  9,
  0,
  0,
  1,
  4,
  0,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
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
   0.094400;0.357600;0.649600;1.000000;;
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
   0.684000;0.426400;0.000000;1.000000;;
   11.000000;
   0.110000;0.110000;0.110000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.800000;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.060000;0.232000;0.420000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.800000;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.138400;0.743200;0.000000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.392000;0.078400;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.684000;0.078400;0.000000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   1.000000;1.000000;1.000000;1.000000;;
   0.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
 }
 MeshNormals {
  107;
  0.091365;0.921568;0.377312;,
  0.075937;0.931181;0.356561;,
  0.060859;0.939859;0.336097;,
  0.112501;0.804604;0.583058;,
  0.114807;0.871815;0.476191;,
  0.115284;0.925127;0.361731;,
  0.965992;0.251962;0.058093;,
  0.927398;0.197253;0.317843;,
  -0.147067;0.049108;0.987907;,
  0.035141;0.975485;-0.217243;,
  0.133627;0.956211;-0.260393;,
  0.084010;0.887008;-0.454046;,
  0.375544;0.805601;-0.458228;,
  0.100353;0.814281;-0.571730;,
  0.540580;0.696856;-0.471344;,
  0.491164;0.843340;-0.218028;,
  0.517206;0.855345;-0.029696;,
  0.453276;0.885148;0.105135;,
  0.481196;0.866762;0.131052;,
  0.793998;0.576928;-0.191628;,
  0.787055;0.570426;0.234860;,
  0.843794;0.503555;0.185590;,
  0.892477;0.416824;-0.172458;,
  0.843696;0.469247;0.260739;,
  0.884454;0.422814;0.197407;,
  0.062642;0.997050;-0.044366;,
  0.004120;0.998276;-0.058543;,
  0.071203;0.997414;-0.009792;,
  0.005554;0.999897;-0.013236;,
  0.052004;0.992642;0.109353;,
  0.006498;0.988677;0.149917;,
  0.022252;-0.999752;0.001040;,
  0.044702;-0.998937;-0.011296;,
  0.044460;-0.998654;0.026710;,
  0.089152;-0.995212;0.040051;,
  0.021994;-0.998996;0.039028;,
  0.044219;-0.996923;0.064718;,
  -0.381031;0.902635;0.200166;,
  -0.104342;0.939542;0.326149;,
  -0.068471;0.939256;0.336319;,
  -0.773247;0.608660;0.177825;,
  -0.417245;0.797790;0.435243;,
  -0.130768;0.923019;0.361850;,
  -0.927044;0.354346;0.122590;,
  -0.816814;0.435868;0.377934;,
  0.153755;0.008628;0.988071;,
  -0.034950;0.975494;-0.217234;,
  -0.154582;0.965471;-0.209690;,
  -0.083892;0.887031;-0.454024;,
  -0.392854;0.822142;-0.412005;,
  -0.100276;0.814310;-0.571703;,
  -0.527273;0.699111;-0.482936;,
  -0.484701;0.863153;-0.141534;,
  -0.479262;0.877195;-0.028939;,
  -0.429404;0.900266;0.071643;,
  -0.428404;0.897466;0.104995;,
  -0.775071;0.612692;-0.154514;,
  -0.796701;0.582991;0.159341;,
  -0.834570;0.533938;0.135657;,
  -0.885908;0.424708;-0.186521;,
  -0.886443;0.430354;0.170334;,
  -0.925137;0.353985;0.137169;,
  -0.062377;0.997067;-0.044347;,
  -0.003871;0.998277;-0.058543;,
  -0.070931;0.997433;-0.009775;,
  -0.005278;0.999898;-0.013235;,
  -0.051703;0.992657;0.109361;,
  -0.006178;0.988679;0.149919;,
  -0.021517;-0.999768;0.001035;,
  -0.042950;-0.999013;-0.011307;,
  -0.042720;-0.998729;0.026735;,
  -0.085386;-0.995540;0.040104;,
  -0.021265;-0.999011;0.039057;,
  -0.042471;-0.996996;0.064778;,
  0.103945;0.310207;0.944969;,
  -0.904582;-0.407551;0.125034;,
  -0.999712;0.023951;-0.001582;,
  0.977818;-0.079326;-0.193852;,
  -0.103628;0.310228;0.944997;,
  0.904501;-0.407800;0.124811;,
  0.999718;0.023686;-0.001832;,
  -0.977889;-0.079056;-0.193605;,
  0.946507;0.322682;-0.000640;,
  0.885253;0.450957;-0.113863;,
  -0.000140;-0.999911;0.013354;,
  -0.000164;-0.999911;0.013359;,
  -0.000199;-0.999911;0.013350;,
  -0.000183;-0.999911;0.013359;,
  -0.000205;-0.999911;0.013353;,
  -0.000190;-0.999911;0.013359;,
  -0.000160;-0.999911;0.013355;,
  -0.000129;-0.999911;0.013350;,
  -0.000110;-0.999911;0.013362;,
  -0.000128;-0.999911;0.013356;,
  -0.000092;-0.999911;0.013352;,
  -0.000097;-0.999911;0.013361;,
  -0.000083;-0.999911;0.013350;,
  -0.000083;-0.999911;0.013349;,
  -0.000113;-0.999911;0.013350;,
  -0.000144;-0.999911;0.013351;,
  0.871578;0.377219;-0.313142;,
  -0.618337;-0.752947;0.225234;,
  0.000000;0.000000;0.000000;,
  0.561431;0.745514;-0.359172;,
  -0.871561;0.377446;-0.312916;,
  0.618176;-0.753124;0.225083;,
  -0.561343;0.745651;-0.359024;;
  74;
  4;0,1,4,3;,
  4;1,2,5,4;,
  4;82,7,7,6;,
  4;8,8,8,8;,
  4;9,10,12,11;,
  4;10,15,19,12;,
  4;11,12,14,13;,
  4;12,19,22,14;,
  4;16,17,20,19;,
  4;17,18,21,20;,
  4;18,83,82,21;,
  4;19,20,23,22;,
  4;20,21,24,23;,
  4;21,82,6,24;,
  4;15,10,25,16;,
  4;10,9,26,25;,
  4;16,25,27,17;,
  4;25,26,28,27;,
  4;17,27,29,18;,
  4;27,28,30,29;,
  4;18,29,1,0;,
  4;29,30,2,1;,
  4;31,32,84,85;,
  4;86,33,31,87;,
  4;33,34,32,31;,
  4;88,35,33,86;,
  4;35,36,34,33;,
  4;89,90,35,88;,
  4;90,91,36,35;,
  3;19,15,16;,
  3;87,31,85;,
  4;37,40,41,38;,
  4;38,41,42,39;,
  4;40,43,44,41;,
  4;45,45,45,45;,
  4;46,48,49,47;,
  4;47,49,56,52;,
  4;48,50,51,49;,
  4;49,51,59,56;,
  4;53,56,57,54;,
  4;54,57,58,55;,
  4;55,58,40,37;,
  4;56,59,60,57;,
  4;57,60,61,58;,
  4;58,61,43,40;,
  4;52,53,62,47;,
  4;47,62,63,46;,
  4;53,54,64,62;,
  4;62,64,65,63;,
  4;54,55,66,64;,
  4;64,66,67,65;,
  4;55,37,38,66;,
  4;66,38,39,67;,
  4;68,92,93,69;,
  4;94,95,68,70;,
  4;70,68,69,71;,
  4;96,94,70,72;,
  4;72,70,71,73;,
  4;97,96,72,98;,
  4;98,72,73,99;,
  3;56,53,52;,
  3;95,92,68;,
  4;74,74,74,74;,
  4;76,76,75,75;,
  4;100,100,77,77;,
  4;101,75,75,101;,
  3;102,102,102;,
  3;100,103,100;,
  4;78,78,78,78;,
  4;80,79,79,80;,
  4;104,81,81,104;,
  4;105,105,79,79;,
  3;102,102,102;,
  3;104,104,106;;
 }
 MeshTextureCoords {
  156;
  0.000000;0.000000;,
  0.250000;0.000000;,
  0.250000;0.500000;,
  0.000000;0.500000;,
  0.500000;0.000000;,
  0.500000;0.500000;,
  0.250000;1.000000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  0.500000;0.000000;,
  0.750000;0.000000;,
  0.750000;0.500000;,
  0.500000;0.500000;,
  1.000000;0.000000;,
  1.000000;0.500000;,
  0.750000;1.000000;,
  0.500000;1.000000;,
  1.000000;1.000000;,
  0.250000;0.000000;,
  0.500000;0.000000;,
  0.500000;0.500000;,
  0.250000;0.500000;,
  0.750000;0.000000;,
  0.750000;0.500000;,
  1.000000;0.000000;,
  1.000000;0.500000;,
  0.500000;1.000000;,
  0.250000;1.000000;,
  0.750000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.250000;0.000000;,
  0.250000;0.250000;,
  0.000000;0.250000;,
  0.500000;0.250000;,
  0.250000;0.500000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  0.250000;0.750000;,
  0.000000;0.750000;,
  0.500000;0.750000;,
  0.250000;1.000000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  0.250000;0.750000;,
  0.500000;0.750000;,
  0.250000;1.000000;,
  0.000000;0.500000;,
  0.250000;0.500000;,
  0.000000;0.750000;,
  0.500000;0.500000;,
  0.000000;0.250000;,
  0.250000;0.250000;,
  0.500000;0.250000;,
  0.000000;0.000000;,
  0.250000;0.000000;,
  0.500000;0.000000;,
  0.125000;0.500000;,
  0.000000;0.875000;,
  0.000000;0.000000;,
  0.000000;0.500000;,
  0.250000;0.500000;,
  0.250000;0.000000;,
  0.500000;0.500000;,
  0.500000;0.000000;,
  0.000000;1.000000;,
  0.250000;1.000000;,
  0.500000;1.000000;,
  0.500000;0.000000;,
  0.500000;0.500000;,
  0.750000;0.500000;,
  0.750000;0.000000;,
  1.000000;0.500000;,
  1.000000;0.000000;,
  0.500000;1.000000;,
  0.750000;1.000000;,
  1.000000;1.000000;,
  0.250000;0.000000;,
  0.250000;0.500000;,
  0.500000;0.500000;,
  0.500000;0.000000;,
  0.750000;0.500000;,
  0.750000;0.000000;,
  1.000000;0.500000;,
  1.000000;0.000000;,
  0.250000;1.000000;,
  0.500000;1.000000;,
  0.750000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.250000;,
  0.250000;0.250000;,
  0.250000;0.000000;,
  0.500000;0.250000;,
  0.000000;0.500000;,
  0.250000;0.500000;,
  0.500000;0.500000;,
  0.000000;0.750000;,
  0.250000;0.750000;,
  0.500000;0.750000;,
  0.000000;1.000000;,
  0.250000;1.000000;,
  0.500000;1.000000;,
  0.250000;0.750000;,
  0.250000;1.000000;,
  0.500000;0.750000;,
  0.000000;0.500000;,
  0.000000;0.750000;,
  0.250000;0.500000;,
  0.500000;0.500000;,
  0.000000;0.250000;,
  0.250000;0.250000;,
  0.500000;0.250000;,
  0.000000;0.000000;,
  0.250000;0.000000;,
  0.500000;0.000000;,
  0.125000;0.500000;,
  0.000000;0.875000;,
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
  0.500000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
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
  1.000000;0.000000;,
  0.500000;0.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;;
 }
}
