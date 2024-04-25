%%
/* Sección de declaraciones de JFlex */
%public
%class LexicalAnalyzer
%{
    /* Constantes con los nombres imprimibles de los distintos tokens */
    private static String COMMENT_LABEL = "COMENTARIO";
    private static String STRING_LABEL = "CADENA";
    private static String RESERVED_LABEL = "PALABRA RESERVADA";
    private static String IDENTIFIER_LABEL = "IDENTIFICADOR";
    private static String DELIMITER_LABEL = "DELIMITADOR";
    private static String OPERATOR_LABEL = "OPERADOR";
    private static String CONSTANT_LABEL = "CONSTANTE";
    
    /* tokenExists indica si existen tokens pendientes de analizar.
       Usado en el main para controlar la condición de salida del bucle de lectura
    */
    private boolean _tokenExists = false;

    public boolean tokenExists(){
        return this._tokenExists;
    }
%}
 
/* Indicamos a JFlex que devuelva objetos del tipo CustomToken */
%type CustomToken
 
%init{
    /* Código a ejecutar en el constructor de la clase */
%init}
 
%eof{
    /* Código a ejecutar al finalizar el análisis.
       Cambiamos tokenExists a false para que se detenga el bucle de lectura
    */
    this._tokenExists = false;
%eof}
 
/* Declaraciones de expresiones regulares */

constant = \d+

stringConstant = \"(.[^\"]*)\"

identifier = [A-Za-z]+

reservedDeclaration = "begin"|"constant"|"else"|"end"|"function"|"if"|"is"|"loop"|"out"|"procedure"|"record"|"return"|"then"|"type"|"while"
reservedType = "Boolean"|"Integer"
reservedConstant = "False"|"True"
reservedProcedure = "Put_line"
reserved = {reservedDeclaration}|{reservedType}|{reservedConstant}|{reservedProcedure}


delimiterQuote = "\""
delimiterExpression = [()]
delimiterList = ","
delimiterSentence = ";"
delimiterType = ":"
delimiter = {delimiterQuote}|{delimiterExpression}|{delimiterList}|{delimiterSentence}|{delimiterType}


operatorArithmetic = "(?<!-)-(?!-)"|"\*"
operatorRelational = ">"|"/="
operatorLogic = "and"
operatorAssignation = ":="
operatorAccess = "\."
operator = {operatorArithmetic}|{operatorRelational}|{operatorLogic}|{operatorAssignation}|{operatorAccess}

blank = \s
break = \r|\n|\r\n

comment = "--"(.*){break}


%%
/* Sección de reglas de producción */

{comment} {
 CustomToken t = new CustomToken(yytext(), COMMENT_LABEL);
 this._tokenExists = true;
 return t;
} 

{constant} {
 CustomToken t = new CustomToken(yytext(), CONSTANT_LABEL);
 this._tokenExists = true;
 return t;
}

{stringConstant} {
 CustomToken t = new CustomToken(yytext(), STRING_LABEL);
 this._tokenExists = true;
 return t;
} 

{reserved} {
 CustomToken t = new CustomToken(yytext(), RESERVED_LABEL);
 this._tokenExists = true;
 return t;
} 

{identifier} {
 CustomToken t = new CustomToken(yytext(), IDENTIFIER_LABEL);
 this._tokenExists = true;
 return t;
} 

{delimiter} {
 CustomToken t = new CustomToken(yytext(), DELIMITER_LABEL);
 this._tokenExists = true;
 return t;
} 

{operator} {
 CustomToken t = new CustomToken(yytext(), OPERATOR_LABEL);
 this._tokenExists = true;
 return t;
}

{blank} {
} 
 
{break} {
}