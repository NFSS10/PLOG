T=([[B,B,B],[N,N,N],[N,R,N]],
[[N,N,N],[N,V,N],[P,P,G]],
[[P,N,N],[R,B,R],[G,G,G]]).

print_board([]).
print_board([Lin|Rest]):-
	nl,
	print_line(Lin),print_board(Rest).

print_line([]).
print_line([Elem|Rest]):-
translate(Elem,Plem),
write(Plem),
print_line(Rest).

