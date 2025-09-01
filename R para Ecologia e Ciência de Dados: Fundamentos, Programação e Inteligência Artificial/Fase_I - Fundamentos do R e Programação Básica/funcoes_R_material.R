# =============================================================
# Material Didático - Funções em R
# =============================================================

# 1. O que são funções?
# - Conjuntos de comandos que realizam uma tarefa específica.
# - Podem ser pré-definidas (internas do R) ou criadas pelo usuário.
# - Tornam o código mais organizado, reutilizável e fácil de manter.

# -------------------------------------------------------------
# 2. Estrutura básica de uma função em R

# nome_funcao <- function(argumentos) {
#   # corpo da função
#   # comandos que serão executados
#   return(resultado)
# }

# -------------------------------------------------------------
# 3. Funções internas do R (built-in)

# Funções matemáticas
sqrt(16)                # raiz quadrada → 4
log(100)                # logaritmo → 4.605
round(3.1415, 2)        # arredonda → 3.14

# Estatísticas básicas
mean(c(1,2,3,4,5))      # média → 3
sum(1:10)               # soma → 55
length(c("a","b","c"))  # tamanho → 3

# -------------------------------------------------------------
# 4. Criando funções próprias

# Exemplo 1 – Função simples
soma <- function(x, y) {
  resultado <- x + y
  return(resultado)
}
soma(3, 5)   # 8

# Exemplo 2 – Função com valor padrão
potencia <- function(base, expoente = 2) {
  return(base ^ expoente)
}
potencia(3)      # 9 (eleva ao quadrado por padrão)
potencia(3, 3)   # 27

# Exemplo 3 – Função com várias instruções
estatisticas <- function(vetor) {
  media <- mean(vetor)
  mediana <- median(vetor)
  minimo <- min(vetor)
  maximo <- max(vetor)
  
  return(list(media = media, mediana = mediana,
              minimo = minimo, maximo = maximo))
}
estatisticas(c(5,2,9,4,7))

# -------------------------------------------------------------
# 5. Argumentos importantes

round(3.14159, digits = 3)   # 3.142
round(3.14159, 3)            # 3.142 (mesmo resultado)

# -------------------------------------------------------------
# 6. Escopo de variáveis

teste <- function() {
  x <- 10
  return(x)
}
teste()   # 10
# x       # Erro: objeto 'x' não encontrado

# -------------------------------------------------------------
# 7. Exercícios práticos

# 1) Função quadrado
quadrado <- function(x) {
  return(x^2)
}
quadrado(4)  # 16

# 2) Função média e desvio padrão
media_sd <- function(vetor) {
  return(list(media = mean(vetor), desvio = sd(vetor)))
}
media_sd(c(10,20,30,40,50))

# 3) Função classificar idade
classificar_idade <- function(idade) {
  if (idade < 12) {
    return("Criança")
  } else if (idade >= 12 & idade <= 17) {
    return("Adolescente")
  } else if (idade >= 18 & idade <= 59) {
    return("Adulto")
  } else {
    return("Idoso")
  }
}

classificar_idade(8)   # Criança
classificar_idade(15)  # Adolescente
classificar_idade(35)  # Adulto
classificar_idade(70)  # Idoso
