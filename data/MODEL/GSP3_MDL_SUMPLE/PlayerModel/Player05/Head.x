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
 316;
 -0.61700;1.35000;-1.80000;,
 -0.30869;1.18835;-1.97491;,
 -0.30869;1.02490;-2.03505;,
 -0.61700;1.18655;-1.86014;,
 -0.00038;1.18835;-1.97491;,
 -0.00038;1.02490;-2.03505;,
 0.30793;1.18835;-1.97491;,
 0.30793;1.02490;-2.03505;,
 0.61624;1.35000;-1.80000;,
 0.61624;1.18655;-1.86014;,
 -0.30869;0.91600;-2.01584;,
 -0.61700;1.07765;-1.84094;,
 -0.00038;0.91600;-2.01584;,
 0.30793;0.91600;-2.01584;,
 0.61624;1.07765;-1.84094;,
 -0.30563;0.77102;-2.00921;,
 -0.61088;0.93267;-1.83430;,
 -0.00038;0.77102;-2.00921;,
 0.30487;0.77102;-2.00921;,
 0.61012;0.93267;-1.83430;,
 -0.31491;0.79419;-1.57892;,
 -0.62943;0.80095;-1.54055;,
 -0.00038;0.79419;-1.57892;,
 0.31415;0.79419;-1.57892;,
 0.62867;0.80095;-1.54055;,
 0.61624;1.35000;-1.80000;,
 0.61624;1.54810;-1.37517;,
 0.61624;1.28570;-1.29783;,
 0.61624;1.18655;-1.86014;,
 0.61624;1.82872;-0.91760;,
 0.83969;1.49410;-0.85860;,
 1.12712;1.97412;-0.49195;,
 1.05633;1.80122;-0.43677;,
 1.12712;2.33338;0.82552;,
 1.05633;1.88262;0.78057;,
 0.61624;1.17680;-1.27863;,
 0.61624;1.07765;-1.84094;,
 0.83969;1.25820;-0.81700;,
 1.05633;1.50018;-0.38369;,
 0.68093;1.61772;0.63671;,
 0.87389;1.07174;-1.28085;,
 0.61012;0.93267;-1.83430;,
 1.02518;1.19307;-0.82807;,
 1.05633;1.26044;0.01288;,
 0.68093;1.09173;1.12232;,
 0.90045;0.84077;-1.19863;,
 0.62867;0.80095;-1.54055;,
 0.99494;0.96209;-0.74586;,
 0.88266;0.01470;-0.02980;,
 0.56895;0.10575;0.92632;,
 1.12712;2.33338;0.82552;,
 0.36491;2.31123;0.38122;,
 0.44556;1.88262;0.93401;,
 1.05633;1.88262;0.78057;,
 -0.00038;2.31123;0.38122;,
 -0.00038;1.88262;0.93401;,
 -0.36567;2.31123;0.38122;,
 -0.44632;1.88262;0.93401;,
 -1.12788;2.33338;0.82552;,
 -1.05709;1.88262;0.78057;,
 0.28714;1.61772;0.79015;,
 0.68093;1.61772;0.63671;,
 -0.00038;1.61772;0.79015;,
 -0.28790;1.61772;0.79015;,
 -0.68169;1.61772;0.63671;,
 0.34027;1.09173;1.12232;,
 0.68093;1.09173;1.12232;,
 -0.00038;1.09173;1.12232;,
 -0.34103;1.09173;1.12232;,
 -0.68169;1.09173;1.12232;,
 0.28429;0.10575;0.92632;,
 0.56895;0.10575;0.92632;,
 -0.00038;0.10575;0.92632;,
 -0.28505;0.10575;0.92632;,
 -0.56971;0.10575;0.92632;,
 -1.12788;2.33338;0.82552;,
 -1.12788;1.97412;-0.49195;,
 -1.05709;1.80122;-0.43677;,
 -1.05709;1.88262;0.78057;,
 -0.61700;1.82872;-0.91760;,
 -0.84045;1.49410;-0.85860;,
 -0.61700;1.54810;-1.37517;,
 -0.61700;1.28570;-1.29783;,
 -0.61700;1.35000;-1.80000;,
 -0.61700;1.18655;-1.86014;,
 -1.05709;1.50018;-0.38369;,
 -0.68169;1.61772;0.63671;,
 -0.84045;1.25820;-0.81700;,
 -0.61700;1.17680;-1.27863;,
 -0.61700;1.07765;-1.84094;,
 -1.05709;1.26044;0.01288;,
 -0.68169;1.09173;1.12232;,
 -1.02594;1.19307;-0.82807;,
 -0.87465;1.07174;-1.28085;,
 -0.61088;0.93267;-1.83430;,
 -0.88342;0.01470;-0.02980;,
 -0.56971;0.10575;0.92632;,
 -0.99570;0.96209;-0.74586;,
 -0.90121;0.84077;-1.19863;,
 -0.62943;0.80095;-1.54055;,
 -0.36567;2.31123;0.38122;,
 -0.52874;2.15596;-0.49932;,
 -1.12788;1.97412;-0.49195;,
 -0.00038;2.15596;-0.49932;,
 0.36491;2.31123;0.38122;,
 0.52798;2.15596;-0.49932;,
 1.12712;1.97412;-0.49195;,
 -0.30869;1.82872;-0.91760;,
 -0.61700;1.82872;-0.91760;,
 -0.00038;1.82872;-0.91760;,
 0.30793;1.82872;-0.91760;,
 0.61624;1.82872;-0.91760;,
 -0.30869;1.54810;-1.37517;,
 -0.61700;1.54810;-1.37517;,
 -0.00038;1.54810;-1.37517;,
 0.30793;1.54810;-1.37517;,
 0.61624;1.54810;-1.37517;,
 -0.30869;1.18835;-1.97491;,
 -0.61700;1.35000;-1.80000;,
 -0.00038;1.18835;-1.97491;,
 0.30793;1.18835;-1.97491;,
 0.61624;1.35000;-1.80000;,
 -0.88342;0.01470;-0.02980;,
 -0.44190;0.01470;-0.02980;,
 -0.28505;0.10575;0.92632;,
 -0.00038;0.01470;-0.02980;,
 0.44114;0.01470;-0.02980;,
 0.28429;0.10575;0.92632;,
 0.88266;0.01470;-0.02980;,
 -0.99570;0.96209;-0.74586;,
 -0.49804;0.96209;-0.74586;,
 -0.00038;0.96209;-0.74586;,
 0.49728;0.96209;-0.74586;,
 0.99494;0.96209;-0.74586;,
 -0.90121;0.84077;-1.19863;,
 -0.45079;0.84077;-1.19863;,
 -0.00038;0.84077;-1.19863;,
 0.45003;0.84077;-1.19863;,
 0.90045;0.84077;-1.19863;,
 -0.62943;0.80095;-1.54055;,
 -0.31491;0.79419;-1.57892;,
 -0.00038;0.79419;-1.57892;,
 0.31415;0.79419;-1.57892;,
 0.62867;0.80095;-1.54055;,
 -0.64862;1.02268;-1.13156;,
 -0.25639;0.87765;-1.18048;,
 -0.19692;0.44701;-1.28131;,
 -0.64862;0.59204;-0.91928;,
 0.25563;0.87765;-1.18048;,
 0.19616;0.44701;-1.28131;,
 0.64786;1.02268;-1.13156;,
 0.64786;0.59204;-0.91928;,
 -0.21646;0.14516;-1.13194;,
 -0.64862;0.29018;-0.83840;,
 0.21570;0.14516;-1.13194;,
 0.64786;0.29018;-0.83840;,
 -0.21646;-0.15671;-0.98257;,
 -0.64862;-0.01167;-0.75752;,
 0.21570;-0.15671;-0.98257;,
 0.64786;-0.01167;-0.75752;,
 0.64786;1.02268;-1.13156;,
 0.64786;1.10356;-0.82970;,
 0.64786;0.87797;-0.61743;,
 0.64786;0.59204;-0.91928;,
 0.64786;1.18444;-0.52785;,
 0.64786;0.88259;-0.44697;,
 0.64786;1.26532;-0.22600;,
 0.64786;0.96347;-0.14512;,
 0.64786;0.37107;-0.53655;,
 0.64786;0.29018;-0.83840;,
 0.64786;0.45195;-0.23469;,
 0.64786;0.53283;0.06716;,
 0.64786;0.06922;-0.45566;,
 0.64786;-0.01167;-0.75752;,
 0.64786;0.15010;-0.15381;,
 0.64786;0.23097;0.14804;,
 0.64786;1.26532;-0.22600;,
 0.35366;1.12029;-0.00095;,
 0.35366;0.81844;0.14842;,
 0.64786;0.96347;-0.14512;,
 -0.35442;1.12029;-0.00095;,
 -0.35442;0.81844;0.14842;,
 -0.64862;1.26532;-0.22600;,
 -0.64862;0.96347;-0.14512;,
 0.11957;0.38780;0.54046;,
 0.64786;0.53283;0.06716;,
 -0.12033;0.38780;0.54046;,
 -0.64862;0.53283;0.06716;,
 0.21570;0.08595;0.68983;,
 0.64786;0.23097;0.14804;,
 -0.21646;0.08595;0.68983;,
 -0.64862;0.23097;0.14804;,
 -0.64862;1.26532;-0.22600;,
 -0.64862;1.18444;-0.52785;,
 -0.64862;0.75380;-0.31557;,
 -0.64862;0.96347;-0.14512;,
 -0.64862;1.10356;-0.82970;,
 -0.64862;0.87797;-0.61743;,
 -0.64862;1.02268;-1.13156;,
 -0.64862;0.59204;-0.91928;,
 -0.64862;0.45195;-0.23469;,
 -0.64862;0.53283;0.06716;,
 -0.64862;0.37107;-0.53655;,
 -0.64862;0.29018;-0.83840;,
 -0.64862;0.15010;-0.15381;,
 -0.64862;0.23097;0.14804;,
 -0.64862;0.06922;-0.45566;,
 -0.64862;-0.01167;-0.75752;,
 -0.35442;1.12029;-0.00095;,
 -0.35442;1.03941;-0.55842;,
 -0.64862;1.18444;-0.52785;,
 0.35366;1.12029;-0.00095;,
 0.35366;1.03941;-0.55842;,
 0.64786;1.18444;-0.52785;,
 -0.35442;0.95853;-1.11588;,
 -0.64862;1.10356;-0.82970;,
 0.35366;0.95853;-1.11588;,
 0.64786;1.10356;-0.82970;,
 -0.25639;0.87765;-1.18048;,
 -0.64862;1.02268;-1.13156;,
 0.25563;0.87765;-1.18048;,
 0.64786;1.02268;-1.13156;,
 -0.64862;0.15010;-0.15381;,
 -0.21646;0.00507;0.13237;,
 -0.21646;0.08595;0.68983;,
 0.21570;0.00507;0.13237;,
 0.21570;0.08595;0.68983;,
 0.64786;0.15010;-0.15381;,
 -0.64862;0.06922;-0.45566;,
 -0.21646;-0.07582;-0.42510;,
 0.21570;-0.07582;-0.42510;,
 0.64786;0.06922;-0.45566;,
 -0.64862;-0.01167;-0.75752;,
 -0.21646;-0.15671;-0.98257;,
 0.21570;-0.15671;-0.98257;,
 0.64786;-0.01167;-0.75752;,
 0.84009;1.95925;0.17551;,
 0.75752;2.27394;-0.06241;,
 0.51999;3.84396;-0.18601;,
 0.30884;2.25050;0.02457;,
 0.51999;3.84396;-0.18601;,
 0.32935;1.93258;0.27452;,
 0.51999;3.84396;-0.18601;,
 0.50890;2.04480;0.53271;,
 0.51999;3.84396;-0.18601;,
 0.76428;2.05815;0.48321;,
 0.51999;3.84396;-0.18601;,
 0.84009;1.95925;0.17551;,
 0.51999;3.84396;-0.18601;,
 0.58472;1.94592;0.22501;,
 0.75752;2.27394;-0.06241;,
 0.84009;1.95925;0.17551;,
 0.30884;2.25050;0.02457;,
 0.32935;1.93258;0.27452;,
 0.50890;2.04480;0.53271;,
 0.76428;2.05815;0.48321;,
 0.88698;0.98494;-0.80143;,
 0.86962;0.91333;-0.68876;,
 0.77884;0.08546;-0.52526;,
 0.68873;0.92040;-0.69065;,
 0.77884;0.08546;-0.52526;,
 0.68108;0.99299;-0.80359;,
 0.77884;0.08546;-0.52526;,
 0.73509;0.93214;-0.89517;,
 0.77884;0.08546;-0.52526;,
 0.83804;0.92812;-0.89409;,
 0.77884;0.08546;-0.52526;,
 0.88698;0.98494;-0.80143;,
 0.77884;0.08546;-0.52526;,
 0.78403;0.98896;-0.80251;,
 0.86962;0.91333;-0.68876;,
 0.88698;0.98494;-0.80143;,
 0.68873;0.92040;-0.69065;,
 0.68108;0.99299;-0.80359;,
 0.73509;0.93214;-0.89517;,
 0.83804;0.92812;-0.89409;,
 -0.88774;0.98494;-0.80143;,
 -0.77960;0.08546;-0.52526;,
 -0.87038;0.91333;-0.68876;,
 -0.77960;0.08546;-0.52526;,
 -0.68949;0.92040;-0.69065;,
 -0.77960;0.08546;-0.52526;,
 -0.68184;0.99299;-0.80359;,
 -0.77960;0.08546;-0.52526;,
 -0.73585;0.93214;-0.89517;,
 -0.77960;0.08546;-0.52526;,
 -0.83880;0.92812;-0.89409;,
 -0.77960;0.08546;-0.52526;,
 -0.88774;0.98494;-0.80143;,
 -0.78479;0.98896;-0.80251;,
 -0.88774;0.98494;-0.80143;,
 -0.87038;0.91333;-0.68876;,
 -0.68949;0.92040;-0.69065;,
 -0.68184;0.99299;-0.80359;,
 -0.73585;0.93214;-0.89517;,
 -0.83880;0.92812;-0.89409;,
 -0.84085;1.95925;0.17551;,
 -0.52075;3.84396;-0.18601;,
 -0.75828;2.27394;-0.06241;,
 -0.52075;3.84396;-0.18601;,
 -0.30960;2.25050;0.02457;,
 -0.52075;3.84396;-0.18601;,
 -0.33011;1.93258;0.27452;,
 -0.52075;3.84396;-0.18601;,
 -0.50966;2.04480;0.53271;,
 -0.52075;3.84396;-0.18601;,
 -0.76504;2.05815;0.48321;,
 -0.52075;3.84396;-0.18601;,
 -0.84085;1.95925;0.17551;,
 -0.58548;1.94592;0.22501;,
 -0.84085;1.95925;0.17551;,
 -0.75828;2.27394;-0.06241;,
 -0.30960;2.25050;0.02457;,
 -0.33011;1.93258;0.27452;,
 -0.50966;2.04480;0.53271;,
 -0.76504;2.05815;0.48321;;
 
 198;
 4;0,1,2,3;,
 4;1,4,5,2;,
 4;4,6,7,5;,
 4;6,8,9,7;,
 4;3,2,10,11;,
 4;2,5,12,10;,
 4;5,7,13,12;,
 4;7,9,14,13;,
 4;11,10,15,16;,
 4;10,12,17,15;,
 4;12,13,18,17;,
 4;13,14,19,18;,
 4;16,15,20,21;,
 4;15,17,22,20;,
 4;17,18,23,22;,
 4;18,19,24,23;,
 4;25,26,27,28;,
 4;26,29,30,27;,
 4;29,31,32,30;,
 4;31,33,34,32;,
 4;28,27,35,36;,
 4;27,30,37,35;,
 4;30,32,38,37;,
 4;32,34,39,38;,
 4;36,35,40,41;,
 4;35,37,42,40;,
 4;37,38,43,42;,
 4;38,39,44,43;,
 4;41,40,45,46;,
 4;40,42,47,45;,
 4;42,43,48,47;,
 4;43,44,49,48;,
 4;50,51,52,53;,
 4;51,54,55,52;,
 4;54,56,57,55;,
 4;56,58,59,57;,
 4;53,52,60,61;,
 4;52,55,62,60;,
 4;55,57,63,62;,
 4;57,59,64,63;,
 4;61,60,65,66;,
 4;60,62,67,65;,
 4;62,63,68,67;,
 4;63,64,69,68;,
 4;66,65,70,71;,
 4;65,67,72,70;,
 4;67,68,73,72;,
 4;68,69,74,73;,
 4;75,76,77,78;,
 4;76,79,80,77;,
 4;79,81,82,80;,
 4;81,83,84,82;,
 4;78,77,85,86;,
 4;77,80,87,85;,
 4;80,82,88,87;,
 4;82,84,89,88;,
 4;86,85,90,91;,
 4;85,87,92,90;,
 4;87,88,93,92;,
 4;88,89,94,93;,
 4;91,90,95,96;,
 4;90,92,97,95;,
 4;92,93,98,97;,
 4;93,94,99,98;,
 4;75,100,101,102;,
 4;100,54,103,101;,
 4;54,104,105,103;,
 4;104,33,106,105;,
 4;102,101,107,108;,
 4;101,103,109,107;,
 4;103,105,110,109;,
 4;105,106,111,110;,
 4;108,107,112,113;,
 4;107,109,114,112;,
 4;109,110,115,114;,
 4;110,111,116,115;,
 4;113,112,117,118;,
 4;112,114,119,117;,
 4;114,115,120,119;,
 4;115,116,121,120;,
 4;122,123,124,96;,
 4;123,125,72,124;,
 4;125,126,127,72;,
 4;126,128,49,127;,
 4;129,130,123,122;,
 4;130,131,125,123;,
 4;131,132,126,125;,
 4;132,133,128,126;,
 4;134,135,130,129;,
 4;135,136,131,130;,
 4;136,137,132,131;,
 4;137,138,133,132;,
 4;139,140,135,134;,
 4;140,141,136,135;,
 4;141,142,137,136;,
 4;142,143,138,137;,
 4;144,145,146,147;,
 4;145,148,149,146;,
 4;148,150,151,149;,
 4;147,146,152,153;,
 4;146,149,154,152;,
 4;149,151,155,154;,
 4;153,152,156,157;,
 4;152,154,158,156;,
 4;154,155,159,158;,
 4;160,161,162,163;,
 4;161,164,165,162;,
 4;164,166,167,165;,
 4;163,162,168,169;,
 4;162,165,170,168;,
 4;165,167,171,170;,
 4;169,168,172,173;,
 4;168,170,174,172;,
 4;170,171,175,174;,
 4;176,177,178,179;,
 4;177,180,181,178;,
 4;180,182,183,181;,
 4;179,178,184,185;,
 4;178,181,186,184;,
 4;181,183,187,186;,
 4;185,184,188,189;,
 4;184,186,190,188;,
 4;186,187,191,190;,
 4;192,193,194,195;,
 4;193,196,197,194;,
 4;196,198,199,197;,
 4;195,194,200,201;,
 4;194,197,202,200;,
 4;197,199,203,202;,
 4;201,200,204,205;,
 4;200,202,206,204;,
 4;202,203,207,206;,
 4;192,208,209,210;,
 4;208,211,212,209;,
 4;211,166,213,212;,
 4;210,209,214,215;,
 4;209,212,216,214;,
 4;212,213,217,216;,
 4;215,214,218,219;,
 4;214,216,220,218;,
 4;216,217,221,220;,
 4;222,223,224,205;,
 4;223,225,226,224;,
 4;225,227,175,226;,
 4;228,229,223,222;,
 4;229,230,225,223;,
 4;230,231,227,225;,
 4;232,233,229,228;,
 4;233,234,230,229;,
 4;234,235,231,230;,
 3;236,237,238;,
 3;237,239,240;,
 3;239,241,242;,
 3;241,243,244;,
 3;243,245,246;,
 3;245,247,248;,
 3;249,250,251;,
 3;249,252,250;,
 3;249,253,252;,
 3;249,254,253;,
 3;249,255,254;,
 3;249,251,255;,
 3;256,257,258;,
 3;257,259,260;,
 3;259,261,262;,
 3;261,263,264;,
 3;263,265,266;,
 3;265,267,268;,
 3;269,270,271;,
 3;269,272,270;,
 3;269,273,272;,
 3;269,274,273;,
 3;269,275,274;,
 3;269,271,275;,
 3;276,277,278;,
 3;278,279,280;,
 3;280,281,282;,
 3;282,283,284;,
 3;284,285,286;,
 3;286,287,288;,
 3;289,290,291;,
 3;289,291,292;,
 3;289,292,293;,
 3;289,293,294;,
 3;289,294,295;,
 3;289,295,290;,
 3;296,297,298;,
 3;298,299,300;,
 3;300,301,302;,
 3;302,303,304;,
 3;304,305,306;,
 3;306,307,308;,
 3;309,310,311;,
 3;309,311,312;,
 3;309,312,313;,
 3;309,313,314;,
 3;309,314,315;,
 3;309,315,310;;
 
 MeshMaterialList {
  10;
  198;
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  6,
  6,
  6,
  6,
  1,
  1,
  1,
  1,
  0,
  7,
  0,
  0,
  1,
  1,
  1,
  6,
  1,
  1,
  1,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  4,
  4,
  4,
  4,
  6,
  6,
  6,
  6,
  1,
  1,
  1,
  1,
  0,
  0,
  7,
  0,
  6,
  1,
  1,
  1,
  6,
  1,
  1,
  1,
  1,
  4,
  4,
  1,
  1,
  4,
  4,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  8,
  6,
  8,
  6,
  6,
  6,
  1,
  1,
  1,
  8,
  7,
  6,
  6,
  6,
  6,
  1,
  1,
  1,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  8,
  6,
  6,
  6,
  6,
  1,
  1,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  2,
  6,
  6,
  2,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  2,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  2,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  2,
  6,
  6,
  2,
  6,
  6,
  6,
  6,
  6,
  6,
  6;;
  Material {
   0.000000;0.000000;0.000000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.200800;0.200800;0.200800;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.432800;0.432800;0.432800;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.000000;0.690400;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.558400;0.558400;0.558400;1.000000;;
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
   0.605600;0.605600;0.605600;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.708800;0.166400;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.000000;0.000000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.783900;0.783900;0.783900;0.950000;;
   25.000000;
   0.250000;0.250000;0.250000;;
   0.000000;0.000000;0.000000;;
  }
 }
 MeshNormals {
  269;
  -0.138362;0.659139;-0.739183;,
  -0.068314;0.649939;-0.756910;,
  0.000000;0.637716;-0.770272;,
  0.068314;0.649939;-0.756910;,
  -0.453831;0.093293;-0.886191;,
  -0.233369;0.093667;-0.967866;,
  0.000000;0.088863;-0.996044;,
  0.233369;0.093667;-0.967866;,
  -0.809681;0.091304;-0.579724;,
  -0.276528;-0.109567;-0.954739;,
  0.000000;-0.109929;-0.993939;,
  0.276528;-0.109567;-0.954739;,
  -0.786851;0.054697;-0.614715;,
  -0.268027;-0.052494;-0.961980;,
  0.000000;-0.045684;-0.998956;,
  0.268027;-0.052494;-0.961980;,
  -0.431616;-0.877895;-0.207387;,
  -0.069996;-0.997241;0.024721;,
  0.000000;-0.996145;0.087723;,
  0.069996;-0.997241;0.024721;,
  0.138362;0.659139;-0.739183;,
  0.976542;0.100497;-0.190434;,
  0.840832;0.072070;-0.536477;,
  0.925542;-0.169047;-0.338815;,
  0.453831;0.093293;-0.886191;,
  0.978403;0.031216;-0.204338;,
  0.877740;-0.001733;-0.479135;,
  0.948920;-0.225568;-0.220615;,
  0.809681;0.091304;-0.579724;,
  0.866257;0.384106;-0.319471;,
  0.900190;0.111815;-0.420899;,
  0.992464;0.096940;-0.074956;,
  0.786851;0.054697;-0.614715;,
  0.790244;0.501746;-0.351803;,
  0.900021;0.329277;-0.285550;,
  0.986486;0.153715;0.056723;,
  0.431616;-0.877895;-0.207387;,
  0.912963;-0.208705;-0.350628;,
  0.984388;-0.116333;-0.132090;,
  0.978670;-0.147800;0.142689;,
  0.965453;-0.255051;0.053382;,
  -0.107699;0.644374;0.757088;,
  0.000000;0.970742;0.240127;,
  0.107699;0.644374;0.757088;,
  0.778206;-0.496009;0.385188;,
  0.000000;0.790278;0.612748;,
  0.955330;-0.034115;0.293566;,
  0.121199;-0.556879;0.821703;,
  0.000000;-0.477238;0.878774;,
  -0.121199;-0.556879;0.821703;,
  0.940450;0.117931;0.318818;,
  0.037989;0.202917;0.978459;,
  0.000000;0.182492;0.983207;,
  -0.037989;0.202917;0.978459;,
  0.939205;-0.153438;0.307164;,
  0.000000;-0.194972;0.980809;,
  0.000000;-0.194972;0.980809;,
  0.209613;0.463854;0.860757;,
  -0.925542;-0.169047;-0.338815;,
  -0.840832;0.072070;-0.536477;,
  -0.976542;0.100497;-0.190434;,
  -0.948919;-0.225568;-0.220615;,
  -0.877740;-0.001733;-0.479134;,
  -0.978403;0.031216;-0.204337;,
  -0.608691;-0.586126;0.534744;,
  -0.992464;0.096940;-0.074956;,
  -0.830347;0.342727;-0.439389;,
  -0.948491;0.158008;-0.274588;,
  -0.076708;0.223380;0.971708;,
  -0.986486;0.153715;0.056723;,
  -0.797050;0.482652;-0.362986;,
  -0.863058;0.296192;-0.409146;,
  0.000000;-0.194972;0.980809;,
  -0.978670;-0.147800;0.142689;,
  -0.984388;-0.116332;-0.132090;,
  -0.912963;-0.208705;-0.350628;,
  -0.085763;0.909836;-0.406008;,
  0.000000;0.913410;-0.407041;,
  0.085763;0.909836;-0.406008;,
  -0.031093;0.823958;-0.565797;,
  0.000000;0.821359;-0.570411;,
  0.031093;0.823958;-0.565797;,
  0.019587;0.861539;-0.507313;,
  0.000000;0.855015;-0.518604;,
  -0.019587;0.861539;-0.507313;,
  0.000000;-0.915391;-0.402566;,
  0.000000;-0.915391;-0.402566;,
  0.000000;-0.602970;-0.797764;,
  0.000000;-0.602970;-0.797764;,
  0.000000;-0.602970;-0.797764;,
  -0.000852;-0.981853;0.189641;,
  0.000000;-0.981655;0.190665;,
  0.000852;-0.981853;0.189641;,
  -0.457018;-0.170694;-0.872925;,
  -0.166005;0.247496;-0.954562;,
  0.070635;0.447169;-0.891656;,
  -0.880329;-0.122817;-0.458189;,
  -0.293539;-0.174678;-0.939852;,
  0.293539;-0.174678;-0.939852;,
  -0.893459;-0.155034;-0.421540;,
  -0.314228;-0.380028;-0.869965;,
  0.314228;-0.380028;-0.869965;,
  -0.883942;-0.166285;-0.437030;,
  -0.294708;-0.386233;-0.874054;,
  0.294708;-0.386233;-0.874054;,
  0.457018;-0.170694;-0.872925;,
  1.000000;0.000000;0.000000;,
  0.880329;-0.122817;-0.458189;,
  0.893459;-0.155034;-0.421540;,
  0.883942;-0.166285;-0.437030;,
  0.878268;0.168092;0.447650;,
  0.283238;0.385565;0.878132;,
  -0.283238;0.385565;0.878132;,
  0.881191;0.188083;0.433737;,
  0.291024;0.468982;0.833883;,
  -0.291024;0.468982;0.833883;,
  0.892459;0.202635;0.403058;,
  0.313915;0.487590;0.814686;,
  -0.313915;0.487590;0.814686;,
  0.900847;0.197453;0.386635;,
  0.330020;0.423359;0.843715;,
  -0.330020;0.423359;0.843715;,
  -0.878268;0.168092;0.447650;,
  -1.000000;0.000000;0.000000;,
  -0.881191;0.188083;0.433737;,
  -0.892459;0.202635;0.403058;,
  -0.900847;0.197453;0.386635;,
  0.213405;0.962506;-0.167453;,
  -0.213405;0.962506;-0.167453;,
  0.154311;0.896857;-0.414531;,
  -0.154311;0.896857;-0.414531;,
  -0.207146;-0.963804;0.167849;,
  0.207146;-0.963804;0.167849;,
  -0.163975;-0.971785;0.169548;,
  0.163975;-0.971785;0.169548;,
  0.985633;0.168754;0.007058;,
  0.977740;0.135298;-0.160369;,
  -0.145266;-0.463360;-0.874183;,
  -0.900382;0.184721;0.393942;,
  -0.843067;0.203985;0.497623;,
  0.158680;0.365427;0.917215;,
  -0.118308;-0.618417;-0.776893;,
  0.978880;-0.157649;-0.130158;,
  0.991354;-0.089813;0.095664;,
  0.018617;0.673623;0.738841;,
  -0.966192;-0.164871;-0.198221;,
  -0.897024;-0.215052;-0.386135;,
  -0.006028;-0.400607;-0.916230;,
  0.027258;0.841755;0.539172;,
  -0.978880;-0.157649;-0.130158;,
  -0.991354;-0.089814;0.095662;,
  -0.018617;0.673623;0.738841;,
  0.966192;-0.164871;-0.198221;,
  0.897024;-0.215052;-0.386135;,
  0.006028;-0.400607;-0.916230;,
  -0.027258;0.841755;0.539172;,
  -0.985633;0.168754;0.007057;,
  -0.977740;0.135298;-0.160370;,
  0.145266;-0.463360;-0.874183;,
  0.900382;0.184721;0.393942;,
  0.843067;0.203985;0.497623;,
  -0.158680;0.365427;0.917215;,
  0.118308;-0.618417;-0.776893;,
  -0.272193;-0.942185;-0.195444;,
  -0.138531;-0.987730;-0.072106;,
  0.000000;-0.998554;0.053767;,
  0.138531;-0.987730;-0.072106;,
  0.272193;-0.942185;-0.195444;,
  0.324337;0.885717;-0.332132;,
  0.832195;-0.317949;-0.454268;,
  -0.209613;0.463854;0.860757;,
  0.239455;-0.622994;0.744675;,
  0.139534;0.601303;0.786743;,
  0.070008;0.569587;0.818944;,
  0.076708;0.223380;0.971708;,
  0.000000;0.533953;0.845514;,
  -0.070008;0.569587;0.818944;,
  -0.567046;0.550267;0.612915;,
  -0.965453;-0.255050;0.053382;,
  -0.940450;0.117931;0.318818;,
  -0.324337;0.885717;-0.332131;,
  -0.939205;-0.153438;0.307164;,
  -0.990104;-0.137928;-0.025874;,
  -0.208362;0.959690;-0.188630;,
  -0.104762;0.977673;-0.182154;,
  -0.170503;0.899621;-0.402009;,
  0.104762;0.977673;-0.182154;,
  0.208362;0.959689;-0.188630;,
  0.170503;0.899621;-0.402009;,
  -0.062198;0.825739;-0.560613;,
  0.062198;0.825739;-0.560613;,
  0.039188;0.867594;-0.495727;,
  -0.039188;0.867594;-0.495727;,
  0.000000;-0.915391;-0.402566;,
  0.000000;-0.995496;0.094799;,
  0.000000;-0.995497;0.094799;,
  0.000000;-0.915391;-0.402566;,
  0.000000;-0.995497;0.094799;,
  0.000000;-0.602970;-0.797764;,
  0.000000;-0.602970;-0.797764;,
  -0.001704;-0.982050;0.188615;,
  0.000000;-0.965926;0.258820;,
  0.001704;-0.982050;0.188615;,
  0.462836;0.867931;-0.180216;,
  0.238385;0.956744;-0.166771;,
  0.417071;0.890158;-0.183495;,
  -0.238385;0.956744;-0.166771;,
  -0.462836;0.867931;-0.180216;,
  -0.417071;0.890158;-0.183495;,
  0.295186;0.898586;-0.324666;,
  -0.295186;0.898586;-0.324666;,
  0.212797;0.864719;-0.454948;,
  -0.212797;0.864719;-0.454948;,
  -0.405385;-0.895291;0.184710;,
  -0.231658;-0.958455;0.166427;,
  -0.450538;-0.874404;0.180092;,
  0.231658;-0.958455;0.166427;,
  0.405385;-0.895291;0.184710;,
  0.450538;-0.874404;0.180092;,
  -0.323493;-0.926798;0.190783;,
  0.323493;-0.926798;0.190783;,
  -0.287299;-0.938314;0.192423;,
  -0.145248;-0.974702;0.169880;,
  0.145248;-0.974702;0.169880;,
  0.287299;-0.938314;0.192423;,
  -0.145265;-0.463356;-0.874185;,
  -0.183989;-0.104776;-0.977328;,
  -0.944726;0.162795;0.284587;,
  0.964732;0.197280;0.174278;,
  -0.118310;-0.618413;-0.776897;,
  -0.118313;-0.618422;-0.776889;,
  0.112768;-0.937542;0.329087;,
  0.112786;-0.937545;0.329073;,
  0.112777;-0.937546;0.329072;,
  0.112763;-0.937540;0.329095;,
  0.112733;-0.937537;0.329114;,
  0.018590;0.673622;0.738843;,
  -0.002667;0.194033;0.980991;,
  -0.994186;-0.107665;-0.001859;,
  0.911831;-0.216694;-0.348723;,
  0.027218;0.841749;0.539183;,
  0.027293;0.841751;0.539175;,
  0.038564;0.842644;-0.537088;,
  0.038574;0.842639;-0.537095;,
  0.038618;0.842628;-0.537110;,
  0.038538;0.842653;-0.537076;,
  0.038544;0.842654;-0.537074;,
  -0.018590;0.673622;0.738843;,
  0.002667;0.194033;0.980991;,
  0.994186;-0.107665;-0.001859;,
  -0.911832;-0.216694;-0.348722;,
  -0.027218;0.841749;0.539183;,
  -0.027293;0.841751;0.539175;,
  -0.038564;0.842644;-0.537088;,
  -0.038618;0.842628;-0.537110;,
  -0.038574;0.842639;-0.537095;,
  -0.038538;0.842653;-0.537076;,
  -0.038544;0.842654;-0.537073;,
  0.145265;-0.463356;-0.874185;,
  0.183989;-0.104776;-0.977328;,
  0.944726;0.162795;0.284587;,
  -0.964732;0.197280;0.174278;,
  0.118310;-0.618413;-0.776897;,
  0.118313;-0.618422;-0.776889;,
  -0.112768;-0.937542;0.329087;,
  -0.112777;-0.937546;0.329072;,
  -0.112786;-0.937545;0.329073;,
  -0.112763;-0.937540;0.329095;,
  -0.112733;-0.937537;0.329114;;
  198;
  4;0,1,5,4;,
  4;1,2,6,5;,
  4;2,3,7,6;,
  4;3,20,24,7;,
  4;4,5,9,8;,
  4;5,6,10,9;,
  4;6,7,11,10;,
  4;7,24,28,11;,
  4;8,9,13,12;,
  4;9,10,14,13;,
  4;10,11,15,14;,
  4;11,28,32,15;,
  4;163,164,17,16;,
  4;164,165,18,17;,
  4;165,166,19,18;,
  4;166,167,36,19;,
  4;106,21,25,106;,
  4;21,22,26,25;,
  4;22,23,27,26;,
  4;23,40,44,27;,
  4;106,25,29,28;,
  4;25,26,30,29;,
  4;26,27,31,30;,
  4;27,44,46,31;,
  4;28,29,33,32;,
  4;29,168,34,33;,
  4;30,31,35,34;,
  4;31,46,50,35;,
  4;32,169,37,36;,
  4;33,34,38,37;,
  4;34,35,39,38;,
  4;35,50,54,39;,
  4;170,41,41,170;,
  4;41,42,45,41;,
  4;42,43,43,45;,
  4;43,57,57,43;,
  4;44,47,47,171;,
  4;47,48,48,47;,
  4;48,49,49,48;,
  4;49,64,64,49;,
  4;172,173,51,174;,
  4;173,175,52,51;,
  4;175,176,53,52;,
  4;176,177,68,53;,
  4;174,51,55,72;,
  4;51,52,56,55;,
  4;52,53,55,56;,
  4;53,68,72,55;,
  4;178,58,61,178;,
  4;58,59,62,61;,
  4;59,60,63,62;,
  4;60,123,123,63;,
  4;64,61,65,64;,
  4;61,62,66,65;,
  4;62,63,67,66;,
  4;63,123,8,67;,
  4;177,65,69,179;,
  4;65,66,70,69;,
  4;66,180,71,70;,
  4;67,8,12,71;,
  4;179,69,73,181;,
  4;69,182,74,73;,
  4;70,71,75,74;,
  4;71,12,16,75;,
  4;183,184,76,185;,
  4;184,42,77,76;,
  4;42,186,78,77;,
  4;186,187,188,78;,
  4;185,76,79,189;,
  4;76,77,80,79;,
  4;77,78,81,80;,
  4;78,188,190,81;,
  4;189,79,82,191;,
  4;79,80,83,82;,
  4;80,81,84,83;,
  4;81,190,192,84;,
  4;191,82,1,0;,
  4;82,83,2,1;,
  4;83,84,3,2;,
  4;84,192,20,3;,
  4;193,85,194,194;,
  4;85,86,194,194;,
  4;86,85,195,194;,
  4;85,196,197,195;,
  4;198,87,85,193;,
  4;87,88,86,85;,
  4;88,89,85,86;,
  4;89,199,196,85;,
  4;200,90,201,201;,
  4;90,91,201,201;,
  4;91,92,201,201;,
  4;92,202,201,201;,
  4;16,17,90,200;,
  4;17,18,91,90;,
  4;18,19,92,91;,
  4;19,36,202,92;,
  4;93,94,97,96;,
  4;94,95,98,97;,
  4;95,105,107,98;,
  4;96,97,100,99;,
  4;97,98,101,100;,
  4;98,107,108,101;,
  4;99,100,103,102;,
  4;100,101,104,103;,
  4;101,108,109,104;,
  4;106,106,106,107;,
  4;106,106,106,106;,
  4;106,110,113,106;,
  4;107,106,106,108;,
  4;106,106,106,106;,
  4;106,113,116,106;,
  4;108,106,106,109;,
  4;106,106,106,106;,
  4;106,116,119,106;,
  4;110,111,114,113;,
  4;111,112,115,114;,
  4;112,122,124,115;,
  4;113,114,117,116;,
  4;114,115,118,117;,
  4;115,124,125,118;,
  4;116,117,120,119;,
  4;117,118,121,120;,
  4;118,125,126,121;,
  4;122,123,123,124;,
  4;123,123,123,123;,
  4;123,123,96,123;,
  4;124,123,123,125;,
  4;123,123,123,123;,
  4;123,96,99,123;,
  4;125,123,123,126;,
  4;123,123,123,123;,
  4;123,99,102,123;,
  4;203,204,127,205;,
  4;204,206,128,127;,
  4;206,207,208,128;,
  4;205,127,129,209;,
  4;127,128,130,129;,
  4;128,208,210,130;,
  4;209,129,211,211;,
  4;129,130,95,94;,
  4;130,210,212,95;,
  4;213,131,214,215;,
  4;131,132,216,214;,
  4;132,217,218,216;,
  4;219,133,131,213;,
  4;133,134,132,131;,
  4;134,220,217,132;,
  4;221,222,133,219;,
  4;222,223,134,133;,
  4;223,224,220,134;,
  3;135,136,135;,
  3;225,137,226;,
  3;227,138,138;,
  3;138,139,138;,
  3;140,140,140;,
  3;228,135,135;,
  3;141,225,229;,
  3;141,137,225;,
  3;141,230,137;,
  3;231,232,233;,
  3;231,234,232;,
  3;231,235,234;,
  3;142,143,142;,
  3;236,144,237;,
  3;238,145,145;,
  3;145,146,145;,
  3;147,147,147;,
  3;239,142,142;,
  3;148,236,240;,
  3;148,144,236;,
  3;148,241,144;,
  3;242,243,244;,
  3;242,245,243;,
  3;242,246,245;,
  3;149,149,150;,
  3;247,248,151;,
  3;249,152,152;,
  3;152,152,153;,
  3;154,154,154;,
  3;250,149,149;,
  3;155,251,247;,
  3;155,247,151;,
  3;155,151,252;,
  3;253,254,255;,
  3;253,255,256;,
  3;253,256,257;,
  3;156,156,157;,
  3;258,259,158;,
  3;260,159,159;,
  3;159,159,160;,
  3;161,161,161;,
  3;261,156,156;,
  3;162,262,258;,
  3;162,258,158;,
  3;162,158,263;,
  3;264,265,266;,
  3;264,266,267;,
  3;264,267,268;;
 }
 MeshTextureCoords {
  316;
  0.000000;0.000000;,
  0.250000;0.000000;,
  0.250000;0.250000;,
  0.000000;0.250000;,
  0.500000;0.000000;,
  0.500000;0.250000;,
  0.750000;0.000000;,
  0.750000;0.250000;,
  1.000000;0.000000;,
  1.000000;0.250000;,
  0.250000;0.500000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  0.750000;0.500000;,
  1.000000;0.500000;,
  0.250000;0.750000;,
  0.000000;0.750000;,
  0.500000;0.750000;,
  0.750000;0.750000;,
  1.000000;0.750000;,
  0.250000;1.000000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  0.750000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.250000;0.000000;,
  0.250000;0.250000;,
  0.000000;0.250000;,
  0.500000;0.000000;,
  0.500000;0.250000;,
  0.750000;0.000000;,
  0.750000;0.250000;,
  1.000000;0.000000;,
  1.000000;0.250000;,
  0.250000;0.500000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  0.750000;0.500000;,
  1.000000;0.500000;,
  0.250000;0.750000;,
  0.000000;0.750000;,
  0.500000;0.750000;,
  0.750000;0.750000;,
  1.000000;0.750000;,
  0.250000;1.000000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  0.750000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.250000;0.000000;,
  0.250000;0.250000;,
  0.000000;0.250000;,
  0.500000;0.000000;,
  0.500000;0.250000;,
  0.750000;0.000000;,
  0.750000;0.250000;,
  1.000000;0.000000;,
  1.000000;0.250000;,
  0.250000;0.500000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  0.750000;0.500000;,
  1.000000;0.500000;,
  0.250000;0.750000;,
  0.000000;0.750000;,
  0.500000;0.750000;,
  0.750000;0.750000;,
  1.000000;0.750000;,
  0.250000;1.000000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  0.750000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.250000;0.000000;,
  0.250000;0.250000;,
  0.000000;0.250000;,
  0.500000;0.000000;,
  0.500000;0.250000;,
  0.750000;0.000000;,
  0.750000;0.250000;,
  1.000000;0.000000;,
  1.000000;0.250000;,
  0.250000;0.500000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  0.750000;0.500000;,
  1.000000;0.500000;,
  0.250000;0.750000;,
  0.000000;0.750000;,
  0.500000;0.750000;,
  0.750000;0.750000;,
  1.000000;0.750000;,
  0.250000;1.000000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  0.750000;1.000000;,
  1.000000;1.000000;,
  0.250000;0.000000;,
  0.250000;0.250000;,
  0.000000;0.250000;,
  0.500000;0.250000;,
  0.750000;0.000000;,
  0.750000;0.250000;,
  1.000000;0.250000;,
  0.250000;0.500000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  0.750000;0.500000;,
  1.000000;0.500000;,
  0.250000;0.750000;,
  0.000000;0.750000;,
  0.500000;0.750000;,
  0.750000;0.750000;,
  1.000000;0.750000;,
  0.250000;1.000000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  0.750000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.750000;,
  0.250000;0.750000;,
  0.250000;1.000000;,
  0.500000;0.750000;,
  0.750000;0.750000;,
  0.750000;1.000000;,
  1.000000;0.750000;,
  0.000000;0.500000;,
  0.250000;0.500000;,
  0.500000;0.500000;,
  0.750000;0.500000;,
  1.000000;0.500000;,
  0.000000;0.250000;,
  0.250000;0.250000;,
  0.500000;0.250000;,
  0.750000;0.250000;,
  1.000000;0.250000;,
  0.000000;0.000000;,
  0.250000;0.000000;,
  0.500000;0.000000;,
  0.750000;0.000000;,
  1.000000;0.000000;,
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
  0.000000;1.000000;,
  0.166670;1.000000;,
  0.083330;0.000000;,
  0.333330;1.000000;,
  0.166670;0.000000;,
  0.500000;1.000000;,
  0.250000;0.000000;,
  0.666670;1.000000;,
  0.333330;0.000000;,
  0.833330;1.000000;,
  0.416670;0.000000;,
  1.000000;1.000000;,
  0.500000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;1.000000;,
  0.166670;1.000000;,
  0.083330;0.000000;,
  0.333330;1.000000;,
  0.166670;0.000000;,
  0.500000;1.000000;,
  0.250000;0.000000;,
  0.666670;1.000000;,
  0.333330;0.000000;,
  0.833330;1.000000;,
  0.416670;0.000000;,
  1.000000;1.000000;,
  0.500000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;1.000000;,
  0.083330;0.000000;,
  0.166670;1.000000;,
  0.166670;0.000000;,
  0.333330;1.000000;,
  0.250000;0.000000;,
  0.500000;1.000000;,
  0.333330;0.000000;,
  0.666670;1.000000;,
  0.416670;0.000000;,
  0.833330;1.000000;,
  0.500000;0.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;1.000000;,
  0.083330;0.000000;,
  0.166670;1.000000;,
  0.166670;0.000000;,
  0.333330;1.000000;,
  0.250000;0.000000;,
  0.500000;1.000000;,
  0.333330;0.000000;,
  0.666670;1.000000;,
  0.416670;0.000000;,
  0.833330;1.000000;,
  0.500000;0.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;;
 }
}