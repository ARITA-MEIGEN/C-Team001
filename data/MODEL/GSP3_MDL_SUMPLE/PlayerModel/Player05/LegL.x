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
 248;
 0.00000;0.75883;0.22569;,
 0.00000;0.75883;-0.21250;,
 -0.16769;0.75883;-0.17915;,
 0.00000;0.75883;0.22569;,
 -0.30985;0.75883;-0.08416;,
 0.00000;0.75883;0.22569;,
 -0.40483;0.75883;0.05800;,
 0.00000;0.75883;0.22569;,
 -0.43819;0.75883;0.22569;,
 0.00000;0.75883;0.22569;,
 -0.40483;0.75883;0.39337;,
 0.00000;0.75883;0.22569;,
 -0.30985;0.75883;0.53553;,
 0.00000;0.75883;0.22569;,
 -0.16769;0.75883;0.63052;,
 0.00000;0.75883;0.22569;,
 0.00000;0.75883;0.66387;,
 0.00000;0.75883;0.22569;,
 0.16769;0.75883;0.63052;,
 0.00000;0.75883;0.22569;,
 0.30985;0.75883;0.53553;,
 0.00000;0.75883;0.22569;,
 0.40483;0.75883;0.39337;,
 0.00000;0.75883;0.22569;,
 0.43819;0.75883;0.22569;,
 0.00000;0.75883;0.22569;,
 0.40483;0.75883;0.05800;,
 0.00000;0.75883;0.22569;,
 0.30985;0.75883;-0.08416;,
 0.00000;0.75883;0.22569;,
 0.16769;0.75883;-0.17915;,
 0.00000;0.75883;0.22569;,
 0.00000;0.75883;-0.21250;,
 0.00000;-1.60612;0.22569;,
 -0.32250;-1.60612;0.01020;,
 -0.07567;-1.60612;-0.15473;,
 0.00000;-1.60612;0.22569;,
 -0.38041;-1.60612;0.30135;,
 -0.32250;-1.60612;0.01020;,
 0.00000;-1.60612;0.22569;,
 -0.27964;-1.60612;0.50532;,
 -0.38041;-1.60612;0.30135;,
 0.00000;-1.60612;0.22569;,
 -0.07567;-1.60612;0.60610;,
 0.00000;-1.60612;0.22569;,
 0.21549;-1.60612;0.54819;,
 -0.07567;-1.60612;0.60610;,
 0.00000;-1.60612;0.22569;,
 0.38041;-1.60612;0.30135;,
 0.21549;-1.60612;0.54819;,
 0.00000;-1.60612;0.22569;,
 0.32250;-1.60612;0.01020;,
 0.38041;-1.60612;0.30135;,
 0.00000;-1.60612;0.22569;,
 0.15134;-1.60612;-0.13968;,
 0.32250;-1.60612;0.01020;,
 0.00000;-1.60612;0.22569;,
 -0.07567;-1.60612;-0.15473;,
 0.00000;1.50180;0.22569;,
 0.00000;1.59820;0.00810;,
 -0.15386;1.59820;0.07183;,
 0.00000;1.50180;0.22569;,
 -0.18572;1.59820;0.30262;,
 0.00000;1.50180;0.22569;,
 -0.18572;1.59820;0.30262;,
 0.00000;1.59820;0.44327;,
 0.00000;1.50180;0.22569;,
 0.15386;1.59820;0.37954;,
 0.00000;1.50180;0.22569;,
 0.21758;1.59820;0.22569;,
 0.00000;1.50180;0.22569;,
 0.15386;1.59820;0.07183;,
 0.00000;1.50180;0.22569;,
 0.00000;1.59820;0.00810;,
 0.00000;0.61357;0.00810;,
 0.00000;0.57301;0.22569;,
 -0.15386;0.61357;0.07183;,
 0.00000;0.57301;0.22569;,
 -0.21758;0.61357;0.22569;,
 0.00000;0.57301;0.22569;,
 -0.15386;0.61357;0.37954;,
 0.00000;0.57301;0.22569;,
 0.00000;0.61357;0.44327;,
 0.00000;0.57301;0.22569;,
 0.18572;0.61357;0.30262;,
 0.18572;0.61357;0.30262;,
 0.00000;0.57301;0.22569;,
 0.15386;0.61357;0.07183;,
 0.00000;0.57301;0.22569;,
 0.00000;0.61357;0.00810;,
 0.00000;0.50568;-0.19059;,
 -0.22682;0.50568;-0.11379;,
 -0.22682;0.50568;-0.11379;,
 -0.38459;0.50568;0.06638;,
 -0.40043;0.50568;0.30534;,
 -0.40043;0.50568;0.30534;,
 -0.29435;0.50568;0.52004;,
 -0.07965;0.50568;0.62612;,
 -0.07965;0.50568;0.62612;,
 0.22682;0.50568;0.56516;,
 0.22682;0.50568;0.56516;,
 0.40043;0.50568;0.30534;,
 0.40043;0.50568;0.30534;,
 0.38459;0.50568;0.06638;,
 0.22682;0.50568;-0.11379;,
 0.22682;0.50568;-0.11379;,
 0.00000;0.50568;-0.19059;,
 0.07567;-0.57864;-0.15473;,
 -0.21549;-0.57864;-0.09682;,
 -0.21549;-0.57864;-0.09682;,
 -0.36536;0.06880;0.07435;,
 -0.38041;0.06880;0.30135;,
 -0.38041;0.06880;0.30135;,
 -0.21549;0.06880;0.54819;,
 -0.21549;0.06880;0.54819;,
 0.07567;0.06880;0.60610;,
 0.07567;0.06880;0.60610;,
 0.27964;0.06880;0.50532;,
 0.38041;0.06880;0.30135;,
 0.38041;0.06880;0.30135;,
 0.36536;0.06880;0.07435;,
 0.27964;-0.57864;-0.05395;,
 0.07567;-0.57864;-0.15473;,
 0.07567;-1.02116;-0.15473;,
 -0.15134;-1.02116;-0.13968;,
 -0.32250;-1.02116;0.01020;,
 -0.32250;-1.02116;0.01020;,
 -0.38041;-1.02116;0.30135;,
 -0.38041;-1.02116;0.30135;,
 -0.21549;-1.02116;0.54819;,
 -0.21549;-1.02116;0.54819;,
 0.07567;-1.02116;0.60610;,
 0.07567;-1.02116;0.60610;,
 0.27964;-1.02116;0.50532;,
 0.38041;-1.02116;0.30135;,
 0.38041;-1.02116;0.30135;,
 0.32250;-1.02116;0.01020;,
 0.32250;-1.02116;0.01020;,
 0.07567;-1.02116;-0.15473;,
 0.07567;-1.41181;-0.15473;,
 -0.15134;-1.41181;-0.13968;,
 -0.32250;-1.41181;0.01020;,
 -0.32250;-1.41181;0.01020;,
 -0.38041;-1.41181;0.30135;,
 -0.38041;-1.41181;0.30135;,
 -0.21549;-1.41181;0.54819;,
 -0.21549;-1.41181;0.54819;,
 0.07567;-1.41181;0.60610;,
 0.07567;-1.41181;0.60610;,
 0.27964;-1.41181;0.50532;,
 0.38041;-1.41181;0.30135;,
 0.38041;-1.41181;0.30135;,
 0.32250;-1.41181;0.01020;,
 0.32250;-1.41181;0.01020;,
 0.07567;-1.41181;-0.15473;,
 -0.07567;-1.60612;-0.15473;,
 0.07567;-1.41181;-0.15473;,
 0.00000;1.48269;-0.17636;,
 -0.28429;1.48269;-0.05860;,
 -0.40204;1.48269;0.22569;,
 -0.28429;1.48269;0.50997;,
 0.00000;1.48269;0.62773;,
 0.28429;1.48269;0.50997;,
 0.40204;1.48269;0.22569;,
 0.28429;1.48269;-0.05860;,
 0.00000;1.48269;-0.17636;,
 0.00000;1.30981;-0.29961;,
 -0.37144;1.30981;-0.14575;,
 -0.52529;1.30981;0.22569;,
 -0.37144;1.30981;0.59713;,
 0.00000;1.30981;0.75098;,
 0.37144;1.30981;0.59713;,
 0.52529;1.30981;0.22569;,
 0.37144;1.30981;-0.14575;,
 0.00000;1.30981;-0.29961;,
 0.00000;1.10589;-0.34289;,
 -0.40204;1.10589;-0.17636;,
 -0.56858;1.10589;0.22569;,
 -0.40204;1.10589;0.62773;,
 0.00000;1.10589;0.79426;,
 0.40204;1.10589;0.62773;,
 0.56858;1.10589;0.22569;,
 0.40204;1.10589;-0.17636;,
 0.00000;1.10589;-0.34289;,
 0.00000;0.90196;-0.29961;,
 -0.37144;0.90196;-0.14575;,
 -0.52529;0.90196;0.22569;,
 -0.37144;0.90196;0.59713;,
 0.00000;0.90196;0.75098;,
 0.37144;0.90196;0.59713;,
 0.52529;0.90196;0.22569;,
 0.37144;0.90196;-0.14575;,
 0.00000;0.90196;-0.29961;,
 0.00000;0.72908;-0.17636;,
 -0.28429;0.72908;-0.05860;,
 -0.40204;0.72908;0.22569;,
 -0.28429;0.72908;0.50997;,
 0.00000;0.72908;0.62773;,
 0.28429;0.72908;0.50997;,
 0.40204;0.72908;0.22569;,
 0.28429;0.72908;-0.05860;,
 0.00000;0.72908;-0.17636;,
 -0.48496;1.60612;-0.10623;,
 -0.48496;1.34204;-0.61551;,
 -0.48496;0.86012;-0.07938;,
 -0.48496;1.42993;-0.04210;,
 -0.48496;1.17369;-0.79426;,
 -0.48496;0.55931;-0.77698;,
 -0.37936;-0.41632;-0.16826;,
 -0.37936;-0.35220;0.00794;,
 -0.48496;1.17369;-0.79426;,
 0.01408;1.17369;-0.79426;,
 0.01408;0.55931;-0.77698;,
 -0.48496;0.55931;-0.77698;,
 0.51312;1.17369;-0.79426;,
 0.51312;0.55932;-0.77698;,
 -0.06296;-0.42908;-0.16361;,
 -0.37936;-0.41632;-0.16826;,
 0.25345;-0.41632;-0.16826;,
 0.51312;1.17369;-0.79426;,
 0.51312;1.34204;-0.61551;,
 0.51312;0.86012;-0.07938;,
 0.51312;0.55932;-0.77698;,
 0.51312;1.60612;-0.10623;,
 0.51312;1.42993;-0.04210;,
 0.25345;-0.35220;0.00794;,
 0.25345;-0.41632;-0.16826;,
 0.51312;1.60612;-0.10623;,
 0.01408;1.60612;-0.10623;,
 0.01408;1.42993;-0.04211;,
 0.51312;1.42993;-0.04210;,
 -0.48496;1.60612;-0.10623;,
 -0.48496;1.42993;-0.04210;,
 0.01408;0.86012;-0.07938;,
 0.51312;0.86012;-0.07938;,
 -0.48496;0.86012;-0.07938;,
 0.01408;1.34204;-0.61551;,
 0.01408;1.60612;-0.10623;,
 0.01408;1.17369;-0.79426;,
 -0.48496;1.34204;-0.61551;,
 -0.48496;1.60612;-0.10623;,
 -0.48496;1.17369;-0.79426;,
 0.01408;0.86012;-0.07938;,
 -0.06296;-0.36495;0.01258;,
 -0.06296;-0.42908;-0.16361;,
 -0.48496;0.86012;-0.07938;,
 -0.37936;-0.35220;0.00794;,
 -0.37936;-0.41632;-0.16826;;
 
 256;
 3;0,1,2;,
 3;3,2,4;,
 3;5,4,6;,
 3;7,6,8;,
 3;9,8,10;,
 3;11,10,12;,
 3;13,12,14;,
 3;15,14,16;,
 3;17,16,18;,
 3;19,18,20;,
 3;21,20,22;,
 3;23,22,24;,
 3;25,24,26;,
 3;27,26,28;,
 3;29,28,30;,
 3;31,30,32;,
 3;33,34,35;,
 3;36,37,38;,
 3;39,40,41;,
 3;42,43,40;,
 3;44,45,46;,
 3;47,48,49;,
 3;50,51,52;,
 3;53,54,55;,
 3;56,57,54;,
 3;58,59,60;,
 3;61,60,62;,
 3;63,64,65;,
 3;66,65,67;,
 3;68,67,69;,
 3;70,69,71;,
 3;72,71,73;,
 3;74,75,76;,
 3;76,77,78;,
 3;78,79,80;,
 3;80,81,82;,
 3;82,83,84;,
 3;85,86,87;,
 3;87,88,89;,
 3;90,91,2;,
 3;90,2,1;,
 3;91,4,2;,
 3;92,93,6;,
 3;92,6,4;,
 3;93,94,8;,
 3;93,8,6;,
 3;94,10,8;,
 3;95,96,12;,
 3;95,12,10;,
 3;96,97,14;,
 3;96,14,12;,
 3;97,16,14;,
 3;98,99,18;,
 3;98,18,16;,
 3;99,20,18;,
 3;100,101,22;,
 3;100,22,20;,
 3;101,24,22;,
 3;102,103,26;,
 3;102,26,24;,
 3;103,104,28;,
 3;103,28,26;,
 3;104,30,28;,
 3;105,106,32;,
 3;105,32,30;,
 3;107,108,91;,
 3;107,91,90;,
 3;92,109,110;,
 3;92,110,93;,
 3;110,111,94;,
 3;110,94,93;,
 3;112,113,96;,
 3;112,96,95;,
 3;113,97,96;,
 3;97,114,115;,
 3;115,99,98;,
 3;116,117,100;,
 3;117,118,101;,
 3;117,101,100;,
 3;119,120,103;,
 3;119,103,102;,
 3;120,121,104;,
 3;120,104,103;,
 3;121,122,105;,
 3;122,106,105;,
 3;123,124,108;,
 3;123,108,107;,
 3;124,125,109;,
 3;125,110,109;,
 3;126,127,111;,
 3;126,111,110;,
 3;128,129,113;,
 3;128,113,112;,
 3;130,131,115;,
 3;130,115,114;,
 3;132,133,117;,
 3;132,117,116;,
 3;133,134,118;,
 3;133,118,117;,
 3;135,136,120;,
 3;135,120,119;,
 3;136,121,120;,
 3;137,138,122;,
 3;137,122,121;,
 3;139,140,124;,
 3;139,124,123;,
 3;140,141,125;,
 3;140,125,124;,
 3;142,143,127;,
 3;142,127,126;,
 3;144,145,129;,
 3;144,129,128;,
 3;146,147,131;,
 3;146,131,130;,
 3;148,149,133;,
 3;148,133,132;,
 3;149,150,134;,
 3;149,134,133;,
 3;151,152,136;,
 3;151,136,135;,
 3;153,154,138;,
 3;153,138,137;,
 3;155,140,139;,
 3;35,34,141;,
 3;35,141,140;,
 3;38,37,143;,
 3;38,143,142;,
 3;41,40,145;,
 3;41,145,144;,
 3;40,43,146;,
 3;43,147,146;,
 3;46,45,148;,
 3;45,149,148;,
 3;49,48,150;,
 3;49,150,149;,
 3;52,51,152;,
 3;52,152,151;,
 3;55,54,154;,
 3;55,154,153;,
 3;54,57,156;,
 3;157,158,60;,
 3;157,60,59;,
 3;158,159,62;,
 3;158,62,60;,
 3;159,160,64;,
 3;160,161,65;,
 3;160,65,64;,
 3;161,162,67;,
 3;161,67,65;,
 3;162,163,69;,
 3;162,69,67;,
 3;163,164,71;,
 3;163,71,69;,
 3;164,165,73;,
 3;164,73,71;,
 3;166,167,158;,
 3;166,158,157;,
 3;167,168,159;,
 3;167,159,158;,
 3;168,169,160;,
 3;168,160,159;,
 3;169,170,161;,
 3;169,161,160;,
 3;170,171,162;,
 3;170,162,161;,
 3;171,172,163;,
 3;171,163,162;,
 3;172,173,164;,
 3;172,164,163;,
 3;173,174,165;,
 3;173,165,164;,
 3;175,176,167;,
 3;175,167,166;,
 3;176,177,168;,
 3;176,168,167;,
 3;177,178,169;,
 3;177,169,168;,
 3;178,179,170;,
 3;178,170,169;,
 3;179,180,171;,
 3;179,171,170;,
 3;171,180,181;,
 3;171,181,172;,
 3;181,182,173;,
 3;181,173,172;,
 3;182,183,174;,
 3;182,174,173;,
 3;184,185,176;,
 3;184,176,175;,
 3;185,186,177;,
 3;185,177,176;,
 3;186,187,178;,
 3;186,178,177;,
 3;187,188,179;,
 3;187,179,178;,
 3;188,189,180;,
 3;188,180,179;,
 3;189,190,181;,
 3;189,181,180;,
 3;190,191,182;,
 3;190,182,181;,
 3;191,192,183;,
 3;191,183,182;,
 3;193,194,185;,
 3;193,185,184;,
 3;194,195,186;,
 3;194,186,185;,
 3;195,196,187;,
 3;195,187,186;,
 3;196,197,188;,
 3;196,188,187;,
 3;197,198,189;,
 3;197,189,188;,
 3;198,199,190;,
 3;198,190,189;,
 3;199,200,191;,
 3;199,191,190;,
 3;200,201,192;,
 3;200,192,191;,
 3;74,76,194;,
 3;74,194,193;,
 3;76,78,195;,
 3;76,195,194;,
 3;78,80,196;,
 3;78,196,195;,
 3;80,82,197;,
 3;80,197,196;,
 3;82,84,198;,
 3;82,198,197;,
 3;198,85,199;,
 3;85,87,200;,
 3;85,200,199;,
 3;87,89,201;,
 3;87,201,200;,
 4;202,203,204,205;,
 4;203,206,207,204;,
 4;204,207,208,209;,
 4;210,211,212,213;,
 4;211,214,215,212;,
 4;213,212,216,217;,
 4;212,215,218,216;,
 4;219,220,221,222;,
 4;220,223,224,221;,
 4;222,221,225,226;,
 4;227,228,229,230;,
 4;228,231,232,229;,
 4;230,229,233,234;,
 4;229,232,235,233;,
 4;227,220,236,237;,
 4;220,214,238,236;,
 4;237,236,239,240;,
 4;236,238,241,239;,
 4;242,243,225,234;,
 4;243,244,218,225;,
 4;245,246,243,242;,
 4;246,247,244,243;;
 
 MeshMaterialList {
  10;
  256;
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
  1,
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
  6,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  6,
  0,
  6,
  6,
  6,
  6,
  4,
  6,
  4,
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
  156;
  0.000000;1.000000;0.000000;,
  -0.039944;-0.083070;-0.995743;,
  -0.585940;-0.087640;-0.805601;,
  -0.934801;-0.088818;-0.343887;,
  -0.972332;-0.099653;0.211281;,
  -0.704597;-0.089524;0.703938;,
  -0.102891;-0.114666;0.988061;,
  0.582848;-0.108473;0.805308;,
  0.972451;-0.095998;0.212423;,
  0.929199;-0.082030;-0.360360;,
  0.537047;-0.079401;-0.839807;,
  0.159998;-0.029649;-0.986672;,
  -0.464770;0.007120;-0.885403;,
  -0.924608;-0.031125;-0.379647;,
  -0.975532;-0.042183;0.215775;,
  -0.591955;-0.044439;0.804745;,
  0.086537;-0.027609;0.995866;,
  0.691362;-0.015702;0.722338;,
  0.980512;-0.023345;0.195069;,
  0.929864;-0.018992;-0.367412;,
  0.653625;-0.027676;-0.756313;,
  0.237965;0.015406;-0.971152;,
  -0.319532;0.013513;-0.947479;,
  -0.857689;-0.007037;-0.514120;,
  -0.980788;0.000000;0.195078;,
  -0.555578;0.000000;0.831464;,
  0.130912;0.000000;0.991394;,
  0.707121;0.000000;0.707093;,
  0.988267;-0.004737;0.152660;,
  0.821373;-0.017552;-0.570122;,
  0.246380;0.029488;-0.968725;,
  -0.443208;-0.030247;-0.895909;,
  -0.854992;-0.034623;-0.517485;,
  -0.980788;0.000000;0.195078;,
  -0.552666;0.045418;0.832164;,
  0.198048;0.008998;0.980151;,
  0.752330;-0.030236;0.658093;,
  0.987942;-0.034620;0.150904;,
  0.831475;0.000000;-0.555562;,
  0.000000;-1.000000;0.000000;,
  -0.030345;0.999461;0.012559;,
  0.049269;0.983601;-0.173496;,
  -0.092076;0.983947;-0.152872;,
  -0.199488;0.979900;0.000299;,
  -0.033919;0.989475;0.140675;,
  0.087844;0.983602;0.157513;,
  0.173493;0.983602;0.049268;,
  0.157517;0.983602;-0.087840;,
  0.018521;0.729888;-0.683316;,
  -0.474370;0.743338;-0.471616;,
  -0.692712;0.718791;-0.059069;,
  -0.506567;0.740033;0.442427;,
  -0.018516;0.729892;0.683312;,
  0.470085;0.729891;0.496265;,
  0.683316;0.729887;0.018525;,
  0.496280;0.729886;-0.470078;,
  0.010159;0.404585;-0.914444;,
  -0.639432;0.404583;-0.653788;,
  -0.914439;0.404595;-0.010165;,
  -0.653792;0.404589;0.639424;,
  -0.010161;0.404582;0.914445;,
  0.689239;0.376756;0.618874;,
  0.894766;0.441130;-0.069271;,
  0.653798;0.404589;-0.639419;,
  0.000000;0.000005;-1.000000;,
  -0.707107;0.000012;-0.707107;,
  -1.000000;0.000002;0.000003;,
  -0.707101;-0.000002;0.707112;,
  -0.000000;0.000005;1.000000;,
  0.645729;-0.042259;0.762397;,
  0.997797;0.030257;0.059044;,
  0.707107;-0.000002;-0.707107;,
  -0.010160;-0.404581;-0.914446;,
  -0.653799;-0.404585;-0.639420;,
  -0.914443;-0.404586;0.010168;,
  -0.639428;-0.404578;0.653796;,
  0.010161;-0.404578;0.914447;,
  0.653794;-0.404585;0.639425;,
  0.914441;-0.404592;-0.010165;,
  0.639434;-0.404579;-0.653789;,
  -0.018521;-0.729888;-0.683316;,
  -0.496280;-0.729886;-0.470078;,
  -0.683316;-0.729888;0.018525;,
  -0.470084;-0.729891;0.496265;,
  0.018516;-0.729892;0.683311;,
  0.506567;-0.740033;0.442426;,
  0.692712;-0.718792;-0.059069;,
  0.474369;-0.743338;-0.471616;,
  -0.044310;-0.917040;-0.396327;,
  -0.311581;-0.917041;-0.248905;,
  -0.396332;-0.917037;0.044313;,
  -0.248921;-0.917039;0.311574;,
  0.069706;-0.928639;0.364376;,
  0.377173;-0.922540;0.081615;,
  0.280510;-0.918429;-0.278932;,
  -0.011407;-0.999924;-0.004720;,
  -1.000000;0.000000;0.000000;,
  -0.999524;-0.028686;0.011383;,
  -0.995713;-0.085975;0.034118;,
  0.000000;0.383531;-0.923528;,
  -0.998928;-0.043034;0.017077;,
  0.000008;-0.288220;-0.957564;,
  0.000015;-0.528318;-0.849046;,
  0.000000;0.383531;-0.923528;,
  1.000000;0.000000;0.000000;,
  0.002283;-0.288358;-0.957520;,
  0.004406;-0.528560;-0.848885;,
  0.974889;-0.206989;0.082142;,
  -0.000000;0.342007;0.939698;,
  -0.000000;0.141389;0.989954;,
  0.997210;-0.069385;0.027535;,
  0.000007;0.004044;0.999992;,
  0.000000;0.815673;-0.578514;,
  0.000015;0.073347;0.997306;,
  -0.359724;-0.113728;-0.926102;,
  0.108221;-0.126478;-0.986048;,
  -0.698222;-0.147003;-0.700626;,
  -0.869573;-0.126478;-0.477333;,
  -0.993268;-0.113725;-0.022040;,
  -0.914506;-0.146970;0.376934;,
  -0.773779;-0.126478;0.620701;,
  -0.400470;-0.113724;0.909225;,
  -0.001723;-0.146960;0.989141;,
  0.317666;-0.166785;0.933419;,
  0.698222;-0.147003;0.700626;,
  0.884651;-0.166801;0.435396;,
  0.989136;-0.146997;0.001730;,
  0.952409;-0.126475;-0.277347;,
  0.717944;-0.113724;-0.686748;,
  0.380108;-0.146989;-0.913188;,
  -0.319227;-0.051663;-0.946269;,
  -0.899648;0.000000;-0.436616;,
  -0.956756;0.069127;0.282557;,
  -0.702927;0.076042;0.707185;,
  -0.154171;-0.017944;0.987881;,
  0.632907;-0.079095;0.770177;,
  0.998252;0.000000;0.059108;,
  0.775793;0.069133;-0.627189;,
  0.378778;0.076068;-0.922356;,
  0.000000;0.383531;-0.923528;,
  -0.002267;-0.288080;-0.957604;,
  -0.004376;-0.528067;-0.849191;,
  0.993702;-0.104151;0.041331;,
  -0.000009;0.342007;0.939698;,
  -0.000010;0.141389;0.989954;,
  0.000009;0.342007;0.939698;,
  0.000010;0.141389;0.989954;,
  0.002911;0.003862;0.999988;,
  -0.002896;0.004226;0.999987;,
  0.000000;0.887748;-0.460329;,
  0.000000;0.887748;-0.460330;,
  0.005818;0.072983;0.997316;,
  -0.000001;-0.939701;0.341998;,
  0.042862;-0.938837;0.341684;,
  -0.005788;0.073709;0.997263;,
  -0.042863;-0.938837;0.341684;;
  256;
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
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;0,0,0;,
  3;39,39,39;,
  3;39,39,39;,
  3;39,39,39;,
  3;39,39,39;,
  3;39,39,39;,
  3;39,39,39;,
  3;39,39,39;,
  3;39,39,39;,
  3;39,39,39;,
  3;40,41,42;,
  3;40,42,43;,
  3;40,43,44;,
  3;40,44,45;,
  3;40,45,46;,
  3;40,46,47;,
  3;40,47,41;,
  3;88,95,89;,
  3;89,95,90;,
  3;90,95,91;,
  3;91,95,92;,
  3;92,95,93;,
  3;93,95,94;,
  3;94,95,88;,
  3;1,2,114;,
  3;1,114,115;,
  3;2,116,114;,
  3;2,3,117;,
  3;2,117,116;,
  3;3,4,118;,
  3;3,118,117;,
  3;4,119,118;,
  3;4,5,120;,
  3;4,120,119;,
  3;5,6,121;,
  3;5,121,120;,
  3;6,122,121;,
  3;6,7,123;,
  3;6,123,122;,
  3;7,124,123;,
  3;7,8,125;,
  3;7,125,124;,
  3;8,126,125;,
  3;8,9,127;,
  3;8,127,126;,
  3;9,10,128;,
  3;9,128,127;,
  3;10,129,128;,
  3;10,1,115;,
  3;10,115,129;,
  3;11,12,2;,
  3;11,2,1;,
  3;2,12,13;,
  3;2,13,3;,
  3;13,14,4;,
  3;13,4,3;,
  3;14,15,5;,
  3;14,5,4;,
  3;15,6,5;,
  3;6,15,16;,
  3;16,7,6;,
  3;16,17,7;,
  3;17,18,8;,
  3;17,8,7;,
  3;18,19,9;,
  3;18,9,8;,
  3;19,20,10;,
  3;19,10,9;,
  3;20,11,10;,
  3;11,1,10;,
  3;21,22,12;,
  3;21,12,11;,
  3;22,23,12;,
  3;23,13,12;,
  3;23,24,14;,
  3;23,14,13;,
  3;24,25,15;,
  3;24,15,14;,
  3;25,26,16;,
  3;25,16,15;,
  3;26,27,17;,
  3;26,17,16;,
  3;27,28,18;,
  3;27,18,17;,
  3;28,29,19;,
  3;28,19,18;,
  3;29,20,19;,
  3;29,21,11;,
  3;29,11,20;,
  3;30,31,22;,
  3;30,22,21;,
  3;31,32,23;,
  3;31,23,22;,
  3;32,33,24;,
  3;32,24,23;,
  3;33,34,25;,
  3;33,25,24;,
  3;34,35,26;,
  3;34,26,25;,
  3;35,36,27;,
  3;35,27,26;,
  3;36,37,28;,
  3;36,28,27;,
  3;37,38,29;,
  3;37,29,28;,
  3;38,30,21;,
  3;38,21,29;,
  3;130,31,30;,
  3;130,131,32;,
  3;130,32,31;,
  3;131,132,33;,
  3;131,33,32;,
  3;132,133,34;,
  3;132,34,33;,
  3;133,134,34;,
  3;134,35,34;,
  3;134,135,35;,
  3;135,36,35;,
  3;135,136,37;,
  3;135,37,36;,
  3;136,137,38;,
  3;136,38,37;,
  3;137,138,30;,
  3;137,30,38;,
  3;138,130,30;,
  3;48,49,42;,
  3;48,42,41;,
  3;49,50,43;,
  3;49,43,42;,
  3;50,51,43;,
  3;51,52,44;,
  3;51,44,43;,
  3;52,53,45;,
  3;52,45,44;,
  3;53,54,46;,
  3;53,46,45;,
  3;54,55,47;,
  3;54,47,46;,
  3;55,48,41;,
  3;55,41,47;,
  3;56,57,49;,
  3;56,49,48;,
  3;57,58,50;,
  3;57,50,49;,
  3;58,59,51;,
  3;58,51,50;,
  3;59,60,52;,
  3;59,52,51;,
  3;60,61,53;,
  3;60,53,52;,
  3;61,62,54;,
  3;61,54,53;,
  3;62,63,55;,
  3;62,55,54;,
  3;63,56,48;,
  3;63,48,55;,
  3;64,65,57;,
  3;64,57,56;,
  3;65,66,58;,
  3;65,58,57;,
  3;66,67,59;,
  3;66,59,58;,
  3;67,68,60;,
  3;67,60,59;,
  3;68,69,61;,
  3;68,61,60;,
  3;61,69,70;,
  3;61,70,62;,
  3;70,71,63;,
  3;70,63,62;,
  3;71,64,56;,
  3;71,56,63;,
  3;72,73,65;,
  3;72,65,64;,
  3;73,74,66;,
  3;73,66,65;,
  3;74,75,67;,
  3;74,67,66;,
  3;75,76,68;,
  3;75,68,67;,
  3;76,77,69;,
  3;76,69,68;,
  3;77,78,70;,
  3;77,70,69;,
  3;78,79,71;,
  3;78,71,70;,
  3;79,72,64;,
  3;79,64,71;,
  3;80,81,73;,
  3;80,73,72;,
  3;81,82,74;,
  3;81,74,73;,
  3;82,83,75;,
  3;82,75,74;,
  3;83,84,76;,
  3;83,76,75;,
  3;84,85,77;,
  3;84,77,76;,
  3;85,86,78;,
  3;85,78,77;,
  3;86,87,79;,
  3;86,79,78;,
  3;87,80,72;,
  3;87,72,79;,
  3;88,89,81;,
  3;88,81,80;,
  3;89,90,82;,
  3;89,82,81;,
  3;90,91,83;,
  3;90,83,82;,
  3;91,92,84;,
  3;91,84,83;,
  3;92,93,85;,
  3;92,85,84;,
  3;85,93,86;,
  3;93,94,87;,
  3;93,87,86;,
  3;94,88,80;,
  3;94,80,87;,
  4;96,96,97,96;,
  4;96,96,100,97;,
  4;97,100,98,98;,
  4;139,99,101,140;,
  4;99,103,105,101;,
  4;140,101,102,141;,
  4;101,105,106,102;,
  4;104,104,110,142;,
  4;104,104,104,110;,
  4;142,110,107,107;,
  4;143,108,109,144;,
  4;108,145,146,109;,
  4;144,109,111,147;,
  4;109,146,148,111;,
  4;149,112,112,150;,
  4;112,103,99,112;,
  4;150,112,112,149;,
  4;112,99,139,112;,
  4;111,113,151,147;,
  4;152,152,153,153;,
  4;148,154,113,111;,
  4;155,155,152,152;;
 }
 MeshTextureCoords {
  248;
  0.031250;0.000000;,
  0.000000;0.000000;,
  0.062500;0.000000;,
  0.093750;0.000000;,
  0.125000;0.000000;,
  0.156250;0.000000;,
  0.187500;0.000000;,
  0.218750;0.000000;,
  0.250000;0.000000;,
  0.281250;0.000000;,
  0.312500;0.000000;,
  0.343750;0.000000;,
  0.375000;0.000000;,
  0.406250;0.000000;,
  0.437500;0.000000;,
  0.468750;0.000000;,
  0.500000;0.000000;,
  0.531250;0.000000;,
  0.562500;0.000000;,
  0.593750;0.000000;,
  0.625000;0.000000;,
  0.656250;0.000000;,
  0.687500;0.000000;,
  0.718750;0.000000;,
  0.750000;0.000000;,
  0.781250;0.000000;,
  0.812500;0.000000;,
  0.843750;0.000000;,
  0.875000;0.000000;,
  0.906250;0.000000;,
  0.937500;0.000000;,
  0.968750;0.000000;,
  1.000000;0.000000;,
  0.093750;1.000000;,
  0.125000;1.000000;,
  0.062500;1.000000;,
  0.218750;1.000000;,
  0.250000;1.000000;,
  0.187500;1.000000;,
  0.343750;1.000000;,
  0.375000;1.000000;,
  0.312500;1.000000;,
  0.406250;1.000000;,
  0.437500;1.000000;,
  0.531250;1.000000;,
  0.562500;1.000000;,
  0.500000;1.000000;,
  0.656250;1.000000;,
  0.687500;1.000000;,
  0.625000;1.000000;,
  0.781250;1.000000;,
  0.812500;1.000000;,
  0.750000;1.000000;,
  0.906250;1.000000;,
  0.937500;1.000000;,
  0.875000;1.000000;,
  0.968750;1.000000;,
  1.000000;1.000000;,
  0.062500;0.000000;,
  0.000000;0.125000;,
  0.125000;0.125000;,
  0.187500;0.000000;,
  0.250000;0.125000;,
  0.437500;0.000000;,
  0.375000;0.125000;,
  0.500000;0.125000;,
  0.562500;0.000000;,
  0.625000;0.125000;,
  0.687500;0.000000;,
  0.750000;0.125000;,
  0.812500;0.000000;,
  0.875000;0.125000;,
  0.937500;0.000000;,
  1.000000;0.125000;,
  0.000000;0.875000;,
  0.062500;1.000000;,
  0.125000;0.875000;,
  0.187500;1.000000;,
  0.250000;0.875000;,
  0.312500;1.000000;,
  0.375000;0.875000;,
  0.437500;1.000000;,
  0.500000;0.875000;,
  0.562500;1.000000;,
  0.625000;0.875000;,
  0.750000;0.875000;,
  0.812500;1.000000;,
  0.875000;0.875000;,
  0.937500;1.000000;,
  1.000000;0.875000;,
  0.000000;0.200000;,
  0.062500;0.200000;,
  0.125000;0.200000;,
  0.187500;0.200000;,
  0.250000;0.200000;,
  0.312500;0.200000;,
  0.375000;0.200000;,
  0.437500;0.200000;,
  0.500000;0.200000;,
  0.562500;0.200000;,
  0.625000;0.200000;,
  0.687500;0.200000;,
  0.750000;0.200000;,
  0.812500;0.200000;,
  0.875000;0.200000;,
  0.937500;0.200000;,
  1.000000;0.200000;,
  0.000000;0.400000;,
  0.062500;0.400000;,
  0.125000;0.400000;,
  0.187500;0.400000;,
  0.250000;0.400000;,
  0.312500;0.400000;,
  0.375000;0.400000;,
  0.437500;0.400000;,
  0.500000;0.400000;,
  0.562500;0.400000;,
  0.625000;0.400000;,
  0.687500;0.400000;,
  0.750000;0.400000;,
  0.812500;0.400000;,
  0.875000;0.400000;,
  0.937500;0.400000;,
  0.000000;0.600000;,
  0.062500;0.600000;,
  0.125000;0.600000;,
  0.187500;0.600000;,
  0.250000;0.600000;,
  0.312500;0.600000;,
  0.375000;0.600000;,
  0.437500;0.600000;,
  0.500000;0.600000;,
  0.562500;0.600000;,
  0.625000;0.600000;,
  0.687500;0.600000;,
  0.750000;0.600000;,
  0.812500;0.600000;,
  0.875000;0.600000;,
  0.937500;0.600000;,
  0.000000;0.800000;,
  0.062500;0.800000;,
  0.125000;0.800000;,
  0.187500;0.800000;,
  0.250000;0.800000;,
  0.312500;0.800000;,
  0.375000;0.800000;,
  0.437500;0.800000;,
  0.500000;0.800000;,
  0.562500;0.800000;,
  0.625000;0.800000;,
  0.687500;0.800000;,
  0.750000;0.800000;,
  0.812500;0.800000;,
  0.875000;0.800000;,
  0.937500;0.800000;,
  0.000000;1.000000;,
  1.000000;0.800000;,
  0.000000;0.250000;,
  0.125000;0.250000;,
  0.250000;0.250000;,
  0.375000;0.250000;,
  0.500000;0.250000;,
  0.625000;0.250000;,
  0.750000;0.250000;,
  0.875000;0.250000;,
  1.000000;0.250000;,
  0.000000;0.375000;,
  0.125000;0.375000;,
  0.250000;0.375000;,
  0.375000;0.375000;,
  0.500000;0.375000;,
  0.625000;0.375000;,
  0.750000;0.375000;,
  0.875000;0.375000;,
  1.000000;0.375000;,
  0.000000;0.500000;,
  0.125000;0.500000;,
  0.250000;0.500000;,
  0.375000;0.500000;,
  0.500000;0.500000;,
  0.625000;0.500000;,
  0.750000;0.500000;,
  0.875000;0.500000;,
  1.000000;0.500000;,
  0.000000;0.625000;,
  0.125000;0.625000;,
  0.250000;0.625000;,
  0.375000;0.625000;,
  0.500000;0.625000;,
  0.625000;0.625000;,
  0.750000;0.625000;,
  0.875000;0.625000;,
  1.000000;0.625000;,
  0.000000;0.750000;,
  0.125000;0.750000;,
  0.250000;0.750000;,
  0.375000;0.750000;,
  0.500000;0.750000;,
  0.625000;0.750000;,
  0.750000;0.750000;,
  0.875000;0.750000;,
  1.000000;0.750000;,
  0.000000;0.000000;,
  0.500000;0.000000;,
  0.500000;0.500000;,
  0.000000;0.500000;,
  1.000000;0.000000;,
  1.000000;0.500000;,
  1.000000;1.000000;,
  0.500000;1.000000;,
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
