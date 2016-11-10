:- consult(interface).

 
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



%Coloca peca pequena no tabuleiro
							  
colocarpequena(X,Y,P,ListaSai,ListaSai2):-           
										nth0(Y,ListaSai,Elemento,Resto), 
										nth0(2,Elemento,Elemento2,Resto2),
										nth0(X,Elemento2,Elemento3,Resto3),
										Elemento3=n1,
										replace(Elemento2, X, P, Lis),
										replace(Elemento,2,Lis,List),
										replace(ListaSai,Y,List,ListaSai2).
																	  
							  
colocarpequena(X,Y,P,ListaSai,ListaSai2):- nl, write('Posicao ocupada!'),fail.
							  
%Coloca peca media no tabuleiro
							  
colocarmedia(X,Y,P,ListaSai,ListaSai2):-        
										nth0(Y,ListaSai,Elemento,Resto), 
										nth0(1,Elemento,Elemento2,Resto2),
										nth0(X,Elemento2,Elemento3,Resto3),
										Elemento3=n2,
										replace(Elemento2, X, P, Lis),
										replace(Elemento,1,Lis,List),
										replace(ListaSai,Y,List,ListaSai2).
									

colocarmedia(X,Y,P,ListaSai,ListaSai2):- nl, write('Posicao ocupada!'),fail.

%Coloca peca grande na ListaSai(tabuleiro) e retorna  ListaSai2(tabueiro modificado)

colocargrande(X,Y,P,ListaSai,ListaSai2):-
										nth0(Y,ListaSai,Elemento,Resto), 
										nth0(0,Elemento,Elemento2,Resto2),
										nth0(X,Elemento2,Elemento3,Resto3),
										Elemento3=n3,
										replace(Elemento2, X, P, Lis),
										replace(Elemento,0,Lis,List),
										replace(ListaSai,Y,List,ListaSai2).
										
									
										
colocargrande(X,Y,P,ListaSai,ListaSai2):- nl, write('Posicao ocupada!'),fail.

getcolor(Peca,Cor):- atom_chars(Peca,Char),
					nth0(0,Char,Cor,Resto2).

getsize(Peca,Tamanho):- atom_chars(Peca,Char),
					nth0(1,Char,Tamanho,Resto2).


%Faz jogada do jogador X TODO-> substituir a peca no set

jogadajogador1(X,Y,Peca):-getsize(Peca,Size),
						 Size='1',!,
						 p1Set(Set),!,
						 board(Board),!,
						 verificapecapequena(Set,Peca),!,
						 removepecapequena(Set,Peca,Newset),!,
						 colocarpequena(X,Y,Peca,Board,Newboard),
						 asserta(board(Newboard)),
						 asserta(p1Set(Newset)),
						 display.
						 
jogadajogador1(X,Y,Peca):-getsize(Peca,Size),
						 Size='2',!,
						 p1Set(Set),!,
						 board(Board),!,
						 verificapecamedia(Set,Peca),!,
						 removepecamedia(Set,Peca,Newset),!,
						 colocarmedia(X,Y,Peca,Board,Newboard),
						 asserta(board(Newboard)),
						 asserta(p1Set(Newset)),
						 display.
						 
jogadajogador1(X,Y,Peca):-getsize(Peca,Size),
						 Size='3',!,
						 p1Set(Set),!,
						 board(Board),!,
						 verificapecagrande(Set,Peca),!,
						 removepecagrande(Set,Peca,Newset),!,
						 colocargrande(X,Y,Peca,Board,Newboard),
						 asserta(board(Newboard)),
						 asserta(p1Set(Newset)),
						 display.
						 
						 


%Verifica se a peca existe no Set
verificapecagrande(Set,Peca):- 
							   nth0(0,Set,Lista,Resto2),
							   nth0(0,Lista,Lista2,Resto3),
							   member(Peca,Lista2).
							   
verificapecagrande(Set,Peca):- nl, write('Peca indisponivel para jogar'),fail.
							   
							   


verificapecamedia(Set,Peca):-
							   nth0(0,Set,Lista,Resto2),
							   nth0(1,Lista,Lista2,Resto3),
							   member(Peca,Lista2),!.
							   
verificapecamedia(Set,Peca):- nl, write('Peca indisponivel para jogar'),fail.


verificapecapequena(Set,Peca):- nth0(0,Set,Lista,Resto2),
							   nth0(2,Lista,Lista2,Resto3),
							   member(Peca,Lista2),!.
							   
verificapecapequena(Set,Peca):- nl, write('Peca indisponivel para jogar'),fail.

%Modifica a primeira ocurrencia de Old na lista Old por New e devolve a lista New -> changeFst(Old,ListaOld,New,ListaNew).

changeFst(Old,[Old|Olds],New,[New|Olds]).
changeFst(Old,[E|Olds],New,[E|News]):-
   dif(Old, E),
   changeFst(Old,Olds,New,News).

 
%Remove peca do Set e devolve o set modificado 

removepecagrande(Set,Peca,Newset):- nth0(0,Set,Lista,Resto2),
							 nth0(0,Lista,Lista2,Resto3),
							 changeFst(Peca,Lista2,n3,Newlist),
							 replace(Lista, 0, Newlist, NNewlist),
							 replace(Set, 0, NNewlist, Newset).
	
removepecamedia(Set,Peca,Newset):- nth0(0,Set,Lista,Resto2),
							 nth0(1,Lista,Lista2,Resto3),
							 changeFst(Peca,Lista2,n2,Newlist),
							 replace(Lista, 1, Newlist, NNewlist),
							 replace(Set, 0, NNewlist, Newset).
								
removepecapequena(Set,Peca,Newset):- nth0(0,Set,Lista,Resto2),
							 nth0(2,Lista,Lista2,Resto3),
							 changeFst(Peca,Lista2,n1,Newlist),
							 replace(Lista, 2, Newlist, NNewlist),
							 replace(Set, 0, NNewlist, Newset).
							
%Lista o indice de um elemento numa lista

indexOf([Element|_], Element, 0).
indexOf([_|Tail], Element, Index):-
  indexOf(Tail, Element, Index1),
  Index is Index1+1.			 


%Devolve uma lista(Bag) com os indices livres da linha

listajogadasgrandelinha(Linha,Bag):- findall(Index,indexOf(Linha,n3,Index),Bag).

listajogadasmedialinha(Linha,Bag):- findall(Index,indexOf(Linha,n2,Index),Bag).

listajogadaspequenalinha(Linha,Bag):- findall(Index,indexOf(Linha,n1,Index),Bag).


%interpola x com cada elemento da lista

interpolate(X,[],[]).
interpolate(X,[Element|Tail],ListaSaida):-append([],[[Element,X]],Lista),
											interpalate(X,Tail,Lista,ListaSaida).		

interpalate(_,[],List,List).
interpalate(X,[Element|Tail],Lista,ListaSaida):-append(Lista,[[Element,X]],List),
											interpalate(X,Tail,List,ListaSaida).											
									

%devove coordenadas livres duma linha

coordenadaslivregrande0(Linha,ListaCoor) :- findall(Index,indexOf(Linha,n3,Index),Bag),
										interpolate(0,Bag,ListaCoor).
										
coordenadaslivregrande1(Linha,ListaCoor) :- findall(Index,indexOf(Linha,n3,Index),Bag),
										interpolate(1,Bag,ListaCoor).											
								  
coordenadaslivregrande2(Linha,ListaCoor) :- findall(Index,indexOf(Linha,n3,Index),Bag),
										interpolate(2,Bag,ListaCoor).



										
coordenadaslivremedia0(Linha,ListaCoor) :- findall(Index,indexOf(Linha,n2,Index),Bag),
										interpolate(0,Bag,ListaCoor).
										
coordenadaslivremedia1(Linha,ListaCoor) :- findall(Index,indexOf(Linha,n2,Index),Bag),
										interpolate(1,Bag,ListaCoor).											
								  
coordenadaslivremedia2(Linha,ListaCoor) :- findall(Index,indexOf(Linha,n2,Index),Bag),
										interpolate(2,Bag,ListaCoor).	



coordenadaslivrepequena0(Linha,ListaCoor) :- findall(Index,indexOf(Linha,n1,Index),Bag),
										interpolate(0,Bag,ListaCoor).
										
coordenadaslivrepequena1(Linha,ListaCoor) :- findall(Index,indexOf(Linha,n1,Index),Bag),
										interpolate(1,Bag,ListaCoor).											
								  
coordenadaslivrepequena2(Linha,ListaCoor) :- findall(Index,indexOf(Linha,n1,Index),Bag),
										interpolate(2,Bag,ListaCoor).											

%Devolve jogadas possiveis para uma peça grande.

jogadapossivelgrande(ListaJogadas):- board(Board),
									 nth0(0,Board,Bloco1,Resto1), 
									 nth0(0,Bloco1,Linha1,Resto2),
									 coordenadaslivregrande0(Linha1,ListaCoor1),
									 nth0(1,Board,Bloco2,Resto3), 
									 nth0(0,Bloco2,Linha2,Resto4),
									 coordenadaslivregrande1(Linha2,ListaCoor2),
									 nth0(2,Board,Bloco3,Resto5), 
									 nth0(0,Bloco3,Linha3,Resto6),
									 coordenadaslivregrande2(Linha3,ListaCoor3),
									 append(ListaCoor1,ListaCoor2,ListaMetade),
									 append(ListaMetade,ListaCoor3,ListaJogadas).
									 