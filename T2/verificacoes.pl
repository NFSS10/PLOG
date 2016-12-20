%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Verifica a posicao da peca no cubo	  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


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
							

verificaAdjLCF2(P,Adj,N):- 	Pr is P-N,
							(
							Adj is P+N*4;
							Adj is P-1;
							Adj is P+1;
							Adj is 4*N*N+(N-1)*N*2+Pr).
			

			

verificaAdjLCF3(P,Adj,N):- 	PI is (3*N)-P,
							(Adj is P+N*4;
							 Adj is P-1;
							 Adj is P+1;
							 Adj is ((PI-1)*2*N)+(N*N*4)+(N-1)).
							
							
							
							
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
							Adj is 4*N*(N-1)+ N+ PI).


verificaAdjC5(P,Adj,N):-	Adj is (N-1)*N*4 +N-1;
							Adj is P+1;
							Adj is P+2*N;
							Adj is (N-1)*N*4 +N.
							
verificaAdjC6(P,Adj,N):-	Adj is (N-1)*N*4 + 2*N-1;
							Adj is P-1;
							Adj is P+2*N;
							Adj is (N-1)*N*4 + 2*N.