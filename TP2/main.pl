:- use_module(library(lists)).
:- use_module(library(clpfd)).



%Cubo
cube([
	P0,		P1,		P2,		P3,		P4,		P5,		P6,		P7,		P8,		P9,		P10,	P11,
	P12,	P13,	P14,	P15,	P16,	P17,	P18,	P19,	P20,	P21,	P22,	P23,
	P24,	P25,	P26,	P27,	P28,	P29,	P30,	P31,	P32,	P33,	P34,	P35,

	
	%Topo						%Base
	P36,	P37,	P38,		P39,	P40,	P41,	
	P42,	P43,	P44,		P45,	P46,	P47,
	P48,	P49,	P50,		P51,	P52,	P53
]).

cube4x4([
	P0,		P1,		P2,		P3,		P4,		P5,		P6,		P7,		P8,		P9,		P10,	P11,   P12,   P13 ,   P14,   P15,
	P16,	P17,	P18,	P19,	P20,	P21,	P22,	P23,	P24,	P25,	P26,	P27,   P28,   P29 ,   P30,   P31,
	P32,	P33,	P34,	P35,	P36,	P37,	P38,	P39,	P40,	P41,	P42,	P43,   P44,   P45 ,   P46,   P47,
	P48,	P49,	P50,	P51,	P52,	P53,	P54,	P55,	P56,	P57,	P58,	P59,   P60,   P61 ,   P62,   P63,

	
	%Topo								%Base
	P64,	P65,	P66, 	P67,		P68,	P69, 	P70,	P71,
	P72,	P73,	P74,	P75,		P76,	P77, 	P78,	P79,
	P80,	P81,	P82,	P83,		P84,	P85, 	P86,	P87,
	P88,	P89,	P90,	P91,		P92,	P93, 	P94,	P95
]).


main :- cube(X),
		domain(X,1,4),
		
		labeling([],X).

jogada(P1,P2,P3,P4,P5)	:-	(P1 #= 1 #/\ (P2 #= 4 #\ P3 #=4 #\ P4 #=4 #\ P5 #=4))
							#\/
							(P1 #= 2 #/\ (P2 #= 3 #\ P3 #=3 #\ P4 #=3 #\ P5 #=3))
							#\/
							(P1 #= 3 #/\ (P2 #= 1 #\ P3 #=1 #\ P4 #=1 #\ P5 #=1))
							#\/
							(P1 #= 4 #/\ (P2 #= 2 #\ P3 #=2 #\ P4 #=2 #\ P5 #=2)).
							
							

							
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
							Adj is 4*N*(N-1)+ N+ PI).


verificaAdjC5(P,Adj,N):-	Adj is (N-1)*N*4 +N-1;
							Adj is P+1;
							Adj is P+2*N;
							Adj is (N-1)*N*4 +N.
							
verificaAdjC6(P,Adj,N):-	Adj is (N-1)*N*4 + 2*N-1;
							Adj is P-1;
							Adj is P+2*N;
							Adj is (N-1)*N*4 + 2*N.


							
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





%Linha baixo topo

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
















									 
%linha de cima										 
adjacente(P,Adj1,Adj2,Adj3,Adj4,N):-	((P>=0,
										P<4*N);
										(P>=N*N*4,
										P < N*N*4+2*N)),
										linhaCima(P,Adj1,Adj2,Adj3,Adj4,N).
										
%linha de baixo										
adjacente(P,Adj1,Adj2,Adj3,Adj4,N):-	P>=(N-1)*N*4,
										P<4*N*N,
										write('linha de baixo principal').
										
adjacente(P,Adj1,Adj2,Adj3,Adj4,N):-	P>=(N*N*4+N*N*2)-2*N,
										P < N*N*4+N*N*2-N,
										ladoBaixoTopo(P,Adj1,Adj2,Adj3,Adj4,N).
										
adjacente(P,Adj1,Adj2,Adj3,Adj4,N):-	P>=(N*N*4+N*N*2)-N,
										P< 4*N*N+2*N*N,
										write('linha de baixo Base').
		

		
%lados	do principal						
adjacente(P,Adj1,Adj2,Adj3,Adj4,N):-
										0 is mod(P,4*N),
										P<N*N*4,
										write('lado esquerdo do principal').
																
adjacente(P,Adj1,Adj2,Adj3,Adj4,N):-
										0 is mod(P+1,4*N),
										P<N*N*4,
										write('lado direito do principal').
										
%meio do principal 

adjacente(P,Adj1,Adj2,Adj3,Adj4,N):-	P<N*N*4,
										linhaMeioPrincipal(P,Adj1,Adj2,Adj3,Adj4,N).
										
										
%lados das tampas

adjacente(P,Adj1,Adj2,Adj3,Adj4,N):-
										0 is mod(P,2*N),
										P>N*N*4,
										ladoEsquerdoTopo(P,Adj1,Adj2,Adj3,Adj4,N).
										
adjacente(P,Adj1,Adj2,Adj3,Adj4,N):-
										0 is mod(P+1,2*N),
										P>N*N*4,
										write('lado direito da base').
										
adjacente(P,Adj1,Adj2,Adj3,Adj4,N):-
										0 is mod(P+1,N),
										P>N*N*4,
										ladoDireitoTopo(P,Adj1,Adj2,Adj3,Adj4,N).
										
adjacente(P,Adj1,Adj2,Adj3,Adj4,N):-
										0 is mod(P,N),
										P>N*N*4,
										write('lado esquerdo da base').
										
adjacente(P,Adj1,Adj2,Adj3,Adj4,N):- 	linhaMeioTampas(P,Adj1,Adj2,Adj3,Adj4,N).
										
																
