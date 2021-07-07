factorisable(N)
    :- counter(2, N).

counter(F, N)
    :- F < N, 
       N mod F =:= 0.
counter(F, N)
    :- F < N,
    F1 is F + 1,
    counter(F1, N).

prime(P)
    :- \+ factorisable(P).

primes(P, Q, [])
    :- P > Q.
primes(P, Q, [P|W])
    :- prime(P),
       P1 is P + 1,
       primes(P1, Q, W).
primes(P, Q, W)
    :- P1 is P + 1,
       primes(P1, Q, W).


main :-
    primes(2, 60, X), write(X).
