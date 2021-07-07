:- initialization(main).
convert(P, Q) :-
    Q is P - 48,
    Q > 0.

unique(List) :-
    sort(List, Sorted),
    length(List, OriginalLength),
    length(Sorted, SortedLength),
    OriginalLength =:= SortedLength.

multiple_of([A,B,C,D]) :-
    get_num(A,B,X),
    get_num(C,D,Y),
    check_mod(X,Y).
    
get_num(P,Q,R) :-
    R is P * 10 + Q.

check_mod(N,M) :-
    N mod M =:= 0.
    
par(Number) :-
    number_codes(Number,ListCharCodes), 
    maplist(convert,ListCharCodes,ListDigits),
    length(ListDigits, 4),
    unique(ListDigits),
    multiple_of(ListDigits).


missing_digit(V,W,CombDigits) :-
    number_codes(V, ListOne),
    number_codes(W, ListTwo),
    maplist(convert, ListOne, ListDigitsOne),
    maplist(convert, ListTwo, ListDigitsTwo),
    append(ListDigitsOne, ListDigitsTwo, CombDigits).

party(V, W) :-
    missing_digit(V, W, CombDigits),
    subtract([1,2,3,4,5,6,7,8,9], CombDigits, MissingDigits),
    length(MissingDigits, 1),
    par(V),
    par(W),
    nth(1, MissingDigits, M),
    check_mod(V,M),
    check_mod(W,M).


main :-
    party( 9632, 5418 ).
