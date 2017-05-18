SPACE [ \t]+
ASSIGN =
EQUALITYCHECK ==
PLUS \+
HASHTAG #
COLON \:
DIRECTIONARROW :>
BIDIRECTIONALARROW ::
PROPERTYSIGN ->
MINUS -
MUL \*
DIV \/
COMMA ,
DOT \.
LESSTHAN <
GREATERTHAN >
LTE <=
GTE >=
NOT !
CONCAT \^
LPARAN \(
RPARAN \)
LCBRACKET \{
RCBRACKET \}
LSBRACKET \[
RSBRACKET \]
DIGIT [0-9]
LETTER [a-zA-Z]
NEWLINE \n
NONSTAR [^\*]
NONSTARNONDIV [^\*/]
NONNEWLINE [^\n]
UNDERSCORE _
STRINGLITERAL	\"([^\"\\\n]|\\\"|\\n|\\t|\\\\)*\" 
BOOL true|false
ID {LETTER}({LETTER}|{DIGIT}|{UNDERSCORE})*
INT ({MINUS}|{PLUS})?{DIGIT}+
FLOAT {INT}"."{DIGIT}+
ENDSTATEMENT ;
COMMENT {DIV}{DIV}{NONNEWLINE}*{NEWLINE}|{DIV}\*({NONSTAR}|\*+{NONSTARNONDIV})*\*+{DIV}
DIRECTEDGRAPH directedGraph
UNDIRECTEDGRAPH undirectedGraph
QUERY Query
EDGE Edge
VERTEX Vertex
VERTEXQUERY {LCBRACKET}{VERTEX}{PROPERTYSIGN}{STRINGLITERAL}{EQUALITYCHECK}({INT}|{STRINGLITERAL}|{BOOL}){RCBRACKET}
EDGEQUERY {LCBRACKET}{EDGE}{PROPERTYSIGN}{STRINGLITERAL}{EQUALITYCHECK}({INT}|{STRINGLITERAL}|{BOOL}){RCBRACKET}
IF \?
AND &
OR \|

%%
{DIRECTEDGRAPH} printf("<DIRECTEDGRAPH>");
{UNDIRECTEDGRAPH} printf("<UNDIRECTEDGRAPH>") ;
{QUERY} printf("<QUERY>") ;
{VERTEXQUERY} printf("<VERTEXQUERY>") ;
{EDGEQUERY} printf("<EDGEQUERY>") ;
{VERTEX} printf("<VERTEX>") ;
{EDGE} printf("<EDGE>") ;
{DIRECTIONARROW} printf("<DIRECTIONARROW>") ;
{PROPERTYSIGN} printf("<PROPERTYSIGN>") ;
{BIDIRECTIONALARROW} printf("<BIDIRECTIONALARROW>") ;
{IF} printf("<IF>") ;
{AND} printf("<AND>") ;
{OR} printf("<OR>") ;
{DOT} printf("<DOT>") ;
{SPACE} ;
{COMMENT} printf("<COMMENT>");
{COMMA} printf("<COMMA>") ;
{NEWLINE} printf("\n");
{ENDSTATEMENT} printf("<ENDSTATEMENT>") ;
{ASSIGN} printf("<ASSIGN>") ;
{NOT} printf("<NOT>") ;
{LTE} printf("<LTE>") ;
{GTE} printf("<GTE>") ;
{LESSTHAN} printf("<LESSTHAN>") ;
{GREATERTHAN} printf("<GREATERTHAN>") ;
{EQUALITYCHECK} printf("<EQUALITYCHECK>") ;
{LCBRACKET} printf("<LCBRACKET>") ;
{RCBRACKET} printf("<RCBRACKET>") ;
{PLUS} printf("<PLUS>") ;
{MINUS} printf("<MINUS>") ;
{MUL} printf("<STAR>") ;
{DIV} printf("<DIV>") ;
{LPARAN} printf("<LPARAN>") ;
{RPARAN} printf("<RPARAN>") ;
{LSBRACKET} printf("<LSBRACKET>") ;
{RSBRACKET} printf("<RSBRACKET>") ;
{STRINGLITERAL} printf("<STRINGLITERAL>") ;
{BOOL} printf("<BOOL>") ;
{INT} printf("<INT>") ;
{FLOAT} printf("<FLOAT>") ;
{ID} printf("<ID>") ;
{HASHTAG} printf("<HASHTAG>") ;
{CONCAT} printf("<CONCAT>") ;

%%
int yywrap()
{
	return 1;
}
int main()
{
	yylex();
	return 0;
}
