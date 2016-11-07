:- use_module(library(lists)).

:-dynamic(board/1).
:-dynamic(p1Set/1).
:-dynamic(p2Set/1).

%Tabuleiro
board([
	[[b3,n3,n3],
	[n2,b2,n2],
	[n1,n1,b1]],
	
	[[n3,r3,n3],
	[n2,r2,n2],
	[n1,n1,n1]],
	
	[[b3,n3,r3],
	[n2,n2,r2],
	[b1,n1,r1]]
]).


%Conjunto das peças iniciais dos jogadores
%Conjunto das peças do jogador 1
p1Set([
	[[b3,r3,g3],
	[b2,r2,g2],
	[b1,r1,g1]]
	]).
	
%Conjunto das peças do jogador 2
p2Set([
	[[b3,r3,g3],
	[b2,r2,g2],
	[b1,r1,g1]]
	]).	

%Conjunto das peças do jogador 3
p3Set([
	[[b3,r3,g3],
	[b2,r2,g2],
	[b1,r1,g1]]
	]).

%Conjunto das peças do jogador 4
p4Set([
	[[b3,r3,g3],
	[b2,r2,g2],
	[b1,r1,g1]]
	]).		
