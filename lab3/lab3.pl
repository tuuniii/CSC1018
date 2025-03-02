% Lists

myElem(X, [X | _]).
myElem(X, [_ | T]) :- myElem(X, T).

myHead(X, [X|_]).

myLast(X, [X]).
myLast(X, [_|T]) :- myLast(X, T).

myTail(X, [_|X]).

myAppend([], L, L).
myAppend([H|T], L, [H|L3]) :- myAppend(T, L, L3).

myReverse([],[]). % simplest case
myReverse([X|T], Y) :- myReverse(T, T1), myAppend(T1, [X], Y). %reversing the tail and appending X to the end.

myDelete(X, [X|L], L). % simplest case.
myDelete(X, [Y|T], [Y|T1]) :- myDelete(X, T, T1). % working recursively through the list.
