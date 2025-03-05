% a set of facts

flight(dublin, london, 464).
flight(london, paris, 344).
flight(paris, berlin, 878).
flight(berlin, rome, 1187).
flight(rome, madrid, 1360).
flight(madrid, lisbon, 502).
flight(lisbon, dublin, 1560).
flight(dublin, paris, 784).
flight(paris, rome, 1106).

% Q1
betweenF(X,Y,Z) :-
	flight(X,Y,_), flight(Y,Z,_).

shortFlight(X,Y) :-
	flight(X,Y,Dist),
	Dist =< 500.
	
% Q2
% base case
connected(A,B) :- flight(A,B,_).

% recursive case
connected(A,B) :-
	flight(A,X,_),
	connected(X,B).
	
% Q3
% Base case
sum(0,[]).
sum(X,[H|T]):-
	sum(X1, T),
	X is X1 + H.
	
minimum(X,[X]).
minimum(X,[H|T]):-
	minimum(X1,T),
	X is min(H,X1).
	
% Q4

% Base Case
% This checks if there is a direct flight from A to B with distance D1
% If D1 is greater than or equal to D, then the relation is true

longRoute(A,B,D) :-
	flight(A,B,D1),
	D1 >= D.
	
% Checks for an indirect route from A to B via an intermediate airport X
% 1. Finds a direct flight from A to X,
% 2. Recursively finds a route from X to B with distance X2,
% 3. Calculates the total distance as D1 + D2,
% 4. Checks if the total distance is >= D.

longRoute(A,B,D) :-
	flight(A,X,D1),
	longRoute(X,B,D2),
	D is D1 + D2,
	D >= D.
	
% Q5 Check if L1 is L2 with rearranged elements

% Base case
permutation([],[]).

% recursive case
permutation([H|T], P) :-
	permutation(T,P1),
	add(H, P1, P).
	
add(X, L, [X|L]).

% Q6 
sublist([],_).

sublist([H|T],[H|T1]) :-
	sublist(T,T1).
	
sublist(S,[_|T]) :-
	sublist(S,T).
	
% Q7 This relation is true if N is the number of times X appears in the list L.

% Base case
count(_,[],0).

% Recursive case

% If the head matches X, increment the count and recursively process the tail.
count(X, [X|T], N):-
	count(X, T, N1),
	N is N1 + 1.

% If the head doesn't match X, skipe the head and recursively process the tail.
count(X,[H|T], N):-
	X \= H,
	count(X, T, N).
	
% Q8

% Base case
remove(_,[],[]).

remove(X, [X|T], L2) :-
	remove(X, T, L2).
remove(X, [H|T], [H|L2]) :-
	X \= H,
	remove(X, T, L2).
	
% Q9 product

product(1,[]).
product(X,[H|T]):-
	product(X1,T).
	X is X1 * H.
	
minimuma(X,[X]).
minimuma(X, [H|T]):-
	minimuma(X1,T),
	X is min(H,X1).
	
reverseList([],[]).
reverseList([H|T], Reverse):-
	reverseList(T, ReverseT),
	append(ReverseT, [H], Reverse).
	
last_element(X,[X]).
last_element(X, [_|T]):-
	last_element(X,T).
	
list_length(0,[]).
list_length(N,[_|T]).
	list_length(N1, T),
	N is N1 + 1.
	
equal_lists([],[]).
equal_lists([H|T], [H1,T1]):-
	H == H1,
	equal_lists(T,T1).
	
maximum(X,[X]).
maximum(X, [_|T]):-
	maximum(X1, T),
	X is max(H, X1).