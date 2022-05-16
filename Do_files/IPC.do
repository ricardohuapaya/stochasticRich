clear 

cls

/*=======================================================================
SetUp.do: Genera data en formato .dta

Universidad de Costa Rica
Escuela de Economía
Ricardo Huapaya
========================================================================*/

cd "/Users/ricardohuapaya/Documents/Projects/stochasticRich/datasets"

use ipc_data

drop if date < tm(2015m1)

local $inflation "ipc ipc_food ipc_tranportation"

global opciones1 'title("Inflación Costa Rica 2015-2022")'

twoway tsline $inflation , title("Inflación Costa Rica 2015-2022")
