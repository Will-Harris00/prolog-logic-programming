:- initialization(main).
animal(C) :-
    member(C, [aardvark, antelope, coyote, dingo, donkey, elephant, horse, jaguar, kangaroo]).

vegetable(C) :-
    member(C, [artichoke, cabbage, carrot, celery, leek, lettuce, marrow, onion, potato]).

mineral(C) :-
    member(C, [anatase, basalt, cobolt, copper, galena, nickel, sodium, silver, zicron]).

spell(S, X) :-
    atom_chars(S, X).

niner(_) :-
    animal(A),
    spell(A, [T4, T5, T2, T5, T8, T9]), write(T9), write(T8), write(T5), write(T2), write(T5), write(T4).

/*
a( 452589 ).
v( 658785 ).
m( 7378719 ).
*/


main :- 
    niner(_).
