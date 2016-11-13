:- use_module(library(lists)).
%Tabuleiro
board([
	[[b3,r3,g3],
	[b2,r2,g2],
	[b1,r1,g1]],
	
	[[p3,b3,g3],
	[p2,b2,g2],
	[p1,b1,g1]],
	
	[[r3,n3,n3],
	[n2,r2,n2],
	[n1,n1,r1]]
]).

%Conjunto das peças iniciais dos jogadores
%Conjunto das peças do jogador 1
p1Set([
	[[b3,r3,g3],
	[b2,r2,g2],
	[b1,r1,g1]]
	]).
	
%Conjunto das peças do jogador 2
p2Set([
	[[b3,r3,g3],
	[b2,r2,g2],
	[b1,r1,g1]]
	]).	

%Conjunto das peças do jogador 3
p3Set([
	[[b3,r3,g3],
	[b2,r2,g2],
	[b1,r1,g1]]
	]).

%Conjunto das peças do jogador 4
p4Set([
	[[b3,r3,g3],
	[b2,r2,g2],
	[b1,r1,g1]]
	]).		

%______________________________________________

%Traduz os simbolos para uma representação mais agradável
translate(r3,'| R()      '). translate(g3,'| G()      '). translate(b3,'| B()      '). translate(p3,'| P()      '). 
translate(r2,'|    RO    '). translate(g2,'|    GO    '). translate(b2,'|    BO    '). translate(p2,'|    PO    '). 
translate(r1,'|       R* '). translate(g1,'|       G* '). translate(b1,'|       B* '). translate(p1,'|       P* ').
translate(n3,'| --       '). 
translate(n2,'|    --    '). 
translate(n1,'|       -- ').


%Seleciona a linha do tabuleiro de indice N, 0->topo, 1->meio, 2->baixo
escolhebloco(BlocoLinha,N) :- board(Board), nth0(N,Board,BlocoLinha).

%Desenham os conjuntos iniciais de peças, fora da zona de jogo, referente a cada jogador
printSetP3(Tam,Pos) :- write('  '), condPrintNum(Tam,Pos), p3Set(X), nth0(0,X,V), nth0(Tam,V,V2), nth0(Pos,V2,Elem), displayPiece(Elem), write('|+').
printSetP4(Tam,Pos) :- write('|+'), p4Set(X), nth0(0,X,V), nth0(Tam,V,V2), nth0(Pos,V2,Elem), displayPiece(Elem).
printSetP1 :- p1Set(X), nth0(N,X,T), display_bloco(T).
printSetP2 :- p2Set(X), nth0(N,X,T), display_bloco(T).

%Usado para desenhar os numeros do lado esquerdo
condPrintNum(X,N):- X \==1, write('   ').
condPrintNum(1,N):-write('  '), write(N).


%Desenha a peça
displayPiece(Piece) :- translate(Piece, Plem),
	write(Plem).

			
%desenha uma fila da lista obtida atraves de escolhe
display_row([]).
display_row([Elem|Rest]):-
	displayPiece(Elem),
	display_row(Rest).

%Desenha o bloco da linha
display_bloco([], N, Pos):- write('     |----------|+|----------|----------|----------|+|----------|').
display_bloco([Elem|Rest], N, Pos):-
	printSetP3(Pos,N),
	display_row(Elem),
	printSetP4(Pos,N),
	write('|'),
	nl,
	Pos1 is Pos +1,
	display_bloco(Rest, N,Pos1).

%Desenha o bloco (so com 1 argumento, usado para os conjuntos inicias de peças)
display_bloco([]):- write('                |||----------|----------|----------|||').
display_bloco([Elem|Rest]):-
	write('                ||'),
	display_row(Elem),
	write('|||'),
	nl,
	display_bloco(Rest).
	
%Desenha o tabuleiro de jogo
display_board([],N).
display_board([Board|Rest],N):-	
	Pos is 0,
	escolhebloco(X,N),
	display_bloco(X, N, Pos),
	nl,
	N1 is N+1,
	display_board(Rest,N1).
	 

%Desenha o tabuleiro completo
display:- board(X),
	nl, write('                        A          B          C       '),
	nl, write('                |||----------|----------|----------|||'),
	nl, printSetP1,
	nl, write('                |++++++++++++++++++++++++++++++++++++|'),
	nl, write('     |----------|+|----------|----------|----------|+|----------'),
	nl,
	display_board(X,0),
		write('                |++++++++++++++++++++++++++++++++++++|'),
	nl, write('                |||----------|----------|----------|||'),
	nl, printSetP2.




 
 
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
 win(Board) :- 	winLineSame(Board), %linha mesmo tamanho
 		winLineAsc(Board), %linha tamanho ascendente
 		winLineDsc(Board), %linha tamanho descendente
		winConc(Board). %concentrica
 

