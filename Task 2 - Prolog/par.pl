:- initialization(main).
get_num(P,Q,R) :-
    R is P * 10 + Q.

multiple_of([A,B,C,D]) :-
    get_num(A,B,X),
    get_num(C,D,Y),
    X mod Y =:= 0.
    %X mod Y is 0.


main :-
    multiple_of( [7, 8, 2, 6] ).
