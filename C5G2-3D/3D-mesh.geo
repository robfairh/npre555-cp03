Geometry.CopyMeshingMethod = 1;

h = 1;
pt = 21.42;

p = 1; l = 1; cl = 1; s = 1;

Y = 0*pt;
Point(p) = { 0*pt, Y, 0, h}; p += 1;
Point(p) = { 1*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = { 2*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = { 3*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;

Y = 1*pt;
Point(p) = { 0*pt, Y, 0, h}; p += 1;
Point(p) = { 1*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = { 2*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = { 3*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;

Y = 2*pt;
Point(p) = { 0*pt, Y, 0, h}; p += 1;
Point(p) = { 1*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = { 2*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = { 3*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;

Y = 3*pt;
Point(p) = { 0*pt, Y, 0, h}; p += 1;
Point(p) = { 1*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = { 2*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = { 3*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;

Line(13) = {1, 5};
Line(14) = {5, 9};
Line(15) = {9, 13};
Line(16) = {2, 6};
Line(17) = {6, 10};
Line(18) = {10, 14};
Line(19) = {3, 7};
Line(20) = {7, 11};
Line(21) = {11, 15};
Line(22) = {4, 8};
Line(23) = {8, 12};
Line(24) = {12, 16};

Curve Loop(1) = {1, 16, -4, -13};
Plane Surface(1) = {1};
Curve Loop(2) = {2, 19, -5, -16};
Plane Surface(2) = {2};
Curve Loop(3) = {3, 22, -6, -19};
Plane Surface(3) = {3};
Curve Loop(4) = {4, 17, -7, -14};
Plane Surface(4) = {4};
Curve Loop(5) = {5, 20, -8, -17};
Plane Surface(5) = {5};
Curve Loop(6) = {6, 23, -9, -20};
Plane Surface(6) = {6};
Curve Loop(7) = {7, 18, -10, -15};
Plane Surface(7) = {7};
Curve Loop(8) = {8, 21, -11, -18};
Plane Surface(8) = {8};
Curve Loop(9) = {9, 24, -12, -21};
Plane Surface(9) = {9};

Transfinite Line{1, 4, 7, 10} = 15;
Transfinite Line{2, 5, 8, 11} = 15;
Transfinite Line{3, 6, 9, 12} = 15;

Transfinite Line{13, 16, 19, 22} = 15;
Transfinite Line{14, 17, 20, 23} = 15;
Transfinite Line{15, 18, 21, 24} = 15;

Transfinite Surface{1, 2, 3, 4, 5, 6, 7, 8, 9};
Recombine Surface{1, 2, 3, 4, 5, 6, 7, 8, 9};

Extrude {0, 0, 60} {
  Surface{1}; Surface{2}; Surface{3}; Surface{4}; Surface{5};
  Surface{6}; Surface{7}; Surface{8}; Surface{9};
  Layers{45}; Recombine;
}

Physical Volume("uo2") = {1, 5};
Physical Volume("mox") = {2, 4};
Physical Volume("reflec") = {3, 6, 9, 8, 7};

Physical Surface("boundary") = {173, 195, 217, 213, 147, 81};

Extrude {0, 0, 20} {
  Surface{46}; Surface{68}; Surface{90}; Surface{112}; Surface{134};
  Surface{156}; Surface{178}; Surface{200}; Surface{222};
  Layers{15}; Recombine;
}

Physical Volume("reflec") += {10, 11, 12, 13, 14, 15, 16, 17, 18};

Physical Surface("boundary") += {371, 393, 415, 411, 345, 279, 244, 266, 288, 310, 332, 354, 376, 398, 420};
