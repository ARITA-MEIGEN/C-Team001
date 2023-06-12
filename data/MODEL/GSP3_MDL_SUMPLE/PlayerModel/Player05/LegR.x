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
 249;
 0.00000;-0.35000;-0.00000;,
 0.16769;-0.35000;-0.40484;,
 0.00000;-0.35000;-0.43819;,
 0.00000;-0.35000;-0.00000;,
 0.30985;-0.35000;-0.30985;,
 0.00000;-0.35000;-0.00000;,
 0.40483;-0.35000;-0.16769;,
 0.00000;-0.35000;-0.00000;,
 0.43819;-0.35000;-0.00000;,
 0.00000;-0.35000;-0.00000;,
 0.40483;-0.35000;0.16768;,
 0.00000;-0.35000;-0.00000;,
 0.30985;-0.35000;0.30984;,
 0.00000;-0.35000;-0.00000;,
 0.16769;-0.35000;0.40483;,
 0.00000;-0.35000;-0.00000;,
 0.00000;-0.35000;0.43818;,
 0.00000;-0.35000;-0.00000;,
 -0.16769;-0.35000;0.40483;,
 0.00000;-0.35000;-0.00000;,
 -0.30985;-0.35000;0.30984;,
 0.00000;-0.35000;-0.00000;,
 -0.40483;-0.35000;0.16768;,
 0.00000;-0.35000;-0.00000;,
 -0.43819;-0.35000;0.00000;,
 0.00000;-0.35000;-0.00000;,
 -0.40483;-0.35000;-0.16769;,
 0.00000;-0.35000;-0.00000;,
 -0.30985;-0.35000;-0.30985;,
 0.00000;-0.35000;-0.00000;,
 -0.16769;-0.35000;-0.40484;,
 0.00000;-0.35000;-0.00000;,
 0.00000;-0.35000;-0.43819;,
 0.00000;-2.71495;-0.00000;,
 0.07567;-2.71495;-0.38042;,
 0.32250;-2.71495;-0.21549;,
 0.00000;-2.71495;-0.00000;,
 0.32250;-2.71495;-0.21549;,
 0.38041;-2.71495;0.07566;,
 0.00000;-2.71495;-0.00000;,
 0.38041;-2.71495;0.07566;,
 0.27964;-2.71495;0.27963;,
 0.00000;-2.71495;-0.00000;,
 0.07567;-2.71495;0.38041;,
 0.00000;-2.71495;-0.00000;,
 0.07567;-2.71495;0.38041;,
 -0.21549;-2.71495;0.32250;,
 0.00000;-2.71495;-0.00000;,
 -0.21549;-2.71495;0.32250;,
 -0.38041;-2.71495;0.07566;,
 0.00000;-2.71495;-0.00000;,
 -0.38041;-2.71495;0.07566;,
 -0.32250;-2.71495;-0.21549;,
 0.00000;-2.71495;-0.00000;,
 -0.32250;-2.71495;-0.21549;,
 -0.15134;-2.71495;-0.36537;,
 0.00000;-2.71495;-0.00000;,
 0.07567;-2.71495;-0.38042;,
 0.00000;0.39297;0.00000;,
 0.15386;0.48937;-0.15386;,
 0.00000;0.48937;-0.21759;,
 0.00000;0.39297;0.00000;,
 0.18572;0.48937;0.07693;,
 0.00000;0.39297;0.00000;,
 0.00000;0.48937;0.21758;,
 0.18572;0.48937;0.07693;,
 0.00000;0.39297;0.00000;,
 -0.15386;0.48937;0.15385;,
 0.00000;0.39297;0.00000;,
 -0.21758;0.48937;0.00000;,
 0.00000;0.39297;0.00000;,
 -0.15386;0.48937;-0.15386;,
 0.00000;0.39297;0.00000;,
 0.00000;0.48937;-0.21759;,
 0.00000;-0.49526;-0.21759;,
 0.15386;-0.49526;-0.15386;,
 0.00000;-0.53582;-0.00000;,
 0.21758;-0.49526;-0.00000;,
 0.00000;-0.53582;-0.00000;,
 0.15386;-0.49526;0.15385;,
 0.00000;-0.53582;-0.00000;,
 0.00000;-0.49526;0.21758;,
 0.00000;-0.53582;-0.00000;,
 -0.18572;-0.49526;0.07693;,
 0.00000;-0.53582;-0.00000;,
 -0.18572;-0.49526;0.07693;,
 -0.15386;-0.49526;-0.15386;,
 0.00000;-0.53582;-0.00000;,
 0.00000;-0.49526;-0.21759;,
 0.00000;-0.53582;-0.00000;,
 0.22682;-0.60315;-0.33948;,
 0.00000;-0.60315;-0.41628;,
 0.38459;-0.60315;-0.15931;,
 0.22682;-0.60315;-0.33948;,
 0.40043;-0.60315;0.07965;,
 0.29435;-0.60315;0.29435;,
 0.40043;-0.60315;0.07965;,
 0.07965;-0.60315;0.40043;,
 -0.22682;-0.60315;0.33947;,
 0.07965;-0.60315;0.40043;,
 -0.40043;-0.60315;0.07965;,
 -0.22682;-0.60315;0.33947;,
 -0.38459;-0.60315;-0.15931;,
 -0.40043;-0.60315;0.07965;,
 -0.22682;-0.60315;-0.33948;,
 0.00000;-0.60315;-0.41628;,
 -0.22682;-0.60315;-0.33948;,
 0.15134;-1.04003;-0.36537;,
 0.00000;-1.68747;-0.39547;,
 0.32250;-1.04003;-0.21549;,
 0.38041;-1.04003;0.07566;,
 0.32250;-1.04003;-0.21549;,
 0.21549;-1.04003;0.32250;,
 0.38041;-1.04003;0.07566;,
 -0.07567;-1.04003;0.38041;,
 0.21549;-1.04003;0.32250;,
 -0.27964;-1.04003;0.27963;,
 -0.07567;-1.04003;0.38041;,
 -0.38041;-1.04003;0.07566;,
 -0.32250;-1.04003;-0.21549;,
 -0.38041;-1.04003;0.07566;,
 -0.15134;-1.04003;-0.36537;,
 -0.32250;-1.04003;-0.21549;,
 0.00000;-1.68747;-0.39547;,
 0.15134;-2.12999;-0.36537;,
 -0.07567;-2.12999;-0.38042;,
 0.32250;-2.12999;-0.21549;,
 0.38041;-2.12999;0.07566;,
 0.32250;-2.12999;-0.21549;,
 0.21549;-2.12999;0.32250;,
 0.38041;-2.12999;0.07566;,
 -0.07567;-2.12999;0.38041;,
 0.21549;-2.12999;0.32250;,
 -0.27964;-2.12999;0.27963;,
 -0.07567;-2.12999;0.38041;,
 -0.38041;-2.12999;0.07566;,
 -0.32250;-2.12999;-0.21549;,
 -0.38041;-2.12999;0.07566;,
 -0.07567;-2.12999;-0.38042;,
 -0.32250;-2.12999;-0.21549;,
 0.15134;-2.52064;-0.36537;,
 -0.07567;-2.52064;-0.38042;,
 0.32250;-2.52064;-0.21549;,
 0.38041;-2.52064;0.07566;,
 0.32250;-2.52064;-0.21549;,
 0.21549;-2.52064;0.32250;,
 0.38041;-2.52064;0.07566;,
 -0.07567;-2.52064;0.38041;,
 0.21549;-2.52064;0.32250;,
 -0.27964;-2.52064;0.27963;,
 -0.07567;-2.52064;0.38041;,
 -0.38041;-2.52064;0.07566;,
 -0.32250;-2.52064;-0.21549;,
 -0.38041;-2.52064;0.07566;,
 -0.07567;-2.52064;-0.38042;,
 -0.32250;-2.52064;-0.21549;,
 0.07567;-2.71495;-0.38042;,
 -0.07567;-2.52064;-0.38042;,
 0.28429;0.37386;-0.28429;,
 0.00000;0.37386;-0.40205;,
 0.40204;0.37386;0.00000;,
 0.28429;0.37386;0.28428;,
 0.00000;0.37386;0.40204;,
 -0.28429;0.37386;0.28428;,
 -0.40204;0.37386;0.00000;,
 -0.28429;0.37386;-0.28429;,
 0.00000;0.37386;-0.40205;,
 0.37144;0.20098;-0.37144;,
 0.00000;0.20098;-0.52530;,
 0.52529;0.20098;0.00000;,
 0.37144;0.20098;0.37144;,
 0.00000;0.20098;0.52529;,
 -0.37144;0.20098;0.37144;,
 -0.52529;0.20098;0.00000;,
 -0.37144;0.20098;-0.37144;,
 0.00000;0.20098;-0.52530;,
 0.40204;-0.00294;-0.40205;,
 0.00000;-0.00294;-0.56858;,
 0.56858;-0.00294;-0.00000;,
 0.40204;-0.00294;0.40204;,
 0.00000;-0.00294;0.56857;,
 -0.40204;-0.00294;0.40204;,
 -0.56858;-0.00294;0.00000;,
 -0.40204;-0.00294;-0.40205;,
 0.00000;-0.00294;-0.56858;,
 0.37144;-0.20687;-0.37144;,
 0.00000;-0.20687;-0.52530;,
 0.52529;-0.20687;-0.00000;,
 0.37144;-0.20687;0.37144;,
 0.00000;-0.20687;0.52529;,
 -0.37144;-0.20687;0.37144;,
 -0.52529;-0.20687;0.00000;,
 -0.37144;-0.20687;-0.37144;,
 0.00000;-0.20687;-0.52530;,
 0.28429;-0.37975;-0.28429;,
 0.00000;-0.37975;-0.40205;,
 0.40204;-0.37975;-0.00000;,
 0.28429;-0.37975;0.28428;,
 0.00000;-0.37975;0.40204;,
 -0.28429;-0.37975;0.28428;,
 -0.40204;-0.37975;0.00000;,
 -0.28429;-0.37975;-0.28429;,
 0.00000;-0.37975;-0.40205;,
 0.48496;0.49729;-0.33192;,
 0.48496;0.32110;-0.26779;,
 0.48496;-0.24871;-0.30507;,
 0.48496;0.23321;-0.84120;,
 0.48496;-0.54952;-1.00267;,
 0.48496;0.06486;-1.01995;,
 0.37936;-1.46103;-0.21775;,
 0.37936;-1.52515;-0.39395;,
 0.48496;0.06486;-1.01995;,
 0.48496;-0.54952;-1.00267;,
 -0.01408;-0.54952;-1.00267;,
 -0.01408;0.06486;-1.01995;,
 -0.51312;-0.54951;-1.00267;,
 -0.51312;0.06486;-1.01995;,
 0.37936;-1.52515;-0.39395;,
 0.06296;-1.53791;-0.38930;,
 -0.25345;-1.52515;-0.39395;,
 -0.51312;0.06486;-1.01995;,
 -0.51312;-0.54951;-1.00267;,
 -0.51312;-0.24871;-0.30507;,
 -0.51312;0.23321;-0.84120;,
 -0.51312;0.32110;-0.26779;,
 -0.51312;0.49729;-0.33192;,
 -0.25345;-1.52515;-0.39395;,
 -0.25345;-1.46103;-0.21775;,
 -0.51312;0.49729;-0.33192;,
 -0.51312;0.32110;-0.26779;,
 -0.01408;0.32110;-0.26780;,
 -0.01408;0.49729;-0.33192;,
 0.48496;0.32110;-0.26779;,
 0.48496;0.49729;-0.33192;,
 -0.51312;-0.24871;-0.30507;,
 -0.01408;-0.24871;-0.30507;,
 0.48496;-0.24871;-0.30507;,
 -0.01408;0.49729;-0.33192;,
 -0.01408;0.23321;-0.84120;,
 -0.01408;0.06486;-1.01995;,
 0.48496;0.49729;-0.33192;,
 0.48496;0.23321;-0.84120;,
 0.48496;0.06486;-1.01995;,
 -0.01408;-0.24871;-0.30507;,
 0.06296;-1.47378;-0.21311;,
 0.06296;-1.53791;-0.38930;,
 0.48496;-0.24871;-0.30507;,
 0.37936;-1.46103;-0.21775;,
 0.37936;-1.52515;-0.39395;;
 
 256;
 3;0,1,2;,
 3;3,4,1;,
 3;5,6,4;,
 3;7,8,6;,
 3;9,10,8;,
 3;11,12,10;,
 3;13,14,12;,
 3;15,16,14;,
 3;17,18,16;,
 3;19,20,18;,
 3;21,22,20;,
 3;23,24,22;,
 3;25,26,24;,
 3;27,28,26;,
 3;29,30,28;,
 3;31,32,30;,
 3;33,34,35;,
 3;36,37,38;,
 3;39,40,41;,
 3;42,41,43;,
 3;44,45,46;,
 3;47,48,49;,
 3;50,51,52;,
 3;53,54,55;,
 3;56,55,57;,
 3;58,59,60;,
 3;61,62,59;,
 3;63,64,65;,
 3;66,67,64;,
 3;68,69,67;,
 3;70,71,69;,
 3;72,73,71;,
 3;74,75,76;,
 3;75,77,78;,
 3;77,79,80;,
 3;79,81,82;,
 3;81,83,84;,
 3;85,86,87;,
 3;86,88,89;,
 3;1,90,91;,
 3;1,91,2;,
 3;4,90,1;,
 3;6,92,93;,
 3;6,93,4;,
 3;8,94,92;,
 3;8,92,6;,
 3;10,94,8;,
 3;12,95,96;,
 3;12,96,10;,
 3;14,97,95;,
 3;14,95,12;,
 3;16,97,14;,
 3;18,98,99;,
 3;18,99,16;,
 3;20,98,18;,
 3;22,100,101;,
 3;22,101,20;,
 3;24,100,22;,
 3;26,102,103;,
 3;26,103,24;,
 3;28,104,102;,
 3;28,102,26;,
 3;30,104,28;,
 3;32,105,106;,
 3;32,106,30;,
 3;91,90,107;,
 3;91,107,108;,
 3;93,109,107;,
 3;92,109,93;,
 3;94,110,111;,
 3;94,111,92;,
 3;95,112,113;,
 3;95,113,96;,
 3;97,112,95;,
 3;97,114,115;,
 3;98,114,99;,
 3;101,116,117;,
 3;100,118,116;,
 3;100,116,101;,
 3;102,119,120;,
 3;102,120,103;,
 3;104,119,102;,
 3;106,121,122;,
 3;105,123,121;,
 3;105,121,106;,
 3;107,124,125;,
 3;107,125,108;,
 3;109,126,124;,
 3;109,124,107;,
 3;110,127,128;,
 3;110,128,111;,
 3;112,129,130;,
 3;112,130,113;,
 3;114,131,132;,
 3;114,132,115;,
 3;116,133,134;,
 3;116,134,117;,
 3;118,135,133;,
 3;118,133,116;,
 3;119,136,137;,
 3;119,137,120;,
 3;121,138,139;,
 3;121,139,122;,
 3;123,138,121;,
 3;124,140,141;,
 3;124,141,125;,
 3;126,142,140;,
 3;126,140,124;,
 3;127,143,144;,
 3;127,144,128;,
 3;129,145,146;,
 3;129,146,130;,
 3;131,147,148;,
 3;131,148,132;,
 3;133,149,150;,
 3;133,150,134;,
 3;135,151,149;,
 3;135,149,133;,
 3;136,152,153;,
 3;136,153,137;,
 3;138,154,155;,
 3;138,155,139;,
 3;140,156,141;,
 3;142,35,34;,
 3;142,34,140;,
 3;143,38,37;,
 3;143,37,144;,
 3;145,41,40;,
 3;145,40,146;,
 3;148,43,41;,
 3;147,43,148;,
 3;150,46,45;,
 3;149,46,150;,
 3;151,49,48;,
 3;151,48,149;,
 3;152,52,51;,
 3;152,51,153;,
 3;154,55,54;,
 3;154,54,155;,
 3;157,57,55;,
 3;59,158,159;,
 3;59,159,60;,
 3;62,160,158;,
 3;62,158,59;,
 3;65,161,160;,
 3;64,162,161;,
 3;64,161,65;,
 3;67,163,162;,
 3;67,162,64;,
 3;69,164,163;,
 3;69,163,67;,
 3;71,165,164;,
 3;71,164,69;,
 3;73,166,165;,
 3;73,165,71;,
 3;158,167,168;,
 3;158,168,159;,
 3;160,169,167;,
 3;160,167,158;,
 3;161,170,169;,
 3;161,169,160;,
 3;162,171,170;,
 3;162,170,161;,
 3;163,172,171;,
 3;163,171,162;,
 3;164,173,172;,
 3;164,172,163;,
 3;165,174,173;,
 3;165,173,164;,
 3;166,175,174;,
 3;166,174,165;,
 3;167,176,177;,
 3;167,177,168;,
 3;169,178,176;,
 3;169,176,167;,
 3;170,179,178;,
 3;170,178,169;,
 3;171,180,179;,
 3;171,179,170;,
 3;172,181,180;,
 3;172,180,171;,
 3;172,173,182;,
 3;172,182,181;,
 3;174,183,182;,
 3;174,182,173;,
 3;175,184,183;,
 3;175,183,174;,
 3;176,185,186;,
 3;176,186,177;,
 3;178,187,185;,
 3;178,185,176;,
 3;179,188,187;,
 3;179,187,178;,
 3;180,189,188;,
 3;180,188,179;,
 3;181,190,189;,
 3;181,189,180;,
 3;182,191,190;,
 3;182,190,181;,
 3;183,192,191;,
 3;183,191,182;,
 3;184,193,192;,
 3;184,192,183;,
 3;185,194,195;,
 3;185,195,186;,
 3;187,196,194;,
 3;187,194,185;,
 3;188,197,196;,
 3;188,196,187;,
 3;189,198,197;,
 3;189,197,188;,
 3;190,199,198;,
 3;190,198,189;,
 3;191,200,199;,
 3;191,199,190;,
 3;192,201,200;,
 3;192,200,191;,
 3;193,202,201;,
 3;193,201,192;,
 3;194,75,74;,
 3;194,74,195;,
 3;196,77,75;,
 3;196,75,194;,
 3;197,79,77;,
 3;197,77,196;,
 3;198,81,79;,
 3;198,79,197;,
 3;199,83,81;,
 3;199,81,198;,
 3;199,200,85;,
 3;201,86,85;,
 3;201,85,200;,
 3;202,88,86;,
 3;202,86,201;,
 4;203,204,205,206;,
 4;206,205,207,208;,
 4;205,209,210,207;,
 4;211,212,213,214;,
 4;214,213,215,216;,
 4;212,217,218,213;,
 4;213,218,219,215;,
 4;220,221,222,223;,
 4;223,222,224,225;,
 4;221,226,227,222;,
 4;228,229,230,231;,
 4;231,230,232,233;,
 4;229,234,235,230;,
 4;230,235,236,232;,
 4;228,237,238,223;,
 4;223,238,239,216;,
 4;237,240,241,238;,
 4;238,241,242,239;,
 4;243,234,227,244;,
 4;244,227,219,245;,
 4;246,243,244,247;,
 4;247,244,245,248;;
 
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
  157;
  0.000000;1.000000;0.000000;,
  0.028548;-0.055183;-0.998068;,
  0.613753;-0.092486;-0.784062;,
  0.933409;-0.102281;-0.343926;,
  0.974590;-0.112957;0.193432;,
  0.704597;-0.089524;0.703938;,
  0.102891;-0.114666;0.988061;,
  -0.582848;-0.108473;0.805308;,
  -0.972451;-0.095998;0.212423;,
  -0.920349;-0.089519;-0.380716;,
  -0.522327;-0.092683;-0.847694;,
  0.163795;-0.053512;-0.985042;,
  0.480526;-0.042026;-0.875973;,
  0.859232;-0.040342;-0.509992;,
  0.984284;-0.036142;0.172854;,
  0.591955;-0.044439;0.804745;,
  -0.086537;-0.027609;0.995866;,
  -0.691362;-0.015702;0.722338;,
  -0.987596;-0.035668;0.152914;,
  -0.876157;-0.035864;-0.480690;,
  -0.453309;-0.019428;-0.891142;,
  0.382689;0.000000;-0.923877;,
  0.865844;0.000000;-0.500315;,
  0.980788;0.000000;0.195078;,
  0.555578;0.000000;0.831464;,
  -0.130912;0.000000;0.991394;,
  -0.707121;0.000000;0.707093;,
  -0.991397;0.000000;0.130890;,
  -0.843524;-0.004848;-0.537070;,
  -0.074972;-0.029240;-0.996757;,
  0.443208;-0.030247;-0.895909;,
  0.854992;-0.034623;-0.517485;,
  0.980788;0.000000;0.195078;,
  0.552666;0.045418;0.832164;,
  -0.198048;0.008998;0.980151;,
  -0.752330;-0.030236;0.658093;,
  -0.987942;-0.034620;0.150904;,
  -0.831475;0.000000;-0.555562;,
  -0.246380;0.029488;-0.968725;,
  0.000000;-1.000000;-0.000000;,
  0.030345;0.999461;0.012559;,
  -0.049269;0.983601;-0.173496;,
  0.092076;0.983947;-0.152872;,
  0.199488;0.979900;0.000299;,
  0.033919;0.989475;0.140675;,
  -0.087844;0.983602;0.157513;,
  -0.173493;0.983602;0.049268;,
  -0.157517;0.983602;-0.087840;,
  -0.018521;0.729888;-0.683316;,
  0.474370;0.743338;-0.471616;,
  0.692712;0.718791;-0.059069;,
  0.506567;0.740033;0.442427;,
  0.018516;0.729892;0.683312;,
  -0.470085;0.729891;0.496265;,
  -0.683316;0.729887;0.018525;,
  -0.496280;0.729886;-0.470078;,
  -0.010159;0.404585;-0.914444;,
  0.639432;0.404583;-0.653788;,
  0.914439;0.404595;-0.010165;,
  0.653792;0.404589;0.639424;,
  0.010161;0.404582;0.914445;,
  -0.689239;0.376756;0.618874;,
  -0.894766;0.441130;-0.069271;,
  -0.653798;0.404589;-0.639419;,
  -0.000000;0.000005;-1.000000;,
  0.707107;0.000012;-0.707107;,
  1.000000;0.000002;0.000003;,
  0.707102;-0.000002;0.707112;,
  0.000000;0.000005;1.000000;,
  -0.645729;-0.042259;0.762397;,
  -0.997797;0.030257;0.059044;,
  -0.707107;-0.000002;-0.707107;,
  0.010159;-0.404581;-0.914446;,
  0.653799;-0.404585;-0.639420;,
  0.914443;-0.404586;0.010168;,
  0.639428;-0.404578;0.653796;,
  -0.010161;-0.404578;0.914447;,
  -0.653794;-0.404585;0.639425;,
  -0.914441;-0.404592;-0.010165;,
  -0.639434;-0.404579;-0.653789;,
  0.018521;-0.729888;-0.683315;,
  0.496280;-0.729886;-0.470078;,
  0.683316;-0.729888;0.018525;,
  0.470084;-0.729892;0.496265;,
  -0.018516;-0.729892;0.683311;,
  -0.506567;-0.740033;0.442426;,
  -0.692712;-0.718792;-0.059069;,
  -0.474369;-0.743338;-0.471616;,
  0.044310;-0.917040;-0.396327;,
  0.311581;-0.917041;-0.248905;,
  0.396332;-0.917037;0.044313;,
  0.248921;-0.917039;0.311574;,
  -0.069706;-0.928639;0.364376;,
  -0.377173;-0.922540;0.081615;,
  -0.280510;-0.918429;-0.278932;,
  0.011407;-0.999924;-0.004720;,
  1.000000;0.000000;0.000000;,
  0.999524;-0.028686;0.011383;,
  0.995713;-0.085975;0.034118;,
  -0.000000;0.383531;-0.923528;,
  0.998928;-0.043034;0.017077;,
  -0.000008;-0.288220;-0.957564;,
  -0.000015;-0.528318;-0.849046;,
  -0.000000;0.383531;-0.923528;,
  -1.000000;0.000000;0.000000;,
  -0.002283;-0.288358;-0.957520;,
  -0.004406;-0.528560;-0.848885;,
  -0.974889;-0.206989;0.082142;,
  0.000000;0.342007;0.939698;,
  0.000000;0.141389;0.989954;,
  -0.997210;-0.069385;0.027535;,
  -0.000007;0.004044;0.999992;,
  0.000000;0.815673;-0.578514;,
  -0.000015;0.073347;0.997306;,
  0.359724;-0.113728;-0.926102;,
  -0.108221;-0.126478;-0.986048;,
  0.698222;-0.147003;-0.700626;,
  0.869573;-0.126478;-0.477333;,
  0.993268;-0.113725;-0.022040;,
  0.914506;-0.146970;0.376934;,
  0.773779;-0.126478;0.620701;,
  0.400470;-0.113723;0.909225;,
  0.001723;-0.146960;0.989141;,
  -0.317666;-0.166785;0.933419;,
  -0.698222;-0.147003;0.700626;,
  -0.884651;-0.166801;0.435396;,
  -0.989136;-0.146997;0.001730;,
  -0.952409;-0.126475;-0.277347;,
  -0.717944;-0.113724;-0.686748;,
  -0.380108;-0.146989;-0.913188;,
  -0.555374;-0.027080;-0.831159;,
  0.319227;-0.051663;-0.946269;,
  0.899648;0.000000;-0.436616;,
  0.956756;0.069127;0.282557;,
  0.702927;0.076042;0.707185;,
  0.154171;-0.017944;0.987881;,
  -0.632907;-0.079095;0.770177;,
  -0.998252;0.000000;0.059108;,
  -0.775793;0.069133;-0.627189;,
  -0.378778;0.076068;-0.922356;,
  0.000000;0.383531;-0.923528;,
  0.002267;-0.288080;-0.957604;,
  0.004376;-0.528067;-0.849191;,
  -0.993702;-0.104151;0.041331;,
  0.000009;0.342007;0.939698;,
  0.000010;0.141389;0.989954;,
  -0.000010;0.141389;0.989954;,
  -0.000009;0.342007;0.939698;,
  -0.002911;0.003862;0.999988;,
  0.002896;0.004226;0.999987;,
  0.000000;0.887748;-0.460329;,
  0.000000;0.887748;-0.460330;,
  -0.005818;0.072983;0.997316;,
  0.000001;-0.939701;0.341998;,
  -0.042862;-0.938837;0.341684;,
  0.005788;0.073709;0.997263;,
  0.042863;-0.938837;0.341684;;
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
  3;40,42,41;,
  3;40,43,42;,
  3;40,44,43;,
  3;40,45,44;,
  3;40,46,45;,
  3;40,47,46;,
  3;40,41,47;,
  3;88,89,95;,
  3;89,90,95;,
  3;90,91,95;,
  3;91,92,95;,
  3;92,93,95;,
  3;93,94,95;,
  3;94,88,95;,
  3;114,2,1;,
  3;114,1,115;,
  3;116,2,114;,
  3;117,3,2;,
  3;117,2,116;,
  3;118,4,3;,
  3;118,3,117;,
  3;119,4,118;,
  3;120,5,4;,
  3;120,4,119;,
  3;121,6,5;,
  3;121,5,120;,
  3;122,6,121;,
  3;123,7,6;,
  3;123,6,122;,
  3;124,7,123;,
  3;125,8,7;,
  3;125,7,124;,
  3;126,8,125;,
  3;127,9,8;,
  3;127,8,126;,
  3;128,10,9;,
  3;128,9,127;,
  3;129,10,128;,
  3;115,1,10;,
  3;115,10,129;,
  3;1,2,12;,
  3;1,12,11;,
  3;2,13,12;,
  3;3,13,2;,
  3;4,14,13;,
  3;4,13,3;,
  3;5,15,14;,
  3;5,14,4;,
  3;6,15,5;,
  3;6,16,15;,
  3;7,16,6;,
  3;7,17,16;,
  3;8,18,17;,
  3;8,17,7;,
  3;9,19,18;,
  3;9,18,8;,
  3;10,19,9;,
  3;10,20,19;,
  3;1,11,20;,
  3;1,20,10;,
  3;12,21,29;,
  3;12,29,11;,
  3;13,22,21;,
  3;13,21,12;,
  3;14,23,22;,
  3;14,22,13;,
  3;15,24,23;,
  3;15,23,14;,
  3;16,25,24;,
  3;16,24,15;,
  3;17,26,25;,
  3;17,25,16;,
  3;18,27,26;,
  3;18,26,17;,
  3;19,28,27;,
  3;19,27,18;,
  3;20,130,28;,
  3;20,28,19;,
  3;11,29,20;,
  3;21,30,38;,
  3;21,38,29;,
  3;22,31,30;,
  3;22,30,21;,
  3;23,32,31;,
  3;23,31,22;,
  3;24,33,32;,
  3;24,32,23;,
  3;25,34,33;,
  3;25,33,24;,
  3;26,35,34;,
  3;26,34,25;,
  3;27,36,35;,
  3;27,35,26;,
  3;28,37,36;,
  3;28,36,27;,
  3;29,38,37;,
  3;29,37,28;,
  3;30,131,38;,
  3;31,132,131;,
  3;31,131,30;,
  3;32,133,132;,
  3;32,132,31;,
  3;33,134,133;,
  3;33,133,32;,
  3;33,135,134;,
  3;34,135,33;,
  3;34,136,135;,
  3;35,136,34;,
  3;36,137,136;,
  3;36,136,35;,
  3;37,138,137;,
  3;37,137,36;,
  3;38,139,138;,
  3;38,138,37;,
  3;38,131,139;,
  3;42,49,48;,
  3;42,48,41;,
  3;43,50,49;,
  3;43,49,42;,
  3;43,51,50;,
  3;44,52,51;,
  3;44,51,43;,
  3;45,53,52;,
  3;45,52,44;,
  3;46,54,53;,
  3;46,53,45;,
  3;47,55,54;,
  3;47,54,46;,
  3;41,48,55;,
  3;41,55,47;,
  3;49,57,56;,
  3;49,56,48;,
  3;50,58,57;,
  3;50,57,49;,
  3;51,59,58;,
  3;51,58,50;,
  3;52,60,59;,
  3;52,59,51;,
  3;53,61,60;,
  3;53,60,52;,
  3;54,62,61;,
  3;54,61,53;,
  3;55,63,62;,
  3;55,62,54;,
  3;48,56,63;,
  3;48,63,55;,
  3;57,65,64;,
  3;57,64,56;,
  3;58,66,65;,
  3;58,65,57;,
  3;59,67,66;,
  3;59,66,58;,
  3;60,68,67;,
  3;60,67,59;,
  3;61,69,68;,
  3;61,68,60;,
  3;61,62,70;,
  3;61,70,69;,
  3;63,71,70;,
  3;63,70,62;,
  3;56,64,71;,
  3;56,71,63;,
  3;65,73,72;,
  3;65,72,64;,
  3;66,74,73;,
  3;66,73,65;,
  3;67,75,74;,
  3;67,74,66;,
  3;68,76,75;,
  3;68,75,67;,
  3;69,77,76;,
  3;69,76,68;,
  3;70,78,77;,
  3;70,77,69;,
  3;71,79,78;,
  3;71,78,70;,
  3;64,72,79;,
  3;64,79,71;,
  3;73,81,80;,
  3;73,80,72;,
  3;74,82,81;,
  3;74,81,73;,
  3;75,83,82;,
  3;75,82,74;,
  3;76,84,83;,
  3;76,83,75;,
  3;77,85,84;,
  3;77,84,76;,
  3;78,86,85;,
  3;78,85,77;,
  3;79,87,86;,
  3;79,86,78;,
  3;72,80,87;,
  3;72,87,79;,
  3;81,89,88;,
  3;81,88,80;,
  3;82,90,89;,
  3;82,89,81;,
  3;83,91,90;,
  3;83,90,82;,
  3;84,92,91;,
  3;84,91,83;,
  3;85,93,92;,
  3;85,92,84;,
  3;85,86,93;,
  3;87,94,93;,
  3;87,93,86;,
  3;80,88,94;,
  3;80,94,87;,
  4;96,96,97,96;,
  4;96,97,100,96;,
  4;97,98,98,100;,
  4;140,141,101,99;,
  4;99,101,105,103;,
  4;141,142,102,101;,
  4;101,102,106,105;,
  4;104,143,110,104;,
  4;104,110,104,104;,
  4;143,107,107,110;,
  4;144,145,109,108;,
  4;108,109,146,147;,
  4;145,148,111,109;,
  4;109,111,149,146;,
  4;150,151,112,112;,
  4;112,112,99,103;,
  4;151,150,112,112;,
  4;112,112,140,99;,
  4;111,148,152,113;,
  4;153,154,154,153;,
  4;149,111,113,155;,
  4;156,153,153,156;;
 }
 MeshTextureCoords {
  249;
  0.031250;0.000000;,
  0.062500;0.000000;,
  0.000000;0.000000;,
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
  0.062500;1.000000;,
  0.125000;1.000000;,
  0.218750;1.000000;,
  0.187500;1.000000;,
  0.250000;1.000000;,
  0.343750;1.000000;,
  0.312500;1.000000;,
  0.375000;1.000000;,
  0.406250;1.000000;,
  0.437500;1.000000;,
  0.531250;1.000000;,
  0.500000;1.000000;,
  0.562500;1.000000;,
  0.656250;1.000000;,
  0.625000;1.000000;,
  0.687500;1.000000;,
  0.781250;1.000000;,
  0.750000;1.000000;,
  0.812500;1.000000;,
  0.906250;1.000000;,
  0.875000;1.000000;,
  0.937500;1.000000;,
  0.968750;1.000000;,
  1.000000;1.000000;,
  0.062500;0.000000;,
  0.125000;0.125000;,
  0.000000;0.125000;,
  0.187500;0.000000;,
  0.250000;0.125000;,
  0.437500;0.000000;,
  0.500000;0.125000;,
  0.375000;0.125000;,
  0.562500;0.000000;,
  0.625000;0.125000;,
  0.687500;0.000000;,
  0.750000;0.125000;,
  0.812500;0.000000;,
  0.875000;0.125000;,
  0.937500;0.000000;,
  1.000000;0.125000;,
  0.000000;0.875000;,
  0.125000;0.875000;,
  0.062500;1.000000;,
  0.250000;0.875000;,
  0.187500;1.000000;,
  0.375000;0.875000;,
  0.312500;1.000000;,
  0.500000;0.875000;,
  0.437500;1.000000;,
  0.625000;0.875000;,
  0.562500;1.000000;,
  0.750000;0.875000;,
  0.875000;0.875000;,
  0.812500;1.000000;,
  1.000000;0.875000;,
  0.937500;1.000000;,
  0.062500;0.200000;,
  0.000000;0.200000;,
  0.187500;0.200000;,
  0.125000;0.200000;,
  0.250000;0.200000;,
  0.375000;0.200000;,
  0.312500;0.200000;,
  0.437500;0.200000;,
  0.562500;0.200000;,
  0.500000;0.200000;,
  0.687500;0.200000;,
  0.625000;0.200000;,
  0.812500;0.200000;,
  0.750000;0.200000;,
  0.875000;0.200000;,
  1.000000;0.200000;,
  0.937500;0.200000;,
  0.062500;0.400000;,
  0.000000;0.400000;,
  0.125000;0.400000;,
  0.250000;0.400000;,
  0.187500;0.400000;,
  0.375000;0.400000;,
  0.312500;0.400000;,
  0.500000;0.400000;,
  0.437500;0.400000;,
  0.625000;0.400000;,
  0.562500;0.400000;,
  0.687500;0.400000;,
  0.812500;0.400000;,
  0.750000;0.400000;,
  0.937500;0.400000;,
  0.875000;0.400000;,
  1.000000;0.400000;,
  0.062500;0.600000;,
  0.000000;0.600000;,
  0.125000;0.600000;,
  0.250000;0.600000;,
  0.187500;0.600000;,
  0.375000;0.600000;,
  0.312500;0.600000;,
  0.500000;0.600000;,
  0.437500;0.600000;,
  0.625000;0.600000;,
  0.562500;0.600000;,
  0.687500;0.600000;,
  0.812500;0.600000;,
  0.750000;0.600000;,
  0.937500;0.600000;,
  0.875000;0.600000;,
  0.062500;0.800000;,
  0.000000;0.800000;,
  0.125000;0.800000;,
  0.250000;0.800000;,
  0.187500;0.800000;,
  0.375000;0.800000;,
  0.312500;0.800000;,
  0.500000;0.800000;,
  0.437500;0.800000;,
  0.625000;0.800000;,
  0.562500;0.800000;,
  0.687500;0.800000;,
  0.812500;0.800000;,
  0.750000;0.800000;,
  0.937500;0.800000;,
  0.875000;0.800000;,
  0.000000;1.000000;,
  1.000000;0.800000;,
  0.125000;0.250000;,
  0.000000;0.250000;,
  0.250000;0.250000;,
  0.375000;0.250000;,
  0.500000;0.250000;,
  0.625000;0.250000;,
  0.750000;0.250000;,
  0.875000;0.250000;,
  1.000000;0.250000;,
  0.125000;0.375000;,
  0.000000;0.375000;,
  0.250000;0.375000;,
  0.375000;0.375000;,
  0.500000;0.375000;,
  0.625000;0.375000;,
  0.750000;0.375000;,
  0.875000;0.375000;,
  1.000000;0.375000;,
  0.125000;0.500000;,
  0.000000;0.500000;,
  0.250000;0.500000;,
  0.375000;0.500000;,
  0.500000;0.500000;,
  0.625000;0.500000;,
  0.750000;0.500000;,
  0.875000;0.500000;,
  1.000000;0.500000;,
  0.125000;0.625000;,
  0.000000;0.625000;,
  0.250000;0.625000;,
  0.375000;0.625000;,
  0.500000;0.625000;,
  0.625000;0.625000;,
  0.750000;0.625000;,
  0.875000;0.625000;,
  1.000000;0.625000;,
  0.125000;0.750000;,
  0.000000;0.750000;,
  0.250000;0.750000;,
  0.375000;0.750000;,
  0.500000;0.750000;,
  0.625000;0.750000;,
  0.750000;0.750000;,
  0.875000;0.750000;,
  1.000000;0.750000;,
  0.000000;0.000000;,
  0.000000;0.500000;,
  0.500000;0.500000;,
  0.500000;0.000000;,
  1.000000;0.500000;,
  1.000000;0.000000;,
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
