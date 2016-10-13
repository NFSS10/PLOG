board([
[[a,a,a],[b,b,b],[a,a,a]],
[[c,c,c],[d,d,d],[c,c,c]],
[[a,a,a],[b,b,b],[a,a,a]]
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
	print_line(Rest).

%print the set of pieces in a position
printaux([]) :- write('   ').
printaux([X|Rest]):-
	translate(X, Plem),
	write(Plem),
	printaux(Rest).



% Translate the board to the displaying symbols
translate(a,'0').
translate(b,'1').
translate(c,'2').
translate(d,'3').

% Display the board
display :- board(X), print_board(X).





