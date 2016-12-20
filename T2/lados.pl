:- ensure_loaded(util).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Devolve pecas adjacentes nos lados do cubo%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Ilustração exemplo:
%			--------------
%			|x|        |x|
%			|x|		   |x|
%			|x|		   |x|						
%---------------------------------------------------
%|x|											 |x|	
%|x|											 |x|
%|x|											 |x| 
%---------------------------------------------------
%			|x|        |x|
%			|x|		   |x|
%			|x|		   |x|	
%			--------------

			

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%			Centro			%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Lado esquerdo central		
getPosRLE(N, Pos, PosR)	:-	PosR is mod(Pos,(4*N)).	
								
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

			

			
										
										
										
										
%Lado direito central									
getPosRLD(N, Pos, PosR)	:-	Pos1 is Pos + 1, 
							getPosRLE(N, Pos1, PosR).
							
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


										
										
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%										
										
										
										
	
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%			Base			%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%										
%Lado esquerdo Base						
basecolunaE(N, Pos)	:-	0 is mod(Pos,N),
					Pos>N*N*4.

verifLBE(N, Pos)	:-	basecolunaE(N,Pos),
						LimMin is (4*N*N) + (2*N) + N - 1,
						LimMax is (6*N*N) - (2*N),
						Pos > LimMin,
						Pos < LimMax.
getAdjLBE(N, Pos, A1, A2, A3, A4)	:- 	verifLBE(N, Pos), !,
										getAdjLBEaux(N, Pos, A1, A2, A3, A4).
getAdjLBEaux(N, Pos, A1, A2, A3, A4)	:-	A1 is Pos + 1,
											A2 is Pos + (2 * N),
											Pos1 is mod(Pos, (4*N*N + N)),
											PosRC is round(Pos1 / (2*N)), %PosRC é o n da linha
											A3 is Pos - (2*N*PosRC)- N - (4*N) + PosRC,
											A4 is Pos - (2 * N).

											
											
											
											
											
											
											
%Lado direito Base						
basecolunaD(N, Pos)	:-	0 is mod(Pos + 1,2*N),
						Pos > (N*N*4).
verifLBD(N, Pos)	:-	basecolunaD(N, Pos),
						LimMin is (4*N*N) + (2*N) + N - 1,
						LimMax is (6*N*N) - (2*N),
						Pos > LimMin,
						Pos < LimMax.
getAdjLBD(N, Pos, A1, A2, A3, A4)	:- 	verifLBD(N, Pos), !,
										getAdjLBDaux(N, Pos, A1, A2, A3, A4).
getAdjLBDaux(N, Pos, A1, A2, A3, A4)	:-	Pos1 is mod(Pos, (4*N*N + N)),
											PosRC is round(Pos1 / (2*N)), %PosRC é o n da linha
											A1 is Pos - (4*N) - (2*N*PosRC) + PosRC + 1,
											A2 is Pos + (2 * N),
											A3 is Pos - 1,
											A4 is Pos - (2 * N).


										
										
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%									
										
										
										
	
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%			Topo			%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%					
%Lado esquerdo topo					 
ladoEsquerdoTopoAux(P,Adj,N):-	Pr is (P-N*N*4)/(2*N),
								(
								Adj is round(Pr);
								Adj is P+1;
								Adj is P+2*N;
								Adj is P-2*N
								).
ladoEsquerdoTopo(P,Adj1,Adj2,Adj3,Adj4,N):- findall(I,ladoEsquerdoTopoAux(P,I,N),Bag),
									 nth0(0,Bag,Adj1),
									 nth0(1,Bag,Adj2),
									 nth0(2,Bag,Adj3),
									 nth0(3,Bag,Adj4).	
									 
									 
									 
									 
									 
									 
									 
									 
%Lado direito topo
ladoDireitoTopoAux(P,Adj,N):-	Pr is (P-N*N*4)/(2*N),
								(
								Adj is round(3*N-1-Pr);
								Adj is P-1;
								Adj is P+2*N;
								Adj is P-2*N
								).
ladoDireitoTopo(P,Adj1,Adj2,Adj3,Adj4,N):- findall(I,ladoDireitoTopoAux(P,I,N),Bag),
									 nth0(0,Bag,Adj1),
									 nth0(1,Bag,Adj2),
									 nth0(2,Bag,Adj3),
									 nth0(3,Bag,Adj4).	
										
	
