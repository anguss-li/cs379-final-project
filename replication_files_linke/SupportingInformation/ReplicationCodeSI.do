*Supporting information for JCR article Linke et al. 
* MUST RUN THE FIRST FILE BEFOREHAND


cd "/Users/u6002021/Dropbox/jcr_revisions/FinalAnalysisJul18/SupportingInformationResults"

cd "C:\Users\u6001910\Dropbox\RevisionsJCR\AcceptedJCR\ReplicationFiles\SupportingInformation"


*Table SI3 (Main Table 3 with no controls)
eststo clear
*m1
eststo: ols_spatial_HAC vio_support T T_RepDrt T_Loc T_RepDrt_Loc RepDrt_Loc RepDrt loc_rules_bi const_term  if useM1 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100) 
lincomest T + T_RepDrt + T_Loc + T_RepDrt_Loc
estimates save RepDrtLocSupportAllControlsLincomNULL,replace  
qui ols_spatial_HAC vio_support T T_RepDrt T_Loc T_RepDrt_Loc RepDrt_Loc RepDrt loc_rules_bi const_term  if useM1 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100) 
lincomest T + T_RepDrt 
estimates save RepDrtLocCONTROLSupportAllControlsLincomNULL, replace

*m2
 eststo: ols_spatial_HAC vio_support T T_RepDrt T_Trad T_RepDrt_Trad RepDrt_Trad RepDrt trad_rules_bi const_term  if useM2 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_RepDrt + T_Trad + T_RepDrt_Trad
estimates save RepDrtTradSupportAllControlsLincomNULL,replace  
qui ols_spatial_HAC vio_support T T_RepDrt T_Trad T_RepDrt_Trad RepDrt_Trad RepDrt trad_rules_bi const_term  if useM2 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_RepDrt
estimates save RepDrtTradCONTROLSSupportAllControlsLincomNULL,replace  

*m3
eststo: ols_spatial_HAC vio_support T T_RepDrt T_MoreLoc T_RepDrt_MoreLoc RepDrt_MoreLoc RepDrt more_loc_rules_bi const_term  if useM3 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_RepDrt + T_MoreLoc + T_RepDrt_MoreLoc
estimates save RepDrtMoreLocSupportAllControlsLincomNULL,replace  
qui ols_spatial_HAC vio_support T T_RepDrt T_MoreLoc T_RepDrt_MoreLoc RepDrt_MoreLoc RepDrt more_loc_rules_bi const_term  if useM3 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_RepDrt
estimates save RepDrtMoreLocCONTROLSSupportAllControlsLincomNULL,replace 

*m4
eststo: ols_spatial_HAC vio_support T T_RepDrt T_MoreTrad T_RepDrt_MoreTrad RepDrt_MoreTrad RepDrt more_trad_rules_bi const_term if useM4 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_RepDrt + T_MoreTrad + T_RepDrt_MoreTrad 
estimates save RepDrtMoreTradSupportAllControlsLincomNULL, replace
qui ols_spatial_HAC vio_support T T_RepDrt T_MoreTrad T_RepDrt_MoreTrad RepDrt_MoreTrad RepDrt more_trad_rules_bi const_term  if useM4 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_RepDrt 
estimates save RepDrtMoreTradCONTROLSSupportAllControlsLincomNULL, replace

estimates use RepDrtLocCONTROLSupportAllControlsLincomNULL
eststo m1LinComControlNULL
estimates use RepDrtLocSupportAllControlsLincomNULL
eststo m1LinComTreatNULL

estimates use RepDrtTradCONTROLSSupportAllControlsLincomNULL
eststo m2LinComControlNULL
estimates use RepDrtTradSupportAllControlsLincomNULL
eststo m2LinComTreatNULL

estimates use RepDrtMoreTradCONTROLSSupportAllControlsLincomNULL
eststo m3LinComControlNULL
estimates use RepDrtMoreLocSupportAllControlsLincomNULL
eststo m3LinComTreatNULL

estimates use RepDrtMoreTradCONTROLSSupportAllControlsLincomNULL
eststo m4LinComControlNULL
estimates use RepDrtMoreTradSupportAllControlsLincomNULL
eststo m4LinComTreatNULL

esttab using TableSI3Results.csv, b(4) se r2 replace wide starlevels( + .1 * .05 ** .01 *** .001)
eststo clear

* model for Table SI4 (Main Table 4 with no controls) 
eststo clear
*m1
eststo: ols_spatial_HAC vio_support T T_TAM2nd T_Loc T_TAM2nd_Loc TAM2nd_Loc TAMBelow2nd loc_rules_bi const_term if useM1 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100) 
lincomest T + T_TAM2nd + T_Loc + T_TAM2nd_Loc
estimates save ObsDrtLocSupportAllControlsLincom,replace  
qui ols_spatial_HAC vio_support T T_TAM2nd T_Loc T_TAM2nd_Loc TAM2nd_Loc TAMBelow2nd loc_rules_bi const_term if useM1 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100) 
lincomest T + T_TAM2nd 
estimates save ObsDrtLocCONTROLSupportAllControlsLincom,replace  

*m2
eststo: ols_spatial_HAC vio_support T T_TAM2nd T_Trad T_TAM2nd_Trad TAM2nd_Trad TAMBelow2nd trad_rules_bi const_term if useM2 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM2nd + T_Trad + T_TAM2nd_Trad
estimates save ObsDrtTradSupportAllControlsLincom,replace  
qui ols_spatial_HAC vio_support T T_TAM2nd T_Trad T_TAM2nd_Trad TAM2nd_Trad TAMBelow2nd trad_rules_bi const_term if useM2 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM2nd 
estimates save ObsDrtTradCONTROLSSupportAllControlsLincom,replace  

*m3
eststo: ols_spatial_HAC vio_support T T_TAM2nd T_MoreLoc T_TAM2nd_MoreLoc TAM2nd_MoreLoc TAMBelow2nd more_loc_rules_bi const_term if useM3 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM2nd + T_MoreLoc + T_TAM2nd_MoreLoc
estimates save ObsDrtMoreLocSupportAllControlsLincom,replace  
qui ols_spatial_HAC vio_support T T_TAM2nd T_MoreLoc T_TAM2nd_MoreLoc TAM2nd_MoreLoc TAMBelow2nd more_loc_rules_bi const_term if useM3 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM2nd 
estimates save ObsDrtMoreLocCONTROLSSupportAllControlsLincom,replace 

*m4
eststo: ols_spatial_HAC vio_support T T_TAM2nd T_MoreTrad T_TAM2nd_MoreTrad TAM2nd_MoreTrad TAMBelow2nd more_trad_rules_bi const_term if useM4 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM2nd + T_MoreTrad + T_TAM2nd_MoreTrad 
estimates save ObsDrtMoreTradSupportAllControlsLincom, replace
qui ols_spatial_HAC vio_support T T_TAM2nd T_MoreTrad T_TAM2nd_MoreTrad TAM2nd_MoreTrad TAMBelow2nd more_trad_rules_bi const_term if useM4 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM2nd 
estimates save ObsDrtMoreTradCONTROLSSupportAllControlsLincom, replace

estimates use ObsDrtLocCONTROLSupportAllControlsLincom
eststo m1ObsLinComControl
estimates use ObsDrtLocSupportAllControlsLincom
eststo m1ObsLinComTreat

estimates use ObsDrtTradCONTROLSSupportAllControlsLincom
eststo m2ObsLinComControl
estimates use ObsDrtTradSupportAllControlsLincom
eststo m2ObsLinComTreat

estimates use ObsDrtMoreLocCONTROLSSupportAllControlsLincom
eststo m3ObsLinComControl
estimates use ObsDrtMoreLocSupportAllControlsLincom
eststo m3ObsLinComTreat

estimates use ObsDrtMoreTradCONTROLSSupportAllControlsLincom
eststo m4ObsLinComControl
estimates use ObsDrtMoreTradSupportAllControlsLincom
eststo m4ObsLinComTreat

esttab using TableSI4Results.csv, b(4) se r2 replace wide starlevels( + .1 * .05 ** .01 *** .001)
eststo clear

* Model for Table SI5 (Main Table 5 with no controls)
*m1
eststo: ols_spatial_HAC SumPost1_50k T T_RepDrt T_Loc T_RepDrt_Loc RepDrt_Loc RepDrt loc_rules_bi const_term  if useM1 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100) 
lincomest T + T_RepDrt + T_Loc + T_RepDrt_Loc
estimates save RepDrtLocSupportAllControlsLincomNULL,replace  
qui ols_spatial_HAC SumPost1_50k T T_RepDrt T_Loc T_RepDrt_Loc RepDrt_Loc RepDrt loc_rules_bi const_term  if useM1 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100) 
lincomest T + T_RepDrt 
estimates save RepDrtLocCONTROLSupportAllControlsLincomNULL, replace

*m2
 eststo: ols_spatial_HAC SumPost1_50k T T_RepDrt T_Trad T_RepDrt_Trad RepDrt_Trad RepDrt trad_rules_bi const_term  if useM2 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_RepDrt + T_Trad + T_RepDrt_Trad
estimates save RepDrtTradSupportAllControlsLincomNULL,replace  
qui ols_spatial_HAC SumPost1_50k T T_RepDrt T_Trad T_RepDrt_Trad RepDrt_Trad RepDrt trad_rules_bi const_term  if useM2 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_RepDrt
estimates save RepDrtTradCONTROLSSupportAllControlsLincomNULL,replace  

*m3
eststo: ols_spatial_HAC SumPost1_50k T T_RepDrt T_MoreLoc T_RepDrt_MoreLoc RepDrt_MoreLoc RepDrt more_loc_rules_bi const_term  if useM3 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_RepDrt + T_MoreLoc + T_RepDrt_MoreLoc
estimates save RepDrtMoreLocSupportAllControlsLincomNULL,replace  
qui ols_spatial_HAC SumPost1_50k T T_RepDrt T_MoreLoc T_RepDrt_MoreLoc RepDrt_MoreLoc RepDrt more_loc_rules_bi const_term  if useM3 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_RepDrt
estimates save RepDrtMoreLocCONTROLSSupportAllControlsLincomNULL,replace 

*m4
eststo: ols_spatial_HAC SumPost1_50k T T_RepDrt T_MoreTrad T_RepDrt_MoreTrad RepDrt_MoreTrad RepDrt more_trad_rules_bi const_term if useM4 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_RepDrt + T_MoreTrad + T_RepDrt_MoreTrad 
estimates save RepDrtMoreTradSupportAllControlsLincomNULL, replace
qui ols_spatial_HAC SumPost1_50k T T_RepDrt T_MoreTrad T_RepDrt_MoreTrad RepDrt_MoreTrad RepDrt more_trad_rules_bi const_term  if useM4 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_RepDrt 
estimates save RepDrtMoreTradCONTROLSSupportAllControlsLincomNULL, replace

estimates use RepDrtLocCONTROLSupportAllControlsLincomNULL
eststo m1LinComControlNULL
estimates use RepDrtLocSupportAllControlsLincomNULL
eststo m1LinComTreatNULL

estimates use RepDrtTradCONTROLSSupportAllControlsLincomNULL
eststo m2LinComControlNULL
estimates use RepDrtTradSupportAllControlsLincomNULL
eststo m2LinComTreatNULL

estimates use RepDrtMoreTradCONTROLSSupportAllControlsLincomNULL
eststo m3LinComControlNULL
estimates use RepDrtMoreLocSupportAllControlsLincomNULL
eststo m3LinComTreatNULL

estimates use RepDrtMoreTradCONTROLSSupportAllControlsLincomNULL
eststo m4LinComControlNULL
estimates use RepDrtMoreTradSupportAllControlsLincomNULL
eststo m4LinComTreatNULL

esttab using TableSI5Results.csv, b(4) se r2 replace wide starlevels( + .1 * .05 ** .01 *** .001)
eststo clear

*Models for Table SI6 (Main Table 6 without controls)******add at least the vio control!
eststo clear
*m1
eststo: ols_spatial_HAC SumPost1_50k T T_TAM2nd T_Loc T_TAM2nd_Loc TAM2nd_Loc TAMBelow2nd loc_rules_bi const_term SumPre5_50k  if useM1 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100) 
lincomest T + T_TAM2nd + T_Loc + T_TAM2nd_Loc
estimates save ObsDrtLocSupportAllControlsLincom,replace  
qui ols_spatial_HAC SumPost1_50k T T_TAM2nd T_Loc T_TAM2nd_Loc TAM2nd_Loc TAMBelow2nd loc_rules_bi const_term SumPre5_50k if useM1 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100) 
lincomest T + T_TAM2nd 
estimates save ObsDrtLocCONTROLSupportAllControlsLincom,replace  

*m2
eststo: ols_spatial_HAC SumPost1_50k T T_TAM2nd T_Trad T_TAM2nd_Trad TAM2nd_Trad TAMBelow2nd trad_rules_bi const_term SumPre5_50k  if useM2 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM2nd + T_Trad + T_TAM2nd_Trad
estimates save ObsDrtTradSupportAllControlsLincom,replace  
qui ols_spatial_HAC SumPost1_50k T T_TAM2nd T_Trad T_TAM2nd_Trad TAM2nd_Trad TAMBelow2nd trad_rules_bi const_term SumPre5_50k if useM2 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM2nd 
estimates save ObsDrtTradCONTROLSSupportAllControlsLincom,replace  

*m3
eststo: ols_spatial_HAC SumPost1_50k T T_TAM2nd T_MoreLoc T_TAM2nd_MoreLoc TAM2nd_MoreLoc TAMBelow2nd more_loc_rules_bi const_term SumPre5_50k if useM3 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM2nd + T_MoreLoc + T_TAM2nd_MoreLoc
estimates save ObsDrtMoreLocSupportAllControlsLincom,replace  
qui ols_spatial_HAC SumPost1_50k T T_TAM2nd T_MoreLoc T_TAM2nd_MoreLoc TAM2nd_MoreLoc TAMBelow2nd more_loc_rules_bi const_term SumPre5_50k if useM3 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM2nd 
estimates save ObsDrtMoreLocCONTROLSSupportAllControlsLincom,replace 

*m4
eststo: ols_spatial_HAC SumPost1_50k T T_TAM2nd T_MoreTrad T_TAM2nd_MoreTrad TAM2nd_MoreTrad TAMBelow2nd more_trad_rules_bi const_term SumPre5_50k if useM4 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM2nd + T_MoreTrad + T_TAM2nd_MoreTrad 
estimates save ObsDrtMoreTradSupportAllControlsLincom, replace
qui ols_spatial_HAC SumPost1_50k T T_TAM2nd T_MoreTrad T_TAM2nd_MoreTrad TAM2nd_MoreTrad TAMBelow2nd more_trad_rules_bi const_term SumPre5_50k if useM4 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM2nd 
estimates save ObsDrtMoreTradCONTROLSSupportAllControlsLincom, replace

estimates use ObsDrtLocCONTROLSupportAllControlsLincom
eststo m1ObsLinComControl
estimates use ObsDrtLocSupportAllControlsLincom
eststo m1ObsLinComTreat

estimates use ObsDrtTradCONTROLSSupportAllControlsLincom
eststo m2ObsLinComControl
estimates use ObsDrtTradSupportAllControlsLincom
eststo m2ObsLinComTreat

estimates use ObsDrtMoreLocCONTROLSSupportAllControlsLincom
eststo m3ObsLinComControl
estimates use ObsDrtMoreLocSupportAllControlsLincom
eststo m3ObsLinComTreat

estimates use ObsDrtMoreTradCONTROLSSupportAllControlsLincom
eststo m4ObsLinComControl
estimates use ObsDrtMoreTradSupportAllControlsLincom
eststo m4ObsLinComTreat

esttab using TableSI6Results.csv, b(4) se r2 replace wide starlevels( + .1 * .05 ** .01 *** .001)

eststo clear
* model for Table SI7 (main Table 4 with 1st threshold for drought) 
eststo clear
*m1
eststo: ols_spatial_HAC vio_support T T_TAM1st T_Loc T_TAM1st_Loc TAM1st_Loc TAMBelow1st loc_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM1 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100) 
lincomest T + T_TAM1st + T_Loc + T_TAM1st_Loc
estimates save ObsDrtLocSupportAllControlsLincom,replace  
qui ols_spatial_HAC vio_support T T_TAM1st T_Loc T_TAM1st_Loc TAM1st_Loc TAMBelow1st loc_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM1 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100) 
lincomest T + T_TAM1st 
estimates save ObsDrtLocCONTROLSupportAllControlsLincom,replace  

*m2
eststo: ols_spatial_HAC vio_support T T_TAM1st T_Trad T_TAM1st_Trad TAM1st_Trad TAMBelow1st trad_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM2 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM1st + T_Trad + T_TAM1st_Trad
estimates save ObsDrtTradSupportAllControlsLincom,replace  
qui ols_spatial_HAC vio_support T T_TAM1st T_Trad T_TAM1st_Trad TAM1st_Trad TAMBelow1st trad_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM2 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM1st 
estimates save ObsDrtTradCONTROLSSupportAllControlsLincom,replace  

*m3
eststo: ols_spatial_HAC vio_support T T_TAM1st T_MoreLoc T_TAM1st_MoreLoc TAM1st_MoreLoc TAMBelow1st more_loc_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM3 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM1st + T_MoreLoc + T_TAM1st_MoreLoc
estimates save ObsDrtMoreLocSupportAllControlsLincom,replace  
qui ols_spatial_HAC vio_support T T_TAM1st T_MoreLoc T_TAM1st_MoreLoc TAM1st_MoreLoc TAMBelow1st more_loc_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM3 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM1st 
estimates save ObsDrtMoreLocCONTROLSSupportAllControlsLincom,replace 

*m4
eststo: ols_spatial_HAC vio_support T T_TAM1st T_MoreTrad T_TAM1st_MoreTrad TAM1st_MoreTrad TAMBelow1st more_trad_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM4 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM1st + T_MoreTrad + T_TAM1st_MoreTrad 
estimates save ObsDrtMoreTradSupportAllControlsLincom, replace
qui ols_spatial_HAC vio_support T T_TAM1st T_MoreTrad T_TAM1st_MoreTrad TAM1st_MoreTrad TAMBelow1st more_trad_rules_bi const_term  DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM4 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM1st 
estimates save ObsDrtMoreTradCONTROLSSupportAllControlsLincom, replace

estimates use ObsDrtLocCONTROLSupportAllControlsLincom
eststo m1ObsLinComControl
estimates use ObsDrtLocSupportAllControlsLincom
eststo m1ObsLinComTreat

estimates use ObsDrtTradCONTROLSSupportAllControlsLincom
eststo m2ObsLinComControl
estimates use ObsDrtTradSupportAllControlsLincom
eststo m2ObsLinComTreat

estimates use ObsDrtMoreLocCONTROLSSupportAllControlsLincom
eststo m3ObsLinComControl
estimates use ObsDrtMoreLocSupportAllControlsLincom
eststo m3ObsLinComTreat

estimates use ObsDrtMoreTradCONTROLSSupportAllControlsLincom
eststo m4ObsLinComControl
estimates use ObsDrtMoreTradSupportAllControlsLincom
eststo m4ObsLinComTreat

esttab using TableSI7Results.csv, b(4) se r2 replace wide starlevels( + .1 * .05 ** .01 *** .001)
eststo clear

* model for Table SI8 (main Table 6 with 1st threshold for drought) 
eststo clear
*m1
eststo: ols_spatial_HAC SumPost1_50k T T_TAM1st T_Loc T_TAM1st_Loc TAM1st_Loc TAMBelow1st loc_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM1 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100) 
lincomest T + T_TAM1st + T_Loc + T_TAM1st_Loc
estimates save ObsDrtLocSupportAllControlsLincom,replace  
qui ols_spatial_HAC SumPost1_50k T T_TAM1st T_Loc T_TAM1st_Loc TAM1st_Loc TAMBelow1st loc_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM1 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100) 
lincomest T + T_TAM1st 
estimates save ObsDrtLocCONTROLSupportAllControlsLincom,replace  

*m2
eststo: ols_spatial_HAC SumPost1_50k T T_TAM1st T_Trad T_TAM1st_Trad TAM1st_Trad TAMBelow1st trad_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM2 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM1st + T_Trad + T_TAM1st_Trad
estimates save ObsDrtTradSupportAllControlsLincom,replace  
qui ols_spatial_HAC SumPost1_50k T T_TAM1st T_Trad T_TAM1st_Trad TAM1st_Trad TAMBelow1st trad_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM2 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM1st 
estimates save ObsDrtTradCONTROLSSupportAllControlsLincom,replace  

*m3
eststo: ols_spatial_HAC SumPost1_50k T T_TAM1st T_MoreLoc T_TAM1st_MoreLoc TAM1st_MoreLoc TAMBelow1st more_loc_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM3 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM1st + T_MoreLoc + T_TAM1st_MoreLoc
estimates save ObsDrtMoreLocSupportAllControlsLincom,replace  
qui ols_spatial_HAC SumPost1_50k T T_TAM1st T_MoreLoc T_TAM1st_MoreLoc TAM1st_MoreLoc TAMBelow1st more_loc_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM3 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM1st 
estimates save ObsDrtMoreLocCONTROLSSupportAllControlsLincom,replace 

*m4
eststo: ols_spatial_HAC SumPost1_50k T T_TAM1st T_MoreTrad T_TAM1st_MoreTrad TAM1st_MoreTrad TAMBelow1st more_trad_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM4 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM1st + T_MoreTrad + T_TAM1st_MoreTrad 
estimates save ObsDrtMoreTradSupportAllControlsLincom, replace
qui ols_spatial_HAC SumPost1_50k T T_TAM1st T_MoreTrad T_TAM1st_MoreTrad TAM1st_MoreTrad TAMBelow1st more_trad_rules_bi const_term  DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM4 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM1st 
estimates save ObsDrtMoreTradCONTROLSSupportAllControlsLincom, replace

estimates use ObsDrtLocCONTROLSupportAllControlsLincom
eststo m1ObsLinComControl
estimates use ObsDrtLocSupportAllControlsLincom
eststo m1ObsLinComTreat

estimates use ObsDrtTradCONTROLSSupportAllControlsLincom
eststo m2ObsLinComControl
estimates use ObsDrtTradSupportAllControlsLincom
eststo m2ObsLinComTreat

estimates use ObsDrtMoreLocCONTROLSSupportAllControlsLincom
eststo m3ObsLinComControl
estimates use ObsDrtMoreLocSupportAllControlsLincom
eststo m3ObsLinComTreat

estimates use ObsDrtMoreTradCONTROLSSupportAllControlsLincom
eststo m4ObsLinComControl
estimates use ObsDrtMoreTradSupportAllControlsLincom
eststo m4ObsLinComTreat

esttab using TableSI8Results.csv, b(4) se r2 replace wide starlevels( + .1 * .05 ** .01 *** .001)
eststo clear



*********************** 

* model for Table SI9 (main Table 3 with 50km threshold for Conley errors)
eststo clear
*m1
eststo: ols_spatial_HAC vio_support T T_RepDrt T_Loc T_RepDrt_Loc RepDrt_Loc RepDrt loc_rules_bi const_term DataVCI DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match weather_lied if useM1 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50) 
lincomest T + T_RepDrt + T_Loc + T_RepDrt_Loc
estimates save RepDrtLocSupportAllControlsLincom,replace  
qui ols_spatial_HAC vio_support T T_RepDrt T_Loc T_RepDrt_Loc RepDrt_Loc RepDrt loc_rules_bi const_term DataVCI DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match weather_lied if useM1 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50) 
lincomest T + T_RepDrt 
estimates save RepDrtLocCONTROLSupportAllControlsLincom, replace

*m2
eststo: ols_spatial_HAC vio_support T T_RepDrt T_Trad T_RepDrt_Trad RepDrt_Trad RepDrt trad_rules_bi const_term DataVCI DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match weather_lied if useM2 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50)
lincomest T + T_RepDrt + T_Trad + T_RepDrt_Trad
estimates save RepDrtTradSupportAllControlsLincom,replace  
qui ols_spatial_HAC vio_support T T_RepDrt T_Trad T_RepDrt_Trad RepDrt_Trad RepDrt trad_rules_bi const_term DataVCI DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match weather_lied if useM2 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50)
lincomest T + T_RepDrt
estimates save RepDrtTradCONTROLSSupportAllControlsLincom,replace  

*m3
eststo: ols_spatial_HAC vio_support T T_RepDrt T_MoreLoc T_RepDrt_MoreLoc RepDrt_MoreLoc RepDrt more_loc_rules_bi const_term DataVCI DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match weather_lied if useM3 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50)
lincomest T + T_RepDrt + T_MoreLoc + T_RepDrt_MoreLoc
estimates save RepDrtMoreLocSupportAllControlsLincom,replace  
qui ols_spatial_HAC vio_support T T_RepDrt T_MoreLoc T_RepDrt_MoreLoc RepDrt_MoreLoc RepDrt more_loc_rules_bi const_term DataVCI DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match weather_lied if useM3 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50)
lincomest T + T_RepDrt
estimates save RepDrtMoreLocCONTROLSSupportAllControlsLincom,replace  

*m4
eststo: ols_spatial_HAC vio_support T T_RepDrt T_MoreTrad T_RepDrt_MoreTrad RepDrt_MoreTrad RepDrt more_trad_rules_bi const_term DataVCI DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match weather_lied if useM4 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50)
lincomest T + T_RepDrt + T_MoreTrad + T_RepDrt_MoreTrad 
estimates save RepDrtMoreTradSupportAllControlsLincom, replace
qui ols_spatial_HAC vio_support T T_RepDrt T_MoreTrad T_RepDrt_MoreTrad RepDrt_MoreTrad RepDrt more_trad_rules_bi const_term DataVCI DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match weather_lied if useM4 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50)
lincomest T + T_RepDrt 
estimates save RepDrtMoreTradCONTROLSSupportAllControlsLincom, replace

estimates use RepDrtLocCONTROLSupportAllControlsLincom
eststo m1LinComControl
estimates use RepDrtLocSupportAllControlsLincom
eststo m1LinComTreat

estimates use RepDrtTradCONTROLSSupportAllControlsLincom
eststo m2LinComControl
estimates use RepDrtTradSupportAllControlsLincom
eststo m2LinComTreat

estimates use RepDrtMoreTradCONTROLSSupportAllControlsLincom
eststo m3LinComControl
estimates use RepDrtMoreLocSupportAllControlsLincom
eststo m3LinComTreat

estimates use RepDrtMoreTradCONTROLSSupportAllControlsLincom
eststo m4LinComControl
estimates use RepDrtMoreTradSupportAllControlsLincom
eststo m4LinComTreat

esttab using TableSI9Results.csv, b(4) se r2 replace wide starlevels( + .1 * .05 ** .01 *** .001)
eststo clear


* model for Table SI10 (Main table 4 with 50km threshold for Conley errors) 
eststo clear
*m1
eststo: ols_spatial_HAC vio_support T T_TAM2nd T_Loc T_TAM2nd_Loc TAM2nd_Loc TAMBelow2nd loc_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM1 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50) 
lincomest T + T_TAM2nd + T_Loc + T_TAM2nd_Loc
estimates save ObsDrtLocSupportAllControlsLincom,replace  
qui ols_spatial_HAC vio_support T T_TAM2nd T_Loc T_TAM2nd_Loc TAM2nd_Loc TAMBelow2nd loc_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM1 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50) 
lincomest T + T_TAM2nd 
estimates save ObsDrtLocCONTROLSupportAllControlsLincom,replace  

*m2
eststo: ols_spatial_HAC vio_support T T_TAM2nd T_Trad T_TAM2nd_Trad TAM2nd_Trad TAMBelow2nd trad_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM2 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50)
lincomest T + T_TAM2nd + T_Trad + T_TAM2nd_Trad
estimates save ObsDrtTradSupportAllControlsLincom,replace  
qui ols_spatial_HAC vio_support T T_TAM2nd T_Trad T_TAM2nd_Trad TAM2nd_Trad TAMBelow2nd trad_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM2 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50)
lincomest T + T_TAM2nd 
estimates save ObsDrtTradCONTROLSSupportAllControlsLincom,replace  

*m3
eststo: ols_spatial_HAC vio_support T T_TAM2nd T_MoreLoc T_TAM2nd_MoreLoc TAM2nd_MoreLoc TAMBelow2nd more_loc_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM3 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50)
lincomest T + T_TAM2nd + T_MoreLoc + T_TAM2nd_MoreLoc
estimates save ObsDrtMoreLocSupportAllControlsLincom,replace  
qui ols_spatial_HAC vio_support T T_TAM2nd T_MoreLoc T_TAM2nd_MoreLoc TAM2nd_MoreLoc TAMBelow2nd more_loc_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM3 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50)
lincomest T + T_TAM2nd 
estimates save ObsDrtMoreLocCONTROLSSupportAllControlsLincom,replace 

*m4
eststo: ols_spatial_HAC vio_support T T_TAM2nd T_MoreTrad T_TAM2nd_MoreTrad TAM2nd_MoreTrad TAMBelow2nd more_trad_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM4 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50)
lincomest T + T_TAM2nd + T_MoreTrad + T_TAM2nd_MoreTrad 
estimates save ObsDrtMoreTradSupportAllControlsLincom, replace
qui ols_spatial_HAC vio_support T T_TAM2nd T_MoreTrad T_TAM2nd_MoreTrad TAM2nd_MoreTrad TAMBelow2nd more_trad_rules_bi const_term  DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM4 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50)
lincomest T + T_TAM2nd 
estimates save ObsDrtMoreTradCONTROLSSupportAllControlsLincom, replace

estimates use ObsDrtLocCONTROLSupportAllControlsLincom
eststo m1ObsLinComControl
estimates use ObsDrtLocSupportAllControlsLincom
eststo m1ObsLinComTreat

estimates use ObsDrtTradCONTROLSSupportAllControlsLincom
eststo m2ObsLinComControl
estimates use ObsDrtTradSupportAllControlsLincom
eststo m2ObsLinComTreat

estimates use ObsDrtMoreLocCONTROLSSupportAllControlsLincom
eststo m3ObsLinComControl
estimates use ObsDrtMoreLocSupportAllControlsLincom
eststo m3ObsLinComTreat

estimates use ObsDrtMoreTradCONTROLSSupportAllControlsLincom
eststo m4ObsLinComControl
estimates use ObsDrtMoreTradSupportAllControlsLincom
eststo m4ObsLinComTreat

esttab using TableSI10Results.csv, b(4) se r2 replace wide starlevels( + .1 * .05 ** .01 *** .001)
eststo clear

* model for Table SI11 (Main table 5 with 50km threshold for Conley errors)   
eststo clear
*m1
eststo: ols_spatial_HAC SumPost1_50k T T_RepDrt T_Loc T_RepDrt_Loc RepDrt_Loc RepDrt loc_rules_bi const_term DataVCI DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match weather_lied if useM1 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50) 
lincomest T + T_RepDrt + T_Loc + T_RepDrt_Loc
estimates save RepDrtLocSupportAllControlsLincom,replace  
qui ols_spatial_HAC SumPost1_50k T T_RepDrt T_Loc T_RepDrt_Loc RepDrt_Loc RepDrt loc_rules_bi const_term DataVCI DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match weather_lied if useM1 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50) 
lincomest T + T_RepDrt 
estimates save RepDrtLocCONTROLSupportAllControlsLincom, replace

*m2
eststo: ols_spatial_HAC SumPost1_50k T T_RepDrt T_Trad T_RepDrt_Trad RepDrt_Trad RepDrt trad_rules_bi const_term DataVCI DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match weather_lied if useM2 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50)
lincomest T + T_RepDrt + T_Trad + T_RepDrt_Trad
estimates save RepDrtTradSupportAllControlsLincom,replace  
qui ols_spatial_HAC SumPost1_50k T T_RepDrt T_Trad T_RepDrt_Trad RepDrt_Trad RepDrt trad_rules_bi const_term DataVCI DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match weather_lied if useM2 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50)
lincomest T + T_RepDrt
estimates save RepDrtTradCONTROLSSupportAllControlsLincom,replace  

*m3
eststo: ols_spatial_HAC SumPost1_50k T T_RepDrt T_MoreLoc T_RepDrt_MoreLoc RepDrt_MoreLoc RepDrt more_loc_rules_bi const_term DataVCI DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match weather_lied if useM3 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50)
lincomest T + T_RepDrt + T_MoreLoc + T_RepDrt_MoreLoc
estimates save RepDrtMoreLocSupportAllControlsLincom,replace  
qui ols_spatial_HAC SumPost1_50k T T_RepDrt T_MoreLoc T_RepDrt_MoreLoc RepDrt_MoreLoc RepDrt more_loc_rules_bi const_term DataVCI DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match weather_lied if useM3 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50)
lincomest T + T_RepDrt
estimates save RepDrtMoreLocCONTROLSSupportAllControlsLincom,replace  

*m4
eststo: ols_spatial_HAC SumPost1_50k T T_RepDrt T_MoreTrad T_RepDrt_MoreTrad RepDrt_MoreTrad RepDrt more_trad_rules_bi const_term DataVCI DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match weather_lied if useM4 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50)
lincomest T + T_RepDrt + T_MoreTrad + T_RepDrt_MoreTrad 
estimates save RepDrtMoreTradSupportAllControlsLincom, replace
qui ols_spatial_HAC SumPost1_50k T T_RepDrt T_MoreTrad T_RepDrt_MoreTrad RepDrt_MoreTrad RepDrt more_trad_rules_bi const_term DataVCI DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match weather_lied if useM4 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50)
lincomest T + T_RepDrt 
estimates save RepDrtMoreTradCONTROLSSupportAllControlsLincom, replace

estimates use RepDrtLocCONTROLSupportAllControlsLincom
eststo m1LinComControl
estimates use RepDrtLocSupportAllControlsLincom
eststo m1LinComTreat

estimates use RepDrtTradCONTROLSSupportAllControlsLincom
eststo m2LinComControl
estimates use RepDrtTradSupportAllControlsLincom
eststo m2LinComTreat

estimates use RepDrtMoreTradCONTROLSSupportAllControlsLincom
eststo m3LinComControl
estimates use RepDrtMoreLocSupportAllControlsLincom
eststo m3LinComTreat

estimates use RepDrtMoreTradCONTROLSSupportAllControlsLincom
eststo m4LinComControl
estimates use RepDrtMoreTradSupportAllControlsLincom
eststo m4LinComTreat

esttab using TableSI11Results.csv, b(4) se r2 replace wide starlevels( + .1 * .05 ** .01 *** .001)
eststo clear

* model for Table SI12 (Main table 6 with 50km threshold for Conley errors) 
eststo clear
*m1
eststo: ols_spatial_HAC SumPost1_50k T T_TAM2nd T_Loc T_TAM2nd_Loc TAM2nd_Loc TAMBelow2nd loc_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM1 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50) 
lincomest T + T_TAM2nd + T_Loc + T_TAM2nd_Loc
estimates save ObsDrtLocSupportAllControlsLincom,replace  
qui ols_spatial_HAC SumPost1_50k T T_TAM2nd T_Loc T_TAM2nd_Loc TAM2nd_Loc TAMBelow2nd loc_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM1 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50) 
lincomest T + T_TAM2nd 
estimates save ObsDrtLocCONTROLSupportAllControlsLincom,replace  

*m2
eststo: ols_spatial_HAC SumPost1_50k T T_TAM2nd T_Trad T_TAM2nd_Trad TAM2nd_Trad TAMBelow2nd trad_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM2 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50)
lincomest T + T_TAM2nd + T_Trad + T_TAM2nd_Trad
estimates save ObsDrtTradSupportAllControlsLincom,replace  
qui ols_spatial_HAC SumPost1_50k T T_TAM2nd T_Trad T_TAM2nd_Trad TAM2nd_Trad TAMBelow2nd trad_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM2 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50)
lincomest T + T_TAM2nd 
estimates save ObsDrtTradCONTROLSSupportAllControlsLincom,replace  

*m3
eststo: ols_spatial_HAC SumPost1_50k T T_TAM2nd T_MoreLoc T_TAM2nd_MoreLoc TAM2nd_MoreLoc TAMBelow2nd more_loc_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM3 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50)
lincomest T + T_TAM2nd + T_MoreLoc + T_TAM2nd_MoreLoc
estimates save ObsDrtMoreLocSupportAllControlsLincom,replace  
qui ols_spatial_HAC SumPost1_50k T T_TAM2nd T_MoreLoc T_TAM2nd_MoreLoc TAM2nd_MoreLoc TAMBelow2nd more_loc_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM3 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50)
lincomest T + T_TAM2nd 
estimates save ObsDrtMoreLocCONTROLSSupportAllControlsLincom,replace 

*m4
eststo: ols_spatial_HAC SumPost1_50k T T_TAM2nd T_MoreTrad T_TAM2nd_MoreTrad TAM2nd_MoreTrad TAMBelow2nd more_trad_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM4 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50)
lincomest T + T_TAM2nd + T_MoreTrad + T_TAM2nd_MoreTrad 
estimates save ObsDrtMoreTradSupportAllControlsLincom, replace
qui ols_spatial_HAC SumPost1_50k T T_TAM2nd T_MoreTrad T_TAM2nd_MoreTrad TAM2nd_MoreTrad TAMBelow2nd more_trad_rules_bi const_term  DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM4 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(50)
lincomest T + T_TAM2nd 
estimates save ObsDrtMoreTradCONTROLSSupportAllControlsLincom, replace

estimates use ObsDrtLocCONTROLSupportAllControlsLincom
eststo m1ObsLinComControl
estimates use ObsDrtLocSupportAllControlsLincom
eststo m1ObsLinComTreat

estimates use ObsDrtTradCONTROLSSupportAllControlsLincom
eststo m2ObsLinComControl
estimates use ObsDrtTradSupportAllControlsLincom
eststo m2ObsLinComTreat

estimates use ObsDrtMoreLocCONTROLSSupportAllControlsLincom
eststo m3ObsLinComControl
estimates use ObsDrtMoreLocSupportAllControlsLincom
eststo m3ObsLinComTreat

estimates use ObsDrtMoreTradCONTROLSSupportAllControlsLincom
eststo m4ObsLinComControl
estimates use ObsDrtMoreTradSupportAllControlsLincom
eststo m4ObsLinComTreat

esttab using TableSI12Results.csv, b(4) se r2 replace wide starlevels( + .1 * .05 ** .01 *** .001)
eststo clear



* model for Table SI13 (Main table 4 with CRU SPI3 ****2nd threshold for now ****) 
eststo clear
*m1
eststo: ols_spatial_HAC vio_support T T_SPI32nd T_Loc T_SPI32nd_Loc SPI32nd_Loc SPI3Below2nd loc_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM1 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100) 
lincomest T + T_SPI32nd + T_Loc + T_SPI32nd_Loc
estimates save ObsDrtLocSupportAllControlsLincom,replace  
qui ols_spatial_HAC vio_support T T_SPI32nd T_Loc T_SPI32nd_Loc SPI32nd_Loc SPI3Below2nd loc_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM1 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100) 
lincomest T + T_SPI32nd 
estimates save ObsDrtLocCONTROLSupportAllControlsLincom,replace  

*m2
eststo: ols_spatial_HAC vio_support T T_SPI32nd T_Trad T_SPI32nd_Trad SPI32nd_Trad SPI3Below2nd trad_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM2 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_SPI32nd + T_Trad + T_SPI32nd_Trad
estimates save ObsDrtTradSupportAllControlsLincom,replace  
qui ols_spatial_HAC vio_support T T_SPI32nd T_Trad T_SPI32nd_Trad SPI32nd_Trad SPI3Below2nd trad_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM2 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_SPI32nd 
estimates save ObsDrtTradCONTROLSSupportAllControlsLincom,replace  

*m3
eststo: ols_spatial_HAC vio_support T T_SPI32nd T_MoreLoc T_SPI32nd_MoreLoc SPI32nd_MoreLoc SPI3Below2nd more_loc_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM3 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_SPI32nd + T_MoreLoc + T_SPI32nd_MoreLoc
estimates save ObsDrtMoreLocSupportAllControlsLincom,replace  
qui ols_spatial_HAC vio_support T T_SPI32nd T_MoreLoc T_SPI32nd_MoreLoc SPI32nd_MoreLoc SPI3Below2nd more_loc_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM3 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_SPI32nd 
estimates save ObsDrtMoreLocCONTROLSSupportAllControlsLincom,replace 

*m4
eststo: ols_spatial_HAC vio_support T T_SPI32nd T_MoreTrad T_SPI32nd_MoreTrad SPI32nd_MoreTrad SPI3Below2nd more_trad_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM4 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_SPI32nd + T_MoreTrad + T_SPI32nd_MoreTrad 
estimates save ObsDrtMoreTradSupportAllControlsLincom, replace
qui ols_spatial_HAC vio_support T T_SPI32nd T_MoreTrad T_SPI32nd_MoreTrad SPI32nd_MoreTrad SPI3Below2nd more_trad_rules_bi const_term  DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM4 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_SPI32nd 
estimates save ObsDrtMoreTradCONTROLSSupportAllControlsLincom, replace

estimates use ObsDrtLocCONTROLSupportAllControlsLincom
eststo m1ObsLinComControl
estimates use ObsDrtLocSupportAllControlsLincom
eststo m1ObsLinComTreat

estimates use ObsDrtTradCONTROLSSupportAllControlsLincom
eststo m2ObsLinComControl
estimates use ObsDrtTradSupportAllControlsLincom
eststo m2ObsLinComTreat

estimates use ObsDrtMoreLocCONTROLSSupportAllControlsLincom
eststo m3ObsLinComControl
estimates use ObsDrtMoreLocSupportAllControlsLincom
eststo m3ObsLinComTreat

estimates use ObsDrtMoreTradCONTROLSSupportAllControlsLincom
eststo m4ObsLinComControl
estimates use ObsDrtMoreTradSupportAllControlsLincom
eststo m4ObsLinComTreat

esttab using TableSI13Results.csv, b(4) se r2 replace wide starlevels( + .1 * .05 ** .01 *** .001)
eststo clear

****** SI tables 14, 15, 
*(there is little chance that a vio control will matter - change ONLY 25km threshold for OUTCOME) 
*model for SI table 14 (main table 5 with 25km post survey vio)
eststo clear
*m1
eststo: ols_spatial_HAC SumPost1_25k T T_RepDrt T_Loc T_RepDrt_Loc RepDrt_Loc RepDrt loc_rules_bi const_term DataVCI DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match weather_lied if useM1 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100) 
lincomest T + T_RepDrt + T_Loc + T_RepDrt_Loc
estimates save RepDrtLocSupportAllControlsLincom,replace  
qui ols_spatial_HAC SumPost1_25k T T_RepDrt T_Loc T_RepDrt_Loc RepDrt_Loc RepDrt loc_rules_bi const_term DataVCI DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match weather_lied if useM1 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100) 
lincomest T + T_RepDrt 
estimates save RepDrtLocCONTROLSupportAllControlsLincom, replace

*m2
eststo: ols_spatial_HAC SumPost1_25k T T_RepDrt T_Trad T_RepDrt_Trad RepDrt_Trad RepDrt trad_rules_bi const_term DataVCI DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match weather_lied if useM2 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_RepDrt + T_Trad + T_RepDrt_Trad
estimates save RepDrtTradSupportAllControlsLincom,replace  
qui ols_spatial_HAC SumPost1_25k T T_RepDrt T_Trad T_RepDrt_Trad RepDrt_Trad RepDrt trad_rules_bi const_term DataVCI DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match weather_lied if useM2 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_RepDrt
estimates save RepDrtTradCONTROLSSupportAllControlsLincom,replace  

*m3
eststo: ols_spatial_HAC SumPost1_25k T T_RepDrt T_MoreLoc T_RepDrt_MoreLoc RepDrt_MoreLoc RepDrt more_loc_rules_bi const_term DataVCI DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match weather_lied if useM3 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_RepDrt + T_MoreLoc + T_RepDrt_MoreLoc
estimates save RepDrtMoreLocSupportAllControlsLincom,replace  
qui ols_spatial_HAC SumPost1_25k T T_RepDrt T_MoreLoc T_RepDrt_MoreLoc RepDrt_MoreLoc RepDrt more_loc_rules_bi const_term DataVCI DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match weather_lied if useM3 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_RepDrt
estimates save RepDrtMoreLocCONTROLSSupportAllControlsLincom,replace  

*m4
eststo: ols_spatial_HAC SumPost1_25k T T_RepDrt T_MoreTrad T_RepDrt_MoreTrad RepDrt_MoreTrad RepDrt more_trad_rules_bi const_term DataVCI DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match weather_lied if useM4 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_RepDrt + T_MoreTrad + T_RepDrt_MoreTrad 
estimates save RepDrtMoreTradSupportAllControlsLincom, replace
qui ols_spatial_HAC SumPost1_25k T T_RepDrt T_MoreTrad T_RepDrt_MoreTrad RepDrt_MoreTrad RepDrt more_trad_rules_bi const_term DataVCI DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match weather_lied if useM4 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_RepDrt 
estimates save RepDrtMoreTradCONTROLSSupportAllControlsLincom, replace

estimates use RepDrtLocCONTROLSupportAllControlsLincom
eststo m1LinComControl
estimates use RepDrtLocSupportAllControlsLincom
eststo m1LinComTreat

estimates use RepDrtTradCONTROLSSupportAllControlsLincom
eststo m2LinComControl
estimates use RepDrtTradSupportAllControlsLincom
eststo m2LinComTreat

estimates use RepDrtMoreTradCONTROLSSupportAllControlsLincom
eststo m3LinComControl
estimates use RepDrtMoreLocSupportAllControlsLincom
eststo m3LinComTreat

estimates use RepDrtMoreTradCONTROLSSupportAllControlsLincom
eststo m4LinComControl
estimates use RepDrtMoreTradSupportAllControlsLincom
eststo m4LinComTreat

esttab using TableSI14Results.csv, b(4) se r2 replace wide starlevels( + .1 * .05 ** .01 *** .001)
eststo clear
  
* model for SI table 15 (main table 6 with 25km post survey vio) 
eststo clear
*m1
eststo: ols_spatial_HAC SumPost1_25k T T_TAM2nd T_Loc T_TAM2nd_Loc TAM2nd_Loc TAMBelow2nd loc_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM1 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100) 
lincomest T + T_TAM2nd + T_Loc + T_TAM2nd_Loc
estimates save ObsDrtLocSupportAllControlsLincom,replace  
qui ols_spatial_HAC SumPost1_25k T T_TAM2nd T_Loc T_TAM2nd_Loc TAM2nd_Loc TAMBelow2nd loc_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM1 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100) 
lincomest T + T_TAM2nd 
estimates save ObsDrtLocCONTROLSupportAllControlsLincom,replace  

*m2
eststo: ols_spatial_HAC SumPost1_25k T T_TAM2nd T_Trad T_TAM2nd_Trad TAM2nd_Trad TAMBelow2nd trad_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM2 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM2nd + T_Trad + T_TAM2nd_Trad
estimates save ObsDrtTradSupportAllControlsLincom,replace  
qui ols_spatial_HAC SumPost1_25 T T_TAM2nd T_Trad T_TAM2nd_Trad TAM2nd_Trad TAMBelow2nd trad_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM2 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM2nd 
estimates save ObsDrtTradCONTROLSSupportAllControlsLincom,replace  

*m3
eststo: ols_spatial_HAC SumPost1_25k T T_TAM2nd T_MoreLoc T_TAM2nd_MoreLoc TAM2nd_MoreLoc TAMBelow2nd more_loc_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM3 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM2nd + T_MoreLoc + T_TAM2nd_MoreLoc
estimates save ObsDrtMoreLocSupportAllControlsLincom,replace  
qui ols_spatial_HAC SumPost1_25k T T_TAM2nd T_MoreLoc T_TAM2nd_MoreLoc TAM2nd_MoreLoc TAMBelow2nd more_loc_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM3 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM2nd 
estimates save ObsDrtMoreLocCONTROLSSupportAllControlsLincom,replace 

*m4
eststo: ols_spatial_HAC SumPost1_25k T T_TAM2nd T_MoreTrad T_TAM2nd_MoreTrad TAM2nd_MoreTrad TAMBelow2nd more_trad_rules_bi const_term DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM4 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM2nd + T_MoreTrad + T_TAM2nd_MoreTrad 
estimates save ObsDrtMoreTradSupportAllControlsLincom, replace
qui ols_spatial_HAC SumPost1_25k T T_TAM2nd T_MoreTrad T_TAM2nd_MoreTrad TAM2nd_MoreTrad TAMBelow2nd more_trad_rules_bi const_term  DataTI3 SumPre5_50k SPI3mean2013_07_2014_06 Var_low age gender employed_q3 formal_education pastoral_q6 low_ses_q15 included_q11 attacked_1yr eth_match gender_match  if useM4 ==1, lat(lat) lon(stata_lon) t(tvar) p(ID) dist(100)
lincomest T + T_TAM2nd 
estimates save ObsDrtMoreTradCONTROLSSupportAllControlsLincom, replace

estimates use ObsDrtLocCONTROLSupportAllControlsLincom
eststo m1ObsLinComControl
estimates use ObsDrtLocSupportAllControlsLincom
eststo m1ObsLinComTreat

estimates use ObsDrtTradCONTROLSSupportAllControlsLincom
eststo m2ObsLinComControl
estimates use ObsDrtTradSupportAllControlsLincom
eststo m2ObsLinComTreat

estimates use ObsDrtMoreLocCONTROLSSupportAllControlsLincom
eststo m3ObsLinComControl
estimates use ObsDrtMoreLocSupportAllControlsLincom
eststo m3ObsLinComTreat

estimates use ObsDrtMoreTradCONTROLSSupportAllControlsLincom
eststo m4ObsLinComControl
estimates use ObsDrtMoreTradSupportAllControlsLincom
eststo m4ObsLinComTreat

esttab using TableSI15Results.csv, b(4) se r2 replace wide starlevels( + .1 * .05 ** .01 *** .001)
eststo clear









