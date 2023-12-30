/* Project B - Which position and PTS affect NBA player salary? */

filename reffile '/home/u63177396/Modelling in SAS (STA3064)/nba_2022-23_all_stats_with_salary.csv';
proc import datafile=reffile
	dbms=CSV
	out=WORK.IMPORT;
	getnames=YES;
run;

proc contents data=WORK.IMPORT;
run;

data b_data;
	set work.import;
run;

/* data exploration */

proc print data=b_data;
run;

proc corr data=b_data;
	var Salary Age GP GS MP PTS 'Total Minutes'n;
	with Salary Age GP GS MP PTS 'Total Minutes'n;
run;

proc sgscatter data=b_data;
	matrix Salary PTS 'Total Minutes'n;
run;

/* ANOVA modeling */

proc glm data=b_data;
	model Salary = PTS;
run;

proc glm data=b_data;
	class PTS;
	model Salary = PTS/ss3;
	means PTS / hovtest;
run;

proc reg data=b_data;
	model Salary = PTS/r;
run;

/* ANCOVA modeling */

proc glm data=b_data;
	class Position;
	model Salary = PTS Position / ss3 solution;
	means Position / hovtest;
run;

proc sort data=b_data;
	by Position;
run;

proc reg data=b_data;
	by Position;
	model Salary = PTS/r;
run;





























