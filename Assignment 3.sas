/* assignment 3 */

/* part 1 */
data part1;
%let B0 = 5;
%let B1 = -2;
do X = -10 to 10 by 0.1;
	P1 = exp(&B0 + &B1*X);
	P2 = 1+ P1;
	p = p1/p2;
	output;
end;
run;

proc sgplot data=part1;
	series x=X y=p;
run;

	/* 1 a */

data part1a;
%let B0a = 5;
%let B1a = -2;
%let B0b = 5;
%let B1b = -4;
do X = -10 to 10 by 0.1;
	p1a = exp(&B0a + &B1a*X);
	p2a = 1 + p1a;
	p1 = p1a/p2a;
	p1b = exp(&B0b + &B1b*X);
	p2b = 1 + p1b;
	p2 = p1b/p2b;
	output;
end;
run;

proc sgplot data=part1a;
	series x=X y=p1;
	series x=X y=p2;
run;

	/* 1 b */
data part1b;
%let B0a = 5;
%let B1a = -2;
%let B0b = 8;
%let B1b = -2;
do X = -10 to 10 by 0.1;
	p1a = exp(&B0a + &B1a*X);
	p2a = 1 + p1a;
	p1 = p1a/p2a;
	p1b = exp(&B0b + &B1b*X);
	p2b = 1 + p1b;
	p2 = p1b/p2b;
	output;
end;
run;

proc sgplot data=part1b;
	series x=X y=p1;
	series x=X y=p2;
run;

	/* 1 c */
data part1c;
%let B0a = 5;
%let B1a = -2;
%let B0b = 5;
%let B1b = -1;
do X = -10 to 10 by 0.1;
	p1a = exp(&B0a + &B1a*X);
	p2a = 1 + p1a;
	p1 = p1a/p2a;
	p1b = exp(&B0b + &B1b*X);
	p2b = 1 + p1b;
	p2 = p1b/p2b;
	output;
end;
run;

proc sgplot data=part1c;
	series x=X y=p1;
	series x=X y=p2;
run;

	/* 1 d */
data part1d;
%let B0a = 5;
%let B1a = -2;
%let B0b = 3;
%let B1b = -2;
do X = -10 to 10 by 0.1;
	p1a = exp(&B0a + &B1a*X);
	p2a = 1 + p1a;
	p1 = p1a/p2a;
	p1b = exp(&B0b + &B1b*X);
	p2b = 1 + p1b;
	p2 = p1b/p2b;
	output;
end;
run;

proc sgplot data=part1d;
	series x=X y=p1;
	series x=X y=p2;
run;

	/* 1 e */
data part1e;
%let B0a = 5;
%let B1a = -2;
%let B0b = -5;
%let B1b = 2;
do X = -10 to 10 by 0.1;
	p1a = exp(&B0a + &B1a*X);
	p2a = 1 + p1a;
	p1 = p1a/p2a;
	p1b = exp(&B0b + &B1b*X);
	p2b = 1 + p1b;
	p2 = p1b/p2b;
	output;
end;
run;

proc sgplot data=part1e;
	series x=X y=p1;
	series x=X y=p2;
run;

/* part 2 */

	/* (-1,-1) */
data p2a;
%let B0 = -1;
%let B1 = -1;
do X = -10 to 10 by 0.1;
	p1 = exp(&B0 + &B1*X);
	p2 = 1 + p1;
	p = p1/p2;
	output;
end;
run;

proc sgplot data=p2a;
	series x=X y=p;
run;
	/* plot 2 */

	/* (-1,0) */
data p2b;
%let B0 = -1;
%let B1 = 0;
do X = -10 to 10 by 0.1;
	p1 = exp(&B0 + &B1*X);
	p2 = 1 + p1;
	p = p1/p2;
	output;
end;
run;

proc sgplot data=p2b;
	series x=X y=p;
run;
	/* plot 6 */

	/* (-1,1) */
data p2c;
%let B0 = -1;
%let B1 = 1;
do X = -10 to 10 by 0.1;
	p1 = exp(&B0 + &B1*X);
	p2 = 1 + p1;
	p = p1/p2;
	output;
end;
run;

proc sgplot data=p2c;
	series x=X y=p;
run;
	/* plot 4 */
	
	/* (0,-1) */
data p2d;
%let B0 = 0;
%let B1 = -1;
do X = -10 to 10 by 0.1;
	p1 = exp(&B0 + &B1*X);
	p2 = 1 + p1;
	p = p1/p2;
	output;
end;
run;

proc sgplot data=p2d;
	series x=X y=p;
run;
	/* plot 9 */

	/* (0,0) */
data p2e;
%let B0 = 0;
%let B1 = 0;
do X = -10 to 10 by 0.1;
	p1 = exp(&B0 + &B1*X);
	p2 = 1 + p1;
	p = p1/p2;
	output;
end;
run;

proc sgplot data=p2e;
	series x=X y=p;
run;
	/* plot 1 */

	/* (0,1) */
data p2f;
%let B0 = 0;
%let B1 = 1;
do X = -10 to 10 by 0.1;
	p1 = exp(&B0 + &B1*X);
	p2 = 1 + p1;
	p = p1/p2;
	output;
end;
run;

proc sgplot data=p2f;
	series x=X y=p;
run;
	/* either plot 5 */

	/* (1,-1) */
data p2g;
%let B0 = 1;
%let B1 = -1;
do X = -10 to 10 by 0.1;
	p1 = exp(&B0 + &B1*X);
	p2 = 1 + p1;
	p = p1/p2;
	output;
end;
run;

proc sgplot data=p2g;
	series x=X y=p;
run;
	/* plot 7 */

	/* (1,0) */
data p2h;
%let B0 = 1;
%let B1 = 0;
do X = -10 to 10 by 0.1;
	p1 = exp(&B0 + &B1*X);
	p2 = 1 + p1;
	p = p1/p2;
	output;
end;
run;

proc sgplot data=p2h;
	series x=X y=p;
run;
	/* plot 8 */

	/* (1,1) */
data p2i;
%let B0 = 1;
%let B1 = 1;
do X = -10 to 10 by 0.1;
	p1 = exp(&B0 + &B1*X);
	p2 = 1 + p1;
	p = p1/p2;
	output;
end;
run;

proc sgplot data=p2i;
	series x=X y=p;
run;
	/* plot 3 */

/* part 3 */
	/* 3 a */
data p3;
do X = 0 to 30 by 0.1;
  log_odds = 2.5 - 0.2 * X;
  p1 = exp(log_odds);
  p2 = exp(1 + p1);
  p = p1/p2;
  output;
end;
run;

proc sgplot data=p3;
	series x=X y=p;
run;

/* part 4 */
data part4;
input REMISS LI;
datalines;
1 1.9
1 1.4
0 0.8
0 0.7
1 1.3
0 0.6
1 1.0
0 1.9
0 0.8
0 0.5
0 0.7
0 1.2
0 0.4
0 0.8
0 1.1
1 1.9
0 0.5
0 1.0
0 0.6
1 1.1
0 0.4
0 0.6
1 1.0
0 1.6
1 1.7
1 0.9
0 0.7
;
run;

	/* 4 a */
proc sgplot data=part4;
  scatter x=LI y=REMISS;
  loess x=LI y=REMISS / smooth=0.5;
run;

	/* 4 b */
proc logistic data=part4 descending;
  model REMISS = LI/rsquare;
run;

	/* 4 d */
data p4d;
do LI = -1 to 3 by 0.1;
  logit = -3.7771 + 2.8973*LI;
  p1 = exp(logit);
  p2 = 1 + p1;
  p = p1/p2;
  output;
end;
run;

proc sgplot data=p4d;
	series x=LI y=p;
run;



















