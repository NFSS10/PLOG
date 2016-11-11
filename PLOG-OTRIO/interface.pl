:- consult(draw).
:- consult(engine).

%posicoes validas
posicaoValidaLin(0).
posicaoValidaLin(1).
posicaoValidaLin(2).
posicaoValidaCol(0).
posicaoValidaCol(1).
posicaoValidaCol(2).

%Pede ao utilizador as coordenadas e recolhe as mesmas
getCoord(X, Y,Peca) :- write('Insira a coordenada desejada'), nl,
			write('X ("0" a "2"): '),
			read(X),
			posicaoValidaLin(X),
			write('Y ("0" a "2"): '),
			read(Y),
			posicaoValidaCol(Y),
			write('Ecolha peca (corTamanho, exemplo r3 para peça vermelha e grande)'),
			read(Peca),
			nl.

getCoord(X, Y) :- write('Posicao invalida!'),nl,getCoord(X, Y).



%Se a posicao e valida //TODO trocar testeCorreto
posicaoValida(X, Y) :- posicaoValidaLin(X), posicaoValidaCol(Y), !, testeCorreto.
%Se Invalida
posicaoValida(X, Y) :- msgCoordInvalida, readCoords.
msgCoordInvalida :- nl, nl, write('--- Coordenadas Incorretas, Insire corretamente as coordenadas ---'), nl, nl.

%Pede as coordenadas ao utlizador
readCoords(X1,Y1) :- getCoord(X1, Y1),!, posicaoValida(X, Y).


testeCorreto :- nl, write('CORRETO'), nl.

