Geometry.CopyMeshingMethod = 1;

h = 1;
pt = 1.26;

p = 1; l = 1; cl = 1; s = 1;

Y = 0*pt;
Point(p) = { 0*pt, Y, 0, h}; p += 1;
Point(p) = { 1*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = { 2*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = { 3*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = { 4*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = { 5*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = { 6*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = { 7*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = { 8*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = { 9*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = {10*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = {11*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = {12*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = {13*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = {14*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = {15*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = {16*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = {17*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = {18*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = {19*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = {20*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = {21*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = {22*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = {23*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = {24*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = {25*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = {26*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = {27*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = {28*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = {29*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = {30*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = {31*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = {32*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = {33*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Point(p) = {34*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;



Y = 1*pt;
Point(p) = { 0*pt, Y, 0, h}; p += 1;
Line(l) = {p-36, p-1}; l += 1;
Point(p) = { 1*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Surface(s) = {cl-1}; s += 1;
Point(p) = { 2*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = { 3*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = { 4*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = { 5*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = { 6*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = { 7*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = { 8*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = { 9*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = {10*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = {11*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = {12*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = {13*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = {14*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = {15*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = {16*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = {17*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = {18*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = {19*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = {20*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = {21*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = {22*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = {23*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = {24*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = {25*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = {26*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = {27*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = {28*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = {29*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = {30*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = {31*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = {32*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = {33*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;
Point(p) = {34*pt, Y, 0, h}; p += 1;
Line(l) = {p-2, p-1}; l += 1;
Line(l) = {p-36, p-1}; l += 1;
Curve Loop(cl) = {l-(p-1), -(l-3), -(l-2), l-1}; cl += 1;
Plane Surface(s) = {cl-1}; s += 1;

surfaces[] = {1};
For yindex In {1:33}
new_surface = Translate {0, yindex*pt, 0} {
  Duplicata {
  	Surface{ 1}; Surface{ 2}; Surface{ 3}; Surface{ 4}; Surface{ 5};
  	Surface{ 6}; Surface{ 7}; Surface{ 8}; Surface{ 9}; Surface{10};
  	Surface{11}; Surface{12}; Surface{13}; Surface{14}; Surface{15};
  	Surface{16}; Surface{17}; Surface{18}; Surface{19}; Surface{20};
  	Surface{21}; Surface{22}; Surface{23}; Surface{24}; Surface{25};
  	Surface{26}; Surface{27}; Surface{27}; Surface{28}; Surface{29};
  	Surface{30}; Surface{31}; Surface{32}; Surface{33}; Surface{34};
  }
};
surfaces += new_surface;
EndFor

Physical Surface("uo2a_1_1") = {1};
Physical Surface("uo2a_1_2") = {2};
Physical Surface("uo2a_1_3") = {3};
Physical Surface("uo2a_1_4") = {4};
Physical Surface("uo2a_1_5") = {5};
Physical Surface("uo2a_1_6") = {6};
Physical Surface("uo2a_1_7") = {7};
Physical Surface("uo2a_1_8") = {8};
Physical Surface("uo2a_1_9") = {9};
Physical Surface("uo2a_1_10") = {10};
Physical Surface("uo2a_1_11") = {11};
Physical Surface("uo2a_1_12") = {12};
Physical Surface("uo2a_1_13") = {13};
Physical Surface("uo2a_1_14") = {14};
Physical Surface("uo2a_1_15") = {15};
Physical Surface("uo2a_1_16") = {16};
Physical Surface("uo2a_1_17") = {17};

Physical Surface("uo2a_2_1") = {104};
Physical Surface("uo2a_2_2") = {109};
Physical Surface("uo2a_2_3") = {114};
Physical Surface("uo2a_2_4") = {119};
Physical Surface("uo2a_2_5") = {124};
Physical Surface("uo2a_2_6") = {129};
Physical Surface("uo2a_2_7") = {134};
Physical Surface("uo2a_2_8") = {139};
Physical Surface("uo2a_2_9") = {144};
Physical Surface("uo2a_2_10") = {149};
Physical Surface("uo2a_2_11") = {154};
Physical Surface("uo2a_2_12") = {159};
Physical Surface("uo2a_2_13") = {164};
Physical Surface("uo2a_2_14") = {169};
Physical Surface("uo2a_2_15") = {174};
Physical Surface("uo2a_2_16") = {179};
Physical Surface("uo2a_2_17") = {184};

Physical Surface("uo2a_3_1") = {278};
Physical Surface("uo2a_3_2") = {283};
Physical Surface("uo2a_3_3") = {288};
Physical Surface("uo2a_3_4") = {293};
Physical Surface("uo2a_3_5") = {298};
// Physical Surface("uo2a_3_6") = {};
Physical Surface("uo2a_3_7") = {308};
Physical Surface("uo2a_3_8") = {313};
// Physical Surface("uo2a_3_9") = {};
Physical Surface("uo2a_3_10") = {323};
Physical Surface("uo2a_3_11") = {328};
// Physical Surface("uo2a_3_12") = {};
Physical Surface("uo2a_3_13") = {338};
Physical Surface("uo2a_3_14") = {343};
Physical Surface("uo2a_3_15") = {348};
Physical Surface("uo2a_3_16") = {353};
Physical Surface("uo2a_3_17") = {358};

Physical Surface("uo2a_4_1") = {452};
Physical Surface("uo2a_4_2") = {457};
Physical Surface("uo2a_4_3") = {462};
// Physical Surface("uo2a_4_4") = {};
Physical Surface("uo2a_4_5") = {472};
Physical Surface("uo2a_4_6") = {477};
Physical Surface("uo2a_4_7") = {482};
Physical Surface("uo2a_4_8") = {487};
Physical Surface("uo2a_4_9") = {492};
Physical Surface("uo2a_4_10") = {497};
Physical Surface("uo2a_4_11") = {502};
Physical Surface("uo2a_4_12") = {507};
Physical Surface("uo2a_4_13") = {512};
// Physical Surface("uo2a_4_14") = {};
Physical Surface("uo2a_4_15") = {522};
Physical Surface("uo2a_4_16") = {527};
Physical Surface("uo2a_4_17") = {532};

Physical Surface("uo2a_5_1") = {626};
Physical Surface("uo2a_5_2") = {631};
Physical Surface("uo2a_5_3") = {636};
Physical Surface("uo2a_5_4") = {641};
Physical Surface("uo2a_5_5") = {646};
Physical Surface("uo2a_5_6") = {651};
Physical Surface("uo2a_5_7") = {656};
Physical Surface("uo2a_5_8") = {661};
Physical Surface("uo2a_5_9") = {666};
Physical Surface("uo2a_5_10") = {671};
Physical Surface("uo2a_5_11") = {676};
Physical Surface("uo2a_5_12") = {681};
Physical Surface("uo2a_5_13") = {686};
Physical Surface("uo2a_5_14") = {691};
Physical Surface("uo2a_5_15") = {696};
Physical Surface("uo2a_5_16") = {701};
Physical Surface("uo2a_5_17") = {706};

Physical Surface("uo2a_6_1") = {800};
Physical Surface("uo2a_6_2") = {805};
// Physical Surface("uo2a_6_3") = {};
Physical Surface("uo2a_6_4") = {815};
Physical Surface("uo2a_6_5") = {820};
// Physical Surface("uo2a_6_6") = {};
Physical Surface("uo2a_6_7") = {830};
Physical Surface("uo2a_6_8") = {835};
// Physical Surface("uo2a_6_9") = {};
Physical Surface("uo2a_6_10") = {845};
Physical Surface("uo2a_6_11") = {850};
// Physical Surface("uo2a_6_12") = {};
Physical Surface("uo2a_6_13") = {860};
Physical Surface("uo2a_6_14") = {865};
// Physical Surface("uo2a_6_15") = {};
Physical Surface("uo2a_6_16") = {875};
Physical Surface("uo2a_6_17") = {880};

Physical Surface("uo2a_7_1") = {974};
Physical Surface("uo2a_7_2") = {979};
Physical Surface("uo2a_7_3") = {984};
Physical Surface("uo2a_7_4") = {989};
Physical Surface("uo2a_7_5") = {994};
Physical Surface("uo2a_7_6") = {999};
Physical Surface("uo2a_7_7") = {1004};
Physical Surface("uo2a_7_8") = {1009};
Physical Surface("uo2a_7_9") = {1014};
Physical Surface("uo2a_7_10") = {1019};
Physical Surface("uo2a_7_11") = {1024};
Physical Surface("uo2a_7_12") = {1029};
Physical Surface("uo2a_7_13") = {1034};
Physical Surface("uo2a_7_14") = {1039};
Physical Surface("uo2a_7_15") = {1044};
Physical Surface("uo2a_7_16") = {1049};
Physical Surface("uo2a_7_17") = {1054};

Physical Surface("uo2a_8_1") = {1148};
Physical Surface("uo2a_8_2") = {1153};
Physical Surface("uo2a_8_3") = {1158};
Physical Surface("uo2a_8_4") = {1163};
Physical Surface("uo2a_8_5") = {1168};
Physical Surface("uo2a_8_6") = {1173};
Physical Surface("uo2a_8_7") = {1178};
Physical Surface("uo2a_8_8") = {1183};
Physical Surface("uo2a_8_9") = {1188};
Physical Surface("uo2a_8_10") = {1193};
Physical Surface("uo2a_8_11") = {1198};
Physical Surface("uo2a_8_12") = {1203};
Physical Surface("uo2a_8_13") = {1208};
Physical Surface("uo2a_8_14") = {1213};
Physical Surface("uo2a_8_15") = {1218};
Physical Surface("uo2a_8_16") = {1223};
Physical Surface("uo2a_8_17") = {1228};

Physical Surface("uo2a_9_1") = {1322};
Physical Surface("uo2a_9_2") = {1327};
// Physical Surface("uo2a_9_3") = {};
Physical Surface("uo2a_9_4") = {1337};
Physical Surface("uo2a_9_5") = {1342};
// Physical Surface("uo2a_9_6") = {};
Physical Surface("uo2a_9_7") = {1352};
Physical Surface("uo2a_9_8") = {1357};
// Physical Surface("uo2a_9_9") = {};
Physical Surface("uo2a_9_10") = {1367};
Physical Surface("uo2a_9_11") = {1372};
// Physical Surface("uo2a_9_12") = {};
Physical Surface("uo2a_9_13") = {1382};
Physical Surface("uo2a_9_14") = {1387};
// Physical Surface("uo2a_9_15") = {};
Physical Surface("uo2a_9_16") = {1397};
Physical Surface("uo2a_9_17") = {1402};

Physical Surface("uo2a_10_1") = {1496};
Physical Surface("uo2a_10_2") = {1501};
Physical Surface("uo2a_10_3") = {1506};
Physical Surface("uo2a_10_4") = {1511};
Physical Surface("uo2a_10_5") = {1516};
Physical Surface("uo2a_10_6") = {1521};
Physical Surface("uo2a_10_7") = {1526};
Physical Surface("uo2a_10_8") = {1531};
Physical Surface("uo2a_10_9") = {1536};
Physical Surface("uo2a_10_10") = {1541};
Physical Surface("uo2a_10_11") = {1546};
Physical Surface("uo2a_10_12") = {1551};
Physical Surface("uo2a_10_13") = {1556};
Physical Surface("uo2a_10_14") = {1561};
Physical Surface("uo2a_10_15") = {1566};
Physical Surface("uo2a_10_16") = {1571};
Physical Surface("uo2a_10_17") = {1576};

Physical Surface("uo2a_11_1") = {1670};
Physical Surface("uo2a_11_2") = {1675};
Physical Surface("uo2a_11_3") = {1680};
Physical Surface("uo2a_11_4") = {1685};
Physical Surface("uo2a_11_5") = {1690};
Physical Surface("uo2a_11_6") = {1695};
Physical Surface("uo2a_11_7") = {1700};
Physical Surface("uo2a_11_8") = {1705};
Physical Surface("uo2a_11_9") = {1710};
Physical Surface("uo2a_11_10") = {1715};
Physical Surface("uo2a_11_11") = {1720};
Physical Surface("uo2a_11_12") = {1725};
Physical Surface("uo2a_11_13") = {1730};
Physical Surface("uo2a_11_14") = {1735};
Physical Surface("uo2a_11_15") = {1740};
Physical Surface("uo2a_11_16") = {1745};
Physical Surface("uo2a_11_17") = {1750};

Physical Surface("uo2a_12_1") = {1844};
Physical Surface("uo2a_12_2") = {1849};
// Physical Surface("uo2a_12_3") = {};
Physical Surface("uo2a_12_4") = {1859};
Physical Surface("uo2a_12_5") = {1864};
// Physical Surface("uo2a_12_6") = {};
Physical Surface("uo2a_12_7") = {1874};
Physical Surface("uo2a_12_8") = {1879};
// Physical Surface("uo2a_12_9") = {};
Physical Surface("uo2a_12_10") = {1889};
Physical Surface("uo2a_12_11") = {1894};
// Physical Surface("uo2a_12_12") = {};
Physical Surface("uo2a_12_13") = {1904};
Physical Surface("uo2a_12_14") = {1909};
// Physical Surface("uo2a_12_15") = {};
Physical Surface("uo2a_12_16") = {1919};
Physical Surface("uo2a_12_17") = {1924};

Physical Surface("uo2a_13_1") = {2018};
Physical Surface("uo2a_13_2") = {2023};
Physical Surface("uo2a_13_3") = {2028};
Physical Surface("uo2a_13_4") = {2033};
Physical Surface("uo2a_13_5") = {2038};
Physical Surface("uo2a_13_6") = {2043};
Physical Surface("uo2a_13_7") = {2048};
Physical Surface("uo2a_13_8") = {2053};
Physical Surface("uo2a_13_9") = {2058};
Physical Surface("uo2a_13_10") = {2063};
Physical Surface("uo2a_13_11") = {2068};
Physical Surface("uo2a_13_12") = {2073};
Physical Surface("uo2a_13_13") = {2078};
Physical Surface("uo2a_13_14") = {2083};
Physical Surface("uo2a_13_15") = {2088};
Physical Surface("uo2a_13_16") = {2093};
Physical Surface("uo2a_13_17") = {2098};

Physical Surface("uo2a_14_1") = {2192};
Physical Surface("uo2a_14_2") = {2197};
Physical Surface("uo2a_14_3") = {2202};
// Physical Surface("uo2a_14_4") = {};
Physical Surface("uo2a_14_5") = {2212};
Physical Surface("uo2a_14_6") = {2217};
Physical Surface("uo2a_14_7") = {2222};
Physical Surface("uo2a_14_8") = {2227};
Physical Surface("uo2a_14_9") = {2232};
Physical Surface("uo2a_14_10") = {2237};
Physical Surface("uo2a_14_11") = {2242};
Physical Surface("uo2a_14_12") = {2247};
Physical Surface("uo2a_14_13") = {2252};
// Physical Surface("uo2a_14_14") = {};
Physical Surface("uo2a_14_15") = {2262};
Physical Surface("uo2a_14_16") = {2267};
Physical Surface("uo2a_14_17") = {2272};

Physical Surface("uo2a_15_1") = {2366};
Physical Surface("uo2a_15_2") = {2371};
Physical Surface("uo2a_15_3") = {2376};
Physical Surface("uo2a_15_4") = {2381};
Physical Surface("uo2a_15_5") = {2386};
// Physical Surface("uo2a_15_6") = {};
Physical Surface("uo2a_15_7") = {2396};
Physical Surface("uo2a_15_8") = {2401};
// Physical Surface("uo2a_15_9") = {};
Physical Surface("uo2a_15_10") = {2411};
Physical Surface("uo2a_15_11") = {2416};
// Physical Surface("uo2a_15_12") = {};
Physical Surface("uo2a_15_13") = {2426};
Physical Surface("uo2a_15_14") = {2431};
Physical Surface("uo2a_15_15") = {2436};
Physical Surface("uo2a_15_16") = {2441};
Physical Surface("uo2a_15_17") = {2446};

Physical Surface("uo2a_16_1") = {2540};
Physical Surface("uo2a_16_2") = {2545};
Physical Surface("uo2a_16_3") = {2550};
Physical Surface("uo2a_16_4") = {2555};
Physical Surface("uo2a_16_5") = {2560};
Physical Surface("uo2a_16_6") = {2565};
Physical Surface("uo2a_16_7") = {2570};
Physical Surface("uo2a_16_8") = {2575};
Physical Surface("uo2a_16_9") = {2580};
Physical Surface("uo2a_16_10") = {2585};
Physical Surface("uo2a_16_11") = {2590};
Physical Surface("uo2a_16_12") = {2595};
Physical Surface("uo2a_16_13") = {2600};
Physical Surface("uo2a_16_14") = {2605};
Physical Surface("uo2a_16_15") = {2610};
Physical Surface("uo2a_16_16") = {2615};
Physical Surface("uo2a_16_17") = {2620};

Physical Surface("uo2a_17_1") = {2714};
Physical Surface("uo2a_17_2") = {2719};
Physical Surface("uo2a_17_3") = {2724};
Physical Surface("uo2a_17_4") = {2729};
Physical Surface("uo2a_17_5") = {2734};
Physical Surface("uo2a_17_6") = {2739};
Physical Surface("uo2a_17_7") = {2744};
Physical Surface("uo2a_17_8") = {2749};
Physical Surface("uo2a_17_9") = {2754};
Physical Surface("uo2a_17_10") = {2759};
Physical Surface("uo2a_17_11") = {2764};
Physical Surface("uo2a_17_12") = {2769};
Physical Surface("uo2a_17_13") = {2774};
Physical Surface("uo2a_17_14") = {2779};
Physical Surface("uo2a_17_15") = {2784};
Physical Surface("uo2a_17_16") = {2789};
Physical Surface("uo2a_17_17") = {2794};

// Physical Surface("uo2a") = {
// 	1, 104, 278, 452, 626, 800, 974, 1148, 1322, 1496, 1670, 1844, 2018, 2192, 2366, 2540, 2714,
// 	2, 109, 283, 457, 631, 805, 979, 1153, 1327, 1501, 1675, 1849, 2023, 2197, 2371, 2545, 2719,
// 	3, 114, 288, 462, 636, 984, 1158, 1506, 1680, 2028, 2202, 2376, 2550, 2724,
// 	4, 119, 293, 641, 815, 989, 1163, 1337, 1511, 1685, 1859, 2033, 2381, 2555, 2729,
// 	5, 124, 298, 472, 646, 820, 994, 1168, 1342, 1516, 1690, 1864, 2038, 2212, 2386, 2560, 2734,
// 	6, 129, 477, 651, 999, 1173, 1521, 1695, 2043, 2217, 2565, 2739,
// 	7, 134, 308, 482, 656, 830, 1004, 1178, 1352, 1526, 1700, 1874, 2048, 2222, 2396, 2570, 2744,
// 	8, 139, 313, 487, 661, 835, 1009, 1183, 1357, 1531, 1705, 1879, 2053, 2227, 2401, 2575, 2749,
// 	9, 144, 492, 666, 1014, 1188, 1536, 1710, 2058,	2232, 2580, 2754,
// 	10, 149, 323, 497, 671, 845, 1019, 1193, 1367, 1541, 1715, 1889, 2063, 2237, 2411, 2585, 2759,
// 	11,	154, 328, 502, 676, 850, 1024, 1198, 1372, 1546, 1720, 1894, 2068, 2242, 2416, 2590, 2764,
// 	12, 159, 507, 681, 1029, 1203, 1551, 1725, 2073, 2247, 2595, 2769,
// 	13, 164, 338, 512, 686, 860, 1034, 1208, 1382, 1556, 1730, 1904, 2078, 2252, 2426, 2600, 2774,
// 	14, 169, 343, 691, 865, 1039, 1213, 1387, 1561,	1735, 1909, 2083, 2431, 2605, 2779,
// 	15, 174, 348, 522, 696, 1044, 1218, 1566, 1740, 2088, 2262, 2436, 2610, 2784,
// 	16, 179, 353, 527, 701, 875, 1049, 1223, 1397, 1571, 1745, 1919, 2093, 2267, 2441, 2615, 2789,
// 	17, 184, 358, 532, 706, 880, 1054, 1228, 1402, 1576, 1750, 1924, 2098, 2272, 2446, 2620, 2794
// };

Physical Surface("gtubea") = {
	810, 1332, 1854,
	467, 2207,
	303, 825, 1347, 1869, 2391,
	318, 840, 1884, 2406,
	333, 855, 1377, 1899, 2421,
	517, 2257,  
	870, 1392, 1914
};

Physical Surface("fchambera") = {
	1362
};

Physical Surface("uo2b_1_1") = {2973};
Physical Surface("uo2b_1_2") = {2978};
Physical Surface("uo2b_1_3") = {2983};
Physical Surface("uo2b_1_4") = {2988};
Physical Surface("uo2b_1_5") = {2993};
Physical Surface("uo2b_1_6") = {2998};
Physical Surface("uo2b_1_7") = {3003};
Physical Surface("uo2b_1_8") = {3008};
Physical Surface("uo2b_1_9") = {3013};
Physical Surface("uo2b_1_10") = {3018};
Physical Surface("uo2b_1_11") = {3028};
Physical Surface("uo2b_1_12") = {3033};
Physical Surface("uo2b_1_13") = {3038};
Physical Surface("uo2b_1_14") = {3043};
Physical Surface("uo2b_1_15") = {3048};
Physical Surface("uo2b_1_16") = {3053};
Physical Surface("uo2b_1_17") = {3058};


Physical Surface("uo2b_2_1") = {3147};
Physical Surface("uo2b_2_2") = {3152};
Physical Surface("uo2b_2_3") = {3157};
Physical Surface("uo2b_2_4") = {3162};
Physical Surface("uo2b_2_5") = {3167};
Physical Surface("uo2b_2_6") = {3172};
Physical Surface("uo2b_2_7") = {3177};
Physical Surface("uo2b_2_8") = {3182};
Physical Surface("uo2b_2_9") = {3187};
Physical Surface("uo2b_2_10") = {3192};
Physical Surface("uo2b_2_11") = {3202};
Physical Surface("uo2b_2_12") = {3207};
Physical Surface("uo2b_2_13") = {3212};
Physical Surface("uo2b_2_14") = {3217};
Physical Surface("uo2b_2_15") = {3222};
Physical Surface("uo2b_2_16") = {3227};
Physical Surface("uo2b_2_17") = {3232};


Physical Surface("uo2b_3_1") = {3321};
Physical Surface("uo2b_3_2") = {3326};
Physical Surface("uo2b_3_3") = {3331};
Physical Surface("uo2b_3_4") = {3336};
Physical Surface("uo2b_3_5") = {3341};
// Physical Surface("uo2b_3_6") = {};
Physical Surface("uo2b_3_7") = {3351};
Physical Surface("uo2b_3_8") = {3356};
// Physical Surface("uo2b_3_9") = {};
Physical Surface("uo2b_3_10") = {3366};
Physical Surface("uo2b_3_11") = {3376};
// Physical Surface("uo2b_3_12") = {};
Physical Surface("uo2b_3_13") = {3386};
Physical Surface("uo2b_3_14") = {3391};
Physical Surface("uo2b_3_15") = {3396};
Physical Surface("uo2b_3_16") = {3401};
Physical Surface("uo2b_3_17") = {3406};

Physical Surface("uo2b_4_1") = {3495};
Physical Surface("uo2b_4_2") = {3500};
Physical Surface("uo2b_4_3") = {3505};
// Physical Surface("uo2b_4_4") = {};
Physical Surface("uo2b_4_5") = {3515};
Physical Surface("uo2b_4_6") = {3520};
Physical Surface("uo2b_4_7") = {3525};
Physical Surface("uo2b_4_8") = {3530};
Physical Surface("uo2b_4_9") = {3535};
Physical Surface("uo2b_4_10") = {3540};
Physical Surface("uo2b_4_11") = {3550};
Physical Surface("uo2b_4_12") = {3555};
Physical Surface("uo2b_4_13") = {3560};
// Physical Surface("uo2b_4_14") = {};
Physical Surface("uo2b_4_15") = {3570};
Physical Surface("uo2b_4_16") = {3575};
Physical Surface("uo2b_4_17") = {3580};

Physical Surface("uo2b") = {
	5837, 5663, 5489, 5315, 5141, 4967, 4793, 4619, 4445, 4271, 4097, 3923, 3749
	5832, 5658, 5484, 5310, 5136, 4788, 4614, 4266, 4092, 3744
	5827, 5653, 5479, 5131, 4957, 4783, 4609, 4435, 4261, 4087, 3913, 3739
	5822, 5648, 5474, 5300, 5126, 4952, 4778, 4604, 4430, 4256, 4082, 3908, 3734
	5817, 5643, 5295, 5121, 4773, 4599, 4251, 4077, 3729
	5812, 5638, 5464, 5290, 5116, 4942, 4768, 4594, 4420, 4246, 4072, 3898, 3724
	5802, 5628, 5454, 5280, 5106, 4932, 4758, 4584, 4410, 4236, 4062, 3888, 3714
	5797, 5623, 5275, 5101, 4753, 4579, 4231, 4057, 3709
	5792, 5618, 5444, 5270, 5096, 4922, 4748, 4574, 4400, 4226, 4052, 3878, 3704
	5787, 5613, 5439, 5265, 5091, 4917, 4743, 4569, 4395, 4221, 4047, 3873, 3699
	5782, 5608, 5260, 5086, 4738, 4564, 4216, 4042, 3694
	5777, 5603, 5429, 5255, 5081, 4907, 4733, 4559, 4385, 4211, 4037, 3863, 3689
	5772, 5598, 5424, 5076, 4902, 4728, 4554, 4380, 4206, 4032, 3858, 3684
	5767, 5593, 5419, 5245, 5071, 4723, 4549, 4201, 4027, 3679
	5762, 5588, 5414, 5240, 5066, 4892, 4718, 4544, 4370, 4196, 4022, 3848
};

Physical Surface("uo2b_5_1") = {3669};
Physical Surface("uo2b_5_2") = {3674};
Physical Surface("uo2b_5_3") = {};
Physical Surface("uo2b_5_4") = {};
Physical Surface("uo2b_5_5") = {};
Physical Surface("uo2b_5_6") = {};
Physical Surface("uo2b_5_7") = {};
Physical Surface("uo2b_5_8") = {};
Physical Surface("uo2b_5_9") = {};
Physical Surface("uo2b_5_10") = {};
Physical Surface("uo2b_5_11") = {};
Physical Surface("uo2b_5_12") = {};
Physical Surface("uo2b_5_13") = {};
Physical Surface("uo2b_5_14") = {};
Physical Surface("uo2b_5_15") = {};
Physical Surface("uo2b_5_16") = {};
Physical Surface("uo2b_5_17") = {3754};

Physical Surface("uo2b_6_1") = {3843};
Physical Surface("uo2b_6_2") = {};
Physical Surface("uo2b_6_3") = {};
Physical Surface("uo2b_6_4") = {};
Physical Surface("uo2b_6_5") = {};
Physical Surface("uo2b_6_6") = {};
Physical Surface("uo2b_6_7") = {};
Physical Surface("uo2b_6_8") = {};
Physical Surface("uo2b_6_9") = {};
Physical Surface("uo2b_6_10") = {};
Physical Surface("uo2b_6_11") = {};
Physical Surface("uo2b_6_12") = {};
Physical Surface("uo2b_6_13") = {};
Physical Surface("uo2b_6_14") = {};
Physical Surface("uo2b_6_15") = {};
Physical Surface("uo2b_6_16") = {};
Physical Surface("uo2b_6_17") = {3928};

Physical Surface("uo2b_7_1") = {4017};
Physical Surface("uo2b_7_2") = {};
Physical Surface("uo2b_7_3") = {};
Physical Surface("uo2b_7_4") = {};
Physical Surface("uo2b_7_5") = {};
Physical Surface("uo2b_7_6") = {};
Physical Surface("uo2b_7_7") = {};
Physical Surface("uo2b_7_8") = {};
Physical Surface("uo2b_7_9") = {};
Physical Surface("uo2b_7_10") = {};
Physical Surface("uo2b_7_11") = {};
Physical Surface("uo2b_7_12") = {};
Physical Surface("uo2b_7_13") = {};
Physical Surface("uo2b_7_14") = {};
Physical Surface("uo2b_7_15") = {};
Physical Surface("uo2b_7_16") = {};
Physical Surface("uo2b_7_17") = {4102};

Physical Surface("uo2b_8_1") = {4191};
Physical Surface("uo2b_8_2") = {};
Physical Surface("uo2b_8_3") = {};
Physical Surface("uo2b_8_4") = {};
Physical Surface("uo2b_8_5") = {};
Physical Surface("uo2b_8_6") = {};
Physical Surface("uo2b_8_7") = {};
Physical Surface("uo2b_8_8") = {};
Physical Surface("uo2b_8_9") = {};
Physical Surface("uo2b_8_10") = {};
Physical Surface("uo2b_8_11") = {};
Physical Surface("uo2b_8_12") = {};
Physical Surface("uo2b_8_13") = {};
Physical Surface("uo2b_8_14") = {};
Physical Surface("uo2b_8_15") = {};
Physical Surface("uo2b_8_16") = {};
Physical Surface("uo2b_8_17") = {4276};

Physical Surface("uo2b_9_1") = {4365};
Physical Surface("uo2b_9_2") = {};
Physical Surface("uo2b_9_3") = {};
Physical Surface("uo2b_9_4") = {};
Physical Surface("uo2b_9_5") = {};
Physical Surface("uo2b_9_6") = {};
Physical Surface("uo2b_9_7") = {};
Physical Surface("uo2b_9_8") = {};
Physical Surface("uo2b_9_9") = {};
Physical Surface("uo2b_9_10") = {};
Physical Surface("uo2b_9_11") = {};
Physical Surface("uo2b_9_12") = {};
Physical Surface("uo2b_9_13") = {};
Physical Surface("uo2b_9_14") = {};
Physical Surface("uo2b_9_15") = {};
Physical Surface("uo2b_9_16") = {};
Physical Surface("uo2b_9_17") = {4450};

Physical Surface("uo2b_10_1") = {4539};
Physical Surface("uo2b_10_2") = {};
Physical Surface("uo2b_10_3") = {};
Physical Surface("uo2b_10_4") = {};
Physical Surface("uo2b_10_5") = {};
Physical Surface("uo2b_10_6") = {};
Physical Surface("uo2b_10_7") = {};
Physical Surface("uo2b_10_8") = {};
Physical Surface("uo2b_10_9") = {};
Physical Surface("uo2b_10_10") = {};
Physical Surface("uo2b_10_11") = {};
Physical Surface("uo2b_10_12") = {};
Physical Surface("uo2b_10_13") = {};
Physical Surface("uo2b_10_14") = {};
Physical Surface("uo2b_10_15") = {};
Physical Surface("uo2b_10_16") = {};
Physical Surface("uo2b_10_17") = {4624};

Physical Surface("uo2b_11_1") = {4713};
Physical Surface("uo2b_11_2") = {};
Physical Surface("uo2b_11_3") = {};
Physical Surface("uo2b_11_4") = {};
Physical Surface("uo2b_11_5") = {};
Physical Surface("uo2b_11_6") = {};
Physical Surface("uo2b_11_7") = {};
Physical Surface("uo2b_11_8") = {};
Physical Surface("uo2b_11_9") = {};
Physical Surface("uo2b_11_10") = {};
Physical Surface("uo2b_11_11") = {};
Physical Surface("uo2b_11_12") = {};
Physical Surface("uo2b_11_13") = {};
Physical Surface("uo2b_11_14") = {};
Physical Surface("uo2b_11_15") = {};
Physical Surface("uo2b_11_16") = {};
Physical Surface("uo2b_11_17") = {4798};

Physical Surface("uo2b_12_1") = {4887};
Physical Surface("uo2b_12_2") = {};
Physical Surface("uo2b_12_3") = {};
Physical Surface("uo2b_12_4") = {};
Physical Surface("uo2b_12_5") = {};
Physical Surface("uo2b_12_6") = {};
Physical Surface("uo2b_12_7") = {};
Physical Surface("uo2b_12_8") = {};
Physical Surface("uo2b_12_9") = {};
Physical Surface("uo2b_12_10") = {};
Physical Surface("uo2b_12_11") = {};
Physical Surface("uo2b_12_12") = {};
Physical Surface("uo2b_12_13") = {};
Physical Surface("uo2b_12_14") = {};
Physical Surface("uo2b_12_15") = {};
Physical Surface("uo2b_12_16") = {};
Physical Surface("uo2b_12_17") = {4972};

Physical Surface("uo2b_13_1") = {5061};
Physical Surface("uo2b_13_2") = {};
Physical Surface("uo2b_13_3") = {};
Physical Surface("uo2b_13_4") = {};
Physical Surface("uo2b_13_5") = {};
Physical Surface("uo2b_13_6") = {};
Physical Surface("uo2b_13_7") = {};
Physical Surface("uo2b_13_8") = {};
Physical Surface("uo2b_13_9") = {};
Physical Surface("uo2b_13_10") = {};
Physical Surface("uo2b_13_11") = {};
Physical Surface("uo2b_13_12") = {};
Physical Surface("uo2b_13_13") = {};
Physical Surface("uo2b_13_14") = {};
Physical Surface("uo2b_13_15") = {};
Physical Surface("uo2b_13_16") = {};
Physical Surface("uo2b_13_17") = {5146};

Physical Surface("uo2b_14_1") = {5235};
Physical Surface("uo2b_14_2") = {};
Physical Surface("uo2b_14_3") = {};
Physical Surface("uo2b_14_4") = {};
Physical Surface("uo2b_14_5") = {};
Physical Surface("uo2b_14_6") = {};
Physical Surface("uo2b_14_7") = {};
Physical Surface("uo2b_14_8") = {};
Physical Surface("uo2b_14_9") = {};
Physical Surface("uo2b_14_10") = {};
Physical Surface("uo2b_14_11") = {};
Physical Surface("uo2b_14_12") = {};
Physical Surface("uo2b_14_13") = {};
Physical Surface("uo2b_14_14") = {};
Physical Surface("uo2b_14_15") = {};
Physical Surface("uo2b_14_16") = {};
Physical Surface("uo2b_14_17") = {5320};

Physical Surface("uo2b_15_1") = {5409};
Physical Surface("uo2b_15_2") = {};
Physical Surface("uo2b_15_3") = {};
Physical Surface("uo2b_15_4") = {};
Physical Surface("uo2b_15_5") = {};
Physical Surface("uo2b_15_6") = {};
Physical Surface("uo2b_15_7") = {};
Physical Surface("uo2b_15_8") = {};
Physical Surface("uo2b_15_9") = {};
Physical Surface("uo2b_15_10") = {};
Physical Surface("uo2b_15_11") = {};
Physical Surface("uo2b_15_12") = {};
Physical Surface("uo2b_15_13") = {};
Physical Surface("uo2b_15_14") = {};
Physical Surface("uo2b_15_15") = {};
Physical Surface("uo2b_15_16") = {};
Physical Surface("uo2b_15_17") = {5494};

Physical Surface("uo2b_16_1") = {5583};
Physical Surface("uo2b_16_2") = {};
Physical Surface("uo2b_16_3") = {};
Physical Surface("uo2b_16_4") = {};
Physical Surface("uo2b_16_5") = {};
Physical Surface("uo2b_16_6") = {};
Physical Surface("uo2b_16_7") = {};
Physical Surface("uo2b_16_8") = {};
Physical Surface("uo2b_16_9") = {};
Physical Surface("uo2b_16_10") = {};
Physical Surface("uo2b_16_11") = {};
Physical Surface("uo2b_16_12") = {};
Physical Surface("uo2b_16_13") = {};
Physical Surface("uo2b_16_14") = {};
Physical Surface("uo2b_16_15") = {};
Physical Surface("uo2b_16_16") = {};
Physical Surface("uo2b_16_17") = {5668};

Physical Surface("uo2b_17_1") = {5757};
Physical Surface("uo2b_17_2") = {};
Physical Surface("uo2b_17_3") = {};
Physical Surface("uo2b_17_4") = {};
Physical Surface("uo2b_17_5") = {};
Physical Surface("uo2b_17_6") = {};
Physical Surface("uo2b_17_7") = {};
Physical Surface("uo2b_17_8") = {};
Physical Surface("uo2b_17_9") = {};
Physical Surface("uo2b_17_10") = {};
Physical Surface("uo2b_17_11") = {};
Physical Surface("uo2b_17_12") = {};
Physical Surface("uo2b_17_13") = {};
Physical Surface("uo2b_17_14") = {};
Physical Surface("uo2b_17_15") = {};
Physical Surface("uo2b_17_16") = {};
Physical Surface("uo2b_17_17") = {5842};

// Physical Surface("uo2b") = {
// 	5842, 5668, 5494, 5320, 5146, 4972, 4798, 4624, 4450, 4276, 4102, 3928, 3754, 3580, 3406, 3232, 3058,
// 	5837, 5663, 5489, 5315, 5141, 4967, 4793, 4619, 4445, 4271, 4097, 3923, 3749, 3575, 3401, 3227, 3053,
// 	5832, 5658, 5484, 5310, 5136, 4788, 4614, 4266, 4092, 3744, 3570, 3396, 3222, 3048,
// 	5827, 5653, 5479, 5131, 4957, 4783, 4609, 4435, 4261, 4087, 3913, 3739, 3391, 3217, 3043,
// 	5822, 5648, 5474, 5300, 5126, 4952, 4778, 4604, 4430, 4256, 4082, 3908, 3734, 3560, 3386, 3212, 3038,
// 	5817, 5643, 5295, 5121, 4773, 4599, 4251, 4077, 3729, 3555, 3207, 3033,
// 	5812, 5638, 5464, 5290, 5116, 4942, 4768, 4594, 4420, 4246, 4072, 3898, 3724, 3550, 3376, 3202, 3028,
// 	5802, 5628, 5454, 5280, 5106, 4932, 4758, 4584, 4410, 4236, 4062, 3888, 3714, 3540, 3366, 3192, 3018,
// 	5797, 5623, 5275, 5101, 4753, 4579, 4231, 4057, 3709, 3535, 3187, 3013,
// 	5792, 5618, 5444, 5270, 5096, 4922, 4748, 4574, 4400, 4226, 4052, 3878, 3704, 3530, 3356, 3182, 3008,
// 	5787, 5613, 5439, 5265, 5091, 4917, 4743, 4569, 4395, 4221, 4047, 3873, 3699, 3525, 3351, 3177, 3003,
// 	5782, 5608, 5260, 5086, 4738, 4564, 4216, 4042, 3694, 3520, 3172, 2998,
// 	5777, 5603, 5429, 5255, 5081, 4907, 4733, 4559, 4385, 4211, 4037, 3863, 3689, 3515, 3341, 3167, 2993,
// 	5772, 5598, 5424, 5076, 4902, 4728, 4554, 4380, 4206, 4032, 3858, 3684, 3162, 2988, 3336,
// 	5767, 5593, 5419, 5245, 5071, 4723, 4549, 4201, 4027, 3679, 3505, 3331, 3157, 2983,
// 	5762, 5588, 5414, 5240, 5066, 4892, 4718, 4544, 4370, 4196, 4022, 3848, 3674, 3500, 3326, 3152, 2978,
// 	5757, 5583, 5409, 5235, 5061, 4887, 4713, 4539, 4365, 4191, 4017, 3843, 3669, 3495, 3321, 3147, 2973
// };

Physical Surface("gtubeb") = {
	4962, 4440, 3918,
	5305, 3565,
	5469, 4947, 4425, 3903, 3381,
	5449, 4927, 3883, 3361,
	5434, 4912, 4390, 3868, 3346,
	5250, 3510,
	4897, 4375, 3853
};

Physical Surface("fchamberb") = {
	4405
};

Physical Surface("mox1a") = {2302, 2307, 2312, 2317, 2322, 2332, 2337, 2123, 2128, 2133, 2138, 2143, 2148, 2158, 2163, 2168, 1944, 1949, 1959, 1964, 1974, 1984, 1994, 1999, 1770, 1775, 1780, 1785, 1790, 1795, 1800, 1810, 1815, 1820, 1825, 1596, 1601, 1606, 1611, 1616, 1621, 1626, 1636, 1641, 1646, 1651, 1422, 1427, 1437, 1442, 1452, 1462, 1472, 1477, 1248, 1253, 1258, 1263, 1268, 1273, 1278, 1288, 1293, 1298, 1303, 1074, 1079, 1084, 1089, 1094, 1099, 1104, 1114, 1119, 1124, 1129, 955, 950, 940, 930, 920, 915, 905, 900, 731, 736, 741, 746, 751, 756, 766, 771, 776, 597, 592, 582, 577, 572, 567, 562};
Physical Surface("mox2a") = {2630, 2635, 2640, 2645, 2650, 2655, 2660, 2665, 2670, 2680, 2685, 2690, 2695, 2700, 2705, 2456, 2461, 2466, 2471, 2481, 2486, 2496, 2506, 2516, 2521, 2526, 2531, 2282, 2287, 2297, 2342, 2352, 2357, 2108, 2113, 2118, 2173, 2178, 2183, 1934, 1760, 1765, 1586, 1591, 1412, 1238, 1243, 1064, 1069, 890, 716, 721, 542, 547, 557, 726, 368, 373, 378, 383, 393, 398, 408, 418, 428, 433, 438, 443, 194, 199, 204, 209, 214, 219, 224, 229, 234, 244, 249, 254, 259, 264, 269, 602, 612, 617, 781, 786, 791, 965, 1134, 1139, 1308, 1313, 1487, 1656, 1661, 1830, 1835, 2009};
Physical Surface("mox3a") = {34, 33, 32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 189, 363, 537, 711, 885, 1059, 1233, 1407, 1581, 1755, 1929, 2103, 2277, 2451, 2625, 2799, 2804, 2809, 2814, 2819, 2824, 2829, 2834, 2839, 2844, 2854, 2859, 2864, 2869, 2874, 2879, 2884, 2710, 2536, 2362, 2188, 2014, 1840, 1666, 1492, 1318, 1144, 970, 796, 622, 448, 274};

Physical Surface("gtubec") = {423, 403, 388, 910, 925, 945, 960, 895, 1417, 1432, 1467, 1482, 1939, 1954, 1969, 1989, 2004, 2476, 2491, 2511, 552, 607, 2292, 2347};
Physical Surface("fchamberc") = {1447};

Physical Surface("mox1b") = {
	5175, 5180, 5185, 5190, 5195, 5200, 5205,
	4996, 5001, 5006, 5011, 5016, 5021, 5026, 5031, 5036,
	4817, 4822, 4832, 4837, 4847, 4852, 4862, 4867,
	4643, 4648, 4653, 4658, 4663, 4668, 4673, 4678, 4683, 4688, 4693,
	4469, 4474, 4479, 4484, 4489, 4494, 4499, 4504, 4509, 4514, 4519,
	4295, 4300, 4310, 4315, 4325, 4330, 4340, 4345,
	4121, 4126, 4131, 4136, 4141, 4146, 4151, 4156, 4161, 4166, 4171,
	3947, 3952, 3957, 3962, 3967, 3972, 3977, 3982, 3987, 3992, 3997,
	3773, 3778, 3788, 3793, 3803, 3808, 3818, 3823,
	3604, 3609, 3614, 3619, 3624, 3629, 3634, 3639, 3644,
	3435, 3440, 3445, 3450, 3455, 3460, 3465
};

Physical Surface("mox2b") = {5503, 5508, 5513, 5518, 5523, 5528, 5533, 5538, 5543, 5548, 5553, 5558, 5563, 5568, 5573, 5329, 5155, 4981, 4807, 4633, 4459, 4285, 4111, 3937, 3763, 3589, 3415, 3241, 3067, 3072, 3077, 3082, 3087, 3092, 3097, 3102, 3107, 3112, 3117, 3122, 3127, 3132, 3137, 3311, 3485, 3659, 3833, 4007, 4181, 4355, 4529, 4703, 4877, 5051, 5225, 5399, 5334, 5339, 5344, 5354, 5359, 5369, 5374, 5384, 5389, 5394, 3246, 3251, 3256, 3266, 3271, 3281, 3286, 3296, 3301, 3306, 3420, 3430, 3480, 3470, 5160, 5170, 5220, 5210, 4986, 4991, 5046, 5041, 3594, 3599, 3654, 3649, 3942, 4116, 4464, 4638, 4698, 4524, 4176, 4002};
Physical Surface("mox3b") = {5672, 5677, 5682, 5687, 5692, 5697, 5702, 5707, 5712, 5717, 5722, 5727, 5732, 5737, 5742, 5747, 5752, 5498, 5324, 5150, 4976, 4802, 4628, 4454, 4280, 4106, 3932, 3758, 3584, 3410, 3236, 3062, 2888, 2893, 2898, 2903, 2908, 2913, 2918, 2923, 2928, 2933, 2938, 2943, 2948, 2953, 2958, 2963, 2968, 3142, 3316, 3490, 3664, 3838, 4012, 4186, 4360, 4534, 4708, 4882, 5056, 5230, 5404, 5578};

Physical Surface("gtubed") = {5165, 4812, 5349, 4290, 3768, 3425, 3783, 4305, 4827, 5364, 4842, 3798, 3276, 3291, 3813, 4335, 4857, 5379, 5215, 4872, 4350, 3828, 3475, 3261};
Physical Surface("fchamberd") = {4320};

si = 128.52;
Point(18221) = {si/2, 0, 0, h};
Point(18222) = {si/2, si/2, 0, h};
Point(18223) = {0, si/2, 0, h};

Line(5846) = {35, 18221};
Line(5847) = {18221, 18222};
Line(5848) = {18222, 18223};
Line(5849) = {18223, 17680};

Curve Loop(35) = {103, 276, 450, 624, 798, 972, 1146, 1320, 1494, 1668, 1842, 2016, 2190, 2364, 2538, 2712, 2886, 3060, 3234, 3408, 3582, 3756, 3930, 4104, 4278, 4452, 4626, 4800, 4974, 5148, 5322, 5496, 5670, 5844, 5845, 5840, 5835, 5830, 5825, 5820, 5815, 5805, 5800, 5795, 5790, 5785, 5780, 5775, 5770, 5765, 5760, 5755, 5750, 5745, 5740, 5735, 5730, 5725, 5720, 5715, 5710, 5705, 5700, 5695, 5690, 5685, 5680, 5675, -5849, -5848, -5847, -5846};
Plane Surface(5843) = {35};
Physical Surface("reflec") = {5843};
Physical Curve("boundary") = {5847, 5848};


// Colors: UO2
Color Yellow{ Surface{
	1, 104, 278, 452, 626, 800, 974, 1148, 1322, 1496, 1670, 1844, 2018, 2192, 2366, 2540, 2714,
	2, 109, 283, 457, 631, 805, 979, 1153, 1327, 1501, 1675, 1849, 2023, 2197, 2371, 2545, 2719,
	3, 114, 288, 462, 636, 984, 1158, 1506, 1680, 2028, 2202, 2376, 2550, 2724,
	4, 119, 293, 641, 815, 989, 1163, 1337, 1511, 1685, 1859, 2033, 2381, 2555, 2729,
	5, 124, 298, 472, 646, 820, 994, 1168, 1342, 1516, 1690, 1864, 2038, 2212, 2386, 2560, 2734,
	6, 129, 477, 651, 999, 1173, 1521, 1695, 2043, 2217, 2565, 2739,
	7, 134, 308, 482, 656, 830, 1004, 1178, 1352, 1526, 1700, 1874, 2048, 2222, 2396, 2570, 2744,
	8, 139, 313, 487, 661, 835, 1009, 1183, 1357, 1531, 1705, 1879, 2053, 2227, 2401, 2575, 2749,
	9, 144, 492, 666, 1014, 1188, 1536, 1710, 2058,	2232, 2580, 2754,
	10, 149, 323, 497, 671, 845, 1019, 1193, 1367, 1541, 1715, 1889, 2063, 2237, 2411, 2585, 2759,
	11,	154, 328, 502, 676, 850, 1024, 1198, 1372, 1546, 1720, 1894, 2068, 2242, 2416, 2590, 2764,
	12, 159, 507, 681, 1029, 1203, 1551, 1725, 2073, 2247, 2595, 2769,
	13, 164, 338, 512, 686, 860, 1034, 1208, 1382, 1556, 1730, 1904, 2078, 2252, 2426, 2600, 2774,
	14, 169, 343, 691, 865, 1039, 1213, 1387, 1561,	1735, 1909, 2083, 2431, 2605, 2779,
	15, 174, 348, 522, 696, 1044, 1218, 1566, 1740, 2088, 2262, 2436, 2610, 2784,
	16, 179, 353, 527, 701, 875, 1049, 1223, 1397, 1571, 1745, 1919, 2093, 2267, 2441, 2615, 2789,
	17, 184, 358, 532, 706, 880, 1054, 1228, 1402, 1576, 1750, 1924, 2098, 2272, 2446, 2620, 2794
};}
Color Blue{ Surface{
	810, 1332, 1854,
	467, 2207,
	303, 825, 1347, 1869, 2391,
	318, 840, 1884, 2406,
	333, 855, 1377, 1899, 2421,
	517, 2257,  
	870, 1392, 1914
}; }
Color Red{ Surface{1362}; }

// Colors: MOX
Color Grey{ Surface{2302, 2307, 2312, 2317, 2322, 2332, 2337, 2123, 2128, 2133, 2138, 2143, 2148, 2158, 2163, 2168, 1944, 1949, 1959, 1964, 1974, 1984, 1994, 1999, 1770, 1775, 1780, 1785, 1790, 1795, 1800, 1810, 1815, 1820, 1825, 1596, 1601, 1606, 1611, 1616, 1621, 1626, 1636, 1641, 1646, 1651, 1422, 1427, 1437, 1442, 1452, 1462, 1472, 1477, 1248, 1253, 1258, 1263, 1268, 1273, 1278, 1288, 1293, 1298, 1303, 1074, 1079, 1084, 1089, 1094, 1099, 1104, 1114, 1119, 1124, 1129, 955, 950, 940, 930, 920, 915, 905, 900, 731, 736, 741, 746, 751, 756, 766, 771, 776, 597, 592, 582, 577, 572, 567, 562}; }
Color Green{ Surface{2630, 2635, 2640, 2645, 2650, 2655, 2660, 2665, 2670, 2680, 2685, 2690, 2695, 2700, 2705, 2456, 2461, 2466, 2471, 2481, 2486, 2496, 2506, 2516, 2521, 2526, 2531, 2282, 2287, 2297, 2342, 2352, 2357, 2108, 2113, 2118, 2173, 2178, 2183, 1934, 1760, 1765, 1586, 1591, 1412, 1238, 1243, 1064, 1069, 890, 716, 721, 542, 547, 557, 726, 368, 373, 378, 383, 393, 398, 408, 418, 428, 433, 438, 443, 194, 199, 204, 209, 214, 219, 224, 229, 234, 244, 249, 254, 259, 264, 269, 602, 612, 617, 781, 786, 791, 965, 1134, 1139, 1308, 1313, 1487, 1656, 1661, 1830, 1835, 2009}; }
Color Grey{ Surface{34, 33, 32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 189, 363, 537, 711, 885, 1059, 1233, 1407, 1581, 1755, 1929, 2103, 2277, 2451, 2625, 2799, 2804, 2809, 2814, 2819, 2824, 2829, 2834, 2839, 2844, 2854, 2859, 2864, 2869, 2874, 2879, 2884, 2710, 2536, 2362, 2188, 2014, 1840, 1666, 1492, 1318, 1144, 970, 796, 622, 448, 274}; }
Color Blue{ Surface{423, 403, 388, 910, 925, 945, 960, 895, 1417, 1432, 1467, 1482, 1939, 1954, 1969, 1989, 2004, 2476, 2491, 2511, 552, 607, 2292, 2347}; }
Color Red{ Surface{1447}; }
Color Grey{ Surface{
	5175, 5180, 5185, 5190, 5195, 5200, 5205,
	4996, 5001, 5006, 5011, 5016, 5021, 5026, 5031, 5036,
	4817, 4822, 4832, 4837, 4847, 4852, 4862, 4867,
	4643, 4648, 4653, 4658, 4663, 4668, 4673, 4678, 4683, 4688, 4693,
	4469, 4474, 4479, 4484, 4489, 4494, 4499, 4504, 4509, 4514, 4519,
	4295, 4300, 4310, 4315, 4325, 4330, 4340, 4345,
	4121, 4126, 4131, 4136, 4141, 4146, 4151, 4156, 4161, 4166, 4171,
	3947, 3952, 3957, 3962, 3967, 3972, 3977, 3982, 3987, 3992, 3997,
	3773, 3778, 3788, 3793, 3803, 3808, 3818, 3823,
	3604, 3609, 3614, 3619, 3624, 3629, 3634, 3639, 3644,
	3435, 3440, 3445, 3450, 3455, 3460, 3465
}; }

// Colors: UO2
Color Yellow{ Surface{
	5842, 5668, 5494, 5320, 5146, 4972, 4798, 4624, 4450, 4276, 4102, 3928, 3754, 3580, 3406, 3232, 3058,
	5837, 5663, 5489, 5315, 5141, 4967, 4793, 4619, 4445, 4271, 4097, 3923, 3749, 3575, 3401, 3227, 3053,
	5832, 5658, 5484, 5310, 5136, 4788, 4614, 4266, 4092, 3744, 3570, 3396, 3222, 3048,
	5827, 5653, 5479, 5131, 4957, 4783, 4609, 4435, 4261, 4087, 3913, 3739, 3391, 3217, 3043,
	5822, 5648, 5474, 5300, 5126, 4952, 4778, 4604, 4430, 4256, 4082, 3908, 3734, 3560, 3386, 3212, 3038,
	5817, 5643, 5295, 5121, 4773, 4599, 4251, 4077, 3729, 3555, 3207, 3033,
	5812, 5638, 5464, 5290, 5116, 4942, 4768, 4594, 4420, 4246, 4072, 3898, 3724, 3550, 3376, 3202, 3028,
	5802, 5628, 5454, 5280, 5106, 4932, 4758, 4584, 4410, 4236, 4062, 3888, 3714, 3540, 3366, 3192, 3018,
	5797, 5623, 5275, 5101, 4753, 4579, 4231, 4057, 3709, 3535, 3187, 3013,
	5792, 5618, 5444, 5270, 5096, 4922, 4748, 4574, 4400, 4226, 4052, 3878, 3704, 3530, 3356, 3182, 3008,
	5787, 5613, 5439, 5265, 5091, 4917, 4743, 4569, 4395, 4221, 4047, 3873, 3699, 3525, 3351, 3177, 3003,
	5782, 5608, 5260, 5086, 4738, 4564, 4216, 4042, 3694, 3520, 3172, 2998,
	5777, 5603, 5429, 5255, 5081, 4907, 4733, 4559, 4385, 4211, 4037, 3863, 3689, 3515, 3341, 3167, 2993,
	5772, 5598, 5424, 5076, 4902, 4728, 4554, 4380, 4206, 4032, 3858, 3684, 3162, 2988, 3336,
	5767, 5593, 5419, 5245, 5071, 4723, 4549, 4201, 4027, 3679, 3505, 3331, 3157, 2983,
	5762, 5588, 5414, 5240, 5066, 4892, 4718, 4544, 4370, 4196, 4022, 3848, 3674, 3500, 3326, 3152, 2978,
	5757, 5583, 5409, 5235, 5061, 4887, 4713, 4539, 4365, 4191, 4017, 3843, 3669, 3495, 3321, 3147, 2973
};}
Color Blue{ Surface{
	4962, 4440, 3918,
	5305, 3565,
	5469, 4947, 4425, 3903, 3381,
	5449, 4927, 3883, 3361,
	5434, 4912, 4390, 3868, 3346,
	5250, 3510,
	4897, 4375, 3853
}; }
Color Red{ Surface{4405}; }

// Colors: MOX
Color Green{ Surface{5503, 5508, 5513, 5518, 5523, 5528, 5533, 5538, 5543, 5548, 5553, 5558, 5563, 5568, 5573, 5329, 5155, 4981, 4807, 4633, 4459, 4285, 4111, 3937, 3763, 3589, 3415, 3241, 3067, 3072, 3077, 3082, 3087, 3092, 3097, 3102, 3107, 3112, 3117, 3122, 3127, 3132, 3137, 3311, 3485, 3659, 3833, 4007, 4181, 4355, 4529, 4703, 4877, 5051, 5225, 5399, 5334, 5339, 5344, 5354, 5359, 5369, 5374, 5384, 5389, 5394, 3246, 3251, 3256, 3266, 3271, 3281, 3286, 3296, 3301, 3306, 3420, 3430, 3480, 3470, 5160, 5170, 5220, 5210, 4986, 4991, 5046, 5041, 3594, 3599, 3654, 3649, 3942, 4116, 4464, 4638, 4698, 4524, 4176, 4002}; }
Color Grey{ Surface{5672, 5677, 5682, 5687, 5692, 5697, 5702, 5707, 5712, 5717, 5722, 5727, 5732, 5737, 5742, 5747, 5752, 5498, 5324, 5150, 4976, 4802, 4628, 4454, 4280, 4106, 3932, 3758, 3584, 3410, 3236, 3062, 2888, 2893, 2898, 2903, 2908, 2913, 2918, 2923, 2928, 2933, 2938, 2943, 2948, 2953, 2958, 2963, 2968, 3142, 3316, 3490, 3664, 3838, 4012, 4186, 4360, 4534, 4708, 4882, 5056, 5230, 5404, 5578}; }
Color Blue{ Surface{5165, 4812, 5349, 4290, 3768, 3425, 3783, 4305, 4827, 5364, 4842, 3798, 3276, 3291, 3813, 4335, 4857, 5379, 5215, 4872, 4350, 3828, 3475, 3261}; }
Color Red{ Surface{4320}; }
