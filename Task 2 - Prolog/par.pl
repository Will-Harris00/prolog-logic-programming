:- initialization(main).
convert(P,Q) :-
    Q is P - 48.

check([_,_,_,D],D).

par(N) :-
    number_codes(N, X), 
    maplist(convert, X, Y),
    length(Y, 4),
    check(Y, Z), write(Z).


main :-
    par( 7826 ).
