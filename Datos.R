library(tidyverse)
capturas <- read_csv2("C:/Users/collf/Documents/Programacion/R_pesca/Capturas_92-17.csv",
                      locale = locale(encoding = "Latin1", decimal_mark = ",", grouping_mark = "."), na = "#¡VALOR!",
                      col_types = cols(Zona = col_character()))


capturas <- capturas %>%
  rename(año = Año, zona = Zona, alfa3 = AL3, peso = `Peso vivo (kg)`, código = `cód. CEIUAPA`, grupo = `Nombre_grupo CEIUAPA`) %>%
  select(año, Taxonómico, alfa3, zona, peso, código, grupo)

clave <- read_csv2("C:/Users/collf/Documents/Programacion/R_pesca/CEIUAPA.csv",
                   locale = locale(encoding = "Latin1"))
clave <- clave %>%
  rename(Taxonómico = TAXOCODE, alfa3 = `3A_CODE`, especie = Scientific_name) %>%
  select(Taxonómico, alfa3, especie)

pesca <- inner_join(capturas, clave)

pesca <- pesca %>%
  mutate(subcódigo = código - (código %/% 10) * 10,
         código = código %/% 10,
         zona = ifelse(zona == "99", NA, zona),
         peso = peso / 1000,
         log_peso = log(peso, 10))