import java.io.BufferedReader;
import java.io.FileReader;

public class JFlexAnalyzer {

  public static void main(String[] args) {

    try {

      // Asignación del nombre de archivo por defecto que usará la aplicación
      String file = "input.txt";

      // Se trata de leer el archivo y analizarlo en la clase que se ha creado con
      // JFlex
      BufferedReader buffer = new BufferedReader(new FileReader(file));
      LexicalAnalyzer analyzer = new LexicalAnalyzer(buffer);

      do {
        // Obtener el token analizado y mostrar su información
        CustomToken token = analyzer.yylex();
        if (token != null) {
          System.out.println(token.toString());
        }
      } while (analyzer.tokenExists());
    } catch (Exception e) {
      System.out.println(e.toString());
    }
  }
}