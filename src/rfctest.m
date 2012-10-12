%  
%  Quality assurance:
%  This script contains tests for the rainflow count algorithm
%  The time series turning points are given as input. The 
%  calculated result is checked against manually found results.
%  
%  There are 8 tests in total: 
%  - 3 for sinus time series
%  - 3 for cosinus time series
%  - 2 for random time series
%
%  In this file, the first and last point of underlying time
%  series are not included as turning points. Observe that the
%  function sig2ext() includes these end points as turning 
%  points. 
% 
%  Usage:
%           $  octave rfc-test.m | grep -i -e error -e conclusion
%           $  octave rfc-test.m >rfc-testresults.txt
% 
%
%  Author        Date           Note 
%  -------------------------------------------------
%  T. Ottesen   January 2009    GNU Octave, OK
%  

%
%        t      S (turning points for one cycle)
sinus1=[ 1      100
         2     -100];
%
%        t      S (turning points for two cycles)
sinus2=[ 1      100
	 2     -100
	 3      100
	 4     -100];
%
%        t        S (turning points for three cycles)
sinus3=[ 1      100
         2     -100
         3      100
         4     -100
         5      100
         6     -100];
%
%          t      S (turning points for one cycle)
cosinus1=[ 1     -100
           2      100];
%
%          t      S (turning points for two cycles)
cosinus2=[ 1     -100
           2      100
           3     -100
           4      100];
%
%          t      S (turning points for three cycles)
cosinus3=[ 1     -100
           2      100
           3     -100
           4      100
           5     -100
           6      100];
%
%         t      S
random1=[ 1     25
          2    -50
          3      0
          4    -25
          5     50
          6     25
          7     50
          8    -50 
          9      0
          10   -25
          11    25];
%
%         t      S
random2=[ 1      0
	  2    120
	  3     60
	  4    100
	  5     20
	  6    140
	  7   -120
	  8    -80 
	  9   -140
	  10    40
	  11   -40
	  12    20
	  13   -40
	  14   100];

ttp=sinus1(:,1); xtp=sinus1(:,2);
rf=rainflow(xtp,ttp)';
rf(:,1)=2*rf(:,1); % convert amplitudes to ranges
disp("example-sinus1");
disp("range            average     cycles      start       period");
disp(rf);
fasit_sinus1=[ 200.00000     0.00000     0.50000     1.00000     2.00000];
delta=max(max(abs(rf-fasit_sinus1)));
if (delta>0.001)
  disp("error: mismatch for example-sinus1")
else
  disp("conclusion: example-sinus1: OK")
end


ttp=sinus2(:,1); xtp=sinus2(:,2);
rf=rainflow(xtp,ttp)';
rf(:,1)=2*rf(:,1); % convert amplitudes to ranges
disp("example-sinus2");
disp("range            average     cycles      start       period");
disp(rf);
fasit_sinus2=[ 200.00000     0.00000     0.50000     1.00000     2.00000
               200.00000     0.00000     0.50000     2.00000     2.00000
               200.00000     0.00000     0.50000     3.00000     2.00000];
delta=max(max(abs(rf-fasit_sinus2)));
if (delta>0.001)
  disp("error: mismatch for example-sinus2")
else
  disp("conclusion: example-sinus2: OK")
end


ttp=sinus3(:,1); xtp=sinus3(:,2);
rf=rainflow(xtp,ttp)';
rf(:,1)=2*rf(:,1); %  convert amplitudes to ranges
disp("example-sinus3");
disp("range            average     cycles      start       period");
disp(rf);
fasit_sinus3=[ 200.00000     0.00000     0.50000     1.00000     2.00000
               200.00000     0.00000     0.50000     2.00000     2.00000
               200.00000     0.00000     0.50000     3.00000     2.00000
               200.00000     0.00000     0.50000     4.00000     2.00000
               200.00000     0.00000     0.50000     5.00000     2.00000];
delta=max(max(abs(rf-fasit_sinus3)));
if (delta>0.001)
  disp("error: mismatch for example-sinus3")
else
  disp("conclusion: example-sinus3: OK")
end


ttp=cosinus1(:,1); xtp=cosinus1(:,2);
rf=rainflow(xtp,ttp)';
rf(:,1)=2*rf(:,1); %  convert amplitudes to ranges
disp("example-cosinus1");
disp("range            average     cycles      start       period");
disp(rf);
fasit_cosinus1=[ 200.00000     0.00000     0.50000     1.00000     2.00000];
delta=max(max(abs(rf-fasit_cosinus1)));
if (delta>0.001)
  disp("error: mismatch for example-cosinus1")
else
  disp("conclusion: example-cosinus1: OK")
end

ttp=cosinus2(:,1); xtp=cosinus2(:,2);
rf=rainflow(xtp,ttp)';
rf(:,1)=2*rf(:,1); %  convert amplitudes to ranges
disp("example-cosinus2");
disp("range            average     cycles      start       period");
disp(rf);
fasit_cosinus2=[ 200.00000     0.00000     0.50000     1.00000     2.00000
                 200.00000     0.00000     0.50000     2.00000     2.00000
                 200.00000     0.00000     0.50000     3.00000     2.00000];
delta=max(max(abs(rf-fasit_cosinus2)));
if (delta>0.001)
  disp("error: mismatch for example-cosinus2")
else
  disp("conclusion: example-cosinus2: OK")
end

ttp=cosinus3(:,1); xtp=cosinus3(:,2);
rf=rainflow(xtp,ttp)';
rf(:,1)=2*rf(:,1); %  convert amplitudes to ranges
disp("example-cosinus3");
disp("range            average     cycles      start       period");
disp(rf);
fasit_cosinus3=[ 200.00000     0.00000     0.50000     1.00000     2.00000
                 200.00000     0.00000     0.50000     2.00000     2.00000
                 200.00000     0.00000     0.50000     3.00000     2.00000
                 200.00000     0.00000     0.50000     4.00000     2.00000
                 200.00000     0.00000     0.50000     5.00000     2.00000];
delta=max(max(abs(rf-fasit_cosinus3)));
if (delta>0.001)
  disp("error: mismatch for example-cosinus3")
else
  disp("conclusion: example-cosinus3: OK")
end


ttp=random1(:,1); xtp=random1(:,2);
rf=rainflow(xtp,ttp)';
rf(:,1)=2*rf(:,1); %  convert amplitudes to ranges
disp("example-random1");
disp("range            average     cycles      start       period");
disp(rf);
fasit_random1=[ 25.00000   -12.50000     1.00000     3.00000     2.00000
                75.00000   -12.50000     0.50000     1.00000     2.00000
                25.00000    37.50000     1.00000     5.00000     2.00000
               100.00000     0.00000     0.50000     2.00000    10.00000
                25.00000   -12.50000     1.00000     9.00000     2.00000
               100.00000     0.00000     0.50000     7.00000     2.00000
                75.00000   -12.50000     0.50000     8.00000     6.00000];
delta=max(max(abs(rf-fasit_random1)));
if (delta>0.001)
  disp("error: mismatch for example-random1")
else
  disp("conclusion: example-random1: OK")
end


ttp=random2(:,1); xtp=random2(:,2);
rf=rainflow(xtp,ttp)';
rf(:,1)=2*rf(:,1); %  convert amplitudes to ranges
disp("example-random2");
disp("range            average     cycles      start       period");
disp(rf);
fasit_random2=[     40.00000    80.00000     1.00000     3.00000     2.00000
	           100.00000    70.00000     1.00000     2.00000     6.00000
	           140.00000    70.00000     0.50000     1.00000    10.00000
	            40.00000  -100.00000     1.00000     7.00000     2.00000
	            60.00000   -10.00000     1.00000    11.00000     2.00000
	            80.00000     0.00000     1.00000    10.00000     6.00000
	           280.00000     0.00000     0.50000     6.00000     6.00000
	           240.00000   -20.00000     0.50000     9.00000    10.00000];
delta=max(max(abs(rf-fasit_random2)));
if (delta>0.001)
  disp("error: mismatch for example-random2")
else
  disp("conclusion: example-random2: OK")
end
