/* Case Study */

/* Part 1 */
/* a */
data study;
infile datalines dlm=',';
input Beer Phenol Melanoidin DScavAct AScavAct ORAC ReducePower MetalChelate;
datalines;
1,148.23,13.37,0.66,0.81,3.81,0.45,10.65
2,160.38,10.96,0.63,0.64,2.85,0.41,15.47
3,170.41,9.22,0.62,0.81,3.34,0.48,15.7
4,208.65,9.65,0.9,1.01,3.34,0.5,76.65
5,146.03,11.72,0.64,0.9,3.18,0.47,9.39
6,180.19,9.33,0.62,1.48,4.33,0.71,23.38
7,169.06,8.27,0.58,1.45,5.82,0.68,26.09
8,119.04,12.06,0.47,1.17,1.5,0.57,22.5
9,158.99,9.06,0.59,2.23,2.5,0.65,6.39
10,153.04,10.71,0.72,1.52,2.55,0.63,18.39
11,169.51,9.14,0.53,1.46,2.01,0.62,20.55
12,111.05,13.7,0.32,1.13,0.79,0.51,33.71
13,143.5,11.7,0.42,1.32,1.02,0.6,35.83
14,186.96,10.71,0.64,1.66,1.5,0.72,80.89
15,109.5,1.64,0.42,1.21,3.24,0.59,11.98
16,209.95,12.39,0.77,1.82,0.93,0.79,71.22
17,88.47,4.29,0.3,1.19,2.96,0.57,14.49
18,230.25,11.04,0.7,1.87,1.05,0.94,61.89
19,152.96,9.56,0.51,0.16,0.03,0.73,29.67
20,147.42,13.08,0.53,1.41,0.01,0.73,24.63
21,159.81,9.91,0.56,1.47,0.04,0.74,9.95
22,163.23,11.5,0.56,1.4,4.35,0.69,25.18
23,169.59,10.08,0.53,1.35,4.41,0.64,5.36
24,135.76,12.51,0.49,1.28,3.77,0.66,18.99
25,198.62,14.13,0.58,1.56,0.47,0.71,33.54
26,221.94,12.92,0.68,1.87,0.42,1.08,26.12
27,148.8,8.29,0.56,1.36,4.88,0.66,13.2
28,120.02,10.62,0.36,1.15,3.65,0.6,17.03
29,84.64,3.77,0.24,0.66,2.86,0.38,11.42
30,238.33,12.5,0.97,1.82,9.12,0.93,79.75
31,177.83,6.66,0.63,1.22,5.8,0.66,15.66
32,150.11,7.57,0.64,1.16,4.82,0.66,13.26
33,135.92,10.8,0.48,1.1,3.09,0.61,18.38
34,162.99,11.03,0.96,1.83,8.41,1,31.24
35,183.54,10.32,0.63,1.27,6.46,0.7,42.35
36,236.37,12.69,0.86,1.74,7.98,0.89,63.33
37,163.23,9.81,0.58,1.15,5.08,0.65,11.5
38,212.48,6.83,0.8,1.51,7.1,0.83,48.83
39,235.06,13.71,0.75,1.54,6.77,0.88,73.28
40,267.27,14.83,0.91,1.71,6.58,1.3,20.62
;
run;

/* b */
proc sgscatter data=study;
	matrix Beer Phenol Melanoidin DScavAct AScavAct ORAC ReducePower MetalChelate;
run;

proc corr data=study;
   var Beer Phenol Melanoidin DScavAct AScavAct ORAC ReducePower MetalChelate;
   with Beer Phenol Melanoidin DScavAct AScavAct ORAC ReducePower MetalChelate;
run;

/* Part 2*/
/* a */

proc sgplot data=study;
    scatter x=Phenol y=DScavAct;
    reg x=Phenol y=DScavAct;
run;

/* eq: Phenol = 44.85626 + 202.74772*DScavAct */
/* b: r^2=0.6920, explains approx 69.2% of variability */

/* c */
proc reg data=study;
	model Phenol=DScavAct/r;
run;

/* d */
data study_new;
infile datalines dlm=',';
input Beer Phenol Melanoidin DScavAct AScavAct ORAC ReducePower MetalChelate;
datalines;
1,148.23,13.37,0.66,0.81,3.81,0.45,10.65
2,160.38,10.96,0.63,0.64,2.85,0.41,15.47
3,170.41,9.22,0.62,0.81,3.34,0.48,15.7
4,208.65,9.65,0.9,1.01,3.34,0.5,76.65
5,146.03,11.72,0.64,0.9,3.18,0.47,9.39
6,180.19,9.33,0.62,1.48,4.33,0.71,23.38
7,169.06,8.27,0.58,1.45,5.82,0.68,26.09
8,119.04,12.06,0.47,1.17,1.5,0.57,22.5
9,158.99,9.06,0.59,2.23,2.5,0.65,6.39
10,153.04,10.71,0.72,1.52,2.55,0.63,18.39
11,169.51,9.14,0.53,1.46,2.01,0.62,20.55
12,111.05,13.7,0.32,1.13,0.79,0.51,33.71
13,143.5,11.7,0.42,1.32,1.02,0.6,35.83
14,186.96,10.71,0.64,1.66,1.5,0.72,80.89
15,109.5,1.64,0.42,1.21,3.24,0.59,11.98
16,209.95,12.39,0.77,1.82,0.93,0.79,71.22
17,88.47,4.29,0.3,1.19,2.96,0.57,14.49
18,230.25,11.04,0.7,1.87,1.05,0.94,61.89
19,152.96,9.56,0.51,0.16,0.03,0.73,29.67
20,147.42,13.08,0.53,1.41,0.01,0.73,24.63
21,159.81,9.91,0.56,1.47,0.04,0.74,9.95
22,163.23,11.5,0.56,1.4,4.35,0.69,25.18
23,169.59,10.08,0.53,1.35,4.41,0.64,5.36
24,135.76,12.51,0.49,1.28,3.77,0.66,18.99
25,198.62,14.13,0.58,1.56,0.47,0.71,33.54
26,221.94,12.92,0.68,1.87,0.42,1.08,26.12
27,148.8,8.29,0.56,1.36,4.88,0.66,13.2
28,120.02,10.62,0.36,1.15,3.65,0.6,17.03
29,84.64,3.77,0.24,0.66,2.86,0.38,11.42
30,238.33,12.5,0.97,1.82,9.12,0.93,79.75
31,177.83,6.66,0.63,1.22,5.8,0.66,15.66
32,150.11,7.57,0.64,1.16,4.82,0.66,13.26
33,135.92,10.8,0.48,1.1,3.09,0.61,18.38
35,183.54,10.32,0.63,1.27,6.46,0.7,42.35
36,236.37,12.69,0.86,1.74,7.98,0.89,63.33
37,163.23,9.81,0.58,1.15,5.08,0.65,11.5
38,212.48,6.83,0.8,1.51,7.1,0.83,48.83
39,235.06,13.71,0.75,1.54,6.77,0.88,73.28
40,267.27,14.83,0.91,1.71,6.58,1.3,20.62
;
run;

/* removed Beer 34 as it is an outlier */
proc sgplot data=study_new;
    scatter x=Phenol y=DScavAct;
    reg x=Phenol y=DScavAct;
run;

proc reg data=study_new;
	model Phenol=DScavAct;
run;
/* r^2=0.7913, this is the better model */

/* e */
proc reg data=study_new;
	model Phenol=DScavAct / alpha=0.05 clb clm;
run;

/* f */
proc surveyselect data=study_new out=boot
	seed=1234 samprate=1
	method=urs outhits rep=1000;
run;

proc reg data=boot outest=betas noprint;
	model Phenol=DScavAct;
	by replicate;
run;

proc print data=betas (obs=100);
run;

proc sgplot data=betas;
	histogram DScavAct;
	density DScavAct/type=kernel;
run;

proc univariate data=betas noprint;
	var DScavAct;
	output out=bootci pctlpts= 5 95 pctlpre=Conf_Limit_;
run;

proc print data=bootci;
run;
/*
Normal theory CI: [190.53147,269.18252]
BootCI: [200.188,260.178]
*/

/* g */
proc glm data=study_new;
	class DScavAct;
	model Phenol=DScavAct / ss3;
run;

/* h */
data xstar;
input Beer Phenol Melanoidin DScavAct AScavAct ORAC ReducePower MetalChelate;
datalines;
. . . 0.90 . . . .
;
run;

data sn_x;
	set xstar study_new;
run;

proc reg data=sn_x;
	model Phenol=DScavAct / alpha=0.05 clb clm;
run;

proc reg data=sn_x;
	model Phenol = DScavAct/r;
run;
/* predicted value of x* is 237.4375 */

/* Part 3 */
/* a */
/*
the model may be more accurate since it will have more data,
however it could lead to too much data and have the model become inaccurate.
finding variables with the highest corr to Phenol will be ideal
*/

/* b */
proc sgscatter data=study_new;
	matrix Beer Phenol Melanoidin DScavAct AScavAct ORAC ReducePower MetalChelate;
run;

proc corr data=study_new;
   var Beer Phenol Melanoidin DScavAct AScavAct ORAC ReducePower MetalChelate;
   with Beer Phenol Melanoidin DScavAct AScavAct ORAC ReducePower MetalChelate;
run;
/*
similar to 1b, trying to find variables with the highest correlation to Phenol 
DScavAct, AScavAct, ReducePower, MetalChelate all have corr >0.5 and are statistically significant
*/

proc reg data=study_new;
	model Phenol = DScavAct AScavAct ReducePower MetalChelate;
run;

/* c */
/*
r^2=0.9071, indicating the chosen variables explain 90.71% of variance in Phenol, and are statistically significant
*/

/* d */
proc reg data=study_new;
	model Phenol = DScavAct AScavAct ReducePower MetalChelate/r;
run;

/* e */
proc reg data=study_new;
	model Phenol = DScavAct AScavAct ReducePower MetalChelate;
	test DScavAct,AScavAct,ReducePower,MetalChelate;
run;

proc reg data=study_new;
	model Phenol = DScavAct ReducePower MetalChelate;
	test DScavAct,ReducePower,MetalChelate;
run;
/* reject null hypothesis in both full model and reduced model of interest */

/* f */
proc sgplot data=study;
    scatter x=Phenol y=AScavAct;
    reg x=Phenol y=AScavAct;
run;

proc sgplot data=study;
    scatter x=Phenol y=ReducePower;
    reg x=Phenol y=ReducePower;
run;

proc sgplot data=study;
    scatter x=Phenol y=MetalChelate;
    reg x=Phenol y=MetalChelate;
run;


















