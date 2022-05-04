
clear;
set mem 500m;
set matsize 10000;
set more off;
capture log close;
pause on;
cd `path';
log off;



log on;
********************************MAIN RESULTS 2006***************************************;
/*2006*/

/*STANDARDIZED VALUES*/

cap program drop _all;
/*WITH CONTROLS */

est clear;
mac def count=1;
foreach x of global Cvars_06z{;
qui  regress `x'  T $controls6  , robust cluster(unique_05);
  est store M$count;
  mac def count=$count+1;
};

est clear;
mac def count=1;
foreach x of global Cvars_06z{;
  qui regress `x'  T $controls6  ;
  est store M$count;
  mac def count=$count+1;
};

suests;


est clear;
mac def count=1;
foreach x of global Cvars_06zm{;
  qui regress `x'  T $controls6  ;
  est store M$count;
  mac def count=$count+1;
};

suests;
/*STANDARDIZED VALUES*/

cap program drop _all;
prog def suests;

   qui suest  M1 M2 M3 M4 M5 M6 M7 M8 M9 M10 M11, cluster(unique_05) dir;
   display "ALL VARIABLES";
   lincom ([M1_mean]T+[M2_mean]T+[M3_mean]T+[M4_mean]T+[M5_mean]T+[M6_mean]T+[M7_mean]T+[M8_mean]T+[M9_mean]T+[M10_mean]T+[M11_mean]T)/11;
   display "ALL VARIABLES WITHOUT MARTIANS TEST";
   lincom ([M1_mean]T+[M2_mean]T+[M3_mean]T+[M5_mean]T+[M6_mean]T+[M7_mean]T+[M8_mean]T+[M9_mean]T+[M10_mean]T+[M11_mean]T)/10;
   display "COGNITIVE AND SOCIO-EMOTIONAL VARIABLES";
   lincom ([M1_mean]T+[M2_mean]T+[M3_mean]T+[M4_mean]T+[M5_mean]T+[M6_mean]T)/6;
   display "COGNITIVE AND SOCIO-EMOTIONAL VARIABLES WITHOUT MARTIANS TEST";
   lincom ([M1_mean]T+[M2_mean]T+[M3_mean]T+[M5_mean]T+[M6_mean]T)/5;
   display "PHYSICAL VARIABLES";
   lincom ([M7_mean]T+[M8_mean]T+[M9_mean]T+[M10_mean]T+[M11_mean]T)/5; 
   display "ALL VARIABLES--EXCLUDING PARENT REPORTS";
   lincom ([M1_mean]T+[M3_mean]T+[M4_mean]T+[M9_mean]T+[M10_mean]T +[M11_mean]T)/6;
   display "COGNITIVE AND SOCIO-EMOTIONAL VARIABLES--EXCLUDING PARENT REPORTS";
   lincom ([M1_mean]T+[M3_mean]T+[M4_mean]T)/3;
   display "PHYSICAL VARIABLES--EXCLUDING PARENT REPORTS";
   lincom ([M9_mean]T+[M10_mean]T +[M11_mean]T)/3; 


end;

/*NO CONTROLS*/

est clear;
mac def count=1;
foreach x of global Cvars_08z{;
qui  regress `x'  T CEDAD* male   , robust cluster(unique_05);
  est store M$count;
  mac def count=$count+1;
};

est clear;
mac def count=1;
foreach x of global Cvars_08z{;
  qui regress `x'  T CEDAD* male    ;
  est store M$count;
  mac def count=$count+1;
};

suests;