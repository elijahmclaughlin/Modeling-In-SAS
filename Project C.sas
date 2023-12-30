/* Project C */

filename reffile '/home/u63177396/Modelling in SAS (STA3064)/Diabetes.csv';

proc import datafile=reffile
	dbms=csv
	out=work.import;
	getnames=yes;
run;

data diabetes;
	set work.import;
run;

/* 4 d */
proc reg data=diabetes;
	model Outcome = Pregnancies Glucose BloodPressure SkinThickness Insulin BMI DiabetesPedigreeFunction Age
	/vif;
run;
/*
all VIF's fall between 1.1 and 1.8, meaning that multicollinearity is not a major concern
*/

/* 4 e */
proc logistic data=diabetes;
	model Outcome(event='1') = Pregnancies Glucose BloodPressure SkinThickness Insulin BMI DiabetesPedigreeFunction Age
	/selection=f;
run;
/*
using selection 'f' Glucose, BMI, Pregnancies, DiabetesPedigreeFunction, and Insulin are statistically significant.
Glucose and BMI are highly statistically significant.
*/

/* 4 f */
/* testing 4e against just Glucose and BMI */
proc logistic data=diabetes;
	model Outcome(event='1') = Glucose BMI;
run;
/*
both models are highly significant. the model from 4e explains more variability, however.
*/

/* 4 g */
proc surveyselect data=diabetes samprate=0.8 method=srs
	outall out=diabetes2;
run;

data training validation;
	set diabetes2;
	if selected = 1 then output training;
	else output validation;
run;

proc logistic data=training;
	model Outcome(event='1') = Pregnancies Glucose Insulin BMI DiabetesPedigreeFunction;
run;
/* training model is statistically significant */

proc logistic data=training;
	model Outcome(event='1') = Pregnancies Glucose Insulin BMI DiabetesPedigreeFunction;
	score data=validation out=scoring_results;
run;
proc print data=scoring_results;
run;

/* 4 h */
proc logistic data=diabetes plots=roc;
	model Outcome(event='1') = Pregnancies Glucose BloodPressure SkinThickness Insulin BMI DiabetesPedigreeFunction Age
	/selection=f;
run;
/* c=0.8417 */

/* my model */
proc logistic data=diabetes plots=roc;
	model Outcome(event='1') = Glucose BMI;
run;
/* c=0.804 */











