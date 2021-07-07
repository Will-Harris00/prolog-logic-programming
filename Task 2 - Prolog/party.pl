:- initialization(main).
convert(P, Q) :-
    Q is P - 48,
    Q > 0.

missing_digit(V,W,D) :-
    number_codes(V, ListOne),
    number_codes(W, ListTwo),
    maplist(convert, ListOne, ListDigitsOne),
    maplist(convert, ListTwo, ListDigitsTwo),
    append(ListDigitsOne, ListDigitsTwo, D).

party(V, W) :-
    missing_digit(V, W, D),
    subtract([1,2,3,4,5,6,7,8,9], D, M), write(M).


main :-
    party( 9632, 5418 ).
