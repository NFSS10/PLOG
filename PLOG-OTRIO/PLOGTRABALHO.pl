board([
[[a,a,a],[b,b,b],[a,a,a]],
[[c,c,c],[d,d,d],[c,c,c]],
[[a,a,a],[b,b,b],[a,a,a]]
]).



/*
board([
[a,a,a],[b,b,b],[a,a,a],
[c,c,c],[d,d,d],[c,c,c],
[a,a,a],[b,b,b],[a,a,a]
]).
*/
/*
%print the board
print_board([]).
print_board([Lin|Rest]):-
	print_line(Lin),
	print_board(Rest).

%Print 1 line of the board
print_line([]):-write(' FIN ').
print_line([Elem|Rest]):-
	translate(Elem, Plem),
	write(Plem),
	print_line(Rest).
*/

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
	
printaux([]) :- write('   ').
printaux([X|Rest]):-
	translate(X, Plem),
	write(Plem),
	printaux(Rest).



% Translate the board to the displaying simbols
translate(a,'0').
translate(b,'1').
translate(c,'2').
translate(d,'3').

linha1G([
[a,a,a],[b,b,b],[c,c,c]
]).

% Display the board
display :- board(X), print_board(X).

teste :- linha1G(X), print_board(X).




