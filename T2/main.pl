:- ensure_loaded(linha_baixo).
:- ensure_loaded(lados).
:- ensure_loaded(paulostuff).

%Cubo N=3
cube([
	%------ F1 -------      ------- F2 --------		------- F3 --------		------- F4 --------					
	P0,		P1,		P2,		P3,		P4,		P5,		P6,		P7,		P8,		P9,		P10,	P11,
	P12,	P13,	P14,	P15,	P16,	P17,	P18,	P19,	P20,	P21,	P22,	P23,
	P24,	P25,	P26,	P27,	P28,	P29,	P30,	P31,	P32,	P33,	P34,	P35,

	
	%---- F5 topo -----			---- F6 baixo -----
	P36,	P37,	P38,		P39,	P40,	P41,	
	P42,	P43,	P44,		P45,	P46,	P47,
	P48,	P49,	P50,		P51,	P52,	P53
]).


main(X) :- cube(X),
		domain(X,1,4),
		
		labeling([],X),
		write(X).

jogada(P1,P2,P3,P4,P5)	:-	(P1 #= 1 #/\ (P2 #= 4 #\ P3 #=4 #\ P4 #=4 #\ P5 #=4))
							#\/
							(P1 #= 2 #/\ (P2 #= 3 #\ P3 #=3 #\ P4 #=3 #\ P5 #=3))
							#\/
							(P1 #= 3 #/\ (P2 #= 1 #\ P3 #=1 #\ P4 #=1 #\ P5 #=1))
							#\/
							(P1 #= 4 #/\ (P2 #= 2 #\ P3 #=2 #\ P4 #=2 #\ P5 #=2)).
							

%0  1  2  3     4  5  6  7 	 8  9  10  11	 12  13  14  15
%16 17 18 19   20 21 22 23   24 25 26  27    28  29  30  31
%32 33 34 35   36 37 38 39   40 41 42  43    44  45  46  47
%48 49 50 51   52 53 54 55   56 57 58  59    60  61  62  63


%64 65 66 67   68 69 70 71
%72 73 74 75   76 77 78 79
%80 81 82 83   84 85 86 87
%88 89 90 91   92 93 94 95

while(0,_ , Cube,_).
while(N, A, Cube,Nr) :-	N1 is N -1,
						adjacente(A,Adj1,Adj2,Adj3,Adj4,Nr),
						nth0(A,Cube,Peca),
						nth0(Adj1,Cube,PecaA1),
						nth0(Adj2,Cube,PecaA2),
						nth0(Adj3,Cube,PecaA3),
						nth0(Adj4,Cube,PecaA4),
						jogada(Peca,PecaA1,PecaA2,PecaA3,PecaA4),
						A1 is A + 1,
						while(N1, A1,Cube,Nr).


ttt(X,N):-
			Tam is 6*N*N,
			length(X,Tam), 
			domain(X,1,4),
			while(Tam, 0,X,N),
			reset_timer,
			labeling([],X),
			print_time,
			fd_statistics.
			
reset_timer :- statistics(walltime,_).	
print_time :-
	statistics(walltime,[_,T]),
	TS is ((T//10)*10)/1000,
	nl, write('Time: '), write(TS), write('s'), nl, nl.






									 
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
										
adjacente(P,Adj1,Adj2,Adj3,Adj4,N):- 	linhaMeioTampas(P,Adj1,Adj2,Adj3,Adj4,N).



