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

candidate_pars(P, Q, []) :-
    P > Q.
candidate_pars(P, Q, [P|W]) :-
    par(P),
    P1 is P + 1,
    candidate_pars(P1, Q, W).
candidate_pars(P, Q, W) :- 
    P1 is P + 1,
    candidate_pars(P1, Q, W).

pars(_) :-
    candidate_pars(1234, 9876, X), write(X).


main :-
    pars(_).
