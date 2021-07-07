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


candidate_pars(P, Q, []) :-
    P > Q.
candidate_pars(P, Q, [P|W]) :-
    par(P),
    P1 is P + 1,
    candidate_pars(P1, Q, W).
candidate_pars(P, Q, W) :- 
    P1 is P + 1,
    candidate_pars(P1, Q, W).

pars( PARS ) :-
    candidate_pars(1234, 9876, PARS).


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


comparison(PARS, I, J) :-
    member(I, PARS), 
    member(J, PARS), 
    party(I,J).

partys( PARTYS ) :-
    pars(PARS),
    findall([I,J], comparison(PARS, I, J), PARTYS).


main :-
    partys( PARTYS ), write(PARTYS).

/*
There are two solutions to Teaser 3026:
Graham: 5418, Sam: 9632, Beth: 6923 or the same where Sam and Beth's numbers are swapped.
The second solution is as follows:
Graham: 8517, Sam: 9624, Beth: 9426 or the same where Sam and Beth's numbers are swapped.
*/
