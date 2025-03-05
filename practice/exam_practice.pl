% The following set of facts describes the roads between pairs of towns.
% The relation road(A,B,N) is true if a one-way road of length N exists from A to B
% An example set of facts is:

road(northbog,westhome,3).
road(oldtown,westhome,4).
road(oldtown,poshville,5).
road(villanua, oldtown,2).
road(eastwick, poshville, 2).
road(poshville, northbog, 3).
road(westpark, villanua, 2).
road(westpark, southfork, 7).
road(southfork, eastwick,2).

% Q1. Using the facts outlined in the Preamble, write the following relations:

% betweenR(X,Y,Z) which is true if there is a road from X to Y and from Y to Z.
% closeTo(X,Y) which is true if the road from X to Y is less than or equal to 3 km.

between(X,Y,Z):- road(X,Y,_), road(Y,Z,_).
closeTo(X,Y):- road(X,Y,D), D =< 3.

% Q2 Using the facts outlined in the Preamble, write the relation route(A,B) which is true if
% there exists a route, with zero or more intermediate towns, between A and B.

% Base case direct route
route(A,B) :- road(A,B,_).

% Indirect route recursive
route(A,B) :- road(A,X,_), route(X,B).

% Q3 Write the following relations for lists of numbers:
% sum(X,L) which is true if X is the sum of the values in the list.
% maximum(X,L
 which is true if X is the largest value in the list L.
 
% Base Case
sum(0,[]).
sum(X,[H|T]) :-
    sum(X1,T),
    X is X1 + H.

% Base case
maximum(X,[X]).
maximum(X,[H|T]):-
    maximum(X1,T),
    X is max(H,X1).
