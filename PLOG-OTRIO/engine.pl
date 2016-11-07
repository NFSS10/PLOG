condVitoria([b3,b3,b3]).
condVitoria([r3,r3,r3]).
condVitoria([b2,b2,b2]).
condVitoria([r2,r2,r2]).
condVitoria([b1,b1,b1]).
condVitoria([r1,r1,r1]).


%Tamanho: Tam, 0 grande, 1 medio, 2 pequeno
%Linha: Lin, 0, 1 ou 2
selectLinhaporTamHor(Tam, Lin, PiecesList) :- escolhebloco(BlocoLinha,Lin), nth0(Tam,BlocoLinha,PiecesList).

winCondConcentric(Tam,Lin) :- selectLinhaporTamHor(Tam, Lin, PiecesList)
							,condVitoria(PiecesList)
							,!
							,nl, write('VITORIAAAAAAAAAAAAA')
							,write(PiecesList).
%Caso n tenha ganho, passa a frente
winCondConcentric(Tam,Lin).							
							
							
verifica :- winCondConcentric(0,0)
			,winCondConcentric(1,0)
			,winCondConcentric(2,0)
			,winCondConcentric(0,1)
			,winCondConcentric(1,1)
			,winCondConcentric(2,1)
			,write('check1')
			,winCondConcentric(0,2)
			,winCondConcentric(1,2)
			,winCondConcentric(2,2)
			,write('check2').