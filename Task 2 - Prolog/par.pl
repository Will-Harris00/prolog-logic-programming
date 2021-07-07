:- initialization(main).
convert(P,Q) :-
    Q is P - 48.

different(X) :-
    sort(X, Sorted),
    length(X, OriginalLength),
    length(Sorted, SortedLength),
    OriginalLength =:= SortedLength.


main :-
    different( [7,8,2,6] ).
