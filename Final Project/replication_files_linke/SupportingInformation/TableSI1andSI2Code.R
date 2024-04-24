#Table SI2 results 
#Observed violence effects on reporting rules presence. Uses spatial splines instead of code for OLS in main analysis.

library(mgcv)
library(readstata13)
#library(MASS) #estimates a theta for neg. bin. dispersion 
#library(plyr)


setwd("/Users/u6001910/Dropbox/RevisionsJCR/AcceptedJCR/ReplicationFiles/SupportingInformation")

jcrData<-read.dta13("DataJCRJune12.dta")

#'makeGAMres' function is below

datam1<- subset (jcrData, useM1 ==1)
datam2<- subset (jcrData, useM2 ==1)
datam3<- subset (jcrData, useM3 ==1)
datam4<- subset (jcrData, useM4 ==1)

#without splines 
VioLocRulesNoSp<- gam (loc_rules_bi ~ SumPre5_50k + age + gender + employed_q3 +formal_education_q5 + pastoral_q6 + low_ses_q15+ included_q11 + eth_match + gender_match , data = datam1, family = binomial)

VioTradRulesNoSp<- gam (trad_rules_bi ~ SumPre5_50k + age + gender + employed_q3 +formal_education_q5 + pastoral_q6 + low_ses_q15+ included_q11 + eth_match + gender_match , data = datam2, family = binomial)

VioMoreLocRulesNoSp<- gam (more_loc_rules_bi ~ SumPre5_50k + age + gender + employed_q3 +formal_education_q5 + pastoral_q6 + low_ses_q15+ included_q11 + eth_match + gender_match , data = datam3, family = binomial)

VioMoreTradRulesNoSp<- gam (more_trad_rules_bi ~ SumPre5_50k + age + gender + employed_q3 +formal_education_q5 + pastoral_q6 + low_ses_q15+ included_q11 + eth_match + gender_match , data = datam4, family = binomial)

summary(VioLocRulesNoSp)
summary(VioTradRulesNoSp)
summary(VioMoreLocRulesNoSp)
summary(VioMoreTradRulesNoSp)

m1EndNoSp<-makeGAMres(VioLocRulesNoSp)
m2EndNoSp<-makeGAMres(VioTradRulesNoSp)
m3EndNoSp<-makeGAMres(VioMoreLocRulesNoSp)
m4EndNoSp<-makeGAMres(VioMoreTradRulesNoSp)

TableSI2ResultsNoSp<-rbind(m1EndNoSp,m2EndNoSp,m3EndNoSp,m4EndNoSp)
write.csv(TableSI2ResultsNoSp,"TableSI2ResultsNoSp.csv")

#with splines 
VioLocRules<- gam (loc_rules_bi ~ SumPre5_50k + age + gender + employed_q3 +formal_education_q5 + pastoral_q6 + low_ses_q15+ included_q11 + eth_match + gender_match + s(long,lat), data = datam1, family = binomial)

VioTradRules<- gam (trad_rules_bi ~ SumPre5_50k + age + gender + employed_q3 +formal_education_q5 + pastoral_q6 + low_ses_q15+ included_q11 + eth_match + gender_match + s(long,lat), data = datam2, family = binomial)

VioMoreLocRules<- gam (more_loc_rules_bi ~ SumPre5_50k + age + gender + employed_q3 +formal_education_q5 + pastoral_q6 + low_ses_q15+ included_q11 + eth_match + gender_match + s(long,lat), data = datam3, family = binomial)

VioMoreTradRules<- gam (more_trad_rules_bi ~ SumPre5_50k + age + gender + employed_q3 +formal_education_q5 + pastoral_q6 + low_ses_q15+ included_q11 + eth_match + gender_match + s(long,lat), data = datam4, family = binomial)

summary(VioLocRules)
summary(VioTradRules)
summary(VioMoreLocRules)
summary(VioMoreTradRules)

m1End<-makeGAMres(VioLocRules)
m2End<-makeGAMres(VioTradRules)
m3End<-makeGAMres(VioMoreLocRules)
m4End<-makeGAMres(VioMoreTradRules)

TableSI2Results<-rbind(m1End,m2End,m3End,m4End)
write.csv(TableSI2Results,"TableSI2Results.csv")




makeGAMres<- function (gam){
	output<-summary(gam)
	mod<-deparse(substitute(gam))
	res<-output$p.table
	res<-rbind(res,output$s.table)
	aic<-gam$aic
	N<-summary(gam)$n
	R2<-summary(gam)$r.sq
	aicRow<-c(aic,0,0,0)
	NRow<-c(N,0,0,0) 
	R2Row<-c(R2,0,0,0)
	res<-data.frame(res)
	res<-rbind(res,aicRow)
	res<-rbind(res,NRow)
	res<-rbind(res,R2Row)
	#colnames(res)<-c (paste(mod,"Est",sep=""), paste(mod,"Se",sep=""), paste(mod,"Z",sep=""), paste(mod,"Pval",sep=""))
	colnames(res)<-c ("Est","Se","Z","Pval")
	dim<-length(res$Est)
	rownames(res)[(dim-2):dim]<-c("AIC", "N", "R-Squared")
	res<-round(res,digits = 4)
	return(res)
}

#Descriptive statistics table

#'DesTable' function below

SumPost1_50k<-DesTable(jcrData,"SumPost1_50k")
SumPost1_25k<-DesTable(jcrData,"SumPost1_25k")
SumPre5_50k<-DesTable(jcrData,"SumPre5_50k")
age<-DesTable(jcrData,"age")
gen<-DesTable(jcrData,"gender")
emp<-DesTable(jcrData,"employed_q3")
edu<-DesTable(jcrData,"formal_education_q5")
pas<-DesTable(jcrData,"pastoral_q6")
ses<-DesTable(jcrData,"low_ses_q15")
inc<-DesTable(jcrData,"included_q11")
eth<-DesTable(jcrData,"eth_match")
gen<-DesTable (jcrData,"gender_match")
att<-DesTable(jcrData,"attacked_1yr")
TAMBelow2nd<-DesTable(jcrData,"TAMBelow2nd")
TAMBelow1st<-DesTable(jcrData,"TAMBelow1st")
SPI3Below2nd<-DesTable(jcrData,"SPI3Below2nd")
RepDrt<-DesTable(jcrData,"RepDrt")
loc_rules_bi<-DesTable(jcrData,"loc_rules_bi")
trad_rules_bi<-DesTable(jcrData,"trad_rules_bi")
more_loc_rules_bi<-DesTable(jcrData,"more_loc_rules_bi")
more_trad_rules_bi<-DesTable(jcrData,"more_trad_rules_bi")
Var_low<-DesTable(jcrData,"Var_low")
SPI3Recent<-DesTable(jcrData,"SPI3mean2013_07_2014_06")
VCI<-DesTable(jcrData,"DataVCI")
TI3<-DesTable(jcrData,"DataTI3")
vioCue<-DesTable(jcrData,"T")

descriptives<-data.frame(rbind(
SumPost1_50k,
SumPost1_25k,
SumPre5_50k,
age,
gen,
emp,
edu,
pas,
ses,
inc,
eth,
gen,
att,
TAMBelow2nd,
TAMBelow1st,
SPI3Below2nd,
RepDrt,
loc_rules_bi,
trad_rules_bi,
more_loc_rules_bi,
more_trad_rules_bi,
Var_low,
SPI3Recent,
VCI,
TI3,
vioCue))

RowNames<- c("Post-survey violence (1yr, 50km)",
"Post-survey violence (1yr, 25km)",
"Pre-survey violence (5yr, 50km)",
"Age",
"Gender",
"Employed",
"Formal education",
"Pastoralist",
"Low SES",
"Included (government)",
"Ethnicity match",
"Gender match",
"Attacked outside home (1yr)",
"TAMSAT very dry",
"TAMSAT dry",
"SPI3 very dry",
"Reported drought",
"Official natural resource rules",
"Unofficial natural resource rules",
"More official rules than past",
"More unofficial rules than past",
"Low precipitation variability",
"Precipitation (survey enumeration yr)",
"Vegetation condition index",
"Temperature deviations",
"Violence cue")

row.names(descriptives)<-RowNames

descriptives<-round (descriptives,digits = 3)
colnames(descriptives)<-c("Mean", "Max", "Min", "Std. Dev.")

write.csv(descriptives,"SI1table.csv")

DesTable<- function(data,var){
	mean<-mean(data[,var])
	max<-max(data[,var])
	min<-min(data[,var])
	sd<-sd(data[,var])
	res<-c(mean,max,min,sd)
}


