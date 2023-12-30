data happy;
input Region $ Country $ Index;
datalines;
NA   USA 68
NA   CAN 71
NA   Mex 65
EURO UnK 72
EURO RUS 65
EURO Nor 73
ASIA CHI 51
ASIA IRQ 45
ASIA UAE 66
SA   Bra 61
SA   PER 56
SA   ARG 58
;
run;

data happy_indicator;
set happy;
if Region = "NA" then NA = 1; else NA = 0;
if Region = "EURO" then EURO = 1; else EURO = 0;
if Region = "ASIA" then ASIA = 1; else ASIA = 0;
if Region = "SA" then SA = 1; else SA = 0;
run;

proc reg data=happy_indicator;
	model Index = EURO ASIA SA;
run;

data part2;
df1 = 4;
df2 = 36;
f = 2.78;
c = cdf('f',f,df1,df2);
run;

proc print data=part2;
run;

data filler;
input Voids $ Strength;
datalines;
Low 106
Low 90
Low 103
Low 90
Low 79
Low 88
Low 92
Low 95
Medium 80
Medium 69
Medium 94
Medium 91
Medium 70
Medium 83
Medium 87
Medium 83
High 78
High 80
High 62
High 69
High 76
High 85
High 69
High 85
;
run;

proc glm data=filler;
  class Voids;
  model Strength = Voids;
  means Voids / hovtest=levene;
run;

proc glm data=filler;
  class Voids;
  model Strength = Voids;
  means Voids / tukey;
run;

data watches;
input Person Brand $ RelAcc;
datalines;
1 Apple -0.1
2 Apple -0.2
3 Apple 0.2
4 Apple 0.24
5 Apple 0.14
6 Apple -0.26
7 Apple -0.36
1 Samsung 0.2
2 Samsung 0.18
3 Samsung 0.24
4 Samsung 0.40
5 Samsung 0.27
6 Samsung 0.31
7 Samsung -0.15
;
run;

proc means data=watches mean;
  var RelAcc;
  class Brand;
run;

proc glm data=watches;
  class Brand Person;
  model RelAcc = Brand;
  means Brand / hovtest=levene;
run;

proc glm data=watches;
  class Brand Person;
  model RelAcc = Brand Person;
  means Brand / hovtest=levene;
run;

data sticky;
input Primer Method $ Adhesion;
datalines;
1 Dip 4
1 Dip 4.5
1 Dip 4.3
1 Spray 5.4
1 Spray 4.9
1 Spray 5.6
2 Dip 5.6
2 Dip 4.9
2 Dip 5.4
2 Spray 5.8
2 Spray 6.1
2 Spray 6.3
3 Dip 3.8
3 Dip 3.7
3 Dip 4
3 Spray 5.5
3 Spray 5
3 Spray 5
;
run;

proc glm data=sticky;
  class Primer Method;
  model Adhesion = Primer Method Primer*Method;
  means Primer*Method / hovtest=levene;
run;

proc glm data=sticky;
  class Primer Method;
  model Adhesion = Primer Method Primer*Method;
  means Primer / tukey;
run;

proc sgplot data=sticky;
  scatter x=Primer y=Adhesion / group=Method;
  xaxis label="Primer";
  yaxis label="Adhesion";
run;
















