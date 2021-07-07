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
    X mod Y =:= 0.

get_num(P,Q,R) :-
    R is P * 10 + Q.

par(Number) :-
    number_codes(Number, ListCharCodes), 
    maplist(convert, ListCharCodes, ListDigits),
    length(ListDigits, 4),
    unique(ListDigits),
    multiple_of(ListDigits).


main :-
    par( 7826 ).
