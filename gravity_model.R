#install.packages("gravity")
library(gravity)
regression_data <- read.csv("regression_data.csv", stringsAsFactors = FALSE)
ppml_result <- ppml("ln_export_ij", dist="ln_distance", c('ln_gdp_i', 'ln_gdp_j', 'ln_gdp_i.ec_index_i',
'ln_gdp_j.ec_index_j', 'ec_index_i', 'ec_index_j', 'ln_population_i', 'ln_population_j', 'contig',
'comlang_off', 'colony', 'dummy_2019', 'dummy_2020'), data=regression_data)
summary(ppml_result)
lm_result <- lm(ln_export_ij ~ ln_distance + ln_gdp_i + ln_gdp_j + I(ln_gdp_i * ec_index_i)
+ I(ln_gdp_j * ec_index_j) + ln_population_i + ln_population_j + contig + comlang_off + colony
+ dummy_2019 + dummy_2020 + ec_index_i + ec_index_j, data=regression_data)  
summary(lm_result)
