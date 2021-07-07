spell( A, R ) :-
    atom_chars( A, R ).


main :-
    spell( cobalt, X ), write(X).
