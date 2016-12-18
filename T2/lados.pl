:- ensure_loaded(util).

%calcula colunas nos extremos
calculaLC(N, Pos, A1, A2, A3, A4)	:-	getAdjLE(N, Pos, A1, A2, A3, A4), nl, write('calc 1').
calculaLC(N, Pos, A1, A2, A3, A4)	:-	getAdjLD(N, Pos, A1, A2, A3, A4), nl, write('calc 2').

calculaLC(N, Pos, A1, A2, A3, A4)	:-	getAdjLBE(N, Pos, A1, A2, A3, A4), nl, write('calc 3').
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
										


										
%Baixo Lado esquerdo										
getPosRLBE(N, Pos, PosR)	:-	Pos1 is Pos - (4*N*N) - (N*N),
								PosR is mod(Pos1,(2*N)).
%TODO CORRIGIR, n funciona com 4x4 mas sim com 3x3
verifLBE(N, Pos)	:-	getPosRLBE(N, Pos, PosR),
						LimMin is (4*N*N) + (2*N) + N - 1,
						LimMax is (6*N*N) - (2*N),
						Pos > LimMin,
						Pos < LimMax,
						PosR = 0.
getAdjLBE(N, Pos, A1, A2, A3, A4)	:- 	verifLBE(N, Pos), !,
										getAdjLBEaux(N, Pos, A1, A2, A3, A4).
getAdjLBEaux(N, Pos, A1, A2, A3, A4)	:-	A1 is Pos + 1,
											A2 is Pos + (2 * N),
											Pos1 is mod(Pos, (4*N*N + N)),
											PosRC is round(Pos1 / (2*N)), %PosRC é o n da linha
											A3 is Pos - (2*N*PosRC)- N - (4*N) + PosRC,
											A4 is Pos - (2 * N).

											
											
%Baixo Lado direito										
getPosRLBD(N, Pos, PosR)	:-	Pos1 is Pos - (4*N*N) - (N*N),
								PosR is mod(Pos1,(2*N)).
%TODO CORRIGIR, n funciona com 4x4 mas sim com 3x3
verifLBD(N, Pos)	:-	getPosRLBE(N, Pos, PosR).%,
						%LimMin is (4*N*N) + (2*N) + N - 1,
						%LimMax is (6*N*N) - (2*N),
						%Pos > LimMin,
						%Pos < LimMax,
						%PosR = 0.
getAdjLBD(N, Pos, A1, A2, A3, A4)	:- 	verifLBD(N, Pos), !,
										getAdjLBDaux(N, Pos, A1, A2, A3, A4).
getAdjLBDaux(N, Pos, A1, A2, A3, A4)	:-	Pos1 is mod(Pos, (4*N*N + N)),
											PosRC is round(Pos1 / (2*N)), %PosRC é o n da linha
											A1 is Pos - (4*N) - (2*N*PosRC) + PosRC + 1,
											A2 is Pos + (2 * N),
											A3 is Pos - 1,
											A4 is Pos - (2 * N).
