:- initialization(main).
animal(C) :-
    member(C, [aardvark, antelope, coyote, dingo, donkey, elephant, horse, jaguar, kangaroo]).

vegetable(C) :-
    member(C, [artichoke, cabbage, carrot, celery, leek, lettuce, marrow, onion, potato]).

mineral(C) :-
    member(C, [anatase, basalt, cobolt, copper, galena, nickel, sodium, silver, zicron]).


main :-
    animal( aardvark ), write(true).
