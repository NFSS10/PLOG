:- consult(draw).
:- consult(engine).

%posicoes validas
posicaoValidaLin(0).
posicaoValidaLin(1).
posicaoValidaLin(2).
posicaoValidaCol(a).
posicaoValidaCol(b).
posicaoValidaCol(c).

%Pede ao utilizador as coordenadas e recolhe as mesmas
getCoord(Lin, Col) :- write('Insira a coordenada desejada'), nl,
			write('Linha ("0" a "2"): '),
			read(Lin),
			write('Coluna ("A" a "C"): '),
			read(Col),
			nl.

%Se a posicao e valida //TODO trocar testeCorreto
posicaoValida(Lin, Col) :- posicaoValidaLin(Lin), posicaoValidaCol(Col), !, testeCorreto.
%Se Invalida
posicaoValida(Lin, Col) :- msgCoordInvalida, readCoords.
msgCoordInvalida :- nl, nl, write('--- Coordenadas Incorretas, Insire corretamente as coordenadas ---'), nl, nl.

%Pede as coordenadas ao utlizador
readCoords :- getCoord(Lin, Col), posicaoValida(Lin, Col).


testeCorreto :- nl, write('CORRETO'), nl.

