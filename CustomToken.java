// Clase que será utilizada para devolver los tokens
public class CustomToken {
 
  String _token;
  String _lexeme;
  
 
  public String getLexeme(){
    return this._lexeme;
  }
 
  public String getToken(){
    return this._token;
  }
 
  CustomToken (String lexeme, String token){
    this._lexeme = lexeme;
    this._token = token;
  }
 
  public String toString(){
    if (this._token=="COMENTARIO") {
      return "ENCONTRADO " + this._token + ";";
    } else {
      return "Encontrado " + this._token + " \"" + this._lexeme + "\"";
    }
  }
}