:- ensure_loaded(linha_baixo).
:- ensure_loaded(lados).
:- ensure_loaded(linha_cima).
:- ensure_loaded(print).
:- ensure_loaded(verificacoes).
:- ensure_loaded(meio).
:- use_module(library(lists)).
:- use_module(library(clpfd)).


%Devolve as solucoes para o cubo
%N : Tamanho de aresta "NxNxN"
solveCube(X,N):-	N < 1, !, nl, write('insira um N valido (N >0)').
solveCube(X,N):-	Tam is 6*N*N,
				length(X,Tam), 
				domain(X,1,4),
				while(Tam, 0,X,N),
				reset_timer,
				labeling([ffc],X),
				display_cube(X,N),
				print_time,
				fd_statistics.

			
%Restricao			
restricao(P1,P2,P3,P4,P5)	:-	(P1 #= 1 #/\ ((P2#=4 #\/ P3#=4 #\/ P3#=4 #\/ P5#=4)#/\((#\(P2 #= 4 #/\ P3 #=4)) #/\ (#\(P2 #= 4 #/\ P4 #=4))#/\ (#\(P2 #= 4 #/\ P5 #=4))
									#/\ (#\(P3 #= 4 #/\ P4 #=4)) #/\ (#\(P3 #= 4 #/\ P5 #=4)) #/\ (#\(P4 #= 4 #/\ P5 #=4)))))
							#\/
							(P1 #= 2 #/\ ((P2#=3 #\/ P3#=3 #\/ P3#=3 #\/ P5#=3)#/\((#\(P2 #= 3 #/\ P3 #=3)) #/\ (#\(P2 #= 3 #/\ P4 #=3))#/\ (#\(P2 #= 3 #/\ P5 #=3))
									#/\ (#\(P3 #= 3 #/\ P4 #=3)) #/\ (#\(P3 #= 3 #/\ P5 #=3)) #/\ (#\(P4 #= 3 #/\ P5 #=3)))))
							#\/
							(P1 #= 3 #/\ ((P2#=1 #\/ P3#=1 #\/ P3#=1 #\/ P5#=1)#/\((#\(P2 #= 1 #/\ P3 #=1)) #/\ (#\(P2 #= 1 #/\ P4 #=1))#/\ (#\(P2 #= 1 #/\ P5 #=1))
									#/\ (#\(P3 #= 1 #/\ P4 #=1)) #/\ (#\(P3 #= 1 #/\ P5 #=1)) #/\ (#\(P4 #= 1 #/\ P5 #=1)))))
							#\/
							(P1 #= 4 #/\ ((P2#=2 #\/ P3#=2 #\/ P3#=2 #\/ P5#=2)#/\((#\(P2 #= 2 #/\ P3 #=2)) #/\ (#\(P2 #= 2 #/\ P4 #=2))#/\ (#\(P2 #= 2 #/\ P5 #=2))
									#/\ (#\(P3 #= 2 #/\ P4 #=2)) #/\ (#\(P3 #= 2 #/\ P5 #=2)) #/\ (#\(P4 #= 2 #/\ P5 #=2))))).
							


%Ciclo que passa por todas as posicoes do cubo e testa as restricoes
while(0,_ , Cube,_).
while(N, A, Cube, Nr) :-	N1 is N -1,
						adjacente(A,Adj1,Adj2,Adj3,Adj4,Nr),
						nth0(A,Cube,Peca),
						nth0(Adj1,Cube,PecaA1),
						nth0(Adj2,Cube,PecaA2),
						nth0(Adj3,Cube,PecaA3),
						nth0(Adj4,Cube,PecaA4),
						restricao(Peca,PecaA1,PecaA2,PecaA3,PecaA4),
						A1 is A + 1,
		while(N1, A1, Cube, Nr).



			
reset_timer :- statistics(walltime,_).	
print_time :-
	statistics(walltime,[_,T]),
	TS is ((T//10)*10)/1000,
	nl, write('Time: '), write(TS), write('s'), nl, nl.






	

%Devolve as posicoes adjacentes a P
%Verifica e usa o predicado correspondente à posicao P
% P : Posicao da qual queremos as adjacentes
% Adj1, Adj2, Adj3, Adj4 : Posicoes adjacentes a P	
%N : Tamanho da aresta do cubo "NxNxN"	
				 
%linha de cima										 
adjacente(P,Adj1,Adj2,Adj3,Adj4,N):-	((P>=0,
										P<4*N);
										(P>=N*N*4,
										P < N*N*4+2*N)),
										linhaCima(P,Adj1,Adj2,Adj3,Adj4,N).
										
%linha de baixo										
adjacente(P,Adj1,Adj2,Adj3,Adj4,N):-	P>=(N-1)*N*4,
										P<4*N*N,
										calcLBP(N, P, Adj1, Adj2, Adj3, Adj4).
										
adjacente(P,Adj1,Adj2,Adj3,Adj4,N):-	P>=(N*N*4+N*N*2)-2*N,
										P < N*N*4+N*N*2-N,
										ladoBaixoTopo(P,Adj1,Adj2,Adj3,Adj4,N).
										
adjacente(P,Adj1,Adj2,Adj3,Adj4,N):-	P>=(N*N*4+N*N*2)-N,
										P< 4*N*N+2*N*N,
										calcLBB(N, P, Adj1, Adj2, Adj3, Adj4).
		

		
%lados	do principal						
adjacente(P,Adj1,Adj2,Adj3,Adj4,N):-
										0 is mod(P,4*N),
										P<N*N*4,
										getAdjLE(N, P, Adj1, Adj2, Adj3, Adj4).
																
adjacente(P,Adj1,Adj2,Adj3,Adj4,N):-
										0 is mod(P+1,4*N),
										P<N*N*4,
										getAdjLD(N, P, Adj1, Adj2, Adj3, Adj4).
										
%meio do principal 
adjacente(P,Adj1,Adj2,Adj3,Adj4,N):-	P<N*N*4,
										linhaMeioPrincipal(P,Adj1,Adj2,Adj3,Adj4,N).
										
										
%lados das tampas
adjacente(P,Adj1,Adj2,Adj3,Adj4,N):-
										0 is mod(P,2*N),
										P>N*N*4,
										ladoEsquerdoTopo(P,Adj1,Adj2,Adj3,Adj4,N).
										
adjacente(P,Adj1,Adj2,Adj3,Adj4,N):-
										0 is mod(P+1,2*N),
										P>N*N*4,
										getAdjLBD(N,P,Adj1,Adj2,Adj3,Adj4).
										
adjacente(P,Adj1,Adj2,Adj3,Adj4,N):-
										0 is mod(P+1,N),
										P>N*N*4,
										ladoDireitoTopo(P,Adj1,Adj2,Adj3,Adj4,N).
										
adjacente(P,Adj1,Adj2,Adj3,Adj4,N):-
										0 is mod(P,N),
										P>N*N*4,
										getAdjLBE(N,P,Adj1,Adj2,Adj3,Adj4).
										
adjacente(P,Adj1,Adj2,Adj3,Adj4,N):- 	P>N*N*4,
										linhaMeioTampas(P,Adj1,Adj2,Adj3,Adj4,N).



