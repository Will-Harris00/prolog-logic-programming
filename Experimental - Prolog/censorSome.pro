% lists must be at least three elements to be censored
%name("abc", X).
% name is a bidirectional predicate that converts between
% atom code and ascii numbers and vice verse.
%name(X, [100,102,102]).


% This function is effectively mapping cersor to all elements
% in the list, except we know that prolog has no higher order
% funcions so we have to write our own to achieve this result.
censor(V, W)
    :- name(V, A),
       blat(A, B),
       name(W, B).

blat([], []).
blat([E], [E]).
blat([E,F], [E,F]).
blat([H|T], [H|W])
    % each if statement is followed by a list of operations
    :- length(T, N),
        N1 is N - 1,
        stars(N1, V),
        last(T, U),
        append(V, [U], W).

stars(0, []).
stars(N, [42|W])
    :- N1 is N - 1,
       stars(N1, W).

last([E], E).
last([_|T], W)
    :- last(T, W).

% prolog operates on the closed world assumption. This means
% that is we don't define a word as being rude, then prolog
% assumes this word to be polite base off no other information.

% We are effectively using rude as a filter funcition with which
% we can map the censor function to those specific rude elements.


rude("damn").
rude("blast").

censorsome([], []).
% predicate when a word is rude and needs censoring
censorsome([H|T], [V|W])
    :- rude(H),
       censor(H, V),
       censorsome(T, W).
% predicate for all other polite words
censorsome([H|T], [H|W])   
    :- censorsome(T, W).

% there is no need to do a test for not rude as the 
% element will have already passed the first predicate.


main :-
    censorsome(["damn","hello","blast"], R), write(R).
