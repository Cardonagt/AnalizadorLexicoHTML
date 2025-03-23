# Analizador Léxico HTML

## Descripción
Este proyecto es un analizador léxico para archivos HTML, desarrollado en Java con JFlex y una interfaz gráfica en Swing. El programa lee un archivo de texto (.txt) que contiene código HTML, identifica los tokens (como etiquetas, atributos, comentarios, texto, etc.), y muestra los resultados en una tabla dentro de una ventana gráfica. También genera un archivo de salida (`salida.txt`) con los mismos resultados.

## Estructura del proyecto
- **`src/analizadorlexicohtml/AnalizadorForm.java`**: Formulario principal con la interfaz gráfica.
- **`src/analizadorlexicohtml/Lexer.jflex`**: Archivo fuente de JFlex que define las reglas del analizador léxico.
- **`src/analizadorlexicohtml/Lexer.java`**: Analizador léxico generado por JFlex.
- **`src/recursos/logo-universidad.png`**: Logo de la Universidad Da Vinci de Guatemala.
- **`html.txt`**: Archivo de entrada de ejemplo con código HTML.
- **`salida.txt`**: Archivo de salida generado por el programa.

## Instrucciones de uso
1. Abre el proyecto en NetBeans.
2. Ejecuta `AnalizadorForm.java` para abrir la interfaz gráfica.
3. Haz clic en "Analizar" y selecciona un archivo .txt con código HTML (por ejemplo, `html.txt`).
4. Los tokens se mostrarán en la ventana y se exportarán a `salida.txt`.
5. Usa el botón "Limpiar" para borrar los resultados y analizar otro archivo.

## Ejemplo
**Entrada (`html.txt`)**:

## <!DOCTYPE html> <html> <head> <title>Mi Página</title> </head> <body> <h1 class="titulo">Bienvenidos</h1> <p id="intro">Esta es una página de prueba.</p> <!-- Esto es un comentario --> <a href="https://example.com">Enlace</a> </body> </html>.

## Salida (en la ventana y en salida.txt):
## Línea  Columna  Tipo                  Valor
## -----  -------  --------------------  --------------------
## 1      0        MENOR_QUE             <
## 1      1        TEXTO                 !DOCTYPE html
## 1      14       FIN_ETIQUETA          >
## 2      0        ETIQUETA_APERTURA     <html
## ...

## Requisitos

1. JDK 21
2. JFlex 1.9.1
3. NetBeans 24

