parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, mary).
parent(mary, jim).

child(X, Y) :- parent(Y, X).

female(pam).
female(liz).
female(mary).
female(ann).
male(tom).
male(bob).
male(jim).

grandparent(X,Y) :- parent(X, Z), parent(Z, Y).

mother(X, Y) :- female(X), parent(X, Y).

father(X, Y) :- male(X), parent(X, Y).

sister(X, Y) :- female(X), parent(Z, X), parent(Z, Y), different(X, Y).
brother(X, Y) :- male(X), parent(Z, X), parent(Z, Y), different(X, Y).

predecessor(X, Y) :- parent(X, Y).
predecessor(X, Y) :- parent(X, Z), predecessor(Z, Y).
