:- initialization(main).
convert(P,Q) :-
    Q is P - 48.

unique(List) :-
    sort(List, Sorted),
    length(List, OriginalLength),
    length(Sorted, SortedLength),
    OriginalLength =:= SortedLength.

par(Number) :-
    number_codes(Number, ListCharCodes), 
    maplist(convert, ListCharCodes, ListDigits),
    length(ListDigits, 4),
    unique(ListDigits), write(ListDigits).


main :-
    par( 7826 ).
