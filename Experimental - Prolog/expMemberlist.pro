:- initialization(main).
memberlist(E, [E|_]).
memberlist(E, [_|T])
    :- memberlist(E,T).


main :-
    memberlist(12, [3,67,2,4,12]).
    %memberlist('A', 4).
    %memberlist('A' [3,67,3,4,12]).
