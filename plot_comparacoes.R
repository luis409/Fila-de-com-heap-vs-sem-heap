# Script R para comparação de estruturas
library(ggplot2)
library(reshape2)

tamanhos <- c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 120, 140, 160, 180, 200, 220, 240, 260, 280, 300, 350, 400, 450, 500, 550, 600, 650, 700, 750, 800)

heap_comp <- c(18, 60, 102, 122, 135, 140, 143, 159, 160, 170, 180, 184, 190, 187, 210, 210, 206, 210, 222, 221, 216, 238, 240, 238, 260, 254, 270, 266, 264, 268)

fila_comp <- c(39, 157, 355, 513, 666, 817, 967, 1117, 1267, 1417, 1717, 2017, 2317, 2617, 2917, 3217, 3517, 3817, 4117, 4417, 5167, 5917, 6667, 7417, 8167, 8917, 9667, 10417, 11167, 11917)

dados <- data.frame(Tamanho = tamanhos, Heap = heap_comp, Fila = fila_comp)
dados_long <- melt(dados, id.vars = "Tamanho", 
                   variable.name = "Estrutura", 
                   value.name = "Comparacoes")

ggplot(dados_long, aes(x = Tamanho, y = Comparacoes, color = Estrutura)) +
  geom_point(size = 2) +
  geom_smooth(method = "loess", se = TRUE) +
  labs(title = "Heap vs Lista Encadeada",
       x = "Elementos", y = "Comparações", color = "Estrutura") +
  theme_minimal() +
  theme(legend.position = "bottom", plot.title = element_text(hjust = 0.5)) +
  scale_color_manual(values = c("Heap" = "#E74C3C", "Fila" = "#3498DB"))

ggsave("comparacao_estruturas.png", width = 10, height = 6, dpi = 300)
