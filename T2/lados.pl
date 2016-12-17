:- ensure_loaded(util).

%calcula colunas nos extremos
calculaLC(N, Pos, A1, A2, A3, A4)	:-	getAdjLE(N, Pos, A1, A2, A3, A4), nl, write('calc 1').
calculaLC(N, Pos, A1, A2, A3, A4)	:-	getAdjLD(N, Pos, A1, A2, A3, A4), nl, write('calc 2').
calculaLC(N, Pos, A1, A2, A3, A4)	:-	write('erro calculaLCE').


%Lado esquerdo - linha cima e linha de baixo
getPosRLE(N, Pos, PosR)	:-	PosR is mod(Pos,(4*N)).

%verifica se é canto baixo esquerdo										
verifLCE(N, Pos)	:-	getPosRLE(N, Pos, PosR),
						LimMin is (4*N) - 1,
						LimMax is (4*N*(N-1)),
						Pos > LimMin,
						Pos < LimMax,
						PosR = 0.
getAdjLE(N, Pos, A1, A2, A3, A4)	:- 	verifLCE(N, Pos), !,
										getAdjLEaux(N, Pos, A1, A2, A3, A4).
getAdjLEaux(N, Pos, A1, A2, A3, A4)	:-	A1 is Pos + 1,
										A2 is Pos + (4 * N),
										A3 is Pos + ((4 * N) - 1),
										A4 is Pos - (4 * N).


										
										
										
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%			

						
										
getPosRLD(N, Pos, PosR)	:-	Pos1 is Pos + 1, 
							getPosRLE(N, Pos1, PosR).

%verifica se é canto baixo esquerdo										
verifLCD(N, Pos)	:-	getPosRLD(N, Pos, PosR),
						LimMin is (4*N) - 1,
						LimMax is (4*N*(N-1)),
						Pos > LimMin,
						Pos < (LimMax + 1),
						PosR = 0.
getAdjLD(N, Pos, A1, A2, A3, A4)	:- 	verifLCD(N, Pos), !,
										getAdjLDaux(N, Pos, A1, A2, A3, A4).
getAdjLDaux(N, Pos, A1, A2, A3, A4)	:-	A1 is Pos - (4 * N) + 1,
										A2 is Pos + (4 * N),
										A3 is Pos - 1,
										A4 is Pos - (4 * N).

