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
 383;
 0.00000;23.85622;-2.42409;,
 0.92766;23.85622;-2.23957;,
 1.17210;20.05371;-2.82970;,
 0.00000;20.05371;-3.06284;,
 1.71409;23.85622;-1.71409;,
 2.16576;20.05371;-2.16576;,
 2.23957;23.85622;-0.92766;,
 2.82970;20.05371;-1.17210;,
 2.42409;23.85622;0.00000;,
 3.06284;20.05371;0.00000;,
 2.23957;23.85622;0.92766;,
 2.82970;20.05371;1.17210;,
 1.71409;23.85622;1.71409;,
 2.16576;20.05371;2.16576;,
 0.92766;23.85622;2.23957;,
 1.17210;20.05371;2.82970;,
 0.00000;23.85622;2.42409;,
 0.00000;20.05371;3.06284;,
 -0.92766;23.85622;2.23957;,
 -1.17210;20.05371;2.82970;,
 -1.71409;23.85622;1.71409;,
 -2.16576;20.05371;2.16576;,
 -2.23957;23.85622;0.92766;,
 -2.82970;20.05371;1.17210;,
 -2.42409;23.85622;-0.00000;,
 -3.06284;20.05371;-0.00000;,
 -2.23957;23.85622;-0.92766;,
 -2.82970;20.05371;-1.17210;,
 -1.71409;23.85622;-1.71409;,
 -2.16576;20.05371;-2.16576;,
 -0.92766;23.85622;-2.23957;,
 -1.17210;20.05371;-2.82970;,
 0.00000;23.85622;-2.42409;,
 0.00000;20.05371;-3.06284;,
 1.42326;16.04397;-3.43606;,
 0.00000;16.04397;-3.71917;,
 2.62985;16.04397;-2.62985;,
 3.43606;16.04397;-1.42326;,
 3.71917;16.04397;0.00000;,
 3.43606;16.04397;1.42326;,
 2.62985;16.04397;2.62985;,
 1.42326;16.04397;3.43606;,
 0.00000;16.04397;3.71917;,
 -1.42326;16.04397;3.43606;,
 -2.62985;16.04397;2.62985;,
 -3.43606;16.04397;1.42326;,
 -3.71917;16.04397;-0.00000;,
 -3.43606;16.04397;-1.42326;,
 -2.62985;16.04397;-2.62985;,
 -1.42326;16.04397;-3.43606;,
 0.00000;16.04397;-3.71917;,
 1.58966;12.20725;-3.83778;,
 0.00000;12.20725;-4.15398;,
 2.93731;12.20725;-2.93731;,
 3.83778;12.20725;-1.58966;,
 4.15398;12.20725;0.00000;,
 3.83778;12.20725;1.58966;,
 2.93731;12.20725;2.93731;,
 1.58966;12.20725;3.83778;,
 0.00000;12.20725;4.15398;,
 -1.58966;12.20725;3.83778;,
 -2.93731;12.20725;2.93731;,
 -3.83778;12.20725;1.58966;,
 -4.15398;12.20725;-0.00000;,
 -3.83778;12.20725;-1.58966;,
 -2.93731;12.20725;-2.93731;,
 -1.58966;12.20725;-3.83778;,
 0.00000;12.20725;-4.15398;,
 1.69164;8.00000;-4.08399;,
 0.00000;8.00000;-4.42048;,
 3.12575;8.00000;-3.12575;,
 4.08399;8.00000;-1.69164;,
 4.42048;8.00000;0.00000;,
 4.08399;8.00000;1.69165;,
 3.12575;8.00000;3.12575;,
 1.69165;8.00000;4.08399;,
 0.00000;8.00000;4.42048;,
 -1.69164;8.00000;4.08399;,
 -3.12575;8.00000;3.12575;,
 -4.08399;8.00000;1.69165;,
 -4.42048;8.00000;-0.00000;,
 -4.08399;8.00000;-1.69165;,
 -3.12575;8.00000;-3.12575;,
 -1.69164;8.00000;-4.08399;,
 0.00000;8.00000;-4.42048;,
 1.81702;3.90000;-4.38667;,
 0.00000;3.90000;-4.74810;,
 3.35741;3.90000;-3.35741;,
 4.38667;3.90000;-1.81702;,
 4.74810;3.90000;0.00000;,
 4.38667;3.90000;1.81702;,
 3.35741;3.90000;3.35741;,
 1.81702;3.90000;4.38667;,
 0.00000;3.90000;4.74810;,
 -1.81702;3.90000;4.38667;,
 -3.35741;3.90000;3.35741;,
 -4.38667;3.90000;1.81702;,
 -4.74810;3.90000;-0.00000;,
 -4.38667;3.90000;-1.81702;,
 -3.35741;3.90000;-3.35742;,
 -1.81702;3.90000;-4.38667;,
 0.00000;3.90000;-4.74810;,
 1.63149;0.10000;-3.93877;,
 0.00000;0.10000;-4.26330;,
 3.01461;0.10000;-3.01461;,
 3.93877;0.10000;-1.63149;,
 4.26330;0.10000;0.00000;,
 3.93877;0.10000;1.63149;,
 3.01461;0.10000;3.01461;,
 1.63149;0.10000;3.93877;,
 0.00000;0.10000;4.26330;,
 -1.63149;0.10000;3.93877;,
 -3.01461;0.10000;3.01461;,
 -3.93877;0.10000;1.63149;,
 -4.26330;0.10000;-0.00000;,
 -3.93877;0.10000;-1.63149;,
 -3.01461;0.10000;-3.01461;,
 -1.63149;0.10000;-3.93877;,
 0.00000;0.10000;-4.26330;,
 0.00000;24.56544;0.00000;,
 0.00000;24.56544;0.00000;,
 0.00000;24.56544;0.00000;,
 0.00000;24.56544;0.00000;,
 0.00000;24.56544;0.00000;,
 0.00000;24.56544;0.00000;,
 0.00000;24.56544;0.00000;,
 0.00000;24.56544;0.00000;,
 0.00000;24.56544;0.00000;,
 0.00000;24.56544;0.00000;,
 0.00000;24.56544;0.00000;,
 0.00000;24.56544;0.00000;,
 0.00000;24.56544;0.00000;,
 0.00000;24.56544;0.00000;,
 0.00000;24.56544;0.00000;,
 0.00000;24.56544;0.00000;,
 0.00000;0.10000;0.00000;,
 0.00000;0.10000;0.00000;,
 0.00000;0.10000;0.00000;,
 0.00000;0.10000;0.00000;,
 0.00000;0.10000;0.00000;,
 0.00000;0.10000;0.00000;,
 0.00000;0.10000;0.00000;,
 0.00000;0.10000;0.00000;,
 0.00000;0.10000;0.00000;,
 0.00000;0.10000;0.00000;,
 0.00000;0.10000;0.00000;,
 0.00000;0.10000;0.00000;,
 0.00000;0.10000;0.00000;,
 0.00000;0.10000;0.00000;,
 0.00000;0.10000;0.00000;,
 0.00000;0.10000;0.00000;,
 -2.85000;25.68830;-2.85000;,
 -1.06875;25.68830;-2.85000;,
 -3.32500;0.00000;-5.70000;,
 -5.70000;0.00000;-5.70000;,
 -1.06875;25.68830;-2.85000;,
 -0.00000;24.14435;0.00000;,
 -3.32500;0.00000;-3.32500;,
 -3.32500;0.00000;-5.70000;,
 -0.00000;24.14435;0.00000;,
 -2.85000;25.68830;-1.06875;,
 -5.70000;0.00000;-3.32500;,
 -3.32500;0.00000;-3.32500;,
 -2.85000;25.68830;-1.06875;,
 -2.85000;25.68830;-2.85000;,
 -5.70000;0.00000;-5.70000;,
 -5.70000;0.00000;-3.32500;,
 -1.06875;25.68830;-2.85000;,
 -2.85000;25.68830;-2.85000;,
 -5.70000;0.00000;-5.70000;,
 -3.32500;0.00000;-5.70000;,
 2.85000;25.68830;-2.85000;,
 5.70000;0.00000;-5.70000;,
 3.32500;0.00000;-5.70000;,
 1.06875;25.68830;-2.85000;,
 1.06875;25.68830;-2.85000;,
 3.32500;0.00000;-5.70000;,
 3.32500;0.00000;-3.32500;,
 -0.00000;24.14435;0.00000;,
 -0.00000;24.14435;0.00000;,
 3.32500;0.00000;-3.32500;,
 5.70000;0.00000;-3.32500;,
 2.85000;25.68830;-1.06875;,
 2.85000;25.68830;-1.06875;,
 5.70000;0.00000;-3.32500;,
 5.70000;0.00000;-5.70000;,
 2.85000;25.68830;-2.85000;,
 2.85000;25.68830;-2.85000;,
 1.06875;25.68830;-2.85000;,
 5.70000;0.00000;-5.70000;,
 3.32500;0.00000;-5.70000;,
 2.85000;25.68830;2.85000;,
 1.06875;25.68830;2.85000;,
 3.32500;0.00000;5.70000;,
 5.70000;0.00000;5.70000;,
 1.06875;25.68830;2.85000;,
 -0.00000;24.14435;0.00000;,
 3.32500;0.00000;3.32500;,
 3.32500;0.00000;5.70000;,
 -0.00000;24.14435;0.00000;,
 2.85000;25.68830;1.06875;,
 5.70000;0.00000;3.32500;,
 3.32500;0.00000;3.32500;,
 2.85000;25.68830;1.06875;,
 2.85000;25.68830;2.85000;,
 5.70000;0.00000;5.70000;,
 5.70000;0.00000;3.32500;,
 1.06875;25.68830;2.85000;,
 2.85000;25.68830;2.85000;,
 5.70000;0.00000;5.70000;,
 3.32500;0.00000;5.70000;,
 -2.85000;25.68830;2.85000;,
 -5.70000;0.00000;5.70000;,
 -3.32500;0.00000;5.70000;,
 -1.06875;25.68830;2.85000;,
 -1.06875;25.68830;2.85000;,
 -3.32500;0.00000;5.70000;,
 -3.32500;0.00000;3.32500;,
 -0.00000;24.14435;0.00000;,
 -0.00000;24.14435;0.00000;,
 -3.32500;0.00000;3.32500;,
 -5.70000;0.00000;3.32500;,
 -2.85000;25.68830;1.06875;,
 -2.85000;25.68830;1.06875;,
 -5.70000;0.00000;3.32500;,
 -5.70000;0.00000;5.70000;,
 -2.85000;25.68830;2.85000;,
 -2.85000;25.68830;2.85000;,
 -1.06875;25.68830;2.85000;,
 -5.70000;0.00000;5.70000;,
 -3.32500;0.00000;5.70000;,
 0.00000;13.56365;-7.06800;,
 2.70481;13.56365;-6.52998;,
 2.84716;11.70365;-6.87366;,
 0.00000;11.70365;-7.44000;,
 4.99783;13.56365;-4.99783;,
 5.26087;11.70365;-5.26087;,
 6.52998;13.56365;-2.70481;,
 6.87366;11.70365;-2.84716;,
 7.06800;13.56365;0.00000;,
 7.44000;11.70365;0.00000;,
 6.52998;13.56365;2.70481;,
 6.87366;11.70365;2.84717;,
 4.99783;13.56365;4.99783;,
 5.26087;11.70365;5.26087;,
 2.70481;13.56365;6.52998;,
 2.84717;11.70365;6.87366;,
 0.00000;13.56365;7.06800;,
 0.00000;11.70365;7.44000;,
 -2.70481;13.56365;6.52998;,
 -2.84716;11.70365;6.87366;,
 -4.99783;13.56365;4.99783;,
 -5.26087;11.70365;5.26088;,
 -6.52998;13.56365;2.70481;,
 -6.87366;11.70365;2.84717;,
 -7.06800;13.56365;-0.00000;,
 -7.44000;11.70365;-0.00000;,
 -6.52998;13.56365;-2.70481;,
 -6.87366;11.70365;-2.84717;,
 -4.99783;13.56365;-4.99783;,
 -5.26087;11.70365;-5.26088;,
 -2.70480;13.56365;-6.52998;,
 -2.84716;11.70365;-6.87366;,
 0.00000;13.56365;-7.06800;,
 0.00000;11.70365;-7.44000;,
 0.00000;13.56365;0.00000;,
 0.00000;13.56365;0.00000;,
 0.00000;13.56365;0.00000;,
 0.00000;13.56365;0.00000;,
 0.00000;13.56365;0.00000;,
 0.00000;13.56365;0.00000;,
 0.00000;13.56365;0.00000;,
 0.00000;13.56365;0.00000;,
 0.00000;13.56365;0.00000;,
 0.00000;13.56365;0.00000;,
 0.00000;13.56365;0.00000;,
 0.00000;13.56365;0.00000;,
 0.00000;13.56365;0.00000;,
 0.00000;13.56365;0.00000;,
 0.00000;13.56365;0.00000;,
 0.00000;13.56365;0.00000;,
 0.00000;11.70365;0.00000;,
 0.00000;11.70365;0.00000;,
 0.00000;11.70365;0.00000;,
 0.00000;11.70365;0.00000;,
 0.00000;11.70365;0.00000;,
 0.00000;11.70365;0.00000;,
 0.00000;11.70365;0.00000;,
 0.00000;11.70365;0.00000;,
 0.00000;11.70365;0.00000;,
 0.00000;11.70365;0.00000;,
 0.00000;11.70365;0.00000;,
 0.00000;11.70365;0.00000;,
 0.00000;11.70365;0.00000;,
 0.00000;11.70365;0.00000;,
 0.00000;11.70365;0.00000;,
 0.00000;11.70365;0.00000;,
 0.00000;17.44699;-4.68000;,
 1.79096;17.44699;-4.32376;,
 1.89170;16.14611;-4.56697;,
 0.00000;16.14611;-4.94325;,
 3.30926;17.44699;-3.30926;,
 3.49541;16.14611;-3.49541;,
 4.32376;17.44699;-1.79096;,
 4.56697;16.14611;-1.89170;,
 4.68000;17.44699;0.00000;,
 4.94325;16.14611;0.00000;,
 4.32376;17.44699;1.79096;,
 4.56697;16.14611;1.89170;,
 3.30926;17.44699;3.30926;,
 3.49541;16.14611;3.49541;,
 1.79096;17.44699;4.32376;,
 1.89170;16.14611;4.56697;,
 0.00000;17.44699;4.68000;,
 0.00000;16.14611;4.94325;,
 -1.79096;17.44699;4.32376;,
 -1.89170;16.14611;4.56697;,
 -3.30926;17.44699;3.30926;,
 -3.49540;16.14611;3.49541;,
 -4.32376;17.44699;1.79096;,
 -4.56697;16.14611;1.89170;,
 -4.68000;17.44699;-0.00000;,
 -4.94325;16.14611;-0.00000;,
 -4.32376;17.44699;-1.79096;,
 -4.56697;16.14611;-1.89170;,
 -3.30926;17.44699;-3.30926;,
 -3.49540;16.14611;-3.49541;,
 -1.79096;17.44699;-4.32376;,
 -1.89170;16.14611;-4.56697;,
 0.00000;17.44699;-4.68000;,
 0.00000;16.14611;-4.94325;,
 0.00000;17.44699;0.00000;,
 0.00000;17.44699;0.00000;,
 0.00000;17.44699;0.00000;,
 0.00000;17.44699;0.00000;,
 0.00000;17.44699;0.00000;,
 0.00000;17.44699;0.00000;,
 0.00000;17.44699;0.00000;,
 0.00000;17.44699;0.00000;,
 0.00000;17.44699;0.00000;,
 0.00000;17.44699;0.00000;,
 0.00000;17.44699;0.00000;,
 0.00000;17.44699;0.00000;,
 0.00000;17.44699;0.00000;,
 0.00000;17.44699;0.00000;,
 0.00000;17.44699;0.00000;,
 0.00000;17.44699;0.00000;,
 0.00000;16.14611;0.00000;,
 0.00000;16.14611;0.00000;,
 0.00000;16.14611;0.00000;,
 0.00000;16.14611;0.00000;,
 0.00000;16.14611;0.00000;,
 0.00000;16.14611;0.00000;,
 0.00000;16.14611;0.00000;,
 0.00000;16.14611;0.00000;,
 0.00000;16.14611;0.00000;,
 0.00000;16.14611;0.00000;,
 0.00000;16.14611;0.00000;,
 0.00000;16.14611;0.00000;,
 0.00000;16.14611;0.00000;,
 0.00000;16.14611;0.00000;,
 0.00000;16.14611;0.00000;,
 0.00000;16.14611;0.00000;,
 -4.29153;26.86013;-4.29153;,
 4.29153;26.86013;-4.29153;,
 3.09849;24.06078;-3.09849;,
 -3.09849;24.06078;-3.09849;,
 4.29153;26.86013;-4.29153;,
 4.29153;26.86013;4.29153;,
 3.09849;24.06078;3.09849;,
 3.09849;24.06078;-3.09849;,
 4.29153;26.86013;4.29153;,
 -4.29153;26.86013;4.29153;,
 -3.09849;24.06078;3.09849;,
 3.09849;24.06078;3.09849;,
 -4.29153;26.86013;4.29153;,
 -4.29153;26.86013;-4.29153;,
 -3.09849;24.06078;-3.09849;,
 -3.09849;24.06078;3.09849;,
 4.29153;26.86013;-4.29153;,
 -4.29153;26.86013;-4.29153;,
 -3.09849;24.06078;-3.09849;,
 3.09849;24.06078;-3.09849;;
 
 254;
 4;0,1,2,3;,
 4;1,4,5,2;,
 4;4,6,7,5;,
 4;6,8,9,7;,
 4;8,10,11,9;,
 4;10,12,13,11;,
 4;12,14,15,13;,
 4;14,16,17,15;,
 4;16,18,19,17;,
 4;18,20,21,19;,
 4;20,22,23,21;,
 4;22,24,25,23;,
 4;24,26,27,25;,
 4;26,28,29,27;,
 4;28,30,31,29;,
 4;30,32,33,31;,
 4;3,2,34,35;,
 4;2,5,36,34;,
 4;5,7,37,36;,
 4;7,9,38,37;,
 4;9,11,39,38;,
 4;11,13,40,39;,
 4;13,15,41,40;,
 4;15,17,42,41;,
 4;17,19,43,42;,
 4;19,21,44,43;,
 4;21,23,45,44;,
 4;23,25,46,45;,
 4;25,27,47,46;,
 4;27,29,48,47;,
 4;29,31,49,48;,
 4;31,33,50,49;,
 4;35,34,51,52;,
 4;34,36,53,51;,
 4;36,37,54,53;,
 4;37,38,55,54;,
 4;38,39,56,55;,
 4;39,40,57,56;,
 4;40,41,58,57;,
 4;41,42,59,58;,
 4;42,43,60,59;,
 4;43,44,61,60;,
 4;44,45,62,61;,
 4;45,46,63,62;,
 4;46,47,64,63;,
 4;47,48,65,64;,
 4;48,49,66,65;,
 4;49,50,67,66;,
 4;52,51,68,69;,
 4;51,53,70,68;,
 4;53,54,71,70;,
 4;54,55,72,71;,
 4;55,56,73,72;,
 4;56,57,74,73;,
 4;57,58,75,74;,
 4;58,59,76,75;,
 4;59,60,77,76;,
 4;60,61,78,77;,
 4;61,62,79,78;,
 4;62,63,80,79;,
 4;63,64,81,80;,
 4;64,65,82,81;,
 4;65,66,83,82;,
 4;66,67,84,83;,
 4;69,68,85,86;,
 4;68,70,87,85;,
 4;70,71,88,87;,
 4;71,72,89,88;,
 4;72,73,90,89;,
 4;73,74,91,90;,
 4;74,75,92,91;,
 4;75,76,93,92;,
 4;76,77,94,93;,
 4;77,78,95,94;,
 4;78,79,96,95;,
 4;79,80,97,96;,
 4;80,81,98,97;,
 4;81,82,99,98;,
 4;82,83,100,99;,
 4;83,84,101,100;,
 4;86,85,102,103;,
 4;85,87,104,102;,
 4;87,88,105,104;,
 4;88,89,106,105;,
 4;89,90,107,106;,
 4;90,91,108,107;,
 4;91,92,109,108;,
 4;92,93,110,109;,
 4;93,94,111,110;,
 4;94,95,112,111;,
 4;95,96,113,112;,
 4;96,97,114,113;,
 4;97,98,115,114;,
 4;98,99,116,115;,
 4;99,100,117,116;,
 4;100,101,118,117;,
 3;119,1,0;,
 3;120,4,1;,
 3;121,6,4;,
 3;122,8,6;,
 3;123,10,8;,
 3;124,12,10;,
 3;125,14,12;,
 3;126,16,14;,
 3;127,18,16;,
 3;128,20,18;,
 3;129,22,20;,
 3;130,24,22;,
 3;131,26,24;,
 3;132,28,26;,
 3;133,30,28;,
 3;134,32,30;,
 3;135,103,102;,
 3;136,102,104;,
 3;137,104,105;,
 3;138,105,106;,
 3;139,106,107;,
 3;140,107,108;,
 3;141,108,109;,
 3;142,109,110;,
 3;143,110,111;,
 3;144,111,112;,
 3;145,112,113;,
 3;146,113,114;,
 3;147,114,115;,
 3;148,115,116;,
 3;149,116,117;,
 3;150,117,118;,
 4;151,152,153,154;,
 4;155,156,157,158;,
 4;159,160,161,162;,
 4;163,164,165,166;,
 4;163,156,167,168;,
 4;169,170,157,166;,
 4;171,172,173,174;,
 4;175,176,177,178;,
 4;179,180,181,182;,
 4;183,184,185,186;,
 4;183,187,188,178;,
 4;189,184,177,190;,
 4;191,192,193,194;,
 4;195,196,197,198;,
 4;199,200,201,202;,
 4;203,204,205,206;,
 4;203,196,207,208;,
 4;209,210,197,206;,
 4;211,212,213,214;,
 4;215,216,217,218;,
 4;219,220,221,222;,
 4;223,224,225,226;,
 4;223,227,228,218;,
 4;229,224,217,230;,
 4;231,232,233,234;,
 4;232,235,236,233;,
 4;235,237,238,236;,
 4;237,239,240,238;,
 4;239,241,242,240;,
 4;241,243,244,242;,
 4;243,245,246,244;,
 4;245,247,248,246;,
 4;247,249,250,248;,
 4;249,251,252,250;,
 4;251,253,254,252;,
 4;253,255,256,254;,
 4;255,257,258,256;,
 4;257,259,260,258;,
 4;259,261,262,260;,
 4;261,263,264,262;,
 3;265,232,231;,
 3;266,235,232;,
 3;267,237,235;,
 3;268,239,237;,
 3;269,241,239;,
 3;270,243,241;,
 3;271,245,243;,
 3;272,247,245;,
 3;273,249,247;,
 3;274,251,249;,
 3;275,253,251;,
 3;276,255,253;,
 3;277,257,255;,
 3;278,259,257;,
 3;279,261,259;,
 3;280,263,261;,
 3;281,234,233;,
 3;282,233,236;,
 3;283,236,238;,
 3;284,238,240;,
 3;285,240,242;,
 3;286,242,244;,
 3;287,244,246;,
 3;288,246,248;,
 3;289,248,250;,
 3;290,250,252;,
 3;291,252,254;,
 3;292,254,256;,
 3;293,256,258;,
 3;294,258,260;,
 3;295,260,262;,
 3;296,262,264;,
 4;297,298,299,300;,
 4;298,301,302,299;,
 4;301,303,304,302;,
 4;303,305,306,304;,
 4;305,307,308,306;,
 4;307,309,310,308;,
 4;309,311,312,310;,
 4;311,313,314,312;,
 4;313,315,316,314;,
 4;315,317,318,316;,
 4;317,319,320,318;,
 4;319,321,322,320;,
 4;321,323,324,322;,
 4;323,325,326,324;,
 4;325,327,328,326;,
 4;327,329,330,328;,
 3;331,298,297;,
 3;332,301,298;,
 3;333,303,301;,
 3;334,305,303;,
 3;335,307,305;,
 3;336,309,307;,
 3;337,311,309;,
 3;338,313,311;,
 3;339,315,313;,
 3;340,317,315;,
 3;341,319,317;,
 3;342,321,319;,
 3;343,323,321;,
 3;344,325,323;,
 3;345,327,325;,
 3;346,329,327;,
 3;347,300,299;,
 3;348,299,302;,
 3;349,302,304;,
 3;350,304,306;,
 3;351,306,308;,
 3;352,308,310;,
 3;353,310,312;,
 3;354,312,314;,
 3;355,314,316;,
 3;356,316,318;,
 3;357,318,320;,
 3;358,320,322;,
 3;359,322,324;,
 3;360,324,326;,
 3;361,326,328;,
 3;362,328,330;,
 4;363,364,365,366;,
 4;367,368,369,370;,
 4;371,372,373,374;,
 4;375,376,377,378;,
 4;375,368,379,380;,
 4;381,382,369,378;;
 
 MeshMaterialList {
  4;
  254;
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
  1,
  2,
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
  1,
  1,
  1,
  1,
  1,
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
   0.511373;0.511373;0.511373;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.257255;0.652549;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.112941;0.555294;0.737255;1.000000;;
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
 }
 MeshNormals {
  194;
  0.000000;1.000000;-0.000000;,
  0.000000;0.165660;-0.986183;,
  0.377396;0.165660;-0.911114;,
  0.697337;0.165660;-0.697337;,
  0.911114;0.165660;-0.377396;,
  0.986183;0.165660;0.000000;,
  0.911114;0.165660;0.377396;,
  0.697337;0.165660;0.697337;,
  0.377396;0.165660;0.911114;,
  0.000000;0.165660;0.986183;,
  -0.377396;0.165660;0.911114;,
  -0.697336;0.165660;0.697337;,
  -0.911114;0.165660;0.377396;,
  -0.986183;0.165660;0.000000;,
  -0.911114;0.165660;-0.377396;,
  -0.697336;0.165660;-0.697337;,
  -0.377396;0.165660;-0.911114;,
  0.000000;0.163597;-0.986527;,
  0.377528;0.163597;-0.911432;,
  0.697580;0.163597;-0.697580;,
  0.911432;0.163597;-0.377528;,
  0.986527;0.163597;0.000000;,
  0.911432;0.163597;0.377528;,
  0.697580;0.163597;0.697580;,
  0.377528;0.163597;0.911432;,
  0.000000;0.163597;0.986527;,
  -0.377528;0.163597;0.911432;,
  -0.697580;0.163597;0.697580;,
  -0.911432;0.163597;0.377528;,
  -0.986527;0.163597;0.000000;,
  -0.911432;0.163597;-0.377528;,
  -0.697580;0.163597;-0.697580;,
  -0.377527;0.163597;-0.911432;,
  0.000000;0.137116;-0.990555;,
  0.379069;0.137116;-0.915153;,
  0.700428;0.137116;-0.700428;,
  0.915153;0.137116;-0.379069;,
  0.990555;0.137116;0.000000;,
  0.915153;0.137116;0.379069;,
  0.700428;0.137116;0.700428;,
  0.379069;0.137116;0.915154;,
  0.000000;0.137116;0.990555;,
  -0.379069;0.137116;0.915154;,
  -0.700428;0.137116;0.700428;,
  -0.915153;0.137116;0.379069;,
  -0.990555;0.137116;0.000000;,
  -0.915153;0.137116;-0.379069;,
  -0.700428;0.137116;-0.700428;,
  -0.379069;0.137116;-0.915154;,
  0.000000;0.087942;-0.996126;,
  0.381201;0.087942;-0.920300;,
  0.704367;0.087942;-0.704367;,
  0.920300;0.087942;-0.381201;,
  0.996126;0.087942;0.000000;,
  0.920300;0.087942;0.381201;,
  0.704367;0.087942;0.704367;,
  0.381201;0.087942;0.920300;,
  0.000000;0.087942;0.996126;,
  -0.381201;0.087942;0.920300;,
  -0.704367;0.087942;0.704367;,
  -0.920300;0.087942;0.381201;,
  -0.996126;0.087942;0.000000;,
  -0.920300;0.087942;-0.381201;,
  -0.704367;0.087942;-0.704367;,
  -0.381201;0.087942;-0.920300;,
  0.000000;0.071437;-0.997445;,
  0.381706;0.071437;-0.921519;,
  0.705300;0.071437;-0.705300;,
  0.921519;0.071437;-0.381706;,
  0.997445;0.071437;0.000000;,
  0.921519;0.071437;0.381706;,
  0.705300;0.071437;0.705300;,
  0.381706;0.071437;0.921519;,
  0.000000;0.071437;0.997445;,
  -0.381706;0.071437;0.921519;,
  -0.705300;0.071437;0.705300;,
  -0.921519;0.071437;0.381706;,
  -0.997445;0.071437;0.000000;,
  -0.921519;0.071437;-0.381706;,
  -0.705300;0.071437;-0.705301;,
  -0.381705;0.071437;-0.921519;,
  0.000000;-0.023586;-0.999722;,
  0.382577;-0.023586;-0.923623;,
  0.706910;-0.023586;-0.706910;,
  0.923622;-0.023586;-0.382577;,
  0.999722;-0.023586;0.000000;,
  0.923623;-0.023586;0.382577;,
  0.706910;-0.023586;0.706910;,
  0.382577;-0.023586;0.923622;,
  0.000000;-0.023586;0.999722;,
  -0.382577;-0.023586;0.923623;,
  -0.706910;-0.023586;0.706910;,
  -0.923622;-0.023586;0.382577;,
  -0.999722;-0.023586;0.000000;,
  -0.923622;-0.023586;-0.382577;,
  -0.706910;-0.023586;-0.706910;,
  -0.382577;-0.023586;-0.923623;,
  0.000000;-0.126554;-0.991960;,
  0.379607;-0.126554;-0.916451;,
  0.701421;-0.126554;-0.701421;,
  0.916451;-0.126554;-0.379607;,
  0.991960;-0.126554;0.000000;,
  0.916451;-0.126554;0.379607;,
  0.701421;-0.126554;0.701421;,
  0.379607;-0.126554;0.916451;,
  0.000000;-0.126554;0.991960;,
  -0.379606;-0.126554;0.916451;,
  -0.701421;-0.126554;0.701422;,
  -0.916451;-0.126554;0.379607;,
  -0.991960;-0.126554;0.000000;,
  -0.916451;-0.126554;-0.379607;,
  -0.701421;-0.126554;-0.701422;,
  -0.379606;-0.126554;-0.916451;,
  0.000000;-1.000000;-0.000000;,
  0.107458;0.959766;-0.259428;,
  0.000000;0.959766;-0.280802;,
  0.198557;0.959766;-0.198557;,
  0.259428;0.959766;-0.107458;,
  0.280802;0.959766;0.000000;,
  0.259428;0.959766;0.107458;,
  0.198557;0.959766;0.198557;,
  0.107458;0.959766;0.259428;,
  0.000000;0.959766;0.280802;,
  -0.107458;0.959766;0.259428;,
  -0.198557;0.959766;0.198557;,
  -0.259428;0.959766;0.107459;,
  -0.280802;0.959766;0.000000;,
  -0.259428;0.959766;-0.107459;,
  -0.198557;0.959766;-0.198557;,
  -0.107458;0.959766;-0.259428;,
  0.000000;0.110269;-0.993902;,
  0.977914;-0.090156;-0.188561;,
  -0.188562;-0.090156;0.977914;,
  0.000000;0.110269;-0.993902;,
  -0.977914;-0.090156;-0.188562;,
  0.188562;-0.090156;0.977914;,
  -0.993902;0.110269;0.000000;,
  0.177797;0.967872;0.177797;,
  0.000000;-1.000000;-0.000000;,
  0.993902;0.110269;0.000000;,
  -0.177797;0.967872;0.177797;,
  0.000000;0.110269;0.993902;,
  -0.977914;-0.090156;0.188562;,
  0.188561;-0.090156;-0.977914;,
  0.000000;0.110269;0.993902;,
  0.977914;-0.090156;0.188562;,
  -0.188562;-0.090156;-0.977914;,
  0.993902;0.110269;0.000000;,
  -0.177797;0.967872;-0.177797;,
  0.000000;-1.000000;0.000000;,
  -0.993902;0.110269;0.000000;,
  0.177797;0.967872;-0.177797;,
  0.000000;1.000000;0.000000;,
  0.000000;0.196116;-0.980581;,
  0.375252;0.196116;-0.905938;,
  0.693375;0.196116;-0.693375;,
  0.905938;0.196116;-0.375252;,
  0.980581;0.196116;0.000000;,
  0.905938;0.196116;0.375252;,
  0.693375;0.196116;0.693375;,
  0.375252;0.196116;0.905938;,
  0.000000;0.196116;0.980581;,
  -0.375252;0.196116;0.905939;,
  -0.693375;0.196116;0.693375;,
  -0.905938;0.196116;0.375252;,
  -0.980581;0.196116;0.000000;,
  -0.905938;0.196116;-0.375252;,
  -0.693375;0.196116;-0.693375;,
  -0.375252;0.196116;-0.905939;,
  0.000000;-1.000000;-0.000000;,
  0.000000;1.000000;0.000000;,
  0.000000;0.198343;-0.980133;,
  0.375081;0.198343;-0.905525;,
  0.693059;0.198343;-0.693058;,
  0.905525;0.198343;-0.375081;,
  0.980133;0.198343;0.000000;,
  0.905525;0.198343;0.375081;,
  0.693059;0.198343;0.693059;,
  0.375081;0.198343;0.905525;,
  0.000000;0.198343;0.980133;,
  -0.375080;0.198343;0.905525;,
  -0.693058;0.198343;0.693059;,
  -0.905525;0.198343;0.375081;,
  -0.980133;0.198343;0.000000;,
  -0.905524;0.198343;-0.375081;,
  -0.693058;0.198343;-0.693059;,
  -0.375080;0.198343;-0.905525;,
  0.000000;-1.000000;-0.000000;,
  0.000000;-0.392065;-0.919937;,
  0.919937;-0.392065;-0.000000;,
  0.000000;-0.392065;0.919937;,
  -0.919937;-0.392065;0.000000;,
  0.000000;1.000000;0.000000;,
  0.000000;-1.000000;-0.000000;;
  254;
  4;1,2,18,17;,
  4;2,3,19,18;,
  4;3,4,20,19;,
  4;4,5,21,20;,
  4;5,6,22,21;,
  4;6,7,23,22;,
  4;7,8,24,23;,
  4;8,9,25,24;,
  4;9,10,26,25;,
  4;10,11,27,26;,
  4;11,12,28,27;,
  4;12,13,29,28;,
  4;13,14,30,29;,
  4;14,15,31,30;,
  4;15,16,32,31;,
  4;16,1,17,32;,
  4;17,18,34,33;,
  4;18,19,35,34;,
  4;19,20,36,35;,
  4;20,21,37,36;,
  4;21,22,38,37;,
  4;22,23,39,38;,
  4;23,24,40,39;,
  4;24,25,41,40;,
  4;25,26,42,41;,
  4;26,27,43,42;,
  4;27,28,44,43;,
  4;28,29,45,44;,
  4;29,30,46,45;,
  4;30,31,47,46;,
  4;31,32,48,47;,
  4;32,17,33,48;,
  4;33,34,50,49;,
  4;34,35,51,50;,
  4;35,36,52,51;,
  4;36,37,53,52;,
  4;37,38,54,53;,
  4;38,39,55,54;,
  4;39,40,56,55;,
  4;40,41,57,56;,
  4;41,42,58,57;,
  4;42,43,59,58;,
  4;43,44,60,59;,
  4;44,45,61,60;,
  4;45,46,62,61;,
  4;46,47,63,62;,
  4;47,48,64,63;,
  4;48,33,49,64;,
  4;49,50,66,65;,
  4;50,51,67,66;,
  4;51,52,68,67;,
  4;52,53,69,68;,
  4;53,54,70,69;,
  4;54,55,71,70;,
  4;55,56,72,71;,
  4;56,57,73,72;,
  4;57,58,74,73;,
  4;58,59,75,74;,
  4;59,60,76,75;,
  4;60,61,77,76;,
  4;61,62,78,77;,
  4;62,63,79,78;,
  4;63,64,80,79;,
  4;64,49,65,80;,
  4;65,66,82,81;,
  4;66,67,83,82;,
  4;67,68,84,83;,
  4;68,69,85,84;,
  4;69,70,86,85;,
  4;70,71,87,86;,
  4;71,72,88,87;,
  4;72,73,89,88;,
  4;73,74,90,89;,
  4;74,75,91,90;,
  4;75,76,92,91;,
  4;76,77,93,92;,
  4;77,78,94,93;,
  4;78,79,95,94;,
  4;79,80,96,95;,
  4;80,65,81,96;,
  4;81,82,98,97;,
  4;82,83,99,98;,
  4;83,84,100,99;,
  4;84,85,101,100;,
  4;85,86,102,101;,
  4;86,87,103,102;,
  4;87,88,104,103;,
  4;88,89,105,104;,
  4;89,90,106,105;,
  4;90,91,107,106;,
  4;91,92,108,107;,
  4;92,93,109,108;,
  4;93,94,110,109;,
  4;94,95,111,110;,
  4;95,96,112,111;,
  4;96,81,97,112;,
  3;0,114,115;,
  3;0,116,114;,
  3;0,117,116;,
  3;0,118,117;,
  3;0,119,118;,
  3;0,120,119;,
  3;0,121,120;,
  3;0,122,121;,
  3;0,123,122;,
  3;0,124,123;,
  3;0,125,124;,
  3;0,126,125;,
  3;0,127,126;,
  3;0,128,127;,
  3;0,129,128;,
  3;0,115,129;,
  3;113,113,113;,
  3;113,113,113;,
  3;113,113,113;,
  3;113,113,113;,
  3;113,113,113;,
  3;113,113,113;,
  3;113,113,113;,
  3;113,113,113;,
  3;113,113,113;,
  3;113,113,113;,
  3;113,113,113;,
  3;113,113,113;,
  3;113,113,113;,
  3;113,113,113;,
  3;113,113,113;,
  3;113,113,113;,
  4;130,130,130,130;,
  4;131,131,131,131;,
  4;132,132,132,132;,
  4;136,136,136,136;,
  4;137,137,137,137;,
  4;138,138,138,138;,
  4;133,133,133,133;,
  4;134,134,134,134;,
  4;135,135,135,135;,
  4;139,139,139,139;,
  4;140,140,140,140;,
  4;138,138,138,138;,
  4;141,141,141,141;,
  4;142,142,142,142;,
  4;143,143,143,143;,
  4;147,147,147,147;,
  4;148,148,148,148;,
  4;149,149,149,149;,
  4;144,144,144,144;,
  4;145,145,145,145;,
  4;146,146,146,146;,
  4;150,150,150,150;,
  4;151,151,151,151;,
  4;149,149,149,149;,
  4;153,154,154,153;,
  4;154,155,155,154;,
  4;155,156,156,155;,
  4;156,157,157,156;,
  4;157,158,158,157;,
  4;158,159,159,158;,
  4;159,160,160,159;,
  4;160,161,161,160;,
  4;161,162,162,161;,
  4;162,163,163,162;,
  4;163,164,164,163;,
  4;164,165,165,164;,
  4;165,166,166,165;,
  4;166,167,167,166;,
  4;167,168,168,167;,
  4;168,153,153,168;,
  3;152,152,152;,
  3;152,152,152;,
  3;152,152,152;,
  3;152,152,152;,
  3;152,152,152;,
  3;152,152,152;,
  3;152,152,152;,
  3;152,152,152;,
  3;152,152,152;,
  3;152,152,152;,
  3;152,152,152;,
  3;152,152,152;,
  3;152,152,152;,
  3;152,152,152;,
  3;152,152,152;,
  3;152,152,152;,
  3;169,169,169;,
  3;169,169,169;,
  3;169,169,169;,
  3;169,169,169;,
  3;169,169,169;,
  3;169,169,169;,
  3;169,169,169;,
  3;169,169,169;,
  3;169,169,169;,
  3;169,169,169;,
  3;169,169,169;,
  3;169,169,169;,
  3;169,169,169;,
  3;169,169,169;,
  3;169,169,169;,
  3;169,169,169;,
  4;171,172,172,171;,
  4;172,173,173,172;,
  4;173,174,174,173;,
  4;174,175,175,174;,
  4;175,176,176,175;,
  4;176,177,177,176;,
  4;177,178,178,177;,
  4;178,179,179,178;,
  4;179,180,180,179;,
  4;180,181,181,180;,
  4;181,182,182,181;,
  4;182,183,183,182;,
  4;183,184,184,183;,
  4;184,185,185,184;,
  4;185,186,186,185;,
  4;186,171,171,186;,
  3;170,170,170;,
  3;170,170,170;,
  3;170,170,170;,
  3;170,170,170;,
  3;170,170,170;,
  3;170,170,170;,
  3;170,170,170;,
  3;170,170,170;,
  3;170,170,170;,
  3;170,170,170;,
  3;170,170,170;,
  3;170,170,170;,
  3;170,170,170;,
  3;170,170,170;,
  3;170,170,170;,
  3;170,170,170;,
  3;187,187,187;,
  3;187,187,187;,
  3;187,187,187;,
  3;187,187,187;,
  3;187,187,187;,
  3;187,187,187;,
  3;187,187,187;,
  3;187,187,187;,
  3;187,187,187;,
  3;187,187,187;,
  3;187,187,187;,
  3;187,187,187;,
  3;187,187,187;,
  3;187,187,187;,
  3;187,187,187;,
  3;187,187,187;,
  4;188,188,188,188;,
  4;189,189,189,189;,
  4;190,190,190,190;,
  4;191,191,191,191;,
  4;192,192,192,192;,
  4;193,193,193,193;;
 }
 MeshTextureCoords {
  383;
  0.000000;0.000000;,
  0.062500;0.000000;,
  0.062500;0.166667;,
  0.000000;0.166667;,
  0.125000;0.000000;,
  0.125000;0.166667;,
  0.187500;0.000000;,
  0.187500;0.166667;,
  0.250000;0.000000;,
  0.250000;0.166667;,
  0.312500;0.000000;,
  0.312500;0.166667;,
  0.375000;0.000000;,
  0.375000;0.166667;,
  0.437500;0.000000;,
  0.437500;0.166667;,
  0.500000;0.000000;,
  0.500000;0.166667;,
  0.562500;0.000000;,
  0.562500;0.166667;,
  0.625000;0.000000;,
  0.625000;0.166667;,
  0.687500;0.000000;,
  0.687500;0.166667;,
  0.750000;0.000000;,
  0.750000;0.166667;,
  0.812500;0.000000;,
  0.812500;0.166667;,
  0.875000;0.000000;,
  0.875000;0.166667;,
  0.937500;0.000000;,
  0.937500;0.166667;,
  1.000000;0.000000;,
  1.000000;0.166667;,
  0.062500;0.333333;,
  0.000000;0.333333;,
  0.125000;0.333333;,
  0.187500;0.333333;,
  0.250000;0.333333;,
  0.312500;0.333333;,
  0.375000;0.333333;,
  0.437500;0.333333;,
  0.500000;0.333333;,
  0.562500;0.333333;,
  0.625000;0.333333;,
  0.687500;0.333333;,
  0.750000;0.333333;,
  0.812500;0.333333;,
  0.875000;0.333333;,
  0.937500;0.333333;,
  1.000000;0.333333;,
  0.062500;0.500000;,
  0.000000;0.500000;,
  0.125000;0.500000;,
  0.187500;0.500000;,
  0.250000;0.500000;,
  0.312500;0.500000;,
  0.375000;0.500000;,
  0.437500;0.500000;,
  0.500000;0.500000;,
  0.562500;0.500000;,
  0.625000;0.500000;,
  0.687500;0.500000;,
  0.750000;0.500000;,
  0.812500;0.500000;,
  0.875000;0.500000;,
  0.937500;0.500000;,
  1.000000;0.500000;,
  0.062500;0.666667;,
  0.000000;0.666667;,
  0.125000;0.666667;,
  0.187500;0.666667;,
  0.250000;0.666667;,
  0.312500;0.666667;,
  0.375000;0.666667;,
  0.437500;0.666667;,
  0.500000;0.666667;,
  0.562500;0.666667;,
  0.625000;0.666667;,
  0.687500;0.666667;,
  0.750000;0.666667;,
  0.812500;0.666667;,
  0.875000;0.666667;,
  0.937500;0.666667;,
  1.000000;0.666667;,
  0.062500;0.833333;,
  0.000000;0.833333;,
  0.125000;0.833333;,
  0.187500;0.833333;,
  0.250000;0.833333;,
  0.312500;0.833333;,
  0.375000;0.833333;,
  0.437500;0.833333;,
  0.500000;0.833333;,
  0.562500;0.833333;,
  0.625000;0.833333;,
  0.687500;0.833333;,
  0.750000;0.833333;,
  0.812500;0.833333;,
  0.875000;0.833333;,
  0.937500;0.833333;,
  1.000000;0.833333;,
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
  1.000000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
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
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
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
  1.000000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
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
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
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
  0.968750;1.000000;,
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
  1.000000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;;
 }
}
