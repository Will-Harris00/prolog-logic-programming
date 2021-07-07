% Note PAR predicate wrong in CA!
% Accept both DW and ST below.
par( N ) :-
    digits( N, [X1,X2,X3,X4] ),
    X1 > 0, X2 > 0, X3 > 0, X4 > 0,
    nub( [X1,X2,X3,X4], [X1,X2,X3,X4] ),
    % 0 is ( 10 * X1 + X2 ) mod ( 10 * X3 + X4 ). % DW
    0 is ( 10 * X3 + X4 ) mod ( 10 * X1 + X2 ). % ST

digits( N, [X1,X2,X3,X4] ) :-
    divMod( N, 1000, X1, N1 ),
    divMod( N1, 100, X2, N2 ),
    divMod( N2, 10, X3, X4 ).

divMod( A, B, D, M ) :-
    D is A div B,
    M is A mod B.
    nub( [], [] ).
nub( [X|XS], [X|RS] ) :-
    \+ member( X, XS ),
    nub( XS, RS ).

nub( [X|XS], RS ) :-
    member( X, XS ),
    nub( XS, RS ).


main :-
    par( 7826 ).
