/* importing data */
data beers;
input student beers  BAL;
datalines;
1       5       0.1
2       2       0.03
3       9       0.19
4       8       0.12
5       3       0.04
6       7       0.095
7       3       0.07
8       5       0.06
9       3       0.02
10       5       0.05
11       4       0.07
12       6       0.1
13       5       0.085
14       7       0.09
15       1       0.01
16       4       0.05
;
run;

/* scatter plot */
proc sgplot data=beers;
	scatter x=beers y=BAL;
run;

/* after running the data step we can see that there is a linear correlation between beers and BAL. */
/* since we want to create a linear reg line, we have to find our equation */
/* BAL = Intercept + beers * beers will be our linear equation */

proc reg data=beers;
    model BAL = beers;
run;

proc sgplot data=beers;
	scatter x=beers y=BAL;
	reg x=beers y=BAL;
run;

/* the proc reg gives us the parameters for the linear equation */
/* linear regression equation: BAL = -0.01270 + 0.01796*beers */

data finaid;
input FamInc     Aid     Tuition;
datalines;
92.922     21.72    14.28
0.25       27.47     8.53
53.092     27.75    14.25
50.2       27.22     8.78
137.613    18       24
47.957     18.52    23.48
113.534    13       23
168.579    13       29
208.115    14       28
12.523     25.47    16.53
119.822    21       15
50.563     17.476   18.524
16.12      22.47    13.53
206.932    11       25
68.678     25.72    16.28
73.598     32.72     9.28
218.12     23       19
89.983     16       20
271.974    20       22
118.165    24       18
108.395    15.5     26.5
235.522     7       35
78.926     20       16
76.854     23.52    18.48
98.496     14       22
134.586    10       32
75.157     21.12    20.88
135.857    21       21
79.448     27.5     14.5
80.858     20.55    15.45
86.14      14.3     27.7
40.49      18.32    23.68
143.337    18       24
97.664     10       26
74.713     21       15
178.795    13.6     22.4
71.55      20.47    15.53
92.605     21       15
62.546     21.6     14.4
  0        27.47    14.53
159.981    25.814   10.186
40.397     25.97    10.03
85.203     25.558   16.442
27.164     20.47    21.53
146.397    17       25
14.089     20.42    21.58
217.443    20       22
140.093    15       21
104.147    17.56    24.44
83.333     23.5     18.5
;
run;

proc sgplot data=finaid;
	scatter x=FamInc y=Aid;
run;
/* after running this data step, there appears to be a slight negative correlation between X and Y */

proc reg data=finaid;
    model Aid=FamInc;
run;
/* this data step gives the parameters and relevant risidual plots */
/* linear regression equation: Aid = 24.31933 + (-0.04307)*FamInc */

data trees;
input diam height volume;
datalines;
 8.3    70    10.3
 8.6    65    10.3
 8.8    63    10.2
10.5    72    16.4
10.7    81    18.8
10.8    83    19.7
11      66    15.6
11      75    18.2
11.1    80    22.6
11.2    75    19.9
11.3    79    24.2
11.4    76    21
11.4    76    21.4
11.7    69    21.3
12      75    19.1
12.9    74    22.2
12.9    85    33.8
13.3    86    27.4
13.7    71    25.7
13.8    64    24.9
14      78    34.5
14.2    80    31.7
14.5    74    36.3
16      72    38.3
16.3    77    42.6
17.3    81    55.4
17.5    82    55.7
17.9    80    58.3
18      80    51.5
18      80    51
20.6    87    77
;
run;

proc sgplot data=trees;
	scatter x=diam y=volume;
run;

proc sgplot data=trees;
	scatter x=height y=volume;
run;

/* based off of pure visualization, diameter is the best predictor for volume */

proc sgplot data=trees;
	scatter x=diam y=volume;
	reg x=diam y=volume;
run;

proc reg data=trees;
	model volume=diam;
run;

data retirement;
input Year     SRA;
datalines;
1997     787.08
1998     968.16
1999     1975.08
2000     3990.00
2001     5455.80
2002     6338.60
2003     566.25
2004     7014.90
2005     10500.00
2006     10945.06
2007     12250.80
2008     13035.45
2009     13053.15
2010     14993.60
2011     952.04
2012     17349.69
;
run;

proc reg data=retirement;
	model SRA=Year;
run;

/* SRA = -1732400 + 868.00256*Year */

proc sgplot data=retirement;
	scatter x=Year y=SRA;
	reg x=Year y=SRA;
run;

proc reg data=retirement;
	model SRA=Year;
run;

/* sabbatical years are 2003, 2011 */

data new_retirement;
	set retirement;
	if Year not in (2003,2011);
run;

proc sgplot data=new_retirement;
	scatter x=Year y=SRA;
	reg x=Year y=SRA;
run;

/* fits much better */

proc reg data=new_retirement;
	model SRA=Year;
run;
