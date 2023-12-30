/* Assignment 4 */

/* 1 */
data beachspiders;
input GrainSize Spider;
datalines;
0.245 0
0.247 0
0.285 1
0.299 0
0.327 1
0.347 1
0.356 0
0.36 1
0.363 0
0.364 0
0.398 0
0.4 1
0.409 0
0.421 1
0.432 0
0.473 1
0.509 1
0.529 1
0.561 0
0.569 0
0.594 1
0.638 1
0.656 1
0.816 1
0.853 1
0.938 1
1.036 1
1.045 1
;
run;

/* a */
proc logistic data=beachspiders;
	model Spider(event='1') = GrainSize;
run;
/* Spider = -2.8489	+ 7.0418x */

/* b */
proc logistic data=beachspiders;
	model Spider(event='1') = GrainSize / clodds=wald clparm=wald;
run;
/* Since 0.0052 < 0.05, reject null hypothesis.
The GrainSize variable is providing valuable information in predicting the probability of Spider occurrence.
 */

/* c */
proc rank data=beachspiders groups=6 out=c1;
	var GrainSize;
	ranks bins;
run;
proc means nway noprint data=c1;
	class bins;
	var GrainSize Spider;
	output out=results1c sum(Spider)=Spider mean(GrainSize)=GrainSize;
run;
data result_1c;
	set results1c;
	EmpLogit = log((Spider + 0.5)/(_freq_ - Spider + 0.5));
run;
title 'Empirical Logit Plot: Beach Spiders';
proc sgplot data=result_1c;
	reg x=GrainSize y=EmpLogit;
	loess x=GrainSize y=EmpLogit;
run;
title;
/* Plot appears to be linear. Assumptions of linearity are met */

/* d */
proc logistic data=beachspiders;
	model Spider(event='1') = GrainSize/lackfit;
run;
/*
Since 0.4068 > 0.05, fail to reject null hypothesis.
The Hosmer-Lemeshow test did not find evidence of a lack of fit in the model.
*/

/* e */
/*
What I found in (c) supports (d) because the assumptions are met, and the Hosmer-Lemeshow test did not find lack-of-fit
*/

/* 3 */
/* a */
proc logistic data=beachspiders;
	model Spider(event='1') = GrainSize/ctable pprob=0.5;
run;

/* b */
/*
0.706 probability for a correct prediction, 0.545 probability for an incorrect prediction
I think the cutoff being 0.5 is alright.
If we want a higher probability of a correct prediction, then have to lower the cutoff.
However, if we want a higher probability of avoiding false positives, then have to raise the cutoff.
*/

/* c */
proc logistic data=beachspiders;
	model Spider(event='1') = GrainSize/ctable pprob= 0 to 1 by .25;
run;
/*
Sensitivity starts at 100% correct guess rate when the cutoff is 0, however falls to 0% when the cutoff is 1.
Conversely, specificity starts at 0% correct guess rate when the cutoff is 0, however rises to 100% when the cutoff is 1.
I would use the 0.5 cutoff for total accuracy, as it is the most balanced of the bunch.
*/

/* d */
proc logistic data=beachspiders plots=roc;
	model Spider(event='1') = GrainSize;
run;
/*
Since c is 0.759 the model seems to perform reasonably well
*/

filename reffile '/home/u63177396/Modelling in SAS (STA3064)/Yankees.csv';
proc import datafile=reffile
	dbms=csv
	out=work.import;
	getnames=yes;
run;

data yankees;
	set work.import;
run;

/* 2 */
proc logistic data=yankees;
	model Result(event='1') = AB;
run;
proc logistic data=yankees;
	model Result(event='1') = H2B;
run;
proc logistic data=yankees;
	model Result(event='1') = RBI;
run;
proc logistic data=yankees;
	model Result(event='1') = BB;
run;
/*
P-value for AB = 0.3331, greater than 0.05, not statistically significant
P-value for H2B = 0.0003, less than 0.05, is statistically significant
P-value for RBI = <0.0001, less than 0.05, is statistically significant
P-value for BB = 0.0952, less than 0.05, is statistically significant
*/

/* b */
/* RBI is the most effective, as both itself and it's intercept's P-value are <0.0001 */

/* c */
/* AB is the least effective, as both itself and it's intercept are not statistically significant */

/* d */
proc logistic data=yankees;
	model Result(event='1') = RBI/expb;
run;
/*
Odds-ratio = 1.706, 95% = [1.420, 2.049]
for each unit increase in RBI, the odds of winning the baseball game increase by 1.706.
*/

/* e */
proc logistic data=yankees;
	model Result(event='1') = RBI/expb;
	units RBI = 2;
run;
/*
2-unit odds-ratio = 2.910
for each two unit increase in RBI, the odds of winning the baseball game increase by 2.910.
*/


/* 4 */
/* a */
proc logistic data=yankees;
	model Result(event='1') = AB H2B H3B HR RBI BB SO;
run;

/* b */
/* AB, H2B, RBI are statistically significant to the model in (a), with a P-value less than 0.05 */

/* c */
proc logistic data=yankees;
	model Result(event='1') = AB H2B H3B HR RBI BB SO/selection=f;
run;
/* the selection model suggests AB, H2B, RBI as the predictors. */

/* d */
proc logistic data=yankees;
	model Result(event='1') = AB H2B H3B HR RBI BB SO/selection=f lackfit;
run;
/*
Since 0.1488 > 0.05, there is no need to for a non-linear model according to the Hosmer-Lemeshow test.
*/

/* e */
proc logistic data=yankees;
	model Result(event='1') = AB H2B H3B HR RBI BB SO/selection=f iplots influence;
run;
/*
Row 46 Delta Deviance = 6.6671, Row 58 Delta Deviance = 4.5400
*/

/* f */
proc logistic data=yankees plots=roc;
	model Result(event='1') = AB H2B H3B HR RBI BB SO/selection=f;
run;
/*
c = 0.845, so the model works fairly well according to ROC.
*/

























