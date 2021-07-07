factorisable(N)
    :- counter(2, N).

counter(F, N)
    :- F < N, 
       N mod F =:= 0.
counter(F, N)
    :- F < N,
    F1 is F + 1,
    counter(F1, N).


main :-
    factorisable(15), write("yes!").
    %factorisable(17), write("yes!").
