:- use_module(library(lists)).
:- use_module(library(clpfd)).


getPosRLinha(N, Pos, PosR) :-	TamL is 4*N,
							Col is N-1,
							LimMin is TamL * Col,
							PosR is Pos - LimMin.						
												