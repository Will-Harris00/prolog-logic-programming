% Going to get an empty list if P is greater than Q
fromTo(P, Q, [])
    :- P > Q.
fromTo(P, Q, [P|W])
    :- P =< Q, 
    % This second if statement isn't strictly necessary
    % as the condition is already checked in the first clause
    % We want to increment P by one each iteration until reaching Q
    % To do maths in Prolog we need to use the 'is' keyword
    P1 is P + 1,
    fromTo(P1, Q, W).
    % 'is' unifies the result of incrementing P with P1


main :-
    fromTo(6, 10, X), write(X).
