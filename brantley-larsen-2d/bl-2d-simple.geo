Geometry.CopyMeshingMethod = 1;

h = 0.2;

Point(1) = {0, 0, 0, h};
Point(2) = {1, 0, 0, h};
Point(3) = {2, 0, 0, h};
Point(4) = {4, 0, 0, h};
Point(5) = {5, 0, 0, h};
Point(6) = {7, 0, 0, h};
Point(7) = {8, 0, 0, h};
Point(8) = {10, 0, 0, h};
Point(9) = {1, 9, 0, h};
Point(10) = {2, 9, 0, h};
Point(11) = {4, 9, 0, h};
Point(12) = {5, 9, 0, h};
Point(13) = {7, 9, 0, h};
Point(14) = {8, 9, 0, h};
Point(15) = {0, 10, 0, h};
Point(16) = {10, 10, 0, h};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 7};
Line(7) = {7, 8};
Line(8) = {1, 15};
Line(9) = {2, 9};
Line(10) = {3, 10};
Line(11) = {4, 11};
Line(12) = {5, 12};
Line(13) = {6, 13};
Line(14) = {7, 14};
Line(15) = {8, 16};
Line(16) = {9, 10};
Line(17) = {11, 12};
Line(18) = {13, 14};
Line(19) = {15, 16};

Curve Loop(1) = {9, 16, -10, -2};
Plane Surface(1) = {1};
Curve Loop(2) = {11, 17, -12, -4};
Plane Surface(2) = {2};
Curve Loop(3) = {13, 18, -14, -6};
Plane Surface(3) = {3};
Curve Loop(4) = {8, 19, -15, -7, 14, -18, -13, -5, 12, -17, -11, -3, 10, -16, -9, -1};
Plane Surface(4) = {4};

Physical Surface("fuel") = {1, 2, 3};
Physical Surface("moderator") = {4};
Physical Curve("outer") = {19, 15};

Color Red{ Surface{1, 2, 3}; }
Color Grey{ Surface{4}; }

// La = 3;
// Transfinite Line{1, 2, 4, 6} = La;
// Transfinite Line{3, 5, 7} = 2*(La-1)+1;
// Transfinite Line{19} = 10*(La-1)+1;

// Lb = 10;
// Transfinite Line{9, 10, 11, 12, 13, 14} = Lb;
// Transfinite Line{8, 15} = 10/9*(Lb-1)+1;

// Transfinite Surface{1, 2, 3};
