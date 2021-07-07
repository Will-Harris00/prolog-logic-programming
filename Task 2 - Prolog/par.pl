:- initialization(main).
convert(P,Q) :-
    Q is P - 48.

par(N) :-
    number_codes(N, X), maplist(convert, X, Y), write(Y).
    /*
    name(N, X), maplist(convert, X, Y), write(Y).
    name(N, A), write(A).
    atom_codes(X, A), write(X).
    char_code(C, 50), write(C). gives 2
    char_code('2', X), write(X). gives 50
    name(123456, X), maplist(char_code(), Y, X).
    number_codes(123456, X), maplist(plus(48), Y, X).
    maplist(char_code, X), write(X).
    maplist(char_code, [p, r, r], X), write(X).
    maplist(number_atom, [112, 114, 114], X), write(X).
    maplist(upcase_atom, [map, reduce, filter], U).
    */


main :-
    par( 7826 ).
