:- initialization(main).
spell(S, X) :-
    atom_chars(S, X).


main :-
    spell(cobalt, X), write(X).
