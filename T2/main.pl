:- use_module(library(lists)).
:- use_module(library(clpfd)).

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
							



%verifica se pertence a linha de baixo				
linhaBaixo(N, Pos)	:-	TamL is 4*N,
						Col is N-1,
						LimMin is TamL * Col,
						LimMax is LimMin + TamL,
						Pos >= LimMin, !,
						Pos < LimMax,
						nl, write('Linha Baixo').
			
%calcula linha de baixo			
getLinhaBaixoAdj(N, Pos, A1, A2, A3, A4)	:-	linhaBaixo(N, Pos), !,
												calculaLB(N, Pos, A1, A2, A3, A4),
												nl, write('finish').

									

									
calculaLB(N, Pos, A1, A2, A3, A4) 	:-	getAdjCantoBE(N, Pos, A1, A2, A3, A4), nl,write('calc 1').
calculaLB(N, Pos, A1, A2, A3, A4) 	:-	getLinhaBaixoF1(N, Pos, A1, A2, A3, A4), nl,write('calc 2').
calculaLB(N, Pos, A1, A2, A3, A4) 	:-	getLinhaBaixoF2(N, Pos, A1, A2, A3, A4), nl,write('calc 3').
calculaLB(N, Pos, A1, A2, A3, A4) 	:- 	write('erro').
	



												
getPosRLinha(N, Pos, PosR) :-	TamL is 4*N,
							Col is N-1,
							LimMin is TamL * Col,
							PosR is Pos - LimMin.						
												

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%verifica se é canto baixo esquerdo										
verifCantoBE(N, Pos)	:-	TamL is 4*N,
					Col is N-1,
					LimMin is TamL * Col,
					Pos = LimMin,
					nl, write('Canto esquerdo').
getAdjCantoBE(N, Pos, A1, A2, A3, A4)	:- 	verifCantoBE(N, Pos), !,
											getAdjCantoBEaux(N, Pos, A1, A2, A3, A4).
getAdjCantoBEaux(N, Pos, A1, A2, A3, A4)	:-	A1 is Pos + 1,
												A2 is Pos + (4 * N) + (((2*N) * N) - N),
												A3 is Pos + ((4 * N) - 1),
												A4 is Pos - (4 * N).

												
												
												
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verificaLBF1(N, Pos)	:-	getPosRLinha(N, Pos, PosR),
							PosR > 0, !,
							PosR < N,
							nl, write('  Face  1 ').
							
getLinhaBaixoF1(N, Pos, A1, A2, A3, A4)	:-	verificaLBF1(N, Pos), !,
											getLinhaBaixoF1aux(N, Pos, A1, A2, A3, A4).
getLinhaBaixoF1aux(N, Pos, A1, A2, A3, A4)	:-	getPosRLinha(N, Pos, PosR),
											A1 is Pos + 1,					
											A2 is Pos + (4 * N) + (((2*N) * N) - N - PosR-(PosR *2*N)),
											A3 is Pos - 1,
											A4 is Pos - (4 * N).
												
										
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verificaLBF2(N, Pos)	:-	getPosRLinha(N, Pos, PosR),
							PosR >= N, !,
							PosR < 2*N,
							nl, write('  Face  2 ').
getLinhaBaixoF2(N, Pos, A1, A2, A3, A4)	:-	verificaLBF2(N, Pos), !,
											getLinhaBaixoF2aux(N, Pos, A1, A2, A3, A4).
getLinhaBaixoF2aux(N, Pos, A1, A2, A3, A4)	:-	A1 is Pos + 1,
												A2 is Pos + (4 * N),
												A3 is Pos  - 1,
												A4 is Pos - (4 * N).
											
						