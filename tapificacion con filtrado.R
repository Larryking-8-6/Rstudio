# Librerias usadas
library(dplyr)      #cargas de datos    
library(lubridate)  #flechas
library(plotly)     #Interaccion de graficas en ventana 
library(readxl)     #lectura de documentos xlsx excel 
library(shiny)      #Entorno grafico interactivo
library(here)       #Lectura local del archivo local

# Excel ruta
data <- read_excel("DATOS.xlsx")

# INterfaz
ui <- fluidPage(
  titlePanel("Conteo Mensual de Agricultores por Tipificacion"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("year", "Selecciona el año:", 
                  choices = 2018:2021,  #Margen de años posibles
                  selected = 2019)  # Año predeterminado
    ),
    
    mainPanel(
      plotlyOutput("plot")  # Espacio de grafica
    )
  )
)

# Servidor
server <- function(input, output) {
  
  output$plot <- renderPlotly({
    
    # Filtracion en base al año seleccionado
    data_filtered <- data %>%
      filter(year(FECHA) == input$year)
    
    # Registro mensual
    monthly_counts <- data_filtered %>%
      mutate(MES = month(FECHA, label = TRUE)) %>%
      group_by(MES, TIPIFICACION) %>%
      summarise(COUNT = n(), .groups = 'drop')
    
    # Ventana de datos
    tooltip_text <- monthly_counts %>%
      group_by(MES) %>%
      summarise(text = paste(TIPIFICACION, ":", COUNT, collapse = "<br>"), 
                total = sum(COUNT))  
    
    # Grafica de lineas y puntos
    plot <- monthly_counts %>%
      plot_ly(x = ~MES, y = ~COUNT, color = ~TIPIFICACION, type = 'scatter', mode = 'lines+markers', 
              text = ~paste(tooltip_text$text[match(MES, tooltip_text$MES)], 
                            "<br><b>Total:</b>", tooltip_text$total[match(MES, tooltip_text$MES)]),  
              hoverinfo = 'text') %>%
      layout(title = paste('Conteo Mensual de Agricultores por Tipificación en', input$year),
             xaxis = list(title = 'Mes'),
             yaxis = list(title = 'Cantidad de Agricultores'),
             showlegend = TRUE)

    
    # Mostrar pantalla
    plot
  })
}

# Ejecutar la aplicacion
shinyApp(ui = ui, server = server)



# itemclick = "toggleothers", 
# itemdistance = 10),
# showlegend = TRUE,
# hovermode = "closest")