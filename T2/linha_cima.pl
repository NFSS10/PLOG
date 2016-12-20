			
%1ª face linha cima					
linhaCimaAux(P,Adj,N):- P < N,
						verificaAdjLCF1(P,Adj,N).
							
linhaCimaAux(P,Adj,N):-	P < N,
						verificaAdjC1(P,Adj,N).		

						
%2ª face linha cima
linhaCimaAux(P,Adj,N):-	P >=N,
						P < 2*N,
						verificaAdjLCF2(P,Adj,N).		

						
%3ª face linha cima
linhaCimaAux(P,Adj,N):-	P >= 2*N,
						P < 3*N,
						verificaAdjLCF3(P,Adj,N).		

						
%4ª face linha cima
linhaCimaAux(P,Adj,N):- P >= 3*N,
						P < 4*N,
						verificaAdjLCF4(P,Adj,N).	

linhaCimaAux(P,Adj,N):- P >= 3*N,
						P < 4*N,
						verificaAdjC2(P,Adj,N).							

						
%topo linha cima						
linhaCimaAux(P,Adj,N):- P >  N*N*4,
						P < (N*N*4)+(N-1),
						verificaAdjLCF5(P,Adj,N).	


linhaCimaAux(P,Adj,N):- P is N*N*4,
						verificaAdjC3(P,Adj,N).	
						
linhaCimaAux(P,Adj,N):- P is N*N*4+(N-1),
						verificaAdjC4(P,Adj,N).	
						

%base linha cima
 linhaCimaAux(P,Adj,N):- P >  N*N*4+N,
						P < N*N*4+2*N-1,
						verificaAdjLCF6(P,Adj,N).	
						
linhaCimaAux(P,Adj,N):- P is N*N*4+N,
						verificaAdjC5(P,Adj,N).	
						
linhaCimaAux(P,Adj,N):- P is N*N*4+2*N-1,
						verificaAdjC6(P,Adj,N).	
						
						
						

linhaCima(P,Adj1,Adj2,Adj3,Adj4,N):- findall(I,linhaCimaAux(P,I,N),Bag),
									 nth0(0,Bag,Adj1),
									 nth0(1,Bag,Adj2),
									 nth0(2,Bag,Adj3),
									 nth0(3,Bag,Adj4).
									 
									 
%Linha do meio principal									 

linhasMeioPrincipalAux(P,Adj,N):- 	Adj is P-1;
									Adj is P+1;
									Adj is P+4*N;
									Adj is P-4*N.


linhaMeioPrincipal(P,Adj1,Adj2,Adj3,Adj4,N):- findall(I,linhasMeioPrincipalAux(P,I,N),Bag),
									 nth0(0,Bag,Adj1),
									 nth0(1,Bag,Adj2),
									 nth0(2,Bag,Adj3),
									 nth0(3,Bag,Adj4).									 
									 
%Linha do meio tampas	
									 
linhasMeioTampasAux(P,Adj,N):- 	Adj is P-1;
									Adj is P+1;
									Adj is P+2*N;
									Adj is P-2*N.


linhaMeioTampas(P,Adj1,Adj2,Adj3,Adj4,N):- findall(I,linhasMeioTampasAux(P,I,N),Bag),
									 nth0(0,Bag,Adj1),
									 nth0(1,Bag,Adj2),
									 nth0(2,Bag,Adj3),
									 nth0(3,Bag,Adj4).	
























										
																
