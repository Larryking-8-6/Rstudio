# Librerias 
library(dplyr)         #cargas de datos
library(lubridate)     #flechas
library(plotly)        #Interaccion de graficas
library(readxl)   #lectura de documentos xlsx excel     
library(here)     #Lectura local del archivo local

# Excel ruta
data <- read_excel("DATOS.xlsx")

# Filtado
data_2019 <- data %>%
  filter(year(FECHA) == 2019)

# Registro mensual
monthly_counts <- data_2019 %>%
  mutate(MES = month(FECHA, label = TRUE)) %>%  #  el mes
  group_by(MES, TIPIFICACION) %>%                # Agrupar por mes y tipificacion
  summarise(COUNT = n(), .groups = 'drop')      # Contar registros y desagrupar

# Crear un tooltip personalizado
tooltip_text <- monthly_counts %>%
  group_by(MES) %>%
  summarise(text = paste(TIPIFICACION, ":", COUNT, collapse = "<br>"), 
            total = sum(COUNT))  # Calcular el total por mes

# Grafica de lnneas y puntos
plot <- monthly_counts %>%
  plot_ly(x = ~MES, y = ~COUNT, color = ~TIPIFICACION, type = 'scatter', mode = 'lines+markers', 
          text = ~paste(tooltip_text$text[match(MES, tooltip_text$MES)], 
                        "<br><b>Total:</b>", tooltip_text$total[match(MES, tooltip_text$MES)]),  # Asignar datos de ventana
          hoverinfo = 'text') %>%  # Mostrar la cantidad en la ventana
  layout(title = 'Conteo Mensual de Agricultores por Tipificación en 2019',
         xaxis = list(title = 'Mes'),
         yaxis = list(title = 'Cantidad de Agricultores'),
         showlegend = TRUE)  # Mostrar leyenda


# Mostrar grafico
plot



# # grfico de barras
# plot <- monthly_counts %>%
#   plot_ly(x = ~MES, y = ~COUNT, color = ~TIPIFICACION, type = 'bar',
#           text = ~paste('Cantidad:', COUNT),
#           hoverinfo = 'text') %>%  # Mostrar la cantidad
#   layout(title = 'Conteo Mensual de Agricultores por Tipificación en 2019',
#          xaxis = list(title = 'Mes'),
#          yaxis = list(title = 'Cantidad de Agricultores'),
#          barmode = 'group')  # Agrupar las barras por tipificación