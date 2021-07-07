:- initialization(main).
convert(P,Q) :-
    Q is P - 48.

different(X) :-
    sort(X, Sorted),
    length(X, OriginalLength),
    length(Sorted, SortedLength),
    OriginalLength =:= SortedLength.

par(N) :-
    number_codes(N, X), 
    maplist(convert, X, Y),
    length(Y, 4),
    different(Y).


main :-
    par( 7826 ).
