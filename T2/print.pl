:- use_module(library(lists)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Desenha o cubo para facil visualização da solução	  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%Mostra a representação do cubo
%Cube -> cubo
%N -> Tamanho aresta cubo NxNxN
%	[]
% [][][][]
% 	[]
display_cube(Cube, N)	:-	nl, nl, 
							nl,nl,nl,nl,nl,nl,nl,nl,
							display_cubeAux(Cube, N),!.



%Chama o necessario para desenhar por completo o cubo
display_cubeAux(Cube, N)	:-	NIF1 is (4*N*N),
							NIF6 is (4*N*N) + N,
							write('  '),display_cubeF1espaco(N),display_cubetraco(N),nl,
							display_cubeF1(Cube, N,N, NIF1, 0, 0, N),
							write(' ###'),display_cubetraco(4*N),nl,
							display_cubeFC(Cube, N,N, 0, 0, 0, N),
							write(' ###'),display_cubetraco(4*N),nl,
							display_cubeF1(Cube, N,N, NIF6, 0, 0, N),
							write('  '),display_cubeF1espaco(N),display_cubetraco(N),nl.



%Desenha os n espacos para centrar uma linha
display_cubeF1espaco(0).
display_cubeF1espaco(N)	:-	N1 is N - 1,
							write('   '),
							display_cubeF1espaco(N1).

%Desenha os n tracos
display_cubetraco(0).
display_cubetraco(N)	:-	N1 is N - 1,
							write('###'),
							display_cubetraco(N1).
							

						
						
%Display do topo	e	%Display da base			
%	[]					%	--
% --------				% --------
% 	--					% 	[]	
display_cubeF1(_, 0, _, _, _, _, _).
display_cubeF1(Cube, NumLinhas, NumColunas, LimMin, NL, NC, N)	:-	NumLinhas1 is NumLinhas - 1,
							display_cubeF1espaco(NumColunas),
							write(' |'),display_cubeF1linha(Cube, NumLinhas, NumColunas, LimMin, NL, NC, N),write('|'),
							nl,nl,
							NL1 is NL + 1,
							display_cubeF1(Cube, NumLinhas1, NumColunas, LimMin, NL1, 0, N).

							
%Linha do topo		
display_cubeF1linha(_, _, 0, _, _, _, _).
display_cubeF1linha(Cube, NLinhas, NumColunas, LimMin, NL, NC, N)	:-	NumColunas1 is NumColunas - 1,
																Pos is LimMin + (2*N*NL) + NC,
																nth0(Pos,Cube,Peca),
																translate(Peca,Pc),
																write(' '), write(Pc),write(' '),
																NC1 is NC + 1, 
																display_cubeF1linha(Cube, NLinhas, NumColunas1, LimMin, NL, NC1, N).
				
				
				
				
			
%Display das faces do centro
%	--
% [][][][]
% 	--					
display_cubeFC(_, 0, _, _, _, _, _).
display_cubeFC(Cube, NumLinhas, NumColunas, NLInicial, NL, NC, N)	:-	NumLinhas1 is NumLinhas - 1,
							write('|'),
							display_cubeFacelinha(Cube, NumLinhas, NumColunas, 0, NL, NC, N),
							write('|'),
							display_cubeFacelinha(Cube, NumLinhas, NumColunas, N, NL, NC, N),
							write('|'),
							display_cubeFacelinha(Cube, NumLinhas, NumColunas, (2*N), NL, NC, N),
							write('|'),
							display_cubeFacelinha(Cube, NumLinhas, NumColunas, (3*N), NL, NC, N),
							write('|'),
							nl,nl,
							NL1 is NL + 1,
							display_cubeFC(Cube, NumLinhas1, NumColunas, NLInicial, NL1, NC, N).



%Linha do cubo
display_cubeFacelinha(_, _, 0, _, _, _, _).
display_cubeFacelinha(Cube, NLinhas, NumColunas, NLInicial, NL, NC, N)	:-	NumColunas1 is NumColunas - 1,
																Pos is NLInicial + (4*N*NL) + NC,
																nth0(Pos,Cube,Peca),
																translate(Peca,Pc),
																write(' '), write(Pc),write(' '),
																NC1 is NC + 1,
																display_cubeFacelinha(Cube, NLinhas, NumColunas1, NLInicial, NL, NC1, N).	



%Cores para letra correspondente À cor
translate(1,'R').
translate(2,'G').
translate(3,'B'). 
translate(4,'Y'). 


							
