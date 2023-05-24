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
 310;
 -1.47900;3.89000;-1.11500;,
 -0.59707;3.54187;-1.44550;,
 -0.84641;3.16626;-1.44550;,
 -1.71772;3.42110;-1.11500;,
 -0.00026;3.24690;-1.44550;,
 -0.00026;2.93070;-1.44550;,
 0.72830;3.48246;-1.44550;,
 0.84589;3.16626;-1.44550;,
 1.47918;3.89000;-1.11500;,
 1.71790;3.42110;-1.11500;,
 -0.61814;2.56387;-1.44550;,
 -1.64231;2.72014;-1.11500;,
 -0.00037;2.25386;-1.44550;,
 0.64303;2.56387;-1.44550;,
 1.64249;2.72014;-1.11500;,
 -0.70393;1.67287;-1.27438;,
 -1.40703;1.67255;-1.11500;,
 -0.00037;1.67287;-1.27438;,
 0.73549;1.67287;-1.27438;,
 1.47181;1.67255;-1.11500;,
 -0.47826;1.34040;-0.91485;,
 -0.88380;1.34040;-0.67326;,
 0.00009;1.34040;-0.99969;,
 0.47844;1.34040;-0.91485;,
 0.88398;1.34040;-0.67326;,
 1.47918;3.89000;-1.11500;,
 1.71409;3.89006;-0.50025;,
 1.99074;3.42117;-0.50025;,
 1.71790;3.42110;-1.11500;,
 1.71409;3.89006;0.11467;,
 1.99074;3.42117;0.11467;,
 1.71409;3.89006;0.72960;,
 1.99074;3.42117;0.72960;,
 1.47918;3.89000;1.07011;,
 1.71790;3.42110;1.07011;,
 1.90335;2.72020;-0.50025;,
 1.64249;2.72014;-1.11500;,
 1.90335;2.72020;0.11467;,
 1.90335;2.72020;0.72960;,
 1.64249;2.72014;1.07011;,
 1.74465;1.67262;-0.50025;,
 1.47181;1.67255;-1.11500;,
 1.74465;1.67262;0.11467;,
 1.74465;1.67262;0.72960;,
 1.47181;1.67255;1.07011;,
 1.15494;1.34040;-0.31167;,
 0.88398;1.34040;-0.67326;,
 1.29929;1.32131;0.11484;,
 1.15494;1.34040;0.54134;,
 0.88398;1.34040;0.90293;,
 1.47918;3.89000;1.07011;,
 0.74009;3.68661;1.40061;,
 0.84679;3.16626;1.40061;,
 1.71790;3.42110;1.07011;,
 0.00055;3.68661;1.40061;,
 0.00064;2.93070;1.40061;,
 -0.73900;3.68661;1.40061;,
 -0.84551;3.16626;1.40061;,
 -1.47900;3.89000;1.07011;,
 -1.71772;3.42110;1.07011;,
 0.80965;2.69357;1.40061;,
 1.64249;2.72014;1.07011;,
 0.00064;2.45801;1.40061;,
 -0.80836;2.69357;1.40061;,
 -1.64231;2.72014;1.07011;,
 0.73642;1.67287;1.22949;,
 1.47181;1.67255;1.07011;,
 0.00055;1.67287;1.22949;,
 -0.73531;1.67287;1.22949;,
 -1.47163;1.67255;1.07011;,
 0.47844;1.34040;0.86997;,
 0.88398;1.34040;0.90293;,
 0.00009;1.34040;0.95480;,
 -0.47826;1.34040;0.86997;,
 -0.88380;1.34040;0.90293;,
 -1.47900;3.89000;1.07011;,
 -1.71391;3.89006;0.72992;,
 -1.99056;3.42117;0.72992;,
 -1.71772;3.42110;1.07011;,
 -1.71391;3.89006;0.11500;,
 -1.99056;3.42117;0.11500;,
 -1.71391;3.89006;-0.49993;,
 -1.99056;3.42117;-0.49993;,
 -1.47900;3.89000;-1.11500;,
 -1.71772;3.42110;-1.11500;,
 -1.90317;2.72020;0.72992;,
 -1.64231;2.72014;1.07011;,
 -1.90317;2.72020;0.11500;,
 -1.90317;2.72020;-0.49993;,
 -1.64231;2.72014;-1.11500;,
 -1.47163;1.67255;0.72975;,
 -1.47163;1.67255;1.07011;,
 -1.47163;1.67255;0.11484;,
 -1.47163;1.67255;-0.50008;,
 -1.40703;1.67255;-1.11500;,
 -1.15476;1.34040;0.54134;,
 -0.88380;1.34040;0.90293;,
 -1.24991;1.34040;0.11484;,
 -1.15476;1.34040;-0.31167;,
 -0.88380;1.34040;-0.67326;,
 -0.73900;3.68661;1.40061;,
 -0.73910;3.78986;0.72992;,
 -1.71391;3.89006;0.72992;,
 0.00009;3.78986;0.72992;,
 0.74009;3.68661;1.40061;,
 0.73928;3.78986;0.72992;,
 1.71409;3.89006;0.72960;,
 -0.73910;3.78986;0.11484;,
 -1.71391;3.89006;0.11500;,
 0.00009;3.78986;0.11484;,
 0.73928;3.78986;0.11484;,
 1.71409;3.89006;0.11467;,
 -0.73910;3.78986;-0.50025;,
 -1.71391;3.89006;-0.49993;,
 0.00009;3.78986;-0.50025;,
 0.73928;3.78986;-0.50025;,
 1.71409;3.89006;-0.50025;,
 -0.59707;3.54187;-1.44550;,
 -1.47900;3.89000;-1.11500;,
 -0.00026;3.24690;-1.44550;,
 0.72830;3.48246;-1.44550;,
 1.47918;3.89000;-1.11500;,
 -1.15476;1.34040;0.54134;,
 -0.64951;1.32131;0.66861;,
 -0.47826;1.34040;0.86997;,
 0.00009;1.32131;0.66861;,
 0.64969;1.32131;0.66861;,
 0.47844;1.34040;0.86997;,
 1.15494;1.34040;0.54134;,
 -1.24991;1.34040;0.11484;,
 -0.64951;1.32131;0.11484;,
 0.00009;1.32131;0.11484;,
 0.64969;1.32131;0.11484;,
 1.29929;1.32131;0.11484;,
 -1.15476;1.34040;-0.31167;,
 -0.64951;1.32131;-0.43894;,
 0.00009;1.32131;-0.43894;,
 0.64969;1.32131;-0.43894;,
 1.15494;1.34040;-0.31167;,
 -0.88380;1.34040;-0.67326;,
 -0.47826;1.34040;-0.91485;,
 0.00009;1.34040;-0.99969;,
 0.47844;1.34040;-0.91485;,
 0.88398;1.34040;-0.67326;,
 0.00009;1.34040;-0.99969;,
 0.47844;1.34040;-0.91485;,
 0.54705;0.66978;-0.50081;,
 0.00009;0.66978;-0.55154;,
 0.88398;1.34040;-0.67326;,
 0.74937;0.66978;-0.35636;,
 1.15494;1.34040;-0.31167;,
 0.89056;0.66978;-0.16833;,
 1.29929;1.32131;0.11484;,
 0.96393;0.66978;0.11484;,
 1.15494;1.34040;0.54134;,
 0.89056;0.66978;0.39800;,
 0.88398;1.34040;0.90293;,
 0.74937;0.66978;0.58604;,
 0.47844;1.34040;0.86997;,
 0.54707;0.66978;0.73049;,
 0.00009;1.34040;0.95480;,
 0.00009;0.66978;0.78121;,
 -0.47826;1.34040;0.86997;,
 -0.54687;0.66978;0.73049;,
 -0.88380;1.34040;0.90293;,
 -0.74919;0.66978;0.58604;,
 -1.15476;1.34040;0.54134;,
 -0.89038;0.66978;0.39800;,
 -1.24991;1.34040;0.11484;,
 -0.96375;0.66978;0.11484;,
 -1.15476;1.34040;-0.31167;,
 -0.89038;0.66978;-0.16833;,
 -0.88380;1.34040;-0.67326;,
 -0.74919;0.66978;-0.35636;,
 -0.47826;1.34040;-0.91485;,
 -0.54687;0.66978;-0.50081;,
 0.00009;1.34040;-0.99969;,
 0.00009;0.66978;-0.55154;,
 0.52045;0.43971;-0.47085;,
 0.00009;0.43971;-0.51911;,
 0.71292;0.43971;-0.33344;,
 0.84724;0.43971;-0.15455;,
 0.91704;0.43971;0.11484;,
 0.84724;0.43971;0.38422;,
 0.71292;0.43971;0.56311;,
 0.52045;0.43971;0.70052;,
 0.00009;0.43971;0.74879;,
 -0.52027;0.43971;0.70052;,
 -0.71274;0.43971;0.56311;,
 -0.84706;0.43971;0.38422;,
 -0.91686;0.43971;0.11484;,
 -0.84706;0.43971;-0.15455;,
 -0.71274;0.43971;-0.33344;,
 -0.52027;0.43971;-0.47085;,
 0.00009;0.43971;-0.51911;,
 0.41402;-0.00214;-0.71610;,
 0.00009;-0.00214;-0.78455;,
 0.76494;-0.00214;-0.52113;,
 0.99942;-0.00214;-0.22934;,
 1.08175;-0.00214;0.11484;,
 0.99942;-0.00214;0.45901;,
 0.76494;-0.00214;0.75081;,
 0.41402;-0.00214;0.94577;,
 0.00009;-0.00214;1.01422;,
 -0.41384;-0.00214;0.94577;,
 -0.76476;-0.00214;0.75081;,
 -0.99924;-0.00214;0.45901;,
 -1.08158;-0.00214;0.11484;,
 -0.99924;-0.00214;-0.22934;,
 -0.76476;-0.00214;-0.52113;,
 -0.41384;-0.00214;-0.71610;,
 0.00009;-0.00214;-0.78455;,
 0.00009;1.34040;0.11484;,
 0.00009;1.34040;0.11484;,
 0.00009;1.34040;0.11484;,
 0.00009;1.34040;0.11484;,
 0.00009;1.34040;0.11484;,
 0.00009;1.34040;0.11484;,
 0.00009;1.34040;0.11484;,
 0.00009;1.34040;0.11484;,
 0.00009;1.34040;0.11484;,
 0.00009;1.34040;0.11484;,
 0.00009;1.34040;0.11484;,
 0.00009;1.34040;0.11484;,
 0.00009;1.34040;0.11484;,
 0.00009;1.34040;0.11484;,
 0.00009;1.34040;0.11484;,
 0.00009;1.34040;0.11484;,
 0.00009;-0.00214;0.11484;,
 0.00009;-0.00214;0.11484;,
 0.00009;-0.00214;0.11484;,
 0.00009;-0.00214;0.11484;,
 0.00009;-0.00214;0.11484;,
 0.00009;-0.00214;0.11484;,
 0.00009;-0.00214;0.11484;,
 0.00009;-0.00214;0.11484;,
 0.00009;-0.00214;0.11484;,
 0.00009;-0.00214;0.11484;,
 0.00009;-0.00214;0.11484;,
 0.00009;-0.00214;0.11484;,
 0.00009;-0.00214;0.11484;,
 0.00009;-0.00214;0.11484;,
 0.00009;-0.00214;0.11484;,
 0.00009;-0.00214;0.11484;,
 0.00009;4.31036;-0.42331;,
 0.14318;4.31036;-0.38234;,
 0.17180;3.68536;-0.48178;,
 0.00009;3.68536;-0.53094;,
 0.26449;4.31036;-0.26569;,
 0.31737;3.68536;-0.28426;,
 0.34554;4.31036;-0.06515;,
 0.41464;3.68536;-0.10115;,
 0.37401;4.31036;0.11484;,
 0.44879;3.68536;0.11484;,
 0.34554;4.31036;0.29483;,
 0.41464;3.68536;0.33083;,
 0.26449;4.31036;0.49536;,
 0.31737;3.68536;0.51393;,
 0.14318;4.31036;0.61202;,
 0.17180;3.68536;0.71145;,
 0.00009;4.31036;0.65298;,
 0.00009;3.68536;0.76061;,
 -0.14300;4.31036;0.61202;,
 -0.17162;3.68536;0.71145;,
 -0.26431;4.31036;0.49536;,
 -0.31719;3.68536;0.51393;,
 -0.34536;4.31036;0.29483;,
 -0.41446;3.68536;0.33083;,
 -0.37383;4.31036;0.11484;,
 -0.44861;3.68536;0.11484;,
 -0.34536;4.31036;-0.06515;,
 -0.41446;3.68536;-0.10115;,
 -0.26431;4.31036;-0.26569;,
 -0.31719;3.68536;-0.28426;,
 -0.14300;4.31036;-0.38234;,
 -0.17162;3.68536;-0.48178;,
 0.00009;4.31036;-0.42331;,
 0.00009;3.68536;-0.53094;,
 0.00009;4.31036;0.11484;,
 0.00009;4.31036;0.11484;,
 0.00009;4.31036;0.11484;,
 0.00009;4.31036;0.11484;,
 0.00009;4.31036;0.11484;,
 0.00009;4.31036;0.11484;,
 0.00009;4.31036;0.11484;,
 0.00009;4.31036;0.11484;,
 0.00009;4.31036;0.11484;,
 0.00009;4.31036;0.11484;,
 0.00009;4.31036;0.11484;,
 0.00009;4.31036;0.11484;,
 0.00009;4.31036;0.11484;,
 0.00009;4.31036;0.11484;,
 0.00009;4.31036;0.11484;,
 0.00009;4.31036;0.11484;,
 0.00009;3.68536;0.11484;,
 0.00009;3.68536;0.11484;,
 0.00009;3.68536;0.11484;,
 0.00009;3.68536;0.11484;,
 0.00009;3.68536;0.11484;,
 0.00009;3.68536;0.11484;,
 0.00009;3.68536;0.11484;,
 0.00009;3.68536;0.11484;,
 0.00009;3.68536;0.11484;,
 0.00009;3.68536;0.11484;,
 0.00009;3.68536;0.11484;,
 0.00009;3.68536;0.11484;,
 0.00009;3.68536;0.11484;,
 0.00009;3.68536;0.11484;,
 0.00009;3.68536;0.11484;,
 0.00009;3.68536;0.11484;;
 
 224;
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
 4;150,152,153,151;,
 4;152,154,155,153;,
 4;154,156,157,155;,
 4;156,158,159,157;,
 4;158,160,161,159;,
 4;160,162,163,161;,
 4;162,164,165,163;,
 4;164,166,167,165;,
 4;166,168,169,167;,
 4;168,170,171,169;,
 4;170,172,173,171;,
 4;172,174,175,173;,
 4;174,176,177,175;,
 4;147,146,178,179;,
 4;146,149,180,178;,
 4;149,151,181,180;,
 4;151,153,182,181;,
 4;153,155,183,182;,
 4;155,157,184,183;,
 4;157,159,185,184;,
 4;159,161,186,185;,
 4;161,163,187,186;,
 4;163,165,188,187;,
 4;165,167,189,188;,
 4;167,169,190,189;,
 4;169,171,191,190;,
 4;171,173,192,191;,
 4;173,175,193,192;,
 4;175,177,194,193;,
 4;179,178,195,196;,
 4;178,180,197,195;,
 4;180,181,198,197;,
 4;181,182,199,198;,
 4;182,183,200,199;,
 4;183,184,201,200;,
 4;184,185,202,201;,
 4;185,186,203,202;,
 4;186,187,204,203;,
 4;187,188,205,204;,
 4;188,189,206,205;,
 4;189,190,207,206;,
 4;190,191,208,207;,
 4;191,192,209,208;,
 4;192,193,210,209;,
 4;193,194,211,210;,
 3;212,145,144;,
 3;213,148,145;,
 3;214,150,148;,
 3;215,152,150;,
 3;216,154,152;,
 3;217,156,154;,
 3;218,158,156;,
 3;219,160,158;,
 3;220,162,160;,
 3;221,164,162;,
 3;222,166,164;,
 3;223,168,166;,
 3;224,170,168;,
 3;225,172,170;,
 3;226,174,172;,
 3;227,176,174;,
 3;228,196,195;,
 3;229,195,197;,
 3;230,197,198;,
 3;231,198,199;,
 3;232,199,200;,
 3;233,200,201;,
 3;234,201,202;,
 3;235,202,203;,
 3;236,203,204;,
 3;237,204,205;,
 3;238,205,206;,
 3;239,206,207;,
 3;240,207,208;,
 3;241,208,209;,
 3;242,209,210;,
 3;243,210,211;,
 4;244,245,246,247;,
 4;245,248,249,246;,
 4;248,250,251,249;,
 4;250,252,253,251;,
 4;252,254,255,253;,
 4;254,256,257,255;,
 4;256,258,259,257;,
 4;258,260,261,259;,
 4;260,262,263,261;,
 4;262,264,265,263;,
 4;264,266,267,265;,
 4;266,268,269,267;,
 4;268,270,271,269;,
 4;270,272,273,271;,
 4;272,274,275,273;,
 4;274,276,277,275;,
 3;278,245,244;,
 3;279,248,245;,
 3;280,250,248;,
 3;281,252,250;,
 3;282,254,252;,
 3;283,256,254;,
 3;284,258,256;,
 3;285,260,258;,
 3;286,262,260;,
 3;287,264,262;,
 3;288,266,264;,
 3;289,268,266;,
 3;290,270,268;,
 3;291,272,270;,
 3;292,274,272;,
 3;293,276,274;,
 3;294,247,246;,
 3;295,246,249;,
 3;296,249,251;,
 3;297,251,253;,
 3;298,253,255;,
 3;299,255,257;,
 3;300,257,259;,
 3;301,259,261;,
 3;302,261,263;,
 3;303,263,265;,
 3;304,265,267;,
 3;305,267,269;,
 3;306,269,271;,
 3;307,271,273;,
 3;308,273,275;,
 3;309,275,277;;
 
 MeshMaterialList {
  7;
  224;
  1,
  1,
  1,
  1,
  1,
  2,
  2,
  1,
  1,
  1,
  1,
  1,
  2,
  1,
  1,
  2,
  2,
  1,
  1,
  2,
  2,
  1,
  1,
  2,
  2,
  1,
  1,
  1,
  2,
  1,
  1,
  2,
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
  2,
  1,
  1,
  2,
  2,
  1,
  1,
  2,
  2,
  1,
  1,
  2,
  1,
  1,
  1,
  2,
  2,
  1,
  1,
  2,
  2,
  2,
  2,
  2,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  2,
  2,
  2,
  2,
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
  1,
  1,
  1,
  1,
  2,
  1,
  1,
  1,
  1,
  1,
  2,
  2,
  2,
  2,
  1,
  1,
  1,
  1,
  1,
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
  1,
  1,
  1,
  1,
  1,
  1,
  2,
  2,
  1,
  1,
  1,
  1,
  1,
  1,
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
  1;;
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
   1.000000;1.000000;1.000000;1.000000;;
   0.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
 }
 MeshNormals {
  196;
  -0.618002;0.344558;-0.706649;,
  -0.149615;0.087157;-0.984896;,
  0.000000;0.000000;-1.000000;,
  0.165385;0.072298;-0.983575;,
  -0.667717;0.123010;-0.734182;,
  -0.162404;0.023176;-0.986452;,
  0.170921;0.017163;-0.985135;,
  -0.686852;-0.166507;-0.707467;,
  -0.166438;-0.109025;-0.980006;,
  -0.000467;-0.116599;-0.993179;,
  0.166159;-0.105143;-0.980477;,
  -0.566132;-0.597749;-0.567618;,
  -0.160216;-0.499170;-0.851563;,
  -0.000476;-0.475602;-0.879660;,
  0.157692;-0.499738;-0.851702;,
  -0.273539;-0.920909;-0.277676;,
  -0.086524;-0.931941;-0.352137;,
  0.000005;-0.911224;-0.411911;,
  0.084632;-0.933104;-0.349506;,
  0.632904;0.327253;-0.701669;,
  0.855831;0.487614;-0.172583;,
  0.861265;0.508155;0.000000;,
  0.832480;0.475140;0.284990;,
  0.674120;0.115854;-0.729479;,
  0.960718;0.195576;-0.196906;,
  0.979162;0.203083;0.000000;,
  0.928054;0.191584;0.319392;,
  0.666831;-0.118364;-0.735749;,
  0.970345;-0.133281;-0.201660;,
  0.990604;-0.136760;-0.000000;,
  0.937221;-0.128774;0.324090;,
  0.523181;-0.587096;-0.617738;,
  0.794303;-0.573602;-0.200158;,
  0.838043;-0.545604;0.000004;,
  0.771806;-0.566009;0.289741;,
  0.216935;-0.939004;-0.266852;,
  0.250750;-0.963088;-0.097912;,
  0.287194;-0.957872;0.000004;,
  0.250669;-0.959879;0.125691;,
  0.569445;0.273902;0.775054;,
  0.178004;0.060503;0.982168;,
  0.000000;0.000000;1.000000;,
  -0.177833;0.060408;0.982205;,
  0.591677;0.104933;0.799317;,
  0.182548;0.021582;0.982960;,
  -0.182351;0.021543;0.982997;,
  0.579380;-0.095590;0.809433;,
  0.173347;-0.087375;0.980977;,
  0.000000;-0.095887;0.995392;,
  -0.173148;-0.087348;0.981015;,
  0.434126;-0.512938;0.740560;,
  0.114469;-0.442988;0.889190;,
  -0.000004;-0.457035;0.889449;,
  -0.114361;-0.442918;0.889238;,
  0.166026;-0.906574;0.388020;,
  0.039010;-0.903567;0.426668;,
  -0.000005;-0.902034;0.431664;,
  -0.038995;-0.903543;0.426719;,
  -0.569165;0.273745;0.775316;,
  -0.832426;0.475111;0.285196;,
  -0.861265;0.508155;0.000000;,
  -0.855844;0.487621;-0.172502;,
  -0.591341;0.104870;0.799573;,
  -0.927981;0.191574;0.319610;,
  -0.979162;0.203083;0.000000;,
  -0.960736;0.195578;-0.196814;,
  -0.638767;-0.133394;0.757748;,
  -0.945333;-0.220540;0.240223;,
  -0.967060;-0.254549;0.000000;,
  -0.959690;-0.230022;-0.161511;,
  -0.527085;-0.554358;0.644102;,
  -0.824094;-0.543983;0.157963;,
  -0.861264;-0.508158;0.000001;,
  -0.822617;-0.549552;-0.145921;,
  -0.216337;-0.908055;0.358656;,
  -0.364964;-0.925891;0.097606;,
  -0.447378;-0.894345;0.000001;,
  -0.370634;-0.923437;-0.099467;,
  0.063805;0.996800;0.048161;,
  0.000000;0.997085;0.076299;,
  -0.063823;0.996797;0.048200;,
  0.051192;0.998689;0.000000;,
  0.000000;1.000000;0.000000;,
  -0.051192;0.998689;0.000000;,
  0.128337;0.985170;-0.113883;,
  0.016906;0.980258;-0.197000;,
  -0.120720;0.983612;-0.133915;,
  -0.015097;-0.999222;0.036439;,
  0.000000;-0.999189;0.040272;,
  0.011121;-0.999091;0.041141;,
  -0.017387;-0.999849;0.000000;,
  0.000000;-1.000000;-0.000000;,
  0.009445;-0.999955;0.000000;,
  -0.019061;-0.999600;-0.020884;,
  0.000000;-0.999828;-0.018530;,
  0.015088;-0.999559;-0.025588;,
  0.001835;0.999998;-0.000000;,
  0.000000;-0.537592;-0.843205;,
  0.307951;-0.497107;-0.811203;,
  0.618879;-0.428232;-0.658488;,
  0.809505;-0.416855;-0.413442;,
  0.901031;-0.433755;0.000004;,
  0.809507;-0.416853;0.413440;,
  0.507430;-0.397533;0.764515;,
  0.183018;-0.286951;0.940300;,
  -0.000001;-0.222591;0.974912;,
  -0.183008;-0.286950;0.940302;,
  -0.507421;-0.397533;0.764521;,
  -0.827783;-0.404338;0.388955;,
  -0.917225;-0.398369;0.000003;,
  -0.827781;-0.404340;-0.388957;,
  -0.618879;-0.428232;-0.658488;,
  -0.307951;-0.497107;-0.811203;,
  0.000000;-0.346247;-0.938143;,
  0.330996;-0.335253;-0.882070;,
  0.658728;-0.306197;-0.687256;,
  0.852723;-0.306932;-0.422677;,
  0.947818;-0.318811;0.000004;,
  0.852723;-0.306934;0.422675;,
  0.605371;-0.289252;0.741525;,
  0.263493;-0.225760;0.937872;,
  -0.000001;-0.181154;0.983455;,
  -0.263485;-0.225753;0.937876;,
  -0.605363;-0.289246;0.741534;,
  -0.861303;-0.300081;0.410011;,
  -0.953612;-0.301039;0.000004;,
  -0.861302;-0.300079;-0.410013;,
  -0.658728;-0.306197;-0.687256;,
  -0.330996;-0.335253;-0.882070;,
  0.000000;0.186122;-0.982527;,
  0.343067;0.146884;-0.927756;,
  0.682858;0.093505;-0.724542;,
  0.897038;0.083249;-0.434042;,
  0.996643;0.081870;0.000004;,
  0.897039;0.083246;0.434041;,
  0.682866;0.093492;0.724537;,
  0.343071;0.146869;0.927756;,
  -0.000000;0.186116;0.982528;,
  -0.343066;0.146876;0.927757;,
  -0.682861;0.093498;0.724541;,
  -0.897037;0.083248;0.434044;,
  -0.996643;0.081874;0.000004;,
  -0.897036;0.083251;-0.434045;,
  -0.682858;0.093505;-0.724542;,
  -0.343067;0.146884;-0.927756;,
  0.000000;0.492654;-0.870225;,
  0.310766;0.436540;-0.844309;,
  0.627407;0.359523;-0.690727;,
  0.841728;0.352329;-0.409094;,
  0.934632;0.355617;0.000004;,
  0.841728;0.352331;0.409094;,
  0.627404;0.359531;0.690726;,
  0.310764;0.436540;0.844309;,
  0.000000;0.492645;0.870230;,
  -0.310764;0.436540;0.844309;,
  -0.627404;0.359531;0.690726;,
  -0.841724;0.352334;0.409099;,
  -0.934628;0.355627;0.000004;,
  -0.841724;0.352333;-0.409100;,
  -0.627407;0.359523;-0.690727;,
  -0.310766;0.436540;-0.844309;,
  0.000000;0.169713;-0.985493;,
  0.530855;0.139991;-0.835820;,
  0.832635;0.107068;-0.543374;,
  0.950214;0.113085;-0.290354;,
  0.992917;0.118810;0.000000;,
  0.950211;0.113085;0.290364;,
  0.832636;0.107065;0.543373;,
  0.530850;0.139987;0.835824;,
  0.000000;0.169704;0.985495;,
  -0.530850;0.139987;0.835824;,
  -0.832636;0.107065;0.543373;,
  -0.950211;0.113085;0.290364;,
  -0.992917;0.118810;0.000000;,
  -0.950214;0.113085;-0.290354;,
  -0.832635;0.107068;-0.543374;,
  -0.530855;0.139991;-0.835820;,
  0.151914;0.987596;0.039692;,
  0.076298;0.992418;0.096354;,
  0.127147;0.991685;0.019856;,
  0.000000;0.988357;0.152154;,
  -0.076333;0.992408;0.096433;,
  -0.151984;0.987579;0.039849;,
  -0.127183;0.991679;0.019935;,
  0.102250;0.994759;0.000000;,
  -0.102250;0.994759;0.000000;,
  0.151608;0.987585;-0.041127;,
  -0.169404;0.983515;-0.063253;,
  0.203731;0.952432;-0.226645;,
  0.200332;0.976284;-0.082082;,
  0.033381;0.920641;-0.388980;,
  -0.188118;0.945432;-0.266028;,
  -0.235094;0.963776;-0.125959;,
  0.007342;0.999775;0.019880;,
  0.014692;0.999892;-0.000000;,
  0.007342;0.999775;-0.019880;;
  224;
  4;0,1,5,4;,
  4;1,2,2,5;,
  4;2,3,6,2;,
  4;3,19,23,6;,
  4;4,5,8,7;,
  4;5,2,9,8;,
  4;2,6,10,9;,
  4;6,23,27,10;,
  4;7,8,12,11;,
  4;8,9,13,12;,
  4;9,10,14,13;,
  4;10,27,31,14;,
  4;11,12,16,15;,
  4;12,13,17,16;,
  4;13,14,18,17;,
  4;14,31,35,18;,
  4;19,20,24,23;,
  4;20,21,25,24;,
  4;21,22,26,25;,
  4;22,39,43,26;,
  4;23,24,28,27;,
  4;24,25,29,28;,
  4;25,26,30,29;,
  4;26,43,46,30;,
  4;27,28,32,31;,
  4;28,29,33,32;,
  4;29,30,34,33;,
  4;30,46,50,34;,
  4;31,32,36,35;,
  4;32,33,37,36;,
  4;33,34,38,37;,
  4;34,50,54,38;,
  4;39,40,44,43;,
  4;40,41,41,44;,
  4;41,42,45,41;,
  4;42,58,62,45;,
  4;43,44,47,46;,
  4;44,41,48,47;,
  4;41,45,49,48;,
  4;45,62,66,49;,
  4;46,47,51,50;,
  4;47,48,52,51;,
  4;48,49,53,52;,
  4;49,66,70,53;,
  4;50,51,55,54;,
  4;51,52,56,55;,
  4;52,53,57,56;,
  4;53,70,74,57;,
  4;58,59,63,62;,
  4;59,60,64,63;,
  4;60,61,65,64;,
  4;61,0,4,65;,
  4;62,63,67,66;,
  4;63,64,68,67;,
  4;64,65,69,68;,
  4;65,4,7,69;,
  4;66,67,71,70;,
  4;67,68,72,71;,
  4;68,69,73,72;,
  4;69,7,11,73;,
  4;70,71,75,74;,
  4;71,72,76,75;,
  4;72,73,77,76;,
  4;73,11,15,77;,
  4;177,178,78,179;,
  4;178,180,79,78;,
  4;180,181,80,79;,
  4;181,182,183,80;,
  4;179,78,81,184;,
  4;78,79,82,81;,
  4;79,80,83,82;,
  4;80,183,185,83;,
  4;184,81,84,186;,
  4;81,82,85,84;,
  4;82,83,86,85;,
  4;83,185,187,86;,
  4;186,84,188,189;,
  4;84,85,190,188;,
  4;85,86,191,190;,
  4;86,187,192,191;,
  4;75,87,57,74;,
  4;87,88,56,57;,
  4;88,89,55,56;,
  4;89,38,54,55;,
  4;76,90,87,75;,
  4;90,91,88,87;,
  4;91,92,89,88;,
  4;92,37,38,89;,
  4;77,93,90,76;,
  4;93,94,91,90;,
  4;94,95,92,91;,
  4;95,36,37,92;,
  4;15,16,93,77;,
  4;16,17,94,93;,
  4;17,18,95,94;,
  4;18,35,36,95;,
  4;97,98,114,113;,
  4;98,99,115,114;,
  4;99,100,116,115;,
  4;100,101,117,116;,
  4;101,102,118,117;,
  4;102,103,119,118;,
  4;103,104,120,119;,
  4;104,105,121,120;,
  4;105,106,122,121;,
  4;106,107,123,122;,
  4;107,108,124,123;,
  4;108,109,125,124;,
  4;109,110,126,125;,
  4;110,111,127,126;,
  4;111,112,128,127;,
  4;112,97,113,128;,
  4;113,114,130,129;,
  4;114,115,131,130;,
  4;115,116,132,131;,
  4;116,117,133,132;,
  4;117,118,134,133;,
  4;118,119,135,134;,
  4;119,120,136,135;,
  4;120,121,137,136;,
  4;121,122,138,137;,
  4;122,123,139,138;,
  4;123,124,140,139;,
  4;124,125,141,140;,
  4;125,126,142,141;,
  4;126,127,143,142;,
  4;127,128,144,143;,
  4;128,113,129,144;,
  4;129,130,146,145;,
  4;130,131,147,146;,
  4;131,132,148,147;,
  4;132,133,149,148;,
  4;133,134,150,149;,
  4;134,135,151,150;,
  4;135,136,152,151;,
  4;136,137,153,152;,
  4;137,138,154,153;,
  4;138,139,155,154;,
  4;139,140,156,155;,
  4;140,141,157,156;,
  4;141,142,158,157;,
  4;142,143,159,158;,
  4;143,144,160,159;,
  4;144,129,145,160;,
  3;96,82,82;,
  3;96,82,82;,
  3;96,193,82;,
  3;96,194,193;,
  3;96,195,194;,
  3;96,82,195;,
  3;96,82,82;,
  3;96,82,82;,
  3;96,82,82;,
  3;96,82,82;,
  3;96,82,82;,
  3;96,82,82;,
  3;96,82,82;,
  3;96,82,82;,
  3;96,82,82;,
  3;96,82,82;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;,
  4;161,162,162,161;,
  4;162,163,163,162;,
  4;163,164,164,163;,
  4;164,165,165,164;,
  4;165,166,166,165;,
  4;166,167,167,166;,
  4;167,168,168,167;,
  4;168,169,169,168;,
  4;169,170,170,169;,
  4;170,171,171,170;,
  4;171,172,172,171;,
  4;172,173,173,172;,
  4;173,174,174,173;,
  4;174,175,175,174;,
  4;175,176,176,175;,
  4;176,161,161,176;,
  3;82,82,82;,
  3;82,82,82;,
  3;82,82,82;,
  3;82,82,82;,
  3;82,82,82;,
  3;82,82,82;,
  3;82,82,82;,
  3;82,82,82;,
  3;82,82,82;,
  3;82,82,82;,
  3;82,82,82;,
  3;82,82,82;,
  3;82,82,82;,
  3;82,82,82;,
  3;82,82,82;,
  3;82,82,82;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;,
  3;91,91,91;;
 }
 MeshTextureCoords {
  310;
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
  0.062500;0.000000;,
  0.062500;0.333330;,
  0.000000;0.333330;,
  0.125000;0.000000;,
  0.125000;0.333330;,
  0.187500;0.000000;,
  0.187500;0.333330;,
  0.250000;0.000000;,
  0.250000;0.333330;,
  0.312500;0.000000;,
  0.312500;0.333330;,
  0.375000;0.000000;,
  0.375000;0.333330;,
  0.437500;0.000000;,
  0.437500;0.333330;,
  0.500000;0.000000;,
  0.500000;0.333330;,
  0.562500;0.000000;,
  0.562500;0.333330;,
  0.625000;0.000000;,
  0.625000;0.333330;,
  0.687500;0.000000;,
  0.687500;0.333330;,
  0.750000;0.000000;,
  0.750000;0.333330;,
  0.812500;0.000000;,
  0.812500;0.333330;,
  0.875000;0.000000;,
  0.875000;0.333330;,
  0.937500;0.000000;,
  0.937500;0.333330;,
  1.000000;0.000000;,
  1.000000;0.333330;,
  0.062500;0.666670;,
  0.000000;0.666670;,
  0.125000;0.666670;,
  0.187500;0.666670;,
  0.250000;0.666670;,
  0.312500;0.666670;,
  0.375000;0.666670;,
  0.437500;0.666670;,
  0.500000;0.666670;,
  0.562500;0.666670;,
  0.625000;0.666670;,
  0.687500;0.666670;,
  0.750000;0.666670;,
  0.812500;0.666670;,
  0.875000;0.666670;,
  0.937500;0.666670;,
  1.000000;0.666670;,
  0.062500;1.000000;,
  0.000000;1.000000;,
  0.125000;1.000000;,
  0.187500;1.000000;,
  0.250000;1.000000;,
  0.312500;1.000000;,
  0.375000;1.000000;,
  0.437500;1.000000;,
  0.500000;1.000000;,
  0.562500;1.000000;,
  0.625000;1.000000;,
  0.687500;1.000000;,
  0.750000;1.000000;,
  0.812500;1.000000;,
  0.875000;1.000000;,
  0.937500;1.000000;,
  1.000000;1.000000;,
  0.031250;0.000000;,
  0.093750;0.000000;,
  0.156250;0.000000;,
  0.218750;0.000000;,
  0.281250;0.000000;,
  0.343750;0.000000;,
  0.406250;0.000000;,
  0.468750;0.000000;,
  0.531250;0.000000;,
  0.593750;0.000000;,
  0.656250;0.000000;,
  0.718750;0.000000;,
  0.781250;0.000000;,
  0.843750;0.000000;,
  0.906250;0.000000;,
  0.968750;0.000000;,
  0.031250;1.000000;,
  0.093750;1.000000;,
  0.156250;1.000000;,
  0.218750;1.000000;,
  0.281250;1.000000;,
  0.343750;1.000000;,
  0.406250;1.000000;,
  0.468750;1.000000;,
  0.531250;1.000000;,
  0.593750;1.000000;,
  0.656250;1.000000;,
  0.718750;1.000000;,
  0.781250;1.000000;,
  0.843750;1.000000;,
  0.906250;1.000000;,
  0.968750;1.000000;,
  0.000000;0.000000;,
  0.062500;0.000000;,
  0.062500;1.000000;,
  0.000000;1.000000;,
  0.125000;0.000000;,
  0.125000;1.000000;,
  0.187500;0.000000;,
  0.187500;1.000000;,
  0.250000;0.000000;,
  0.250000;1.000000;,
  0.312500;0.000000;,
  0.312500;1.000000;,
  0.375000;0.000000;,
  0.375000;1.000000;,
  0.437500;0.000000;,
  0.437500;1.000000;,
  0.500000;0.000000;,
  0.500000;1.000000;,
  0.562500;0.000000;,
  0.562500;1.000000;,
  0.625000;0.000000;,
  0.625000;1.000000;,
  0.687500;0.000000;,
  0.687500;1.000000;,
  0.750000;0.000000;,
  0.750000;1.000000;,
  0.812500;0.000000;,
  0.812500;1.000000;,
  0.875000;0.000000;,
  0.875000;1.000000;,
  0.937500;0.000000;,
  0.937500;1.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.031250;0.000000;,
  0.093750;0.000000;,
  0.156250;0.000000;,
  0.218750;0.000000;,
  0.281250;0.000000;,
  0.343750;0.000000;,
  0.406250;0.000000;,
  0.468750;0.000000;,
  0.531250;0.000000;,
  0.593750;0.000000;,
  0.656250;0.000000;,
  0.718750;0.000000;,
  0.781250;0.000000;,
  0.843750;0.000000;,
  0.906250;0.000000;,
  0.968750;0.000000;,
  0.031250;1.000000;,
  0.093750;1.000000;,
  0.156250;1.000000;,
  0.218750;1.000000;,
  0.281250;1.000000;,
  0.343750;1.000000;,
  0.406250;1.000000;,
  0.468750;1.000000;,
  0.531250;1.000000;,
  0.593750;1.000000;,
  0.656250;1.000000;,
  0.718750;1.000000;,
  0.781250;1.000000;,
  0.843750;1.000000;,
  0.906250;1.000000;,
  0.968750;1.000000;;
 }
}
