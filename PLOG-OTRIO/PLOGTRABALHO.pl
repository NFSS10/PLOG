board([[a,a,a],[b,b,b]]).

%print the board
print_board([]).
print_board([Lin|Rest]):-
	nl,
	print_line(Lin),
	print_board(Rest).

%Print 1 line of the board
print_line([]).
print_line([Elem|Rest]):-
	translate(Elem, Plem),
	write(Plem),
	print_line(Rest).

% Translate the board to the displaying simbols
translate(a,'0').
translate(b,'1').

% Display the board
display :- board(X), print_board(X).
