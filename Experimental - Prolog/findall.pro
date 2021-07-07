:- initialization(main).
party(V,W) :-
    V mod 2 =:= 0,
    W mod 2 =:= 0,
    V \= W.

all_diff(L) :-
        findall([I,J], (member(I, L), member(J, L), party(I,J)), List), write(List).


main :-
    all_diff([ 9631, 5418, 8276]).

