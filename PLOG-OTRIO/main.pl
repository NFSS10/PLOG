:- consult(draw).

 
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
 
teste :-
display, boardaa(X),asserta(board(X)), display.


%%%%%%%%%%%%%%%%%%%%CODIGO MA FRIEEEEEEEEEEEEEEEEND
teste2 :-	write('LER'),nl,
			write('A: '),
			read(A),
			write('B: '),
			read(B),
			nl, write(A),
			nl, write(B),
			nl.

