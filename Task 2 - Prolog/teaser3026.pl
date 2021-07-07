:- initialization(main).
% This program has been developed for GNU Prolog | https://www.tutorialspoint.com/execute_prolog_online.php

% Question 2.1
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
    M mod N =:= 0.
    
par(Number) :-
    number_codes(Number,ListCharCodes), 
    maplist(convert,ListCharCodes,ListDigits),
    length(ListDigits, 4),
    unique(ListDigits),
    multiple_of(ListDigits).


% Question 2.2
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


% Question 2.3
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
    check_mod(M,V),
    check_mod(M,W).


% Question 2.4
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
There is only a single solution to Teaser 3026:
There are only 2 PARs that appear in more than one PARTY: 1785 and 2754. 
Each of these appears in two PARTYs, but only 1785 is paired with two other
PARs that share the same digits. 1785 can be paired with both 2496 and 4692 
(missing digit = 3) to make a PARTY.
*/
