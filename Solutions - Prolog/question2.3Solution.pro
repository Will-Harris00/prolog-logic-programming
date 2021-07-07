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


pars( PARS ) :-
    loop( 1111, 9999, PARS ), write(PARS).

loop( I, LIMIT, [] ) :-
    I > LIMIT.
loop( I, LIMIT, [I|RS] ) :-
    par( I ),
    I1 is I + 1,
    loop( I1, LIMIT, RS ).

loop( I, LIMIT, RS ) :-
    I1 is I + 1,
    loop( I1, LIMIT, RS ).


party( M, N ) :-
    par( M ),
    par( N ),
    digits( M, [X1,X2,X3,X4] ),
    digits( N, [Y1,Y2,Y3,Y4] ),
    intersection( [X1,X2,X3,X4], [Y1,Y2,Y3,Y4], [] ),
    difference( [1,2,3,4,5,6,7,8,9], [X1,X2,X3,X4,Y1,Y2,Y3,Y4], [W] ),
    0 is M mod W,
    0 is N mod W.

intersection( [], _, [] ).
intersection( [X|XS], YS, [X|RS] ) :-
    member( X, YS ),
    intersection( XS, YS, RS ).

intersection( [X|XS], YS, RS ) :-
    \+ member( X, YS ),
    intersection( XS, YS, RS ).

difference( [], _, [] ).
difference( [X|XS], YS, [X|RS] ) :-
    \+ member( X, YS ),
    difference( XS, YS, RS ).
difference( [_|XS], YS, RS ) :-
    difference( XS, YS, RS ).


main :-
   party( 9632, 5418 ).
