markdown
# Conteo Mensual de Agricultores por Tipificación

## Descripción
Esta aplicación Shiny permite a los usuarios visualizar el conteo mensual de agricultores por tipificación, utilizando datos de un archivo Excel. Los usuarios pueden seleccionar el año de interés (2018-2021) y ver un gráfico interactivo que muestra la distribución de los agricultores por mes y tipificación para la empresa Catie.

---

## Requisitos Previos
Para ejecutar esta aplicación, asegúrate de tener instalados los siguientes paquetes en R:

r
install.packages(c("shiny", "dplyr", "lubridate", "plotly", "readxl", "here"))


![image](https://github.com/user-attachments/assets/86a70c23-e50a-4295-8e67-505142b1f3fa)

# Descripción de las Librerías Utilizadas

## 1. dplyr
**Descripción**: `dplyr` es una de las librerías más populares de R para la manipulación y transformación de datos. Proporciona una gramática simple y coherente para trabajar con data frames. Permite realizar operaciones como filtrar, seleccionar, agrupar y resumir datos de manera eficiente.

**Funciones Clave**:
- `filter()`: Filtra las filas de un data frame según condiciones específicas.
- `select()`: Selecciona columnas específicas de un data frame.
- `mutate()`: Crea nuevas columnas o modifica columnas existentes.
- `summarise()`: Resumir datos agregando información.

---

## 2. lubridate
**Descripción**: `lubridate` es una librería diseñada para facilitar el trabajo con fechas y horas en R. Proporciona funciones para parsear, manipular y realizar cálculos con fechas de manera intuitiva.

**Funciones Clave**:
- `ymd()`, `mdy()`, `dmy()`: Parsean cadenas de texto en fechas en varios formatos.
- `year()`, `month()`, `day()`: Extraen componentes específicos de fechas.
- `interval()`, `duration()`: Permiten calcular intervalos de tiempo.

---

## 3. plotly
**Descripción**: `plotly` es una librería que permite crear gráficos interactivos a partir de datos. Es especialmente útil para visualizaciones web y se integra fácilmente con `ggplot2`. Los gráficos generados son interactivos y permiten a los usuarios explorar los datos de manera más profunda.

**Funciones Clave**:
- `plot_ly()`: Crea un gráfico básico interactivo.
- `add_trace()`: Agrega trazas adicionales a un gráfico existente.
- `layout()`: Personaliza el diseño de los gráficos.

---

## 4. readxl
**Descripción**: `readxl` es una librería que permite leer archivos de Microsoft Excel (.xls y .xlsx) de manera sencilla. No requiere la instalación de software adicional y es capaz de manejar distintos formatos de datos en hojas de cálculo.

**Funciones Clave**:
- `read_excel()`: Lee un archivo Excel y devuelve un data frame.
- `excel_sheets()`: Lista las hojas disponibles en un archivo Excel.

---

## 5. shiny
**Descripción**: `shiny` es un framework para construir aplicaciones web interactivas con R. Permite a los usuarios crear interfaces gráficas que reaccionan a las entradas del usuario, proporcionando una experiencia interactiva en la visualización de datos y análisis.

**Funciones Clave**:
- `fluidPage()`: Define el diseño de la interfaz de usuario.
- `sidebarLayout()`: Crea un diseño con un panel lateral y un panel principal.
- `shinyApp()`: Ejecuta la aplicación Shiny.

---

## 6. here
**Descripción**: `here` es una librería que facilita la gestión de rutas de archivos en proyectos de R. Permite usar rutas relativas en lugar de rutas absolutas, lo que mejora la portabilidad del código y facilita la colaboración en proyectos.

**Funciones Clave**:
- `here()`: Construye una ruta de archivo relativa basada en la ubicación del proyecto.

- *Carga de Librerías*: Se cargan las librerías necesarias para la manipulación de datos, visualización y creación de la aplicación Shiny.
  
- *Carga de Datos*: Se lee el archivo DATOS.xlsx utilizando here para asegurarse de que se acceda correctamente sin necesidad de rutas absolutas.

- *Interfaz de Usuario (ui)*:
  - Se define un panel lateral donde los usuarios pueden seleccionar el año de interés.
  - Se incluye un espacio principal para mostrar el gráfico interactivo.

- *Lógica del Servidor (server)*:
  - Se filtran los datos según el año seleccionado por el usuario.
  - Se agrupan los datos por mes y tipificación, y se genera un gráfico de líneas y puntos.



# Este proyecto consta de 2 versiones una de uso nativo par la carga de un año concreto y una donde pude definir del 2018 al 2021
![image](https://github.com/user-attachments/assets/3c1883d8-01fe-4bde-b9ac-54eb804ff0db)

![image](https://github.com/user-attachments/assets/4e06ab1a-0477-431f-b1fa-67b7bdfcae42)

![image](https://github.com/user-attachments/assets/01a3b4b8-e432-4561-b173-a54dbf073cde)

![image](https://github.com/user-attachments/assets/cdab2b72-cd3f-426f-9db6-b1c2d5fc5ed7)


## Esto fue hecho por Juan Carlos Gonzalez Valdez.
