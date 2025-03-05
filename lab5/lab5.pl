% Write a prolog relation class(X,Y) that classifies a number X into
% a category Y, where Y is either negative, positive or zero.
class(0,zero) :- !.
class(N, positive) :- N > 0, !.
class(N, negative) :- N < 0, !.

split([], [], []).
split([X|XS], [X|PS], N) :- X >= 0, !, split(XS,PS,N).
split([X|XS], P, [X|NS]) :- X < 0, !, split(XS,P,NS).

splitb([],[],[]).
splitb([X|XS], [X|PS], N) :- X >=0, splitb(XS, PS, N).
splitb([X|XS], P, [X|NS]) :- X < 0, splitb(XS, P, NS).

fiba(0,1).
fiba(1,1).

fiba(X,Y) :-
    X > 0,
    X1 is X - 1,
    X2 is X - 2,
    fiba(X1, Y1),
    fiba(X2, Y2),
    Y is Y1 + Y2, !.
