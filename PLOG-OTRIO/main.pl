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
							  
colocarpequena(X,Y,P):-                	board(ListaSai),
										nth0(Y,ListaSai,Elemento,Resto), 
										nth0(2,Elemento,Elemento2,Resto2),
										nth0(X,Elemento2,Elemento3,Resto3),
										Elemento3=n1,!,
										replace(Elemento2, X, P, Lis),
										replace(Elemento,2,Lis,List),
										replace(ListaSai,Y,List,ListaSai2),
										asserta(board(ListaSai2)),
										display.							  
							  
colocarpequena(X,Y,P):- nl, write('Posicao ocupada!'),fail.
							  
%Coloca peca media no tabuleiro
							  
colocarmedia(X,Y,P):-                	board(ListaSai),
										nth0(Y,ListaSai,Elemento,Resto), 
										nth0(1,Elemento,Elemento2,Resto2),
										nth0(X,Elemento2,Elemento3,Resto3),
										Elemento3=n2,!,
										replace(Elemento2, X, P, Lis),
										replace(Elemento,1,Lis,List),
										replace(ListaSai,Y,List,ListaSai2),
										asserta(board(ListaSai2)),
										display.

colocarmedia(X,Y,P):- nl, write('Posicao ocupada!'),fail.

%Coloca peca grande no tabuleiro

colocargrande(X,Y,P):-					board(ListaSai),
										nth0(Y,ListaSai,Elemento,Resto), 
										nth0(0,Elemento,Elemento2,Resto2),
										nth0(X,Elemento2,Elemento3,Resto3),
										Elemento3=n3,!,
										replace(Elemento2, X, P, Lis),
										replace(Elemento,0,Lis,List),
										replace(ListaSai,Y,List,ListaSai2),
										asserta(board(ListaSai2)),
										display.
										
colocargrande(X,Y,P):- nl, write('Posicao ocupada!'),fail.

getcolor(Peca,Cor):- atom_chars(Peca,Char),
					nth0(0,Char,Cor,Resto2).

getsize(Peca,Tamanho):- atom_chars(Peca,Char),
					nth0(1,Char,Tamanho,Resto2).


%Faz jogada do jogador X TODO-> substituir a peca no set

jogadajogador1(X,Y,Peca):-getsize(Peca,Size),
						 Size='1',!,
						 p1Set(Set),
						 verificapecapequena(Set,Peca),
						 colocarpequena(X,Y,Peca).
						 
jogadajogador1(X,Y,Peca):-getsize(Peca,Size),
						 Size='2',!,
						 p1Set(Set),
						 verificapecamedia(Set,Peca),
						 colocarmedia(X,Y,Peca).
						 
jogadajogador1(X,Y,Peca):-getsize(Peca,Size),
						 Size='3',!,
						 p1Set(Set),
						 verificapecagrande(Set,Peca),
						 colocargrande(X,Y,Peca).
						 


%Verifica peca
verificapecagrande(Set,Peca):- 
							   nth0(0,Set,Lista,Resto2),
							   nth0(0,Lista,Lista2,Resto3),
							   member(Peca,Lista2),!.
							   
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