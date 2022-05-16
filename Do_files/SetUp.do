cls

/*=======================================================================
usd_crc.do: Pruebas de ruido blanco en el tipo de cambio

Universidad de Costa Rica
Escuela de Economía
Ricardo Huapaya
========================================================================*/

cd "/Users/ricardohuapaya/Documents/Projects/stochasticRich/datasets"

import excel "IPC.xlsx", firstrow clear

drop date

generate date = tm(2000m1) +_n -1

tsset date, monthly

save ipc, replace
