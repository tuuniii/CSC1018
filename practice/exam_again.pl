% The relation path(A,B,N) is true if a one-way path of length N exists from A to B
% An example set of facts is:

path(alpha, beta, 4).
path(beta, gamma, 6).
path(gamma, delta, 3).
path(delta, epsilon, 5).
path(epsilon, zeta, 2).
path(zeta, eta, 4).
path(eta, theta, 7).
path(theta, iota, 3).
path(iota, kappa, 6).

adjacent(X,Y,Z) :- path(X,Y,_), path(Y,Z,_).

shortPath(X,Y) :- path(X,Y,D), D =< 4.

connection(A,B) :- path(A, B,_).
connection(A,B) :- path(A,X,_), connection(X,B).

product(1,[]).
product(X,[H|T]):-
	product(X1, T),
	X is X1 * H.

minimum(X,[X]):-
minimum(X,[H|T]):-
	minimum(X1, T),
	X is min(H, X1).
	
reverseList([],[]).
reverseList([H|T], Y) :-
	reverselist(T, Y1),
	append(Y1, [H], Y).
	
even_length([]).
even_length([_,_|T]):-
	even_length(T).
	
parent(alice, bob).
parent(bob, charlie).
parent(charlie, dave).

ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(X,Z), ancestor(Z,Y).

countOccurrence(_,0,[]).
countOccurrence(X, [X|T], N):-
	countOccurrence(X, T, N1),
	N is N1 + 1.
countOccurrences(X, [_|T], N):-
	countOccurences(X,T,N).
	
palindromic(L) :- reverseList(L,L).