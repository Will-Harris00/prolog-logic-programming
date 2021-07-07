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
    loop( 1111, 9999, PARS ).

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


partys( PARTYS ) :-
    pars( PARS ),
    loop2( PARS, PARS, PARTYS ).

loop2( [], _, [] ).
loop2( [P|PS], PARS, RS3 ) :-
    loop3( P, PARS, RS1 ),
    loop2( PS, PARS, RS2 ),
    append( RS1, RS2, RS3 ).

loop3( _, [], [] ).
loop3( P, [Q|QS], [ [P,Q] | RS ] ) :-
    party( P, Q ),
    loop3( P, QS, RS ).
loop3( P, [_|QS], RS ) :-
    loop3( P, QS, RS ).


main :-
    partys( PARTYS ), write( PARTYS ).
