# =============================================================
# R Básico: Importação de Dados 
# Arquivos de exemplo: trees_example.csv, trees_example.txt, trees_example.xlsx
# Dica: coloque estes arquivos na sua pasta de trabalho antes de rodar.
# =============================================================

# verificar o diretorio
getwd()

# listar os arquivos no diretorio
dir()

# definir o diretorio de trabalho
setwd()


# 0) Preparação ------------------------------------------------
# Instale os pacotes uma única vez (se precisar):
# install.packages(c('tidyverse','readxl'))

library(tidyverse)  # readr, dplyr, ggplot2...
library(readxl)     # ler .xlsx

# 1) Importação -----------------------------------------------
# Ajuste o caminho dos arquivos se necessário (use setwd() ou caminhos absolutos).

# .CSV (separado por vírgula)
trees_csv <- readr::read_csv('trees_example.csv', show_col_types = FALSE)

# .TXT (separado por TAB)
trees_txt <- readr::read_delim('trees_example.txt', delim='\t', show_col_types = FALSE)

# .XLSX (planilha Excel)
trees_xlsx <- readxl::read_excel('trees_example.xlsx')

# 2) Olhada rápida --------------------------------------------
dplyr::glimpse(trees_csv)   # estrutura
head(trees_csv, 3)          # primeiras linhas

# 3) Manipulação essencial (um pipeline) ----------------------
# Objetivo: criar área basal (m²), filtrar por DAP >= 30 cm,
# resumir por parcela e visualizar.

resultado <- trees_csv |>
  mutate(basal_area_m2 = pi * (dbh_cm/200)^2) |>   # dbh em cm -> raio em m
  filter(dbh_cm >= 30) |>
  group_by(plot) |>
  summarise(
    n_trees = n(),
    mean_dbh = mean(dbh_cm),
    total_basal = sum(basal_area_m2),
    .groups = 'drop'
  ) |>
  arrange(plot)

print(resultado)

# 4) Visualização rápida --------------------------------------
ggplot(resultado, aes(x = plot, y = total_basal)) +
  geom_col() +
  labs(title='Área basal total por parcela (DAP ≥ 30 cm)',
       x='Parcela', y='Área basal (m²)') +
  theme_minimal()

