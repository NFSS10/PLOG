:- consult(draw).
:- consult(engine).
:- consult(main).

%posicoes validas
posicaoValidaLin(0).
posicaoValidaLin(1).
posicaoValidaLin(2).
posicaoValidaCol(a).
posicaoValidaCol(b).
posicaoValidaCol(c).

posicaoValidaTam(g).
posicaoValidaTam(m).
posicaoValidaTam(p).

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



%%%%%%%%%%%%%%%%%%%%%%%%%
%Ler do utilizador peca a jogar
getPecaSet(Tam) :- nl,
						write('Tamanho validos: g, m, p    "grande, medio, pequeno" respetivamente'), nl, nl,
						write('Insira o tamanho:  '),
						read(Tam), nl.
					


					
%Peca tamanho e coluna		
pedirPecaSet(Tam, Col, Set) :- getPecaSet(Tam), tamValidaSet(Tam), !,
						translatePeca(Tam, Peca),
						verificapeca(Set,Peca,Tamanho).
pedirPecaSet(Tam, Col, Set) :- pedirPecaSet(Tam, Col, Set).

%%%%%%%%%%%%%
%validaTamCol(Tam, Col) :-posicaoValidaSet(Col), !, tamValidaSet(Tam).

%posicaoValidaSet(Col) :- posicaoValidaCol(Col).
%posicaoValidaSet(Col) :- msgCoordInvalida, fail.

tamValidaSet(Tam) :- posicaoValidaTam(Tam).
tamValidaSet(Tam) :- nl, write('--- Tamanho Incorreto, Insire corretamente o tamanho ---'), nl, nl, fail.
%%%%%%%%%%%%%%%%%%%%%%			












/*
paulo
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

*/