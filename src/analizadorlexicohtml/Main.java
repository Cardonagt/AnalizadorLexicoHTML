package analizadorlexicohtml;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Clase principal para ejecutar el analizador léxico
 */
public class Main {
    /**
     * Método principal
     * @param args argumentos de línea de comandos
     */
    public static void main(String[] args) {
        try {
            // Rutas de los archivos de entrada y salida
            String inputFile = "E:\\OneDrive - Grupo Disresa\\Otros\\Documentos\\NetBeansProjects\\AnalizadorLexicoHTML\\src\\analizadorlexicohtml\\html.txt";
            String outputFile = "salida.txt";

            // Crear instancia del lexer con el archivo de entrada
            FileReader reader = new FileReader(inputFile); System.out.println("Directorio de trabajo actual: " + new File(".").getAbsolutePath());
            Lexer lexer = new Lexer(reader);
            
            // Lista para almacenar tokens
            List<Lexer.Token> tokens = new ArrayList<>();
            Lexer.Token token;

            // Procesar todos los tokens
            while ((token = lexer.yylex()) != null) {
                tokens.add(token);
            }

            // Escribir tokens en el archivo de salida
            try (PrintWriter writer = new PrintWriter(outputFile)) {
                for (Lexer.Token t : tokens) {
                    writer.println(t.toString());
                }
                System.out.println("Analisis completado. Resultados escritos en " + outputFile);
            }

        } catch (IOException e) {
            System.err.println("Error al procesar el archivo: " + e.getMessage());
            e.printStackTrace();
        }
    }
}