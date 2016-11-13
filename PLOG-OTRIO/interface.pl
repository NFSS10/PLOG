:- consult(draw).
:- consult(condicoes).



%Se a posicao e valida //TODO trocar testeCorreto
posicaoValida(X, Y) :- posicaoValidaLin(X), posicaoValidaCol(Y), !, testeCorreto.
%Se Invalida
posicaoValida(X, Y) :- msgCoordInvalida, readCoords.
msgCoordInvalida :- nl, nl, write('--- Coordenadas Incorretas, Insire corretamente as coordenadas ---'), nl, nl.

%Pede as coordenadas ao utlizador
readCoords(X1,Y1) :- getCoord(X1, Y1),!, posicaoValida(X, Y).


testeCorreto :- nl, write('CORRETO'), nl.

