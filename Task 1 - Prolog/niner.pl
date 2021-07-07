:- initialization(main).
animal(C) :-
    member(C, [aardvark, antelope, coyote, dingo, donkey, elephant, horse, jaguar, kangaroo]).

vegetable(C) :-
    member(C, [artichoke, cabbage, carrot, celery, leek, lettuce, marrow, onion, potato]).

mineral(C) :-
    member(C, [anatase, basalt, cobolt, copper, galena, nickel, sodium, silver, zicron]).

spell(S, X) :-
    atom_chars(S, X).

/*
a( 452589 ).
v( 658785 ).
m( 7378719 ).
*/


main :-
    animal(A),
    spell(A, [T4, T5, T2, T5, T8, T9]),
    %maplist(write, [T4, T5, T2, T5, T8, T9, '\n']),
    vegetable(V),
    spell(V, [T6, T5, T8, T7, T8, T5]),
    %maplist(write, [T6, T5, T8, T7, T8, T5, '\n']),
    mineral(M),
    spell(M, [T7, T3, T7, T8, T7, T1, T9]),
    %maplist(write, [T7, T3, T7, T8, T7, T1, T9, '\n']),
    maplist(write, [T1, T2, T3, T4, T5, T6, T7, T8, T9]).
