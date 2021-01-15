Geometry.CopyMeshingMethod = 1;

h = 0.2;

p = 1;

y = -9;
Point(p) = {-8, y, 0, h}; p += 1;
Point(p) = {-7, y, 0, h}; p += 1;
Point(p) = {-5, y, 0, h}; p += 1;
Point(p) = {-4, y, 0, h}; p += 1;
Point(p) = {-2, y, 0, h}; p += 1;
Point(p) = {-1, y, 0, h}; p += 1;
Point(p) = {1, y, 0, h}; p += 1;
Point(p) = {2, y, 0, h}; p += 1;
Point(p) = {4, y, 0, h}; p += 1;
Point(p) = {5, y, 0, h}; p += 1;
Point(p) = {7, y, 0, h}; p += 1;
Point(p) = {8, y, 0, h}; p += 1;

y = 9;
Point(p) = {-8, y, 0, h}; p += 1;
Point(p) = {-7, y, 0, h}; p += 1;
Point(p) = {-5, y, 0, h}; p += 1;
Point(p) = {-4, y, 0, h}; p += 1;
Point(p) = {-2, y, 0, h}; p += 1;
Point(p) = {-1, y, 0, h}; p += 1;
Point(p) = {1, y, 0, h}; p += 1;
Point(p) = {2, y, 0, h}; p += 1;
Point(p) = {4, y, 0, h}; p += 1;
Point(p) = {5, y, 0, h}; p += 1;
Point(p) = {7, y, 0, h}; p += 1;
Point(p) = {8, y, 0, h}; p += 1;

Point(p) = {-10, -10, 0, h}; p += 1;
Point(p) = {10, -10, 0, h}; p += 1;
Point(p) = {-10, 10, 0, h}; p += 1;
Point(p) = {10, 10, 0, h}; p += 1;

Line(1) = {1, 2};
Line(2) = {2, 14};
Line(3) = {14, 13};
Line(4) = {13, 1};
Line(5) = {3, 4};
Line(6) = {4, 16};
Line(7) = {16, 15};
Line(8) = {15, 3};
Line(9) = {5, 6};
Line(10) = {6, 18};
Line(11) = {18, 17};
Line(12) = {17, 5};
Line(13) = {7, 8};
Line(14) = {8, 20};
Line(15) = {20, 19};
Line(16) = {19, 7};
Line(17) = {9, 10};
Line(18) = {10, 22};
Line(19) = {22, 21};
Line(20) = {21, 9};
Line(21) = {11, 12};
Line(22) = {12, 24};
Line(23) = {24, 23};
Line(24) = {23, 11};
Line(25) = {25, 26};
Line(26) = {26, 28};
Line(27) = {28, 27};
Line(28) = {27, 25};

Curve Loop(1) = {1, 2, 3, 4};
Plane Surface(1) = {1};
Curve Loop(2) = {5, 6, 7, 8};
Plane Surface(2) = {2};
Curve Loop(3) = {9, 10, 11, 12};
Plane Surface(3) = {3};
Curve Loop(4) = {13, 14, 15, 16};
Plane Surface(4) = {4};
Curve Loop(5) = {17, 18, 19, 20};
Plane Surface(5) = {5};
Curve Loop(6) = {21, 22, 23, 24};
Plane Surface(6) = {6};
Curve Loop(7) = {25, 26, 27, 28};
Plane Surface(7) = {1, 2, 3, 4, 5, 6, 7};

Physical Surface("moderator") = {7};
Physical Surface("fuel") = {1, 2, 3, 4, 5, 6};
