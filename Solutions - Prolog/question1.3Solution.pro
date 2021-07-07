animal( aardvark ).
animal( antelope ).
animal( coyote ).
animal( dingo ).
animal( donkey ).
animal( elephant ).
animal( horse ).
animal( jaguar ).
animal( kangaroo ).

vegetable( artichoke ).
vegetable( cabbage ).
vegetable( carrot ).
vegetable( celery ).
vegetable( leek ).
vegetable( lettuce ).
vegetable( marrow ).
vegetable( onion ).
vegetable( potato ).

mineral( anatase ).
mineral( basalt ).
mineral( cobalt ).
mineral( copper ).
mineral( galena ).
mineral( nickel ).
mineral( sodium ).
mineral( silver ).
mineral( zircon ).


spell( A, R ) :-
    atom_chars( A, R ).


solution( X1, X2, X3, X4, X5, X6, X7, X8, X9 ) :-
    animal( A ),
    spell( A, [ X4, X5, X2, X5, X8, X9 ] ),
    vegetable( V ),
    spell( V, [ X6, X5, X8, X7, X8, X5 ] ),
    mineral( M ),
    spell( M, [ X7, X3, X7, X8, X7, X1, X9 ] ).


main :-
    solution( X1, X2, X3, X4, X5, X6, X7, X8, X9 ),
    write( X1 ),
    write( X2 ),
    write( X3 ),
    write( X4 ),
    write( X5 ),
    write( X6 ),
    write( X7 ),
    write( X8 ),
    write( X9 ).
