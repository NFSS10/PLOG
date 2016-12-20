:- use_module(library(lists)).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Devolve pecas adjacentes das linhas de baixo do cubo %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Ilustração exemplo:
%			---------------
%			|             |
%			|		      |
%			|x||x||x||x||x|						
%---------------------------------------------------
%|											       |	
%|											       |
%|x||x||x||x||x||x||x||x||x||x||x||x||x||x||x||x||x| 
%---------------------------------------------------
%			|             |
%			|  		      |
%			|x||x||x||x||x|	
%			--------------




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%			Centro			%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%		
calcLBP(N, Pos, A1, A2, A3, A4)	:-	getAdjCantoBE(N, Pos, A1, A2, A3, A4).
calcLBP(N, Pos, A1, A2, A3, A4) :-	getLinhaBaixoF1(N, Pos, A1, A2, A3, A4).
calcLBP(N, Pos, A1, A2, A3, A4) :-	getLinhaBaixoF2(N, Pos, A1, A2, A3, A4).
calcLBP(N, Pos, A1, A2, A3, A4) :-	getLinhaBaixoF3(N, Pos, A1, A2, A3, A4).
calcLBP(N, Pos, A1, A2, A3, A4) :-	getLinhaBaixoF4(N, Pos, A1, A2, A3, A4).
calcLBP(N, Pos, A1, A2, A3, A4) :-	getCantoBD(N, Pos, A1, A2, A3, A4).




getPosRLinha(N, Pos, PosR) :-	TamL is 4*N,
							Col is N-1,
							LimMin is TamL * Col,
							PosR is Pos - LimMin.						
												
%Baixo canto esquerdo									
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

												
																								
%Baixo face 1
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
												
										
										
%Baixo face 2
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

												

%Baixo face 3
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
												
												
												
%Baixo face4
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

												
												
												
%Baixo canto direito
verificaLBCD(N, Pos)	:-	getPosRLinha(N, Pos, PosR),
							Lim is ((4 * N)-1),
							PosR = Lim,
							nl, write('Canto direito').
getCantoBD(N, Pos, A1, A2, A3, A4)	:-	verificaLBCD(N, Pos), !,
											getCantoBDaux(N, Pos, A1, A2, A3, A4).
getCantoBDaux(N, Pos, A1, A2, A3, A4)	:-	getPosRLinha(N, Pos, PosR),
												PosRF is PosR - (3*N),
												Resto is (4*N) - PosR - 1,
												A1 is Pos - (4*N)+1,
												A2 is Pos + Resto + ((2*N) * N) - PosRF,
												A3 is Pos  - 1,
												A4 is Pos - (4 * N).	
										
										
										
										
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%										
										
										
										
	
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%			Base			%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
calcLBB(N, Pos, A1, A2, A3, A4) 	:-	getLinhaBaixoBCE(N, Pos, A1, A2, A3, A4).
calcLBB(N, Pos, A1, A2, A3, A4) 	:-	getLinhaBaixoBCD(N, Pos, A1, A2, A3, A4).
calcLBB(N, Pos, A1, A2, A3, A4) 	:-	getLinhaBaixoBC(N, Pos, A1, A2, A3, A4).										



									
getPosRLinhaBB(N, Pos, PosR)	:-	Meio is 4*N*N,
									PosR is Pos - Meio - ((2*N)*(N-1)) - N.
%Base, canto esquerdo									
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
											
											

%Base, canto direito
verificaLBBCD(N, Pos)	:-	getPosRLinhaBB(N, Pos, PosR),
							Lim is (N -1),
							PosR = Lim,
							nl, write('Baixo Linha Baixo Canto direito').
getLinhaBaixoBCD(N, Pos, A1, A2, A3, A4)	:-	verificaLBBCD(N, Pos), !,
											getLinhaBaixoBCDaux(N, Pos, A1, A2, A3, A4).
getLinhaBaixoBCDaux(N, Pos, A1, A2, A3, A4)	:-	Dif is ((6*N*N) - (2*N*N)) - N,
												A1 is Dif - 1,
												A2 is Dif,
												A3 is Pos - 1,
												A4 is Pos - (2 * N).								

												
												
												
%Base, centro
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
										
										
										
										
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%										
										
										
										
	
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%			Topo			%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
verificaAdjLBF7(P,Adj,N):- 	Pr is P-(N*N*4+(N-1)*N*2),
							(
							Adj is P+1;
							Adj is P-1;
							Adj is N+Pr;
							Adj is P-2*N
							).

verificaAdjC7(P,Adj,N):- 	Adj is P+1;
							Adj is N-1;
							Adj is N;
							Adj is P-2*N.
							
verificaAdjC8(P,Adj,N):- 	Adj is P-1;
							Adj is 2*N-1;
							Adj is 2*N;
							Adj is P-2*N.



linhaBaixoTopoAux(P,Adj,N):- P >  (N*N*4+N*N*2)-2*N,
						P < N*N*4+N*N*2-N-1,
						verificaAdjLBF7(P,Adj,N).	
						
linhaBaixoTopoAux(P,Adj,N):- P is (N*N*4+N*N*2)-2*N,
						verificaAdjC7(P,Adj,N).	
						
linhaBaixoTopoAux(P,Adj,N):- P is N*N*4+N*N*2-N-1,
						verificaAdjC8(P,Adj,N).	
						


ladoBaixoTopo(P,Adj1,Adj2,Adj3,Adj4,N):- findall(I,linhaBaixoTopoAux(P,I,N),Bag),
									 nth0(0,Bag,Adj1),
									 nth0(1,Bag,Adj2),
									 nth0(2,Bag,Adj3),
									 nth0(3,Bag,Adj4).	


						