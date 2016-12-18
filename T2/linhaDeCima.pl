:- use_module(library(lists)).
:- use_module(library(clpfd)).
						
							
verificaAdjLCF1(P,Adj,N):-	P \= 0,
							(
							Adj is P+N*4;
							Adj is P-1;
							Adj is P+1;
							Adj is (P*2*N)+(N*N*4)).
							

verificaAdjC1(P,Adj,N):-	P = 0,
							(
							Adj is P+N*4;
							Adj is P+N*4-1;
							Adj is P+1;
							Adj is (P*2*N)+(N*N*4)).
							

verificaAdjLCF2(P,Adj,N):- 	Adj is P+N*4;
							Adj is P-1;
							Adj is P+1;
							Adj is P+(N*N*4)+3*N.
			

			

verificaAdjLCF3(P,Adj,N):- 	PI is P-(2*N),
							(Adj is P+N*4;
							 Adj is P-1;
							 Adj is P+1;
							 Adj is (PI*2*N)+(N*N*4)+(N-1)).
							
							
							
							
verificaAdjLCF4(P,Adj,N):-	PI is 4*N-(P+1),
							Ns is ((4*N)-1),
							P \= Ns,
							(
							Adj is P+N*4;
							Adj is P-1;
							Adj is P+1;
							Adj is N*N*4+PI).
							

verificaAdjC2(P,Adj,N):-	PI is 4*N-(P+1),
							Ns is ((4*N)-1),
							P = Ns,
							(
							Adj is P+N*4;
							Adj is P-1;
							Adj is 0;
							Adj is N*N*4+PI).							
							
							
							
verificaAdjLCF5(P,Adj,N):- 	PI is P-(N*N*4),
							(
							Adj is (4*N-1)-PI;
							Adj is P+1;
							Adj is P-1;
							Adj is (N*N*4+PI+(N-PI)+N+PI)).
							

verificaAdjC3(P,Adj,N):-	Adj is P+1;
							Adj is 0;
							Adj is 4*N-1;
							Adj is P+2*N.
							
							
verificaAdjC4(P,Adj,N):-	Adj is 3*N;
							Adj is 3*N-1;
							Adj is P-1;
							Adj is P+2*N.	
									

verificaAdjLCF6(P,Adj,N):-	PI is P-(N*N*4+N),
						   (
							Adj is P+2*N;
							Adj is P+1;
							Adj is P-1;
							Adj is 4*N*(N-1) + 3*N + PI).


verificaAdjC5(P,Adj,N):-	Adj is (N-1)*N*4;
							Adj is P+1;
							Adj is P+2*N;
							Adj is N*N*4-1.
							
verificaAdjC6(P,Adj,N):-	Adj is (N-1)*N*4 +3*N;
							Adj is P-1;
							Adj is P+2*N;
							Adj is (N-1)*N*4 +3*N-1.


							
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
									 
									 
									 


%linha de cima										 
adjacente(P,Adj1,Adj2,Adj3,Adj4,N):-	((P>=0,
										P<4*N);
										(P>=N*N*4,
										P < N*N*4+2*N)),
										linhaCima(P,Adj1,Adj2,Adj3,Adj4,N).
										
%linha de baixo										
adjacente(P,Adj1,Adj2,Adj3,Adj4,N):-	((P>=(N-1)*N*4,
										P<4*N*N);
										(P>=N*N*4+(N-1)*N*2,
										P < N*N*4+2*N*N)),
										write('linha de baixo').