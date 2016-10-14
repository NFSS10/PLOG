:- use_module(library(lists)).

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


p1Set([
	[[b3,r3,g3],
	[b2,r2,g2],
	[b1,r1,g1]]
	]).

p2Set([
	[[b3,r3,g3],
	[b2,r2,g2],
	[b1,r1,g1]]
	]).	


p3Set([
	[[b3,r3,g3],
	[b2,r2,g2],
	[b1,r1,g1]]
	]).


p4Set([
	[[b3,r3,g3],
	[b2,r2,g2],
	[b1,r1,g1]]
	]).		

	
	
do(X):- printSet34B(V,X),write(V). %//TODO colocar displaySetRow....

coiso(0):- do(X).
coiso(X):- X \== 3, dooutro.

dooutro :- write('*+').

%print the board //TODO ajusatar so para o set e so para o board
print_board([]).
print_board([Lin|Rest]):-
	print_line(Lin,0),
	print_board(Rest).

%Print 1 line of the board
print_line([],X):- write('----------------------------------'),nl.
print_line([Elem|Rest],X):-
	printaux(Elem),
	write('|'), 
		coiso(X),nl, %imprimir aqui as do lado direito, dar 1n e as do lado esquerdo
		X1 is X+1,
	print_line(Rest,X1).

%print the set of pieces in a position
printaux([]).
printaux([X|Rest]):-
	translate(X, Plem),
	write(Plem),
	printaux(Rest).



% Translate the board to the displaying symbols
translate(r3,'| R()      '). translate(g3,'| G()      '). translate(b3,'| B()      '). translate(p3,'| P()      '). 
translate(r2,'|    RO    '). translate(g2,'|    GO    '). translate(b2,'|    BO    '). translate(p2,'|    PO    '). 
translate(r1,'|       R* '). translate(g1,'|       G* '). translate(b1,'|       B* '). translate(p1,'|       P* ').
translate(n3,'| --       '). 
translate(n2,'|    --    '). 
translate(n1,'|       -- ').

% Display the board
display :- nl, write('----------------------------------'),nl
			,p1Set(Y), print_board(Y)
			,write('----------------------------------'),nl
			, board(X), print_board(X).


			

			
	

%v2 =  list with pieces ordered by size, (N=0 -> big, N=1 -> medium, N=2 -> small)
printSet34B(V2,N) :- p3Set(X), nth0(0,X,V), nth0(N,V,V2).

escolhe(V2,N,N1) :- board(X), nth0(N1,X,V), nth0(N,V,V2).

escolhebloco(V,N) :- board(X), nth0(N,X,V).
testebloco :- escolhebloco(X,0), write(X).



%TODO TALVEZ MELHOR, alternativo, talvez mais facil, visto ter um problema em imprimir de lado
display2 :- nl, write('----------------------------------'),nl,
			escolhe(X,0,0),
			write(X), nl,
			escolhe(Y,1,0),
			write(Y), nl,
			escolhe(Z,2,0),
			write(Z), nl,
			nl,
			escolhe(A,0,1),
			write(A), nl,
			escolhe(B,1,1),
			write(B), nl,
			escolhe(C,2,1),
			write(C), nl,
			nl,
			escolhe(E,0,2),
			write(E), nl,
			escolhe(F,1,2),
			write(F), nl,
			escolhe(G,2,2),
			write(G), nl,
			nl.
			
%desenha uma fila da lista obtida atraves de escolhe
display_row([]).
display_row([Elem|Rest]):-
	displayPiece(Elem),
	display_row(Rest).

%desenha o bloco
display_bloco([], N, Pos):- write('----------------------------------').
display_bloco([Elem|Rest], N, Pos):-
	printSetP3(Pos,N),
	display_row(Elem),
	printSetP4(Pos,N),
	write('|'),
	nl,
	Pos1 is Pos +1,
	display_bloco(Rest, N,Pos1).

%desenha o bloco (so com 1 argumento)
display_bloco([]):- write('----------------------------------').
display_bloco([Elem|Rest]):-
	display_row(Elem),
	write('|'),
	nl,
	display_bloco(Rest).
	
	
%ja deve funcionar
display_board([],N).
display_board([Board|Rest],N):-
	Pos is 0,
	escolhebloco(X,N),
	display_bloco(X, N, Pos),
	nl, %escrever depois
	N1 is N+1,
	display_board(Rest,N1).
	 



			
teste:- escolhe(T,0,0),write(T).
			
teste2:- escolhe(T,0,0),display_row(T).

teste3:- board(X), display_board(X,0).

teste4:-escolhebloco(X,1),display_bloco(X).


displayPiece(Piece) :- translate(Piece, Plem),
	write(Plem).

%%%%%%%%%%%
tprintSetP3(Elem,Tam,Pos) :- p3Set(X), nth0(0,X,V), nth0(Tam,V,V2), nth0(Pos,V2,Elem), displayPiece(Elem), write('p1').
printSetP3(Tam,Pos) :- p3Set(X), nth0(0,X,V), nth0(Tam,V,V2), nth0(Pos,V2,Elem), displayPiece(Elem), write('||').
printSetP4(Tam,Pos) :- write('||'), p4Set(X), nth0(0,X,V), nth0(Tam,V,V2), nth0(Pos,V2,Elem), displayPiece(Elem).
printSetP1 :- p1Set(X), nth0(N,X,T), display_bloco(T).
printSetP2 :- p2Set(X), nth0(N,X,T), display_bloco(T).


 