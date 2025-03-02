north(a, f).
north(b, g).
north(c, h).
north(d, i).
north(e, j).
north(f, k).
north(g, l).
north(h, m).
north(i, n).
north(j, o).
north(k, p).
north(l, q).
north(m, r).
north(n, s).
north(o, t).

west(a, b).
west(f, g).
west(k, l).
west(p, q).
west(b, c).
west(g, h).
west(l, m).
west(q, r).
west(c, d).
west(h, i).
west(m, n).
west(r, s).
west(d, e).
west(i, j).
west(n, o).
west(s, t).

south(f, a).
south(g, b).
south(h, c).
south(i, d).
south(j, e).
south(k, f).
south(l, g).
south(m, h).
south(n, i).
south(o, j).
south(p, k).
south(q, l).
south(r, m).
south(s, n).
south(t, o).

east(b, a).
east(g, f).
east(l, k).
east(q, p).
east(c, b).
east(h, g).
east(m, l).
east(r, q).
east(d, c).
east(i, h).
east(n, m).
east(s, r).
east(e, d).
east(j, i).
east(o, n).
east(t, s).

%North
duenorth(X, Y) :-
    north(X,Y).
duenorth(X,Y) :-
    north(X, Z), duenorth(Z, Y).

% North-West
duenorthwest(X,Y) :-
    north(X, Z),
    west(Z, Y).
duenorthwest(X,Y) :-
    north(X, Z),
    duenorthwest(Z,Y).
duenorthwest(X,Y) :-
    west(X,Z),
    duenorthwest(Z,Y).

% West
duewest(X,Y) :-
    west(X,Y).
duewest(X,Y) :-
    west(X,Z),
    duewest(Z,Y).

% South-West
duesouthwest(X,Y) :-
    south(X,Z),
    west(Z,Y).
duesouthwest(X,Y) :-
    south(X,Z),
    duesouthwest(Z,Y).
duesouthwest(X,Y) :-
    west(X,Z),
    duesouthwest(Z,Y).

% South
duesouth(X,Y) :-
    south(X,Y).
duesouth(X,Y) :-
    south(X,Z),
    duesouth(Z,Y).

% South-East
duesoutheast(X,Y) :-
    south(X,Z),
    east(Z,Y).
duesoutheast(X,Y) :-
    south(X,Z),
    duesoutheast(Z,Y).
duesoutheast(X,Y) :-
    east(X,Z),
    duesoutheast(Z,Y).

%North-East
duenortheast(X,Y) :-
    north(X,Z),
    east(Z,Y).
duenortheast(X,Y) :-
    north(X,Z),
    duenortheast(Z,Y).
duenortheast(X,Y) :-
    east(X,Z),
    duenortheast(Z,Y).

