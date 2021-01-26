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

Physical Surface("uo2b_5_1") = {3669};
Physical Surface("uo2b_5_2") = {3674};
Physical Surface("uo2b_5_3") = {3679};
Physical Surface("uo2b_5_4") = {3684};
Physical Surface("uo2b_5_5") = {3689};
Physical Surface("uo2b_5_6") = {3694};
Physical Surface("uo2b_5_7") = {3699};
Physical Surface("uo2b_5_8") = {3704};
Physical Surface("uo2b_5_9") = {3709};
Physical Surface("uo2b_5_10") = {3714};
Physical Surface("uo2b_5_11") = {3724};
Physical Surface("uo2b_5_12") = {3729};
Physical Surface("uo2b_5_13") = {3734};
Physical Surface("uo2b_5_14") = {3739};
Physical Surface("uo2b_5_15") = {3744};
Physical Surface("uo2b_5_16") = {3749};
Physical Surface("uo2b_5_17") = {3754};

Physical Surface("uo2b_6_1") = {3843};
Physical Surface("uo2b_6_2") = {3848};
// Physical Surface("uo2b_6_3") = {};
Physical Surface("uo2b_6_4") = {3858};
Physical Surface("uo2b_6_5") = {3863};
// Physical Surface("uo2b_6_6") = {};
Physical Surface("uo2b_6_7") = {3873};
Physical Surface("uo2b_6_8") = {3878};
// Physical Surface("uo2b_6_9") = {};
Physical Surface("uo2b_6_10") = {3888};
Physical Surface("uo2b_6_11") = {3898};
// Physical Surface("uo2b_6_12") = {};
Physical Surface("uo2b_6_13") = {3908};
Physical Surface("uo2b_6_14") = {3913};
// Physical Surface("uo2b_6_15") = {};
Physical Surface("uo2b_6_16") = {3923};
Physical Surface("uo2b_6_17") = {3928};

Physical Surface("uo2b_7_1") = {4017};
Physical Surface("uo2b_7_2") = {4022};
Physical Surface("uo2b_7_3") = {4027};
Physical Surface("uo2b_7_4") = {4032};
Physical Surface("uo2b_7_5") = {4037};
Physical Surface("uo2b_7_6") = {4042};
Physical Surface("uo2b_7_7") = {4047};
Physical Surface("uo2b_7_8") = {4052};
Physical Surface("uo2b_7_9") = {4057};
Physical Surface("uo2b_7_10") = {4062};
Physical Surface("uo2b_7_11") = {4072};
Physical Surface("uo2b_7_12") = {4077};
Physical Surface("uo2b_7_13") = {4082};
Physical Surface("uo2b_7_14") = {4087};
Physical Surface("uo2b_7_15") = {4092};
Physical Surface("uo2b_7_16") = {4097};
Physical Surface("uo2b_7_17") = {4102};

Physical Surface("uo2b_8_1") = {4191};
Physical Surface("uo2b_8_2") = {4196};
Physical Surface("uo2b_8_3") = {4201};
Physical Surface("uo2b_8_4") = {4206};
Physical Surface("uo2b_8_5") = {4211};
Physical Surface("uo2b_8_6") = {4216};
Physical Surface("uo2b_8_7") = {4221};
Physical Surface("uo2b_8_8") = {4226};
Physical Surface("uo2b_8_9") = {4231};
Physical Surface("uo2b_8_10") = {4236};
Physical Surface("uo2b_8_11") = {4246};
Physical Surface("uo2b_8_12") = {4251};
Physical Surface("uo2b_8_13") = {4256};
Physical Surface("uo2b_8_14") = {4261};
Physical Surface("uo2b_8_15") = {4266};
Physical Surface("uo2b_8_16") = {4271};
Physical Surface("uo2b_8_17") = {4276};

Physical Surface("uo2b_9_1") = {4365};
Physical Surface("uo2b_9_2") = {4370};
// Physical Surface("uo2b_9_3") = {};
Physical Surface("uo2b_9_4") = {4380};
Physical Surface("uo2b_9_5") = {4385};
// Physical Surface("uo2b_9_6") = {};
Physical Surface("uo2b_9_7") = {4395};
Physical Surface("uo2b_9_8") = {4400};
// Physical Surface("uo2b_9_9") = {};
Physical Surface("uo2b_9_10") = {4410};
Physical Surface("uo2b_9_11") = {4420};
// Physical Surface("uo2b_9_12") = {};
Physical Surface("uo2b_9_13") = {4430};
Physical Surface("uo2b_9_14") = {4435};
// Physical Surface("uo2b_9_15") = {};
Physical Surface("uo2b_9_16") = {4445};
Physical Surface("uo2b_9_17") = {4450};

Physical Surface("uo2b_10_1") = {4539};
Physical Surface("uo2b_10_2") = {4544};
Physical Surface("uo2b_10_3") = {4549};
Physical Surface("uo2b_10_4") = {4554};
Physical Surface("uo2b_10_5") = {4559};
Physical Surface("uo2b_10_6") = {4564};
Physical Surface("uo2b_10_7") = {4569};
Physical Surface("uo2b_10_8") = {4574};
Physical Surface("uo2b_10_9") = {4579};
Physical Surface("uo2b_10_10") = {4584};
Physical Surface("uo2b_10_11") = {4594};
Physical Surface("uo2b_10_12") = {4599};
Physical Surface("uo2b_10_13") = {4604};
Physical Surface("uo2b_10_14") = {4609};
Physical Surface("uo2b_10_15") = {4614};
Physical Surface("uo2b_10_16") = {4619};
Physical Surface("uo2b_10_17") = {4624};

Physical Surface("uo2b_11_1") = {4713};
Physical Surface("uo2b_11_2") = {4718};
Physical Surface("uo2b_11_3") = {4723};
Physical Surface("uo2b_11_4") = {4728};
Physical Surface("uo2b_11_5") = {4733};
Physical Surface("uo2b_11_6") = {4738};
Physical Surface("uo2b_11_7") = {4743};
Physical Surface("uo2b_11_8") = {4748};
Physical Surface("uo2b_11_9") = {4753};
Physical Surface("uo2b_11_10") = {4758};
Physical Surface("uo2b_11_11") = {4768};
Physical Surface("uo2b_11_12") = {4773};
Physical Surface("uo2b_11_13") = {4778};
Physical Surface("uo2b_11_14") = {4783};
Physical Surface("uo2b_11_15") = {4788};
Physical Surface("uo2b_11_16") = {4793};
Physical Surface("uo2b_11_17") = {4798};

Physical Surface("uo2b_12_1") = {4887};
Physical Surface("uo2b_12_2") = {4892};
// Physical Surface("uo2b_12_3") = {};
Physical Surface("uo2b_12_4") = {4902};
Physical Surface("uo2b_12_5") = {4907};
// Physical Surface("uo2b_12_6") = {};
Physical Surface("uo2b_12_7") = {4917};
Physical Surface("uo2b_12_8") = {4922};
// Physical Surface("uo2b_12_9") = {};
Physical Surface("uo2b_12_10") = {4932};
Physical Surface("uo2b_12_11") = {4942};
// Physical Surface("uo2b_12_12") = {};
Physical Surface("uo2b_12_13") = {4952};
Physical Surface("uo2b_12_14") = {4957};
// Physical Surface("uo2b_12_15") = {};
Physical Surface("uo2b_12_16") = {4967};
Physical Surface("uo2b_12_17") = {4972};

Physical Surface("uo2b_13_1") = {5061};
Physical Surface("uo2b_13_2") = {5066};
Physical Surface("uo2b_13_3") = {5071};
Physical Surface("uo2b_13_4") = {5076};
Physical Surface("uo2b_13_5") = {5081};
Physical Surface("uo2b_13_6") = {5086};
Physical Surface("uo2b_13_7") = {5091};
Physical Surface("uo2b_13_8") = {5096};
Physical Surface("uo2b_13_9") = {5101};
Physical Surface("uo2b_13_10") = {5106};
Physical Surface("uo2b_13_11") = {5116};
Physical Surface("uo2b_13_12") = {5121};
Physical Surface("uo2b_13_13") = {5126};
Physical Surface("uo2b_13_14") = {5131};
Physical Surface("uo2b_13_15") = {5136};
Physical Surface("uo2b_13_16") = {5141};
Physical Surface("uo2b_13_17") = {5146};

Physical Surface("uo2b_14_1") = {5235};
Physical Surface("uo2b_14_2") = {5240};
Physical Surface("uo2b_14_3") = {5245};
// Physical Surface("uo2b_14_4") = {};
Physical Surface("uo2b_14_5") = {5255};
Physical Surface("uo2b_14_6") = {5260};
Physical Surface("uo2b_14_7") = {5265};
Physical Surface("uo2b_14_8") = {5270};
Physical Surface("uo2b_14_9") = {5275};
Physical Surface("uo2b_14_10") = {5285};
Physical Surface("uo2b_14_11") = {5290};
Physical Surface("uo2b_14_12") = {5295};
Physical Surface("uo2b_14_13") = {5300};
// Physical Surface("uo2b_14_14") = {};
Physical Surface("uo2b_14_15") = {5310};
Physical Surface("uo2b_14_16") = {5315};
Physical Surface("uo2b_14_17") = {5320};

Physical Surface("uo2b_15_1") = {5409};
Physical Surface("uo2b_15_2") = {5414};
Physical Surface("uo2b_15_3") = {5419};
Physical Surface("uo2b_15_4") = {5424};
Physical Surface("uo2b_15_5") = {5429};
// Physical Surface("uo2b_15_6") = {};
Physical Surface("uo2b_15_7") = {5439};
Physical Surface("uo2b_15_8") = {5444};
// Physical Surface("uo2b_15_9") = {};
Physical Surface("uo2b_15_10") = {5454};
Physical Surface("uo2b_15_11") = {5464};
// Physical Surface("uo2b_15_12") = {};
Physical Surface("uo2b_15_13") = {5474};
Physical Surface("uo2b_15_14") = {5479};
Physical Surface("uo2b_15_15") = {5484};
Physical Surface("uo2b_15_16") = {5489};
Physical Surface("uo2b_15_17") = {5494};

Physical Surface("uo2b_16_1") = {5583};
Physical Surface("uo2b_16_2") = {5588};
Physical Surface("uo2b_16_3") = {5593};
Physical Surface("uo2b_16_4") = {5598};
Physical Surface("uo2b_16_5") = {5603};
Physical Surface("uo2b_16_6") = {5608};
Physical Surface("uo2b_16_7") = {5613};
Physical Surface("uo2b_16_8") = {5618};
Physical Surface("uo2b_16_9") = {5623};
Physical Surface("uo2b_16_10") = {5628};
Physical Surface("uo2b_16_11") = {5638};
Physical Surface("uo2b_16_12") = {5643};
Physical Surface("uo2b_16_13") = {5648};
Physical Surface("uo2b_16_14") = {5653};
Physical Surface("uo2b_16_15") = {5658};
Physical Surface("uo2b_16_16") = {5663};
Physical Surface("uo2b_16_17") = {5668};

Physical Surface("uo2b_17_1") = {5757};
Physical Surface("uo2b_17_2") = {5762};
Physical Surface("uo2b_17_3") = {5767};
Physical Surface("uo2b_17_4") = {5772};
Physical Surface("uo2b_17_5") = {5777};
Physical Surface("uo2b_17_6") = {5782};
Physical Surface("uo2b_17_7") = {5787};
Physical Surface("uo2b_17_8") = {5792};
Physical Surface("uo2b_17_9") = {5797};
Physical Surface("uo2b_17_10") = {5802};
Physical Surface("uo2b_17_11") = {5812};
Physical Surface("uo2b_17_12") = {5817};
Physical Surface("uo2b_17_13") = {5822};
Physical Surface("uo2b_17_14") = {5827};
Physical Surface("uo2b_17_15") = {5832};
Physical Surface("uo2b_17_16") = {5837};
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

Physical Surface("moxa_1_1") = {18};
Physical Surface("moxa_1_2") = {19};
Physical Surface("moxa_1_3") = {20};
Physical Surface("moxa_1_4") = {21};
Physical Surface("moxa_1_5") = {22};
Physical Surface("moxa_1_6") = {23};
Physical Surface("moxa_1_7") = {24};
Physical Surface("moxa_1_8") = {25};
Physical Surface("moxa_1_9") = {26};
Physical Surface("moxa_1_10") = {27};
Physical Surface("moxa_1_11") = {28};
Physical Surface("moxa_1_12") = {29};
Physical Surface("moxa_1_13") = {30};
Physical Surface("moxa_1_14") = {31};
Physical Surface("moxa_1_15") = {32};
Physical Surface("moxa_1_16") = {33};
Physical Surface("moxa_1_17") = {34};

Physical Surface("moxa_2_1") = {189};
Physical Surface("moxa_2_2") = {194};
Physical Surface("moxa_2_3") = {199};
Physical Surface("moxa_2_4") = {204};
Physical Surface("moxa_2_5") = {209};
Physical Surface("moxa_2_6") = {214};
Physical Surface("moxa_2_7") = {219};
Physical Surface("moxa_2_8") = {224};
Physical Surface("moxa_2_9") = {229};
Physical Surface("moxa_2_10") = {234};
Physical Surface("moxa_2_11") = {244};
Physical Surface("moxa_2_12") = {249};
Physical Surface("moxa_2_13") = {254};
Physical Surface("moxa_2_14") = {259};
Physical Surface("moxa_2_15") = {264};
Physical Surface("moxa_2_16") = {269};
Physical Surface("moxa_2_17") = {274};

Physical Surface("moxa_3_1") = {363};
Physical Surface("moxa_3_2") = {368};
Physical Surface("moxa_3_3") = {373};
Physical Surface("moxa_3_4") = {378};
Physical Surface("moxa_3_5") = {383};
// Physical Surface("moxa_3_6") = {};
Physical Surface("moxa_3_7") = {393};
Physical Surface("moxa_3_8") = {398};
// Physical Surface("moxa_3_9") = {};
Physical Surface("moxa_3_10") = {408};
Physical Surface("moxa_3_11") = {418};
// Physical Surface("moxa_3_12") = {};
Physical Surface("moxa_3_13") = {428};
Physical Surface("moxa_3_14") = {433};
Physical Surface("moxa_3_15") = {438};
Physical Surface("moxa_3_16") = {443};
Physical Surface("moxa_3_17") = {448};

Physical Surface("moxa_4_1") = {537};
Physical Surface("moxa_4_2") = {542};
Physical Surface("moxa_4_3") = {547};
// Physical Surface("moxa_4_4") = {};
Physical Surface("moxa_4_5") = {557};
Physical Surface("moxa_4_6") = {562};
Physical Surface("moxa_4_7") = {567};
Physical Surface("moxa_4_8") = {572};
Physical Surface("moxa_4_9") = {577};
Physical Surface("moxa_4_10") = {582};
Physical Surface("moxa_4_11") = {592};
Physical Surface("moxa_4_12") = {597};
Physical Surface("moxa_4_13") = {602};
// Physical Surface("moxa_4_14") = {};
Physical Surface("moxa_4_15") = {612};
Physical Surface("moxa_4_16") = {617};
Physical Surface("moxa_4_17") = {622};

Physical Surface("moxa_5_1") = {711};
Physical Surface("moxa_5_2") = {716};
Physical Surface("moxa_5_3") = {721};
Physical Surface("moxa_5_4") = {726};
Physical Surface("moxa_5_5") = {731};
Physical Surface("moxa_5_6") = {736};
Physical Surface("moxa_5_7") = {741};
Physical Surface("moxa_5_8") = {746};
Physical Surface("moxa_5_9") = {751};
Physical Surface("moxa_5_10") = {756};
Physical Surface("moxa_5_11") = {766};
Physical Surface("moxa_5_12") = {771};
Physical Surface("moxa_5_13") = {776};
Physical Surface("moxa_5_14") = {781};
Physical Surface("moxa_5_15") = {786};
Physical Surface("moxa_5_16") = {791};
Physical Surface("moxa_5_17") = {796};

Physical Surface("moxa_6_1") = {885};
Physical Surface("moxa_6_2") = {890};
// Physical Surface("moxa_6_3") = {};
Physical Surface("moxa_6_4") = {900};
Physical Surface("moxa_6_5") = {905};
// Physical Surface("moxa_6_6") = {};
Physical Surface("moxa_6_7") = {915};
Physical Surface("moxa_6_8") = {920};
// Physical Surface("moxa_6_9") = {};
Physical Surface("moxa_6_10") = {930};
Physical Surface("moxa_6_11") = {940};
// Physical Surface("moxa_6_12") = {};
Physical Surface("moxa_6_13") = {950};
Physical Surface("moxa_6_14") = {955};
// Physical Surface("moxa_6_15") = {};
Physical Surface("moxa_6_16") = {965};
Physical Surface("moxa_6_17") = {970};

Physical Surface("moxa_7_1") = {1059};
Physical Surface("moxa_7_2") = {1064};
Physical Surface("moxa_7_3") = {1069};
Physical Surface("moxa_7_4") = {1074};
Physical Surface("moxa_7_5") = {1079};
Physical Surface("moxa_7_6") = {1084};
Physical Surface("moxa_7_7") = {1089};
Physical Surface("moxa_7_8") = {1094};
Physical Surface("moxa_7_9") = {1099};
Physical Surface("moxa_7_10") = {1104};
Physical Surface("moxa_7_11") = {1114};
Physical Surface("moxa_7_12") = {1119};
Physical Surface("moxa_7_13") = {1124};
Physical Surface("moxa_7_14") = {1129};
Physical Surface("moxa_7_15") = {1134};
Physical Surface("moxa_7_16") = {1139};
Physical Surface("moxa_7_17") = {1144};

Physical Surface("moxa_8_1") = {1233};
Physical Surface("moxa_8_2") = {1238};
Physical Surface("moxa_8_3") = {1243};
Physical Surface("moxa_8_4") = {1248};
Physical Surface("moxa_8_5") = {1253};
Physical Surface("moxa_8_6") = {1258};
Physical Surface("moxa_8_7") = {1263};
Physical Surface("moxa_8_8") = {1268};
Physical Surface("moxa_8_9") = {1273};
Physical Surface("moxa_8_10") = {1278};
Physical Surface("moxa_8_11") = {1288};
Physical Surface("moxa_8_12") = {1293};
Physical Surface("moxa_8_13") = {1298};
Physical Surface("moxa_8_14") = {1303};
Physical Surface("moxa_8_15") = {1308};
Physical Surface("moxa_8_16") = {1313};
Physical Surface("moxa_8_17") = {1318};

Physical Surface("moxa_9_1") = {1407};
Physical Surface("moxa_9_2") = {1412};
// Physical Surface("moxa_9_3") = {};
Physical Surface("moxa_9_4") = {1422};
Physical Surface("moxa_9_5") = {1427};
// Physical Surface("moxa_9_6") = {};
Physical Surface("moxa_9_7") = {1437};
Physical Surface("moxa_9_8") = {1442};
// Physical Surface("moxa_9_9") = {};
Physical Surface("moxa_9_10") = {1452};
Physical Surface("moxa_9_11") = {1462};
// Physical Surface("moxa_9_12") = {};
Physical Surface("moxa_9_13") = {1472};
Physical Surface("moxa_9_14") = {1477};
// Physical Surface("moxa_9_15") = {};
Physical Surface("moxa_9_16") = {1487};
Physical Surface("moxa_9_17") = {1492};

Physical Surface("moxa_10_1") = {1581};
Physical Surface("moxa_10_2") = {1586};
Physical Surface("moxa_10_3") = {1591};
Physical Surface("moxa_10_4") = {1596};
Physical Surface("moxa_10_5") = {1601};
Physical Surface("moxa_10_6") = {1606};
Physical Surface("moxa_10_7") = {1611};
Physical Surface("moxa_10_8") = {1616};
Physical Surface("moxa_10_9") = {1621};
Physical Surface("moxa_10_10") = {1626};
Physical Surface("moxa_10_11") = {1636};
Physical Surface("moxa_10_12") = {1641};
Physical Surface("moxa_10_13") = {1646};
Physical Surface("moxa_10_14") = {1651};
Physical Surface("moxa_10_15") = {1656};
Physical Surface("moxa_10_16") = {1661};
Physical Surface("moxa_10_17") = {1666};

Physical Surface("moxa_11_1") = {1755};
Physical Surface("moxa_11_2") = {1760};
Physical Surface("moxa_11_3") = {1765};
Physical Surface("moxa_11_4") = {1770};
Physical Surface("moxa_11_5") = {1775};
Physical Surface("moxa_11_6") = {1780};
Physical Surface("moxa_11_7") = {1785};
Physical Surface("moxa_11_8") = {1790};
Physical Surface("moxa_11_9") = {1795};
Physical Surface("moxa_11_10") = {1800};
Physical Surface("moxa_11_11") = {1810};
Physical Surface("moxa_11_12") = {1815};
Physical Surface("moxa_11_13") = {1820};
Physical Surface("moxa_11_14") = {1825};
Physical Surface("moxa_11_15") = {1830};
Physical Surface("moxa_11_16") = {1835};
Physical Surface("moxa_11_17") = {1840};

Physical Surface("moxa_12_1") = {1929};
Physical Surface("moxa_12_2") = {1934};
// Physical Surface("moxa_12_3") = {};
Physical Surface("moxa_12_4") = {1944};
Physical Surface("moxa_12_5") = {1949};
// Physical Surface("moxa_12_6") = {};
Physical Surface("moxa_12_7") = {1959};
Physical Surface("moxa_12_8") = {1964};
// Physical Surface("moxa_12_9") = {};
Physical Surface("moxa_12_10") = {1974};
Physical Surface("moxa_12_11") = {1984};
// Physical Surface("moxa_12_12") = {};
Physical Surface("moxa_12_13") = {1994};
Physical Surface("moxa_12_14") = {1999};
// Physical Surface("moxa_12_15") = {};
Physical Surface("moxa_12_16") = {2009};
Physical Surface("moxa_12_17") = {2014};

Physical Surface("moxa_13_1") = {2103};
Physical Surface("moxa_13_2") = {2108};
Physical Surface("moxa_13_3") = {2113};
Physical Surface("moxa_13_4") = {2118};
Physical Surface("moxa_13_5") = {2123};
Physical Surface("moxa_13_6") = {2128};
Physical Surface("moxa_13_7") = {2133};
Physical Surface("moxa_13_8") = {2138};
Physical Surface("moxa_13_9") = {2143};
Physical Surface("moxa_13_10") = {2148};
Physical Surface("moxa_13_11") = {2158};
Physical Surface("moxa_13_12") = {2163};
Physical Surface("moxa_13_13") = {2168};
Physical Surface("moxa_13_14") = {2173};
Physical Surface("moxa_13_15") = {2178};
Physical Surface("moxa_13_16") = {2183};
Physical Surface("moxa_13_17") = {2188};

Physical Surface("moxa_14_1") = {2277};
Physical Surface("moxa_14_2") = {2282};
Physical Surface("moxa_14_3") = {2287};
// Physical Surface("moxa_14_4") = {};
Physical Surface("moxa_14_5") = {2297};
Physical Surface("moxa_14_6") = {2302};
Physical Surface("moxa_14_7") = {2307};
Physical Surface("moxa_14_8") = {2312};
Physical Surface("moxa_14_9") = {2317};
Physical Surface("moxa_14_10") = {2322};
Physical Surface("moxa_14_11") = {2332};
Physical Surface("moxa_14_12") = {2337};
Physical Surface("moxa_14_13") = {2342};
// Physical Surface("moxa_14_14") = {};
Physical Surface("moxa_14_15") = {2352};
Physical Surface("moxa_14_16") = {2357};
Physical Surface("moxa_14_17") = {2362};

Physical Surface("moxa_15_1") = {2451};
Physical Surface("moxa_15_2") = {2456};
Physical Surface("moxa_15_3") = {2461};
Physical Surface("moxa_15_4") = {2466};
Physical Surface("moxa_15_5") = {2471};
// Physical Surface("moxa_15_6") = {};
Physical Surface("moxa_15_7") = {2481};
Physical Surface("moxa_15_8") = {2486};
// Physical Surface("moxa_15_9") = {};
Physical Surface("moxa_15_10") = {2496};
Physical Surface("moxa_15_11") = {2506};
// Physical Surface("moxa_15_12") = {};
Physical Surface("moxa_15_13") = {2516};
Physical Surface("moxa_15_14") = {2521};
Physical Surface("moxa_15_15") = {2526};
Physical Surface("moxa_15_16") = {2531};
Physical Surface("moxa_15_17") = {2536};

Physical Surface("moxa_16_1") = {2625};
Physical Surface("moxa_16_2") = {2630};
Physical Surface("moxa_16_3") = {2635};
Physical Surface("moxa_16_4") = {2640};
Physical Surface("moxa_16_5") = {2645};
Physical Surface("moxa_16_6") = {2650};
Physical Surface("moxa_16_7") = {2655};
Physical Surface("moxa_16_8") = {2660};
Physical Surface("moxa_16_9") = {2665};
Physical Surface("moxa_16_10") = {2670};
Physical Surface("moxa_16_11") = {2680};
Physical Surface("moxa_16_12") = {2685};
Physical Surface("moxa_16_13") = {2690};
Physical Surface("moxa_16_14") = {2695};
Physical Surface("moxa_16_15") = {2700};
Physical Surface("moxa_16_16") = {2705};
Physical Surface("moxa_16_17") = {2710};

Physical Surface("moxa_17_1") = {2799};
Physical Surface("moxa_17_2") = {2804};
Physical Surface("moxa_17_3") = {2809};
Physical Surface("moxa_17_4") = {2814};
Physical Surface("moxa_17_5") = {2819};
Physical Surface("moxa_17_6") = {2824};
Physical Surface("moxa_17_7") = {2829};
Physical Surface("moxa_17_8") = {2834};
Physical Surface("moxa_17_9") = {2839};
Physical Surface("moxa_17_10") = {2844};
Physical Surface("moxa_17_11") = {2854};
Physical Surface("moxa_17_12") = {2859};
Physical Surface("moxa_17_13") = {2864};
Physical Surface("moxa_17_14") = {2869};
Physical Surface("moxa_17_15") = {2874};
Physical Surface("moxa_17_16") = {2879};
Physical Surface("moxa_17_17") = {2884};

// Physical Surface("mox1a") = {2302, 2307, 2312, 2317, 2322, 2332, 2337, 2123, 2128, 2133, 2138, 2143, 2148, 2158, 2163, 2168, 1944, 1949, 1959, 1964, 1974, 1984, 1994, 1999, 1770, 1775, 1780, 1785, 1790, 1795, 1800, 1810, 1815, 1820, 1825, 1596, 1601, 1606, 1611, 1616, 1621, 1626, 1636, 1641, 1646, 1651, 1422, 1427, 1437, 1442, 1452, 1462, 1472, 1477, 1248, 1253, 1258, 1263, 1268, 1273, 1278, 1288, 1293, 1298, 1303, 1074, 1079, 1084, 1089, 1094, 1099, 1104, 1114, 1119, 1124, 1129, 955, 950, 940, 930, 920, 915, 905, 900, 731, 736, 741, 746, 751, 756, 766, 771, 776, 597, 592, 582, 577, 572, 567, 562};
// Physical Surface("mox2a") = {2630, 2635, 2640, 2645, 2650, 2655, 2660, 2665, 2670, 2680, 2685, 2690, 2695, 2700, 2705, 2456, 2461, 2466, 2471, 2481, 2486, 2496, 2506, 2516, 2521, 2526, 2531, 2282, 2287, 2297, 2342, 2352, 2357, 2108, 2113, 2118, 2173, 2178, 2183, 1934, 1760, 1765, 1586, 1591, 1412, 1238, 1243, 1064, 1069, 890, 716, 721, 542, 547, 557, 726, 368, 373, 378, 383, 393, 398, 408, 418, 428, 433, 438, 443, 194, 199, 204, 209, 214, 219, 224, 229, 234, 244, 249, 254, 259, 264, 269, 602, 612, 617, 781, 786, 791, 965, 1134, 1139, 1308, 1313, 1487, 1656, 1661, 1830, 1835, 2009};
// Physical Surface("mox3a") = {34, 33, 32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 189, 363, 537, 711, 885, 1059, 1233, 1407, 1581, 1755, 1929, 2103, 2277, 2451, 2625, 2799, 2804, 2809, 2814, 2819, 2824, 2829, 2834, 2839, 2844, 2854, 2859, 2864, 2869, 2874, 2879, 2884, 2710, 2536, 2362, 2188, 2014, 1840, 1666, 1492, 1318, 1144, 970, 796, 622, 448, 274};

Physical Surface("gtubec") = {423, 403, 388, 910, 925, 945, 960, 895, 1417, 1432, 1467, 1482, 1939, 1954, 1969, 1989, 2004, 2476, 2491, 2511, 552, 607, 2292, 2347};
Physical Surface("fchamberc") = {1447};

Physical Surface("moxb_1_1") = {2888};
Physical Surface("moxb_1_2") = {2893};
Physical Surface("moxb_1_3") = {2898};
Physical Surface("moxb_1_4") = {2903};
Physical Surface("moxb_1_5") = {2908};
Physical Surface("moxb_1_6") = {2913};
Physical Surface("moxb_1_7") = {2918};
Physical Surface("moxb_1_8") = {2923};
Physical Surface("moxb_1_9") = {2928};
Physical Surface("moxb_1_10") = {2933};
Physical Surface("moxb_1_11") = {2938};
Physical Surface("moxb_1_12") = {2943};
Physical Surface("moxb_1_13") = {2948};
Physical Surface("moxb_1_14") = {2953};
Physical Surface("moxb_1_15") = {2958};
Physical Surface("moxb_1_16") = {2963};
Physical Surface("moxb_1_17") = {2968};

Physical Surface("moxb_2_1") = {3062};
Physical Surface("moxb_2_2") = {3067};
Physical Surface("moxb_2_3") = {3072};
Physical Surface("moxb_2_4") = {3077};
Physical Surface("moxb_2_5") = {3082};
Physical Surface("moxb_2_6") = {3087};
Physical Surface("moxb_2_7") = {3092};
Physical Surface("moxb_2_8") = {3097};
Physical Surface("moxb_2_9") = {3102};
Physical Surface("moxb_2_10") = {3107};
Physical Surface("moxb_2_11") = {3112};
Physical Surface("moxb_2_12") = {3117};
Physical Surface("moxb_2_13") = {3122};
Physical Surface("moxb_2_14") = {3127};
Physical Surface("moxb_2_15") = {3132};
Physical Surface("moxb_2_16") = {3137};
Physical Surface("moxb_2_17") = {3142};

Physical Surface("moxb_3_1") = {3236};
Physical Surface("moxb_3_2") = {3241};
Physical Surface("moxb_3_3") = {3246};
Physical Surface("moxb_3_4") = {3251};
Physical Surface("moxb_3_5") = {3256};
// Physical Surface("moxb_3_6") = {};
Physical Surface("moxb_3_7") = {3266};
Physical Surface("moxb_3_8") = {3271};
// Physical Surface("moxb_3_9") = {};
Physical Surface("moxb_3_10") = {3281};
Physical Surface("moxb_3_11") = {3286};
// Physical Surface("moxb_3_12") = {};
Physical Surface("moxb_3_13") = {3296};
Physical Surface("moxb_3_14") = {3301};
Physical Surface("moxb_3_15") = {3306};
Physical Surface("moxb_3_16") = {3311};
Physical Surface("moxb_3_17") = {3316};

Physical Surface("moxb_4_1") = {3410};
Physical Surface("moxb_4_2") = {3415};
Physical Surface("moxb_4_3") = {3420};
// Physical Surface("moxb_4_4") = {};
Physical Surface("moxb_4_5") = {3430};
Physical Surface("moxb_4_6") = {3435};
Physical Surface("moxb_4_7") = {3440};
Physical Surface("moxb_4_8") = {3445};
Physical Surface("moxb_4_9") = {3450};
Physical Surface("moxb_4_10") = {3455};
Physical Surface("moxb_4_11") = {3460};
Physical Surface("moxb_4_12") = {3465};
Physical Surface("moxb_4_13") = {3470};
// Physical Surface("moxb_4_14") = {};
Physical Surface("moxb_4_15") = {3480};
Physical Surface("moxb_4_16") = {3485};
Physical Surface("moxb_4_17") = {3490};

Physical Surface("moxb_5_1") = {3584};
Physical Surface("moxb_5_2") = {3589};
Physical Surface("moxb_5_3") = {3594};
Physical Surface("moxb_5_4") = {3599};
Physical Surface("moxb_5_5") = {3604};
Physical Surface("moxb_5_6") = {3609};
Physical Surface("moxb_5_7") = {3614};
Physical Surface("moxb_5_8") = {3619};
Physical Surface("moxb_5_9") = {3624};
Physical Surface("moxb_5_10") = {3629};
Physical Surface("moxb_5_11") = {3634};
Physical Surface("moxb_5_12") = {3639};
Physical Surface("moxb_5_13") = {3644};
Physical Surface("moxb_5_14") = {3649};
Physical Surface("moxb_5_15") = {3654};
Physical Surface("moxb_5_16") = {3659};
Physical Surface("moxb_5_17") = {3664};

Physical Surface("moxb_6_1") = {3758};
Physical Surface("moxb_6_2") = {3763};
// Physical Surface("moxb_6_3") = {};
Physical Surface("moxb_6_4") = {3773};
Physical Surface("moxb_6_5") = {3778};
// Physical Surface("moxb_6_6") = {};
Physical Surface("moxb_6_7") = {3788};
Physical Surface("moxb_6_8") = {3793};
// Physical Surface("moxb_6_9") = {};
Physical Surface("moxb_6_10") = {3803};
Physical Surface("moxb_6_11") = {3808};
// Physical Surface("moxb_6_12") = {};
Physical Surface("moxb_6_13") = {3818};
Physical Surface("moxb_6_14") = {3823};
// Physical Surface("moxb_6_15") = {};
Physical Surface("moxb_6_16") = {3833};
Physical Surface("moxb_6_17") = {3838};

Physical Surface("moxb_7_1") = {3932};
Physical Surface("moxb_7_2") = {3937};
Physical Surface("moxb_7_3") = {3942};
Physical Surface("moxb_7_4") = {3947};
Physical Surface("moxb_7_5") = {3952};
Physical Surface("moxb_7_6") = {3957};
Physical Surface("moxb_7_7") = {3962};
Physical Surface("moxb_7_8") = {3967};
Physical Surface("moxb_7_9") = {3972};
Physical Surface("moxb_7_10") = {3977};
Physical Surface("moxb_7_11") = {3982};
Physical Surface("moxb_7_12") = {3987};
Physical Surface("moxb_7_13") = {3992};
Physical Surface("moxb_7_14") = {3997};
Physical Surface("moxb_7_15") = {4002};
Physical Surface("moxb_7_16") = {4007};
Physical Surface("moxb_7_17") = {4012};

Physical Surface("moxb_8_1") = {4106};
Physical Surface("moxb_8_2") = {4111};
Physical Surface("moxb_8_3") = {4116};
Physical Surface("moxb_8_4") = {4121};
Physical Surface("moxb_8_5") = {4126};
Physical Surface("moxb_8_6") = {4131};
Physical Surface("moxb_8_7") = {4136};
Physical Surface("moxb_8_8") = {4141};
Physical Surface("moxb_8_9") = {4146};
Physical Surface("moxb_8_10") = {4151};
Physical Surface("moxb_8_11") = {4156};
Physical Surface("moxb_8_12") = {4161};
Physical Surface("moxb_8_13") = {4166};
Physical Surface("moxb_8_14") = {4171};
Physical Surface("moxb_8_15") = {4176};
Physical Surface("moxb_8_16") = {4181};
Physical Surface("moxb_8_17") = {4186};

Physical Surface("moxb_9_1") = {4280};
Physical Surface("moxb_9_2") = {4285};
// Physical Surface("moxb_9_3") = {};
Physical Surface("moxb_9_4") = {4295};
Physical Surface("moxb_9_5") = {4300};
// Physical Surface("moxb_9_6") = {};
Physical Surface("moxb_9_7") = {4310};
Physical Surface("moxb_9_8") = {4315};
// Physical Surface("moxb_9_9") = {};
Physical Surface("moxb_9_10") = {4325};
Physical Surface("moxb_9_11") = {4330};
// Physical Surface("moxb_9_12") = {};
Physical Surface("moxb_9_13") = {4340};
Physical Surface("moxb_9_14") = {4345};
// Physical Surface("moxb_9_15") = {};
Physical Surface("moxb_9_16") = {4355};
Physical Surface("moxb_9_17") = {4360};

Physical Surface("moxb_10_1") = {4454};
Physical Surface("moxb_10_2") = {4459};
Physical Surface("moxb_10_3") = {4464};
Physical Surface("moxb_10_4") = {4469};
Physical Surface("moxb_10_5") = {4474};
Physical Surface("moxb_10_6") = {4479};
Physical Surface("moxb_10_7") = {4484};
Physical Surface("moxb_10_8") = {4489};
Physical Surface("moxb_10_9") = {4494};
Physical Surface("moxb_10_10") = {4499};
Physical Surface("moxb_10_11") = {4504};
Physical Surface("moxb_10_12") = {4509};
Physical Surface("moxb_10_13") = {4514};
Physical Surface("moxb_10_14") = {4519};
Physical Surface("moxb_10_15") = {4524};
Physical Surface("moxb_10_16") = {4529};
Physical Surface("moxb_10_17") = {4534};

Physical Surface("moxb_11_1") = {4628};
Physical Surface("moxb_11_2") = {4633};
Physical Surface("moxb_11_3") = {4638};
Physical Surface("moxb_11_4") = {4643};
Physical Surface("moxb_11_5") = {4648};
Physical Surface("moxb_11_6") = {4653};
Physical Surface("moxb_11_7") = {4658};
Physical Surface("moxb_11_8") = {4663};
Physical Surface("moxb_11_9") = {4668};
Physical Surface("moxb_11_10") = {4673};
Physical Surface("moxb_11_11") = {4678};
Physical Surface("moxb_11_12") = {4683};
Physical Surface("moxb_11_13") = {4688};
Physical Surface("moxb_11_14") = {4693};
Physical Surface("moxb_11_15") = {4698};
Physical Surface("moxb_11_16") = {4703};
Physical Surface("moxb_11_17") = {4708};

Physical Surface("moxb_12_1") = {4802};
Physical Surface("moxb_12_2") = {4807};
// Physical Surface("moxb_12_3") = {};
Physical Surface("moxb_12_4") = {4817};
Physical Surface("moxb_12_5") = {4822};
// Physical Surface("moxb_12_6") = {};
Physical Surface("moxb_12_7") = {4832};
Physical Surface("moxb_12_8") = {4837};
// Physical Surface("moxb_12_9") = {};
Physical Surface("moxb_12_10") = {4847};
Physical Surface("moxb_12_11") = {4852};
// Physical Surface("moxb_12_12") = {};
Physical Surface("moxb_12_13") = {4862};
Physical Surface("moxb_12_14") = {4867};
// Physical Surface("moxb_12_15") = {};
Physical Surface("moxb_12_16") = {4877};
Physical Surface("moxb_12_17") = {4882};

Physical Surface("moxb_13_1") = {4976};
Physical Surface("moxb_13_2") = {4981};
Physical Surface("moxb_13_3") = {4986};
Physical Surface("moxb_13_4") = {4991};
Physical Surface("moxb_13_5") = {4996};
Physical Surface("moxb_13_6") = {5001};
Physical Surface("moxb_13_7") = {5006};
Physical Surface("moxb_13_8") = {5011};
Physical Surface("moxb_13_9") = {5016};
Physical Surface("moxb_13_10") = {5021};
Physical Surface("moxb_13_11") = {5026};
Physical Surface("moxb_13_12") = {5031};
Physical Surface("moxb_13_13") = {5036};
Physical Surface("moxb_13_14") = {5041};
Physical Surface("moxb_13_15") = {5046};
Physical Surface("moxb_13_16") = {5051};
Physical Surface("moxb_13_17") = {5056};

Physical Surface("moxb_14_1") = {5150};
Physical Surface("moxb_14_2") = {5155};
Physical Surface("moxb_14_3") = {5160};
// Physical Surface("moxb_14_4") = {};
Physical Surface("moxb_14_5") = {5170};
Physical Surface("moxb_14_6") = {5175};
Physical Surface("moxb_14_7") = {5180};
Physical Surface("moxb_14_8") = {5185};
Physical Surface("moxb_14_9") = {5190};
Physical Surface("moxb_14_10") = {5195};
Physical Surface("moxb_14_11") = {5200};
Physical Surface("moxb_14_12") = {5205};
Physical Surface("moxb_14_13") = {5210};
// Physical Surface("moxb_14_14") = {};
Physical Surface("moxb_14_15") = {5220};
Physical Surface("moxb_14_16") = {5225};
Physical Surface("moxb_14_17") = {5230};

Physical Surface("moxb_15_1") = {5324};
Physical Surface("moxb_15_2") = {5329};
Physical Surface("moxb_15_3") = {5334};
Physical Surface("moxb_15_4") = {5339};
Physical Surface("moxb_15_5") = {5344};
// Physical Surface("moxb_15_6") = {};
Physical Surface("moxb_15_7") = {5354};
Physical Surface("moxb_15_8") = {5359};
// Physical Surface("moxb_15_9") = {};
Physical Surface("moxb_15_10") = {5369};
Physical Surface("moxb_15_11") = {5374};
// Physical Surface("moxb_15_12") = {};
Physical Surface("moxb_15_13") = {5384};
Physical Surface("moxb_15_14") = {5389};
Physical Surface("moxb_15_15") = {5394};
Physical Surface("moxb_15_16") = {5399};
Physical Surface("moxb_15_17") = {5404};

Physical Surface("moxb_16_1") = {5498};
Physical Surface("moxb_16_2") = {5503};
Physical Surface("moxb_16_3") = {5508};
Physical Surface("moxb_16_4") = {5513};
Physical Surface("moxb_16_5") = {5518};
Physical Surface("moxb_16_6") = {5523};
Physical Surface("moxb_16_7") = {5528};
Physical Surface("moxb_16_8") = {5533};
Physical Surface("moxb_16_9") = {5538};
Physical Surface("moxb_16_10") = {5543};
Physical Surface("moxb_16_11") = {5548};
Physical Surface("moxb_16_12") = {5553};
Physical Surface("moxb_16_13") = {5558};
Physical Surface("moxb_16_14") = {5563};
Physical Surface("moxb_16_15") = {5568};
Physical Surface("moxb_16_16") = {5573};
Physical Surface("moxb_16_17") = {5578};

Physical Surface("moxb_17_1") = {5672};
Physical Surface("moxb_17_2") = {5677};
Physical Surface("moxb_17_3") = {5682};
Physical Surface("moxb_17_4") = {5687};
Physical Surface("moxb_17_5") = {5692};
Physical Surface("moxb_17_6") = {5697};
Physical Surface("moxb_17_7") = {5702};
Physical Surface("moxb_17_8") = {5707};
Physical Surface("moxb_17_9") = {5712};
Physical Surface("moxb_17_10") = {5717};
Physical Surface("moxb_17_11") = {5722};
Physical Surface("moxb_17_12") = {5727};
Physical Surface("moxb_17_13") = {5732};
Physical Surface("moxb_17_14") = {5737};
Physical Surface("moxb_17_15") = {5742};
Physical Surface("moxb_17_16") = {5747};
Physical Surface("moxb_17_17") = {5752};

// Physical Surface("mox1b") = {
// 	5175, 5180, 5185, 5190, 5195, 5200, 5205,
// 	4996, 5001, 5006, 5011, 5016, 5021, 5026, 5031, 5036,
// 	4817, 4822, 4832, 4837, 4847, 4852, 4862, 4867,
// 	4643, 4648, 4653, 4658, 4663, 4668, 4673, 4678, 4683, 4688, 4693,
// 	4469, 4474, 4479, 4484, 4489, 4494, 4499, 4504, 4509, 4514, 4519,
// 	4295, 4300, 4310, 4315, 4325, 4330, 4340, 4345,
// 	4121, 4126, 4131, 4136, 4141, 4146, 4151, 4156, 4161, 4166, 4171,
// 	3947, 3952, 3957, 3962, 3967, 3972, 3977, 3982, 3987, 3992, 3997,
// 	3773, 3778, 3788, 3793, 3803, 3808, 3818, 3823,
// 	3604, 3609, 3614, 3619, 3624, 3629, 3634, 3639, 3644,
// 	3435, 3440, 3445, 3450, 3455, 3460, 3465
// };

// Physical Surface("mox2b") = {5503, 5508, 5513, 5518, 5523, 5528, 5533, 5538, 5543, 5548, 5553, 5558, 5563, 5568, 5573, 5329, 5155, 4981, 4807, 4633, 4459, 4285, 4111, 3937, 3763, 3589, 3415, 3241, 3067, 3072, 3077, 3082, 3087, 3092, 3097, 3102, 3107, 3112, 3117, 3122, 3127, 3132, 3137, 3311, 3485, 3659, 3833, 4007, 4181, 4355, 4529, 4703, 4877, 5051, 5225, 5399, 5334, 5339, 5344, 5354, 5359, 5369, 5374, 5384, 5389, 5394, 3246, 3251, 3256, 3266, 3271, 3281, 3286, 3296, 3301, 3306, 3420, 3430, 3480, 3470, 5160, 5170, 5220, 5210, 4986, 4991, 5046, 5041, 3594, 3599, 3654, 3649, 3942, 4116, 4464, 4638, 4698, 4524, 4176, 4002};
// Physical Surface("mox3b") = {5672, 5677, 5682, 5687, 5692, 5697, 5702, 5707, 5712, 5717, 5722, 5727, 5732, 5737, 5742, 5747, 5752, 5498, 5324, 5150, 4976, 4802, 4628, 4454, 4280, 4106, 3932, 3758, 3584, 3410, 3236, 3062, 2888, 2893, 2898, 2903, 2908, 2913, 2918, 2923, 2928, 2933, 2938, 2943, 2948, 2953, 2958, 2963, 2968, 3142, 3316, 3490, 3664, 3838, 4012, 4186, 4360, 4534, 4708, 4882, 5056, 5230, 5404, 5578};

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
