# Librerías ====
library(tidyverse)

# Lectura de datos =====
diccionario <- read_csv("data/raw/diccionario_censo20.csv") %>% 
  janitor::clean_names()

data_censo <- read_csv("data/raw/datos_censo20.csv") %>% 
  janitor::clean_names()

# Exploración de datos
data_censo %>% 
  group_by(nom_ent) %>% 
  summarise()

# Educación ====
diccionario %>% 
  filter

# Municipios CDMX ====

municipios_count <- data_censo %>% 
  filter(nom_ent == 'Ciudad de México') %>% 
  group_by(nom_mun) %>% 
  summarise(pob_mun = sum(pobtot))

municipios_count %>% 
  mutate(nom_mun = fct_reorder(nom_mun, pob_mun)) %>% 
  filter(nom_mun != 'Total de la entidad Ciudad de México') %>% 
  ggplot(aes(desc(pob_mun), nom_mun)) +
  geom_bar(stat = "identity")

dic_educación <- diccionario %>% 
  filter(stringr::str_detect(descripcion, "no van a la escuela")) %>% 
  mutate(mnemonico = stringr::str_to_lower(mnemonico)) 

dic_educación %>% select(descripcion)

vec_educacion <- dic_educación %>% 
  select(mnemonico) %>% 
  pull()

data_educacion <- data_censo %>% select(entidad, nom_ent,mun, nom_mun,vec_educacion)

data_educacion %>% mutate(tot = as.numeric(p3a5_noa) + as.numeric(p12a14noam))
             
                          