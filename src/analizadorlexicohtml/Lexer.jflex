/* Lexer.jflex */
%%

%public
%class Lexer
%type Token
%line
%column

%{
    public static class Token {
        public String type;
        public String value;
        public int line;
        public int column;

        public Token(String type, String value, int line, int column) {
            this.type = type;
            this.value = value;
            this.line = line + 1;
            this.column = column;
        }

        @Override
        public String toString() {
            return String.format("Token[tipo=%s, valor='%s', linea=%d, columna=%d]", 
                type, value, line, column);
        }
    }
%}

/* Expresiones regulares */
WhiteSpace = [ \t\r\n]+
OpenTag = "<" [a-zA-Z1-6]+
CloseTag = "</" [a-zA-Z1-6]+ ">"
Attribute = [a-zA-Z]+ "=\"" [^\"]* "\""
Comment = "<!--" [^\-]* "-->"
Entity = "&" [a-zA-Z]+ ";"
Text = [^<>&]+

%%

{WhiteSpace}    { /* ignorar */ }
{OpenTag}       { return new Token("ETIQUETA_APERTURA", yytext(), yyline, yycolumn); }
{CloseTag}      { return new Token("ETIQUETA_CIERRE", yytext(), yyline, yycolumn); }
{Attribute}     { return new Token("ATRIBUTO", yytext(), yyline, yycolumn); }
{Comment}       { return new Token("COMENTARIO", yytext(), yyline, yycolumn); }
{Entity}        { return new Token("ENTIDAD", yytext(), yyline, yycolumn); }
{Text}          { return new Token("TEXTO", yytext().trim(), yyline, yycolumn); }
">"             { return new Token("FIN_ETIQUETA", yytext(), yyline, yycolumn); }
"<"             { return new Token("MENOR_QUE", yytext(), yyline, yycolumn); }
[^]             { return new Token("ERROR", yytext(), yyline, yycolumn); }

<<EOF>>         { return null; }