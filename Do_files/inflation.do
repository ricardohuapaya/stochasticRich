/* =============================================================================
Codigo para comparar el nivel de IPC

Ricardo Huapaya Rey, 13 de Mayo 2013
*/

cls 
clear 

cd "/Users/ricardohuapaya/Documents/Projects/stochasticRich"


import excel "datasets/IPC.xlsx", firstrow clear


drop date


generate date = tm(2000m2) +_n-1


tsset date, monthly


save "datasets/ipc_data.dta", replace


clear


* Ahora si procedemos con el grafico

use "datasets/ipc_data.dta", clear


local inflation ipc_food ipc_transp


keep ipc ipc_food ipc_transp date


label var ipc  "IPC"

label var ipc_food  "IPC Alimentos"

label var ipc_transp  "IPC Transporte"


describe 


drop if date < tm(2015m1)



local optiontitles "place(nwest) al(top) j(left)"

local colorsrich "10 17 40" "18 130 162" "187 62 3"

tsline ipc, ///
         title("Índice de Precios Costa Rica", `optiontitles') ///
         subtitle("Variación Interanual (%), 2015-2022", `optiontitles') ///
         caption("Fuente: BCCR") ///
         xtitle(" ") /// 
         ylabel(#6, angle(0)) ///
         xlabel(, format(%tm_m-y)) ///
         lcolor("145 168 208") ///
         graphregion(color(white)) ///
         plotregion(fcolor(white) ifcolor(white)) ///
         lcolor( "18 130 162" "187 62 3")

graph export "gph/ipc_inflation.png", replace

tsline `inflation', ///
         title("Índice de Precios Costa Rica", `optiontitles') ///
         subtitle("Variación Interanual (%), 2015-2022", `optiontitles') ///
         caption("Fuente: BCCR") ///
         xtitle(" ") /// 
         ylabel(#6, angle(0)) ///
         xlabel(, format(%tm_m-y)) ///
         lcolor("145 168 208") ///
         graphregion(color(white)) ///
         plotregion(fcolor(white) ifcolor(white)) ///
         lcolor( "18 130 162" "187 62 3")
		 
graph export "gph/ipc_inflation2.png", replace

clear 

import excel "datasets/bls_ipc.xlsx", cellrange(A12:D136) firstrow clear

generate date = tm(2012m1) +_n-1

tsset date, monthly

drop SeriesID Year Period

label var Value "IPC"


tsline Value, ///
         title("Índice de Precios Estados Unidos", `optiontitles') ///
         subtitle("Variación Interanual (%), 2012-2022", `optiontitles') ///
         caption("Fuente: BLS") ///
         xtitle(" ") ///
		 ytitle(" ") ///
         ylabel(#6, angle(0)) ///
         xlabel(, format(%tm_m-y)) ///
         lcolor("145 168 208") ///
         graphregion(color(white)) ///
         plotregion(fcolor(white) ifcolor(white)) ///
         lcolor("18 130 162")

graph export "gph/USipc_inflation.png", replace
