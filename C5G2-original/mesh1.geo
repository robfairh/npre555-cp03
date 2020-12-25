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


Line(l) = {1, 5}; l += 1;
Line(l) = {5, 9}; l += 1;
Line(l) = {9, 13}; l += 1;

Line(l) = {2, 6}; l += 1;
Line(l) = {6, 10}; l += 1;
Line(l) = {10, 14}; l += 1;

Line(l) = {3, 7}; l += 1;
Line(l) = {7, 11}; l += 1;
Line(l) = {11, 15}; l += 1;

Line(l) = {4, 8}; l += 1;
Line(l) = {8, 12}; l += 1;
Line(l) = {12, 16}; l += 1;

Curve Loop(1) = {1, 16, -4, -13};
Plane Surface(1) = {1};
Curve Loop(2) = {2, 19, -5, -16};
Plane Surface(2) = {2};
Curve Loop(3) = {14, 7, -17, -4};
Plane Surface(3) = {3};
Curve Loop(4) = {17, 8, -20, -5};
Plane Surface(4) = {4};
Curve Loop(5) = {3, 22, -6, -19};
Plane Surface(5) = {5};
Curve Loop(6) = {20, 9, -23, -6};
Plane Surface(6) = {6};
Curve Loop(7) = {7, 18, -10, -15};
Plane Surface(7) = {7};
Curve Loop(8) = {18, 11, -21, -8};
Plane Surface(8) = {8};
Curve Loop(9) = {21, 12, -24, -9};
Plane Surface(9) = {9};

Physical Surface("UO2") = {1, 4};
Physical Surface("MOX") = {3, 2};
Physical Surface("Reflector") = {7, 8, 9, 6, 5};
