library("PNADcIBGE")
library("survey")
library("srvyr")
library("tidyverse")
library("tidyr")

data_pnad2= get_pnadc(year=2020, quarter= 4, vars=c("UF", "V2007", "V2010", "VD4020", "V2009", "VD4009", "VD4020", "VD3004"))

data_pnad2<- data_pnad2$variables

renda = svyby(~interaction(V2010, svymean(VD4020)), data_pnad2, svymean)

ftable(renda)