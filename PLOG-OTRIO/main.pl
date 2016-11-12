:- consult(interface).
:- use_module(library(random)).
 
%TODO: Selecionar jogador
%TODO: Selecionar peca a mover
%TODO: Verificar se movimento e valido
%TODO: Movimentar peca
%TODO: Verificar estado do jogo
%TODO: Display de estado do jogo, ganhas-te n é possivel mover, etc
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Fazer so para 2 primeiro, fazer para 3 e 4 no futuro %%%%%%
% X jogador a selecionar, N numero total de jogadores permitido
%selectPlayer(X, N):- X > N, nl, write('Erro! numero de jogador selecionado maior que o numero de jogadores do jogo').
%selectPlayer(X, N):- X < 1, nl, write('Erro! numero de jogador selecionado menor que o numero minimo de jogadores').
%selectPlayer(1, N):- 
%selectPlayer(2, N):-
%selectPlayer(3, N):-
%selectPlayer(4, N):-
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% X jogador a selecionar
%selectPlayer(X):- X > 2, nl, write('Erro! numero de jogador selecionado maior que o numero de jogadores do jogo').
%selectPlayer(X):- X < 1, nl, write('Erro! numero de jogador selecionado menor que o numero minimo de jogadores').
%selectPlayer(1):- %selecionarPecaAmover(1). 
%selectPlayer(2):-

%selecionarPecaAmover(1):- %pedir ao user para inserir valor e chamar funcao que verifique se a peca esta disponivel
%depois de verificar se a peca esta disponivel, essa funcao chamar funcao para pedir coordenadas de onde meter a peca
% e talvez ter botao para voltar atras
% depois de obter as coordenadas chamar metodo que verifique se a jogada e possivel e agir conforme, ...
 
 
 %%TESTE condicao de vencer
 %win(Board) :- 	winLineSame(Board), %linha mesmo tamanho
 %		winLineAsc(Board), %linha tamanho ascendente
 %		winLineDsc(Board), %linha tamanho descendente
%		winConc(Board). %concentrica
 
%teste :-
%display, boardaa(X),asserta(board(X)), display.


%%%%%%%%%%%%%%%%%%%%CODIGO MA FRIEEEEEEEEEEEEEEEEND
teste2 :-	write('LER'),nl,
			write('A: '),
			read(A),
			write('B: '),
			read(B),
			nl, write(A),
			nl, write(B),
			nl.

%%%%%%%%%%%%%%%%%%%%%FIZ DAQUI PARA BAIXO

%Da replace na lista dado o indx(I) e o valor pretendido(X) devolva a lista modificada

replace([_|T], 0, X, [X|T]).
replace([H|T], I, X, [H|R]):- I > 0,	
							  I1 is I-1,
							  replace(T, I1, X, R).




%Coloca peca na ListaSai(tabuleiro) e retorna  ListaSai2(tabueiro modificado) sendo X,Y as coordenadas, P a peça, Elem (n1,n2,n3) conforme o tamanho da peça, Fila indica Y em cada bloco ex:0 para grande.

colocarpeca(X,Y,P,Fila,Elem,ListaSai,ListaSai2):-
										nth0(Y,ListaSai,Elemento,Resto), 
										nth0(Fila,Elemento,Elemento2,Resto2),
										nth0(X,Elemento2,Elemento3,Resto3),
										Elemento3=Elem,
										replace(Elemento2, X, P, Lis),
										replace(Elemento,Fila,Lis,List),
										replace(ListaSai,Y,List,ListaSai2).
										
									
										
colocarpeca(X,Y,P,Fila,Elem,ListaSai,ListaSai2):- nl, write('Posicao ocupada!'),fail.

getcolor(Peca,Cor):- atom_chars(Peca,Char),
					nth0(0,Char,Cor,Resto2).

getsize(Peca,Tamanho):- atom_chars(Peca,Char),
					nth0(1,Char,Tamanho,Resto2).


%Faz jogada do jogador X 

jogadaX(X,Y,Peca,Set,NewSet):-getsize(Peca,Size),
									Size='1',!,
									board(Board),!,
									verificapeca(Set,Peca,2),!,
									removepeca(Set,Peca,2,NewSet),!,
									colocarpeca(X,Y,Peca,2,n1,Board,Newboard),
									asserta(board(Newboard)).
								
						 
jogadaX(X,Y,Peca,Set,NewSet):-getsize(Peca,Size),
									Size='2',!,
									board(Board),!,
									verificapeca(Set,Peca,1),!,
									removepeca(Set,Peca,1,NewSet),!,
									colocarpeca(X,Y,Peca,1,n2,Board,Newboard),
									asserta(board(Newboard)).
							
						 
jogadaX(X,Y,Peca,Set,NewSet):-getsize(Peca,Size),
									Size='3',!,
									board(Board),!,
									verificapeca(Set,Peca,0),!,
									removepeca(Set,Peca,0,NewSet),!,
									colocarpeca(X,Y,Peca,0,n3,Board,Newboard),
									asserta(board(Newboard)).
									
						 
						 
%Faz jogada do jogador 1 ou 2 


jogadajogador1(X,Y,Peca):-	p1Set(Set),!,
							jogadaX(X,Y,Peca,Set,NewSet),
							asserta(p1Set(NewSet)).
						
							
jogadajogador2(X,Y,Peca):-	p2Set(Set),!,
							jogadaX(X,Y,Peca,Set,NewSet),
							asserta(p2Set(NewSet)).
											

			 
						 

%Verifica se a peca existe no Set
verificapeca(Set,Peca,Tamanho):- 
							   nth0(0,Set,Lista,Resto2),
							   nth0(Tamanho,Lista,Lista2,Resto3),
							   member(Peca,Lista2).
							   
verificapeca(Set,Peca,Tamanho):- nl, write('Peca indisponivel para jogar'),fail.
							   
							   

%Modifica a primeira ocurrencia de Old na lista Old por New e devolve a lista New -> changeFst(Old,ListaOld,New,ListaNew).

changeFst(Old,[Old|Olds],New,[New|Olds]).
changeFst(Old,[E|Olds],New,[E|News]):-
   dif(Old, E),
   changeFst(Old,Olds,New,News).

 
%Remove peca do Set e devolve o set modificado 

removepeca(Set,Peca,Tamanho,Newset):- nth0(0,Set,Lista,Resto2),
							 nth0(Tamanho,Lista,Lista2,Resto3),
							 changeFst(Peca,Lista2,n3,Newlist),
							 replace(Lista, Tamanho, Newlist, NNewlist),
							 replace(Set, 0, NNewlist, Newset).
	

							
%Lista o indice de um elemento numa lista

indexOf([Element|_], Element, 0).
indexOf([_|Tail], Element, Index):-
  indexOf(Tail, Element, Index1),
  Index is Index1+1.			 

  

%interpola x com cada elemento da lista e retorna ListaSaida

interpolate(X,[],[]).
interpolate(X,[Element|Tail],ListaSaida):-append([],[[Element,X]],Lista),
											interpalate(X,Tail,Lista,ListaSaida).		

interpalate(_,[],List,List).
interpalate(X,[Element|Tail],Lista,ListaSaida):-append(Lista,[[Element,X]],List),
											interpalate(X,Tail,List,ListaSaida).											
									

%devove coordenadas livres duma linha, Elemento= n1,n2,n3 conforme tamanho, Y =0,1,2 conforme o Y no tabuleiro,devolve Listacoor

coordenadaslivre(Linha,Y,Elemento,ListaCoor) :- findall(Index,indexOf(Linha,Elemento,Index),Bag),
													 interpolate(Y,Bag,ListaCoor).
										
									

%Devolve jogadas possiveis para uma peça tamanho X, devolve ListaJogadas, Elemento=n3,n2,n1 e Linha é a linha em cada bloco (ex:0 para grande)

jogadapossivelX(ListaJogadas,Elemento,Linha):- board(Board),
									 nth0(0,Board,Bloco1,Resto1), 
									 nth0(Linha,Bloco1,Linha1,Resto2),
									 coordenadaslivre(Linha1,0,Elemento,ListaCoor1),
									 nth0(1,Board,Bloco2,Resto3), 
									 nth0(Linha,Bloco2,Linha2,Resto4),
									 coordenadaslivre(Linha2,1,Elemento,ListaCoor2),
									 nth0(2,Board,Bloco3,Resto5), 
									 nth0(Linha,Bloco3,Linha3,Resto6),
									 coordenadaslivre(Linha3,2,Elemento,ListaCoor3),
									 append(ListaCoor1,ListaCoor2,ListaMetade),
									 append(ListaMetade,ListaCoor3,ListaJogadas).
									 
%devolve em ListaJogadas a lista de jogadas permitidas para cada tipo de peça

jogadapossivelgrande(ListaJogadas):- jogadapossivelX(ListaJogadas,n3,0).	
jogadapossivelmedia(ListaJogadas):- jogadapossivelX(ListaJogadas,n2,1).	
jogadapossivelpequena(ListaJogadas):- jogadapossivelX(ListaJogadas,n1,2).				 
									 
									 
%Faz jogada random

escolherPeca(Set,Peca):-	 	  
							   nth0(0,Set,RealSet,Resto1),
							   nth0(0,RealSet,Grandes,Resto2),	
							   nth0(1,RealSet,Medias,Resto3),	
							   nth0(2,RealSet,Pequenas,Resto4),
							   append(Grandes,Medias,PecasSet),
							   append(PecasSet,Pequenas,PecasCompleto),
							   delete(PecasCompleto,n3,Semn3),
							   delete(Semn3,n2,Semn3n2),
							   delete(Semn3n2,n1,PecasExistentes),
							   length(PecasExistentes,Tamanho),!,
							   random(0,Tamanho,Nrandom),
							   nth0(Nrandom,PecasExistentes,Peca,Resto5).
							   
							   					

jogadacomputadorX(Peca,Set,NewSet):- 
								getsize(Peca,Size),
								Size='3',!,
								jogadapossivelgrande(ListaJogadas),
								length(ListaJogadas,Tamanho),
							    random(0,Tamanho,Nrandom),
								nth0(Nrandom,ListaJogadas,Jogada,Resto1),
								nth0(0,Jogada,X,Resto2),
								nth0(1,Jogada,Y,Resto3),
								jogadaX(X,Y,Peca,Set,NewSet).

jogadacomputadorX(Peca,Set,NewSet):- 
								getsize(Peca,Size),
								Size='2',!,
								jogadapossivelmedia(ListaJogadas),
								length(ListaJogadas,Tamanho),
							    random(0,Tamanho,Nrandom),
								nth0(Nrandom,ListaJogadas,Jogada,Resto1),
								nth0(0,Jogada,X,Resto2),
								nth0(1,Jogada,Y,Resto3),
								jogadaX(X,Y,Peca,Set,NewSet).

jogadacomputadorX(Peca,Set,NewSet):- 
								getsize(Peca,Size),
								Size='1',!,
								jogadapossivelpequena(ListaJogadas),
								length(ListaJogadas,Tamanho),
							    random(0,Tamanho,Nrandom),
								nth0(Nrandom,ListaJogadas,Jogada,Resto1),
								nth0(0,Jogada,X,Resto2),
								nth0(1,Jogada,Y,Resto3),
								jogadaX(X,Y,Peca,Set,NewSet).								

%Funcao aux para jogada random

jogadacomputadorA(Peca,Set):- 
					         jogadacomputadorX(Peca,Set,NewSet),
							 asserta(p1Set(NewSet)),!.
                      
					
jogadacomputadorB(Peca,Set):- 
					         jogadacomputadorX(Peca,Set,NewSet),
							 asserta(p2Set(NewSet)),!.					  
				  
%Funcao faz jogada computador.

jogadacomputador1:-
				   p1Set(Set),!,
				   escolherPeca(Set,Peca),!,
				   jogadacomputadorA(Peca,Set).
				   

jogadacomputador2:-
				   p2Set(Set),!,
				   escolherPeca(Set,Peca),!,
				   jogadacomputadorB(Peca,Set).
						   
				   
				   
%posicoes validas
posicaoValidaLin(0).
posicaoValidaLin(1).
posicaoValidaLin(2).
posicaoValidaCol(0).
posicaoValidaCol(1).
posicaoValidaCol(2).

%Pede ao utilizador as coordenadas e recolhe as mesmas

getCoord(X, Y,Peca) :- 			
			getsize(Peca,Size),
			Size='3',
			write('Insira a coordenada desejada'), nl,
			write('X ("0" a "2"): '),
			read(X),
			posicaoValidaLin(X),
			write('Y ("0" a "2"): '),
			read(Y),
			append([X],[Y],Coords),
			posicaoValidaCol(Y),
			jogadapossivelgrande(ListaJogadas),!,
			member(Coords,ListaJogadas),
			nl.

getCoord(X, Y,Peca) :-		
			getsize(Peca,Size),
			Size='2',
			write('Insira a coordenada desejada'), nl,
			write('X ("0" a "2"): '),
			read(X),
			posicaoValidaLin(X),
			write('Y ("0" a "2"): '),
			read(Y),
			append([X],[Y],Coords),
			posicaoValidaCol(Y),
			jogadapossivelmedia(ListaJogadas),!,
			member(Coords,ListaJogadas),
			nl.
			
getCoord(X, Y,Peca) :- 
			getsize(Peca,Size),
			Size='1',
			write('Insira a coordenada desejada'), nl,
			write('X ("0" a "2"): '),
			read(X),
			posicaoValidaLin(X),
			write('Y ("0" a "2"): '),
			read(Y),
			append([X],[Y],Coords),
			posicaoValidaCol(Y),
			jogadapossivelpequena(ListaJogadas),!,
			member(Coords,ListaJogadas),
			nl.




readCoords(X,Y,Peca) :-getCoord(X,Y,Peca).

readCoords(X,Y,Peca) :- write('Posicao indisponivel ou ocupada'),nl, readCoords(X,Y,Peca).


getPecaInterface(Peca,Set) :- write('Insira a peca desejada (corTamanho, exemplo r3)!'), 
					          read(Peca),
					          verificaPecaSet(Peca,Set).

					 
					 
getPecaInterface(Peca,Set) :-  write('Peca nao disponivel!'), nl,  getPecaInterface(Peca,Set).

					 
					 

verificaPecaSet(Peca,Set) :-   nth0(0,Set,RealSet,Resto1),
							   nth0(0,RealSet,Grandes,Resto2),	
							   nth0(1,RealSet,Medias,Resto3),	
							   nth0(2,RealSet,Pequenas,Resto4),
							   append(Grandes,Medias,PecasSet),
							   append(PecasSet,Pequenas,PecasCompleto),
							   delete(PecasCompleto,n3,Semn3),
							   delete(Semn3,n2,Semn3n2),
							   delete(Semn3n2,n1,PecasExistentes),
							   length(PecasExistentes,Tamanho),!,	
							   member(Peca,PecasExistentes).

playpvp :- p1Set(Set1),
		   p2Set(Set2),
		   nl,
		   write('JOGADOR 1: '),
		   nl,
		   nl,
		   getPecaInterface(Peca1,Set1),
		   readCoords(X1,Y1,Peca1),
		   jogadajogador1(X1,Y1,Peca1),
		   display,
		   verSeGanhou,
		   nl,
		   write('JOGADOR 2: '),
		   nl,
		   nl,
		   getPecaInterface(Peca2,Set2),
		   readCoords(X2,Y2,Peca2),
		   jogadajogador2(X2,Y2,Peca2),
		   display,
		   playpvp,
		   verSeGanhou.
		   
playpvc :- p1Set(Set1),
		   nl,
		   write('JOGADOR 1: '),
		   nl,
		   nl,
		   getPecaInterface(Peca1,Set1),
		   readCoords(X1,Y1,Peca1),
		   jogadajogador1(X1,Y1,Peca1),
		   %meter aqui
		   nl,
		   jogadacomputador2,
		   display,
		   verSeGanhou,
		   playpvc.