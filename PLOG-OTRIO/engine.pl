%linha mesmo tamanho
%horizontal
condVitoria([b3,b3,b3]).
condVitoria([r3,r3,r3]).
condVitoria([b2,b2,b2]).
condVitoria([r2,r2,r2]).
condVitoria([b1,b1,b1]).
condVitoria([r1,r1,r1]).

%diferentes tamanhos
condVitoria([b3,b2,b1]).
condVitoria([r3,r2,r1]).
condVitoria([b1,b2,b3]).
condVitoria([r1,r2,r3]).



%concentrica
condVitoria([[b3,_,_],[b2,_,_],[b1,_,_]]).
condVitoria([[_,b3,_],[_,b2,_],[_,b1,_]]).
condVitoria([[_,_,b3],[_,_,b2],[_,_,b1]]).
condVitoria([[r3,_,_],[r2,_,_],[r1,_,_]]).
condVitoria([[_,r3,_],[_,r2,_],[_,r1,_]]).
condVitoria([[_,_,r3],[_,_,r2],[_,_,r1]]).




%Tamanho: Tam, 0 grande, 1 medio, 2 pequeno
%Linha: Lin, 0, 1 ou 2
selectLinhaporTamHor(Tam, Lin, PiecesList) :- escolhebloco(BlocoLinha,Lin), nth0(Tam,BlocoLinha,PiecesList).

%Seleciona a peca do tabuleiro por tamanho
getPiece(Tam, Lin, Col, Piece) :-   escolhebloco(BlocoLinha, Lin),
									nth0(Tam,BlocoLinha,PiecesList),
									nth0(Col,PiecesList,Piece).
											
											
											



%Verifica se existe vitoria com linha horizontal (Tam: tamanho da peca a verificar, Lin: linha a verificar)
%Na mesma linha tem 3 tamanhos diferentes
%Tam: 0 - grande, 1 - medio, 2 - pequeno
%Lin: 0, 1 ou 2
winCondLinhaMesmoTamH(Tam,Lin) :- selectLinhaporTamHor(Tam, Lin, PiecesList),
							condVitoria(PiecesList),
							!,
							msgVitoria(PiecesList).
winCondLinhaMesmoTamH(Tam,Lin).






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	

%Res e lista com as pecas, por tam selecionado na diagonal (esq. para dir.)
selectLinhaporTamDListA(Tam, Res) :-  getPiece(Tam, 0,0, Piece), append([],[Piece],List),
								getPiece(Tam, 1,1, Piece2), append(List,[Piece2],List2),
								getPiece(Tam, 2,2, Piece3), append(List2,[Piece3],Res).
%Res e lista com as pecas, por tam selecionado na diagonal (dir. para esq.)	
selectLinhaporTamDListB(Tam, Res) :-  getPiece(Tam, 0,2, Piece), append([],[Piece],List),
								getPiece(Tam, 1,1, Piece2), append(List,[Piece2],List2),
								getPiece(Tam, 2,0, Piece3), append(List2,[Piece3],Res).
			



%Verifica se ganhou com linha diagonal
winCondLinhaMesmoTamD(Tam):- selectLinhaporTamDListA(Tam, Res),
							condVitoria(Res),
							!,
							msgVitoria(Res).
winCondLinhaMesmoTamD(Tam):- selectLinhaporTamDListB(Tam, Res),
							condVitoria(Res),
							!,
							msgVitoria(Res).

							
winCondLinhaMesmoTamD(Tam).

msgVitoria(L):-nl, write('VITORIAAAAAAAAAAAAA'),
							write(L),
							fail.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%Verifica se existe vitoria onde as pecas estao concentricas
%Lin: 0, 1 ou 2
winCondConcentrica(Lin) :- escolhebloco(BlocoLinha,Lin),
							condVitoria(BlocoLinha),
							!,
							msgVitoria(BlocoLinha).
winCondConcentrica(Lin).							

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Mesmo tamanho
winCondLinhaMesmoTamV(Tam,Col) :- getPiece(Tam, 0,Col, Piece), append([],[Piece],List),
								getPiece(Tam, 1,Col, Piece2), append(List,[Piece2],List2),
								getPiece(Tam, 2,Col, Piece3), append(List2,[Piece3],PiecesList),
								condVitoria(PiecesList),
								!,
								msgVitoria(PiecesList).
winCondLinhaMesmoTamV(Tam,Lin).




winCondLinhaDifV(Col) :- getPiece(0, 0,Col, Piece), append([],[Piece],List),
								getPiece(1, 1,Col, Piece2), append(List,[Piece2],List2),
								getPiece(2, 2,Col, Piece3), append(List2,[Piece3],PiecesList),
								condVitoria(PiecesList),
								!,
								msgVitoria(PiecesList).
winCondLinhaDifV(Col).



winCondLinhaDifHA(Lin) :- getPiece(0, Lin,0, Piece), append([],[Piece],List),
								getPiece(1, Lin,1, Piece2), append(List,[Piece2],List2),
								getPiece(2, Lin,2, Piece3), append(List2,[Piece3],PiecesList),
								condVitoria(PiecesList),
								!,
								msgVitoria(PiecesList).
winCondLinhaDifHA(Lin).




winCondLinhaDifHB(Lin) :- getPiece(0, Lin,2, Piece), append([],[Piece],List),
								getPiece(1, Lin,1, Piece2), append(List,[Piece2],List2),
								getPiece(2, Lin,0, Piece3), append(List2,[Piece3],PiecesList),
								condVitoria(PiecesList),
								!,
								msgVitoria(PiecesList).
winCondLinhaDifHB(Lin).




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

verLinhaIgualV :-	winCondLinhaMesmoTamV(0,0),
					winCondLinhaMesmoTamV(0,1),
					winCondLinhaMesmoTamV(0,2),
					winCondLinhaMesmoTamV(1,0),
					winCondLinhaMesmoTamV(1,1),
					winCondLinhaMesmoTamV(1,2),
					winCondLinhaMesmoTamV(2,0),
					winCondLinhaMesmoTamV(2,1),
					winCondLinhaMesmoTamV(2,2).	
					
verLinhaDifV :- winCondLinhaDifV(0),
				winCondLinhaDifV(1),
				winCondLinhaDifV(2),
				winCondLinhaDifV(0),
				winCondLinhaDifV(1),
				winCondLinhaDifV(2).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
				
verLinhaIgualH :-	winCondLinhaMesmoTamH(0,0),
					winCondLinhaMesmoTamH(0,1),
					winCondLinhaMesmoTamH(0,2),
					winCondLinhaMesmoTamH(1,0),
					winCondLinhaMesmoTamH(1,1),
					winCondLinhaMesmoTamH(1,2),
					winCondLinhaMesmoTamH(2,0),
					winCondLinhaMesmoTamH(2,1),
					winCondLinhaMesmoTamH(2,2).

verLinhaDifH :- winCondLinhaDifHB(0),
				winCondLinhaDifHB(1),
				winCondLinhaDifHB(2),
				winCondLinhaDifHA(0),
				winCondLinhaDifHA(1),
				winCondLinhaDifHA(2).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

verConcentrica :- winCondConcentrica(0),
					winCondConcentrica(1),
					winCondConcentrica(2).
					
					
verLinhaDiag :- winCondLinhaMesmoTamD(0),
				winCondLinhaMesmoTamD(1),
				winCondLinhaMesmoTamD(2).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

verSeGanhou :- 	verConcentrica,
				verLinhaDifH,
				verLinhaIgualH,
				verLinhaDifV,
				verLinhaIgualV,
				verLinhaDiag.












