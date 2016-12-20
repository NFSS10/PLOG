:- ensure_loaded(util).

dt:- cubet(C), display_cube(C, 3).



display_cube(Cube, N)	:-	display_cubeF1P(Cube, N),!.

%display do topo
display_cubeF1P(Cube, N)	:-	LimMinF1 is (4*N*N),
							LimMaxF1 is LimMinF1 + (2*N*N) - N - 1,
							LimMinF2 is (4*N*N) + N,
							LimMaxF2 is LimMinF2 + (2*N*N) - N - 1,
							%nl, write(LimMin), write('  '), write(LimMax).
							display_cubeF1(Cube, N,N, LimMinF1, LimMaxF1, 0, 0, N),
							display_cubeFC(Cube, N,N, 0, 0, 0, N),
							display_cubeF1(Cube, N,N, LimMinF2, LimMaxF2, 0, 0, N).







display_cubeFC(_, 0, _, _, _, _, _).
display_cubeFC(Cube, NumLinhas, NumColunas, NLInicial, NL, NC, N)	:-	NumLinhas1 is NumLinhas - 1,
							display_cubeFacelinha(Cube, NumLinhas, NumColunas, 0, NL, NC, N),
							display_cubeFacelinha(Cube, NumLinhas, NumColunas, N, NL, NC, N),
							display_cubeFacelinha(Cube, NumLinhas, NumColunas, (2*N), NL, NC, N),
							display_cubeFacelinha(Cube, NumLinhas, NumColunas, (3*N), NL, NC, N),
							nl,nl,
							NL1 is NL + 1,
							display_cubeFC(Cube, NumLinhas1, NumColunas, NLInicial, NL1, NC, N).




display_cubeFacelinha(_, _, 0, _, _, _, _).
display_cubeFacelinha(Cube, NLinhas, NumColunas, NLInicial, NL, NC, N)	:-	NumColunas1 is NumColunas - 1,
																Pos is NLInicial + (4*N*NL) + NC,
																nth0(Pos,Cube,Peca),
																write(' '), write(Peca),write(' '),
																NC1 is NC + 1,
																display_cubeFacelinha(Cube, NLinhas, NumColunas1, NLInicial, NL, NC1, N).
		



							
%espaco para centrar topo			
display_cubeF1(_, 0, _, _, _, _, _, _).
display_cubeF1(Cube, NumLinhas, NumColunas, LimMin, LimMax, NL, NC, N)	:-	NumLinhas1 is NumLinhas - 1,
							display_cubeF1espaco(NumColunas),
							display_cubeF1linha(Cube, NumLinhas, NumColunas, LimMin, LimMax, NL, NC, N),
							nl,nl,
							NL1 is NL + 1,
							display_cubeF1(Cube, NumLinhas1, NumColunas, LimMin, LimMax, NL1, 0, N).
				


				
			
display_cubeF1linha(_, _, 0, _, _, _, _, _).
display_cubeF1linha(Cube, NLinhas, NumColunas, LimMin, LimMax, NL, NC, N)	:-	NumColunas1 is NumColunas - 1,
																Pos is LimMin + (2*N*NL) + NC,
																nth0(Pos,Cube,Peca),
																write(' '), write(Peca),write(' '),
																NC1 is NC + 1, 
																display_cubeF1linha(Cube, NLinhas, NumColunas1, LimMin, LimMax, NL, NC1, N).
		


getCubePeca(Cube, Pos, Peca)	:-	nth0(Pos,Cube,Peca).




				
%desenha os n espacos para centrar uma linha
display_cubeF1espaco(0).
display_cubeF1espaco(N)	:-	N1 is N - 1,
							write('    '),
							display_cubeF1espaco(N1).
							
							
							
							
							
							
							
%espaco para centrar topo			
display_cubeBase(_, 0, _, _, _, _, _, _).
display_cubeBase(Cube, NumLinhas, NumColunas, LimMin, LimMax, NL, NC, N)	:-	NumLinhas1 is NumLinhas - 1,
							display_cubeF1espaco(NumColunas),
							display_cubeBaselinha(Cube, NumLinhas, NumColunas, LimMin, LimMax, NL, NC, N),
							nl,nl,
							NL1 is NL + 1,
							display_cubeBase(Cube, NumLinhas1, NumColunas, LimMin, LimMax, NL1, 0, N).
				


				
			
display_cubeBaselinha(_, _, 0, _, _, _, _, _).
display_cubeBaselinha(Cube, NLinhas, NumColunas, LimMin, LimMax, NL, NC, N)	:-	NumColunas1 is NumColunas - 1,
																Pos is LimMin + (2*N*NL) + NC,
																nth0(Pos,Cube,Peca),
																write(' '), write(Peca),write(' '),
																NC1 is NC + 1, 
																display_cubeBaselinha(Cube, NLinhas, NumColunas1, LimMin, LimMax, NL, NC1, N).
							
							
