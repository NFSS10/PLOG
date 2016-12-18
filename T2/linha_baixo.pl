:- ensure_loaded(util).


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

									

%devolve para pos os indices dos adjacentes								
calculaLB(N, Pos, A1, A2, A3, A4) 	:-	getAdjCantoBE(N, Pos, A1, A2, A3, A4), nl,write('calc 1').
calculaLB(N, Pos, A1, A2, A3, A4) 	:-	getLinhaBaixoF1(N, Pos, A1, A2, A3, A4), nl,write('calc 2').
calculaLB(N, Pos, A1, A2, A3, A4) 	:-	getLinhaBaixoF2(N, Pos, A1, A2, A3, A4), nl,write('calc 3').
calculaLB(N, Pos, A1, A2, A3, A4) 	:-	getLinhaBaixoF3(N, Pos, A1, A2, A3, A4), nl,write('calc 4').
calculaLB(N, Pos, A1, A2, A3, A4) 	:-	getLinhaBaixoF4(N, Pos, A1, A2, A3, A4), nl,write('calc 5').
calculaLB(N, Pos, A1, A2, A3, A4) 	:-	verifCantoBD(N, Pos, A1, A2, A3, A4), nl,write('calc 6').
calculaLB(N, Pos, A1, A2, A3, A4) 	:-	getLinhaBaixoBCE(N, Pos, A1, A2, A3, A4), nl,write('calc 7').
calculaLB(N, Pos, A1, A2, A3, A4) 	:-	getLinhaBaixoBCD(N, Pos, A1, A2, A3, A4), nl,write('calc 8').
calculaLB(N, Pos, A1, A2, A3, A4) 	:-	getLinhaBaixoBC(N, Pos, A1, A2, A3, A4), nl,write('calc 9').
calculaLB(N, Pos, A1, A2, A3, A4) 	:- 	write('erro calculaLB').
	


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
												
												
												
												

%%%%%
verificaLBF3(N, Pos)	:-	getPosRLinha(N, Pos, PosR),
							PosR >= (2*N), !,
							PosR < 3*N,
							nl, write('  Face  3 ').
getLinhaBaixoF3(N, Pos, A1, A2, A3, A4)	:-	verificaLBF3(N, Pos), !,
											getLinhaBaixoF3aux(N, Pos, A1, A2, A3, A4).
getLinhaBaixoF3aux(N, Pos, A1, A2, A3, A4)	:-	getPosRLinha(N, Pos, PosR),
												PosRF is PosR - (2*N),
												Resto is (4*N) - PosR - 1,
												A1 is Pos + 1,
												A2 is Pos + Resto + (2 * N) + (2*N*(PosRF)),
												A3 is Pos  - 1,
												A4 is Pos - (4 * N).												
												

%%%%%
verificaLBF4(N, Pos)	:-	getPosRLinha(N, Pos, PosR),
							PosR >= (3*N), !,
							PosR < ((4*N) - 1),
							nl, write('  Face  3 ').
getLinhaBaixoF4(N, Pos, A1, A2, A3, A4)	:-	verificaLBF4(N, Pos), !,
											getLinhaBaixoF4aux(N, Pos, A1, A2, A3, A4).
getLinhaBaixoF4aux(N, Pos, A1, A2, A3, A4)	:-	getPosRLinha(N, Pos, PosR),
												PosRF is PosR - (3*N),
												Resto is (4*N) - PosR - 1,
												A1 is Pos + 1,
												A2 is Pos + Resto + ((2*N) * N) - PosRF,
												A3 is Pos  - 1,
												A4 is Pos - (4 * N).	


verificaLBCD(N, Pos)	:-	getPosRLinha(N, Pos, PosR),
							Lim is ((4 * N)-1),
							PosR = Lim,
							nl, write('Canto direito').
verifCantoBD(N, Pos, A1, A2, A3, A4)	:-	verificaLBCD(N, Pos), !,
											verifCantoBDaux(N, Pos, A1, A2, A3, A4).
verifCantoBDaux(N, Pos, A1, A2, A3, A4)	:-	getPosRLinha(N, Pos, PosR),
												PosRF is PosR - (3*N),
												Resto is (4*N) - PosR - 1,
												A1 is Pos - (4*N)+1,
												A2 is Pos + Resto + ((2*N) * N) - PosRF,
												A3 is Pos  - 1,
												A4 is Pos - (4 * N).	


												
												
												
									
getPosRLinhaBB(N, Pos, PosR)	:-	Meio is 4*N*N,
									PosR is Pos - Meio - ((2*N)*(N-1)) - N.
%Baixo, canto esquerdo									
verificaLBBCE(N, Pos)	:-	getPosRLinhaBB(N, Pos, PosR),
							PosR = 0,
							nl, write('Baixo Linha Baixo Canto esquerdo').
getLinhaBaixoBCE(N, Pos, A1, A2, A3, A4)	:-	verificaLBBCE(N, Pos), !,
											getLinhaBaixoBCEaux(N, Pos, A1, A2, A3, A4).
getLinhaBaixoBCEaux(N, Pos, A1, A2, A3, A4)	:-	getPosRLinhaBB(N, Pos, PosR),
												A1 is Pos + 1,
												A2 is ((4*N*N) - 1),
												A3 is (4*N*N) - (4*N) ,
												A4 is Pos - (2 * N).													
												

%Baixo, canto direito
verificaLBBCD(N, Pos)	:-	getPosRLinhaBB(N, Pos, PosR),
							Lim is (N -1),
							PosR = Lim,
							nl, write('Baixo Linha Baixo Canto direito').
getLinhaBaixoBCD(N, Pos, A1, A2, A3, A4)	:-	verificaLBBCD(N, Pos), !,
											getLinhaBaixoBCDaux(N, Pos, A1, A2, A3, A4).
getLinhaBaixoBCDaux(N, Pos, A1, A2, A3, A4)	:-	getPosRLinhaBB(N, Pos, PosR),
												A1 is ((4*N*N) - PosR - N + 1),
												A2 is ((4*N*N) - PosR - 1),
												A3 is Pos - 1,
												A4 is Pos - (2 * N).								

%Baixo, coluna Esquerdo
verificaLBBC(N, Pos)	:-	getPosRLinhaBB(N, Pos, PosR),
							LimMax is (N -1),
							PosR > 0, !,
							PosR < LimMax,
							nl, write('Baixo Linha Baixo Centro').
getLinhaBaixoBC(N, Pos, A1, A2, A3, A4)	:-	verificaLBBC(N, Pos), !,
											getLinhaBaixoBCaux(N, Pos, A1, A2, A3, A4).
getLinhaBaixoBCaux(N, Pos, A1, A2, A3, A4)	:-	getPosRLinhaBB(N, Pos, PosR),
												A1 is Pos + 1,
												A2 is ((4*N*N) - PosR - 1),
												A3 is Pos - 1,
												A4 is Pos - (2 * N).

%Baixo, coluna direito
verificaLBBC(N, Pos)	:-	getPosRLinhaBB(N, Pos, PosR),
							LimMax is (N -1),
							PosR > 0, !,
							PosR < LimMax,
							nl, write('Baixo Linha Baixo Centro').
getLinhaBaixoBC(N, Pos, A1, A2, A3, A4)	:-	verificaLBBC(N, Pos), !,
											getLinhaBaixoBCaux(N, Pos, A1, A2, A3, A4).
getLinhaBaixoBCaux(N, Pos, A1, A2, A3, A4)	:-	getPosRLinhaBB(N, Pos, PosR),
												A1 is Pos + 1,
												A2 is ((4*N*N) - PosR - 1),
												A3 is Pos - 1,
												A4 is Pos - (2 * N).													
												
						