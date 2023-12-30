/* Project A */

data texans;
infile datalines dlm=',';
length Tm $ 14;
input Tm $ @@ SRS @@ W;
datalines;
Houston Texans,-8.5,3
Houston Texans,-9.7,4
Houston Texans,-5.5,4
Houston Texans,0.5,10
Houston Texans,3.8,11
Houston Texans,-6.4,4
Houston Texans,-2.6,9
Houston Texans,-0.8,9
Houston Texans,1.7,9
Houston Texans,-7.6,2
Houston Texans,3.5,12
Houston Texans,4.5,10
Houston Texans,-1.8,6
Houston Texans,2,9
Houston Texans,-0.4,8
Houston Texans,0,8
Houston Texans,-4.5,6
Houston Texans,-10,2
Houston Texans,-0.6,7
Houston Texans,-6,5
Houston Texans,-9.4,4
;
run;

proc sgplot data=texans;
    scatter x=SRS y=W;
run;

proc sgplot data=texans;
    scatter x=SRS y=W;
    loess x=SRS y=W;
run;

/* a.1 */
proc sgplot data=texans;
    scatter x=SRS y=W;
    reg x=SRS y=W;
run;

proc reg data=texans;
	model W=SRS;
run;

/* a.2: linear regression line: W = 8.41207 + 0.59954*SRS */
/* b:  */
/* r-sqr: 0.8723 */
/* having this high of an r-sqr value suggests that SRS has a strong correlation for W */

/* d */
data t_texans;
infile datalines dlm=',';
length Tm $ 14;
input Tm $ @@ SRS @@ W;
W_sqrt = sqrt(W);
datalines;
Houston Texans,-8.5,3
Houston Texans,-9.7,4
Houston Texans,-5.5,4
Houston Texans,0.5,10
Houston Texans,3.8,11
Houston Texans,-6.4,4
Houston Texans,-2.6,9
Houston Texans,-0.8,9
Houston Texans,1.7,9
Houston Texans,-7.6,2
Houston Texans,3.5,12
Houston Texans,4.5,10
Houston Texans,-1.8,6
Houston Texans,2,9
Houston Texans,-0.4,8
Houston Texans,0,8
Houston Texans,-4.5,6
Houston Texans,-10,2
Houston Texans,-0.6,7
Houston Texans,-6,5
Houston Texans,-9.4,4
;
run;

proc reg data=t_texans;
	model W_sqrt=SRS;
run;

/* I performed a square-root transformation for 'W'. Results are similar, with R^2 being 0.8605 */

/* e */
proc reg data=texans;
	model W=SRS / alpha=0.05 clb clm;
run;
/*
95% confidence interval is [0.48940,0.70968], and the point slope being approx. 0.59954
This shows a positive correlation between SRS and W, i.e. when SRS is higher W will be higher and vice versa.
*/

/* f */
proc glm data=texans;
	class W;
	model SRS=W / ss3;
run;
/* 'Pr > F' is 0.0007, meaning that the results are statistically significant and the model is effective */

/* g */
data tx_new;
infile datalines dlm=',';
length Tm $ 14;
input Tm $ @@ W @@ SoS;
datalines;
Houston Texans,3,-0.8
Houston Texans,4,0.4
Houston Texans,4,-0.5
Houston Texans,10,1
Houston Texans,11,-1.5
Houston Texans,4,-0.3
Houston Texans,9,0.4
Houston Texans,9,-2.4
Houston Texans,9,-2.3
Houston Texans,2,1.9
Houston Texans,12,-1.8
Houston Texans,10,-1.9
Houston Texans,6,0.5
Houston Texans,9,-1.5
Houston Texans,8,1.4
Houston Texans,8,0.3
Houston Texans,6,1.7
Houston Texans,2,0.7
Houston Texans,7,1.2
Houston Texans,5,1.9
Houston Texans,4,-0.5
;
run;

proc reg data=tx_new;
	model W=SoS;
run;

proc reg data=tx_new;
	model W=SoS / alpha=0.05 clb clm;
run;

/*
95% interval: [-1.96430,-0.14420]
	This is a weak, negative correlation between SoS (Strength of Schedule) and W
Prediction interval: [5.41169,7.90127]
	This is predicting the Houston Texans to get between 5.4 and 7.9 wins this year
*/






