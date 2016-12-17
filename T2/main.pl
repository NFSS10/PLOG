:- use_module(library(lists)).
:- use_module(library(clpfd)).

%Cubo
cube([
	P0,		P1,		P2,		P3,		P4,		P5,		P6,		P7,		P8,		P9,		P10,	P11,
	P12,	P13,	P14,	P15,	P16,	P17,	P18,	P19,	P20,	P21,	P22,	P23,
	P24,	P25,	P26,	P27,	P28,	P29,	P30,	P31,	P32,	P33,	P34,	P35,

	
	%topo						%baixo
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
							



							
linhaBaixo(N, Pos)	:-	TamL is 4*N,
						Col is N-1,
						LimMin is TamL * Col,
						LimMax is LimMin + TamL,
						Pos >= LimMin, !,
						Pos < LimMax,
						nl, write('Linha Baixo').
						
getLinhaBaixoAdj(N, Pos, A1, A2, A3, A4)	:-	linhaBaixo(N, Pos), !,
												nl, write('continua'),
												\+getAdjCantoBE(N, Pos, A1, A2, A3, A4), !,
												nl, write('E da-lhe').

									

									
									
		
		
		
		
getAdjCantoBE(N, Pos, A1, A2, A3, A4)	:- 	verifCantoBE(N, Pos), !,
											getAdjCantoBEaux(N, Pos, A1, A2, A3, A4).


getAdjCantoBEaux(N, Pos, A1, A2, A3, A4)	:-	A1 is Pos + 1,
												A2 is Pos + (4 * N) + (((2*N) * N) - N),
												A3 is Pos + ((4 * N) - 1),
												A4 is Pos - (4 * N),
												
												
												nl,nl, write('Resteste: '), write(A1),
												write(' '), write(A2),
												write(' '), write(A3),
												write(' '), write(A4).

										
%verifica se é canto baixo esquerdo										
verifCantoBE(N, Pos)	:-	TamL is 4*N,
					Col is N-1,
					LimMin is TamL * Col,
					Pos = LimMin,
					nl, write('Canto esquerdo').
											
						