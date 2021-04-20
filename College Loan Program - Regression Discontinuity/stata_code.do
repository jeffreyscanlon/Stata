set type double
set more off
clear all

cd "C:\Users\jscanlo2\Downloads"

log using "HW2_jscanlo", replace

use "psu_data.dta", clear

drop psu475t1 m475psut1

keep if qqt1 == 1
keep if psu475 <= 46 & psu475 >=-46

gen m2 = m475psu^2
gen m3 = m475psu^3
gen m_over = m475t1*m475psu
gen m_over2 = m475t1*m2
gen m_over3 = m475t1*m3 


** Panel A **
reg enrolt1 m475t1 psu475 m475psu m_over, robust



** Panel C **
reg everelig1 m475t1 psu475 m475psu m_over, robust


** Panel B **
ivreg everenroll1 (everelig1 = m475t1) psu475 m475psu m_over, robust

log close
translate "HW2_jscanlo.smcl" "HW2_jscanlo2.pdf"


