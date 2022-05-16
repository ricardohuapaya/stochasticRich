cls

/*=======================================================================
SetUp.do: Genera data en formato .dta

Universidad de Costa Rica
Escuela de Economía
Ricardo Huapaya
========================================================================*/

cd "/Users/ricardohuapaya/Documents/Projects/stochasticRich/datasets"

import excel "IPC.xlsx", firstrow clear

drop date

generate date = tm(2000m2) + _n-1

tsset date, monthly

save ipc_data, replace
