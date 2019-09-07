:- use_module(library(lists)).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Devolve pecas adjacentes do centro  do cubo %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Ilustração exemplo:
%			---------------
%			|             |
%			|  |x||x||x|  |
%			|		      |					
%---------------------------------------------------
%|											       |
%|  |x||x||x||x||x||x||x||x||x||x||x||x||x||x||x|  |
%|											       | 
%---------------------------------------------------
%			|             |
%			|  |x||x||x|  |
%			|  		      |	
%			---------------




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%			Centro			%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
linhasMeioPrincipalAux(P,Adj,N):- 	Adj is P-1;
									Adj is P+1;
									Adj is P+4*N;
									Adj is P-4*N.


linhaMeioPrincipal(P,Adj1,Adj2,Adj3,Adj4,N):- findall(I,linhasMeioPrincipalAux(P,I,N),Bag),
									 nth0(0,Bag,Adj1),
									 nth0(1,Bag,Adj2),
									 nth0(2,Bag,Adj3),
									 nth0(3,Bag,Adj4).									 
									
										
										
										
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%										
										
										
										
	
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Topo e Base			%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%				 
linhasMeioTampasAux(P,Adj,N):- 	Adj is P-1;
									Adj is P+1;
									Adj is P+2*N;
									Adj is P-2*N.


linhaMeioTampas(P,Adj1,Adj2,Adj3,Adj4,N):- findall(I,linhasMeioTampasAux(P,I,N),Bag),
									 nth0(0,Bag,Adj1),
									 nth0(1,Bag,Adj2),
									 nth0(2,Bag,Adj3),
									 nth0(3,Bag,Adj4).	




						
																
