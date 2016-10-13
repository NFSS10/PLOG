board([
	[[b3,r3,g3],
	[b2,r2,g2],
	[b1,r1,g1]],
	
	[[p3,b3,g3],
	[p2,b2,g2],
	[p1,b1,g1]],
	
	[[r3,n,n],
	[n,r2,n],
	[n,n,r1]]
]).



%print the board
print_board([]).
print_board([Lin|Rest]):-
	print_line(Lin),
	print_board(Rest).

%Print 1 line of the board
print_line([]):- nl.
print_line([Elem|Rest]):-
	printaux(Elem),
	nl,
	print_line(Rest).

%print the set of pieces in a position
printaux([]) :- write('   ').
printaux([X|Rest]):-
	translate(X, Plem),
	write(Plem),
	printaux(Rest).



% Translate the board to the displaying symbols
translate(r3,'R()'). translate(g3,'G()'). translate(b3,'B()'). translate(p3,'P()'). 
translate(r2,'RO'). translate(g2,'GO'). translate(b2,'BO'). translate(p2,'PO'). 
translate(r1,'R*'). translate(g1,'G*'). translate(b1,'B*'). translate(p1,'P*').
translate(n,'  '). 

% Display the board
display :- nl, board(X), print_board(X).





