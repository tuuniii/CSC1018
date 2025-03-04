% Fibonacci numbers
% fib(0,1).
% fib(1,1).
%
fib(0,1).
fib(1,1).

fib(X,Y):-
    X > 1,
    X1 is X - 1,
    X2 is X - 2,
    fib(X1, Y1),
    fib(X2, Y2),
    Y is Y1 + Y2.

% Area of a triangle
% A/B - base A, height B.
% % tA is a binary relation, so it will take 2 arguements and evaluate to
% true or false. If we were not using a binary operator we would define
% tA(Base,Height,Area) to be true if Area = 0.5*Base*Height. This is a
% ternary relation, so to make it binary we need to combine Area and
% Height into one argument using the / operator,
% i.e. tA(Base/Height,Area). Then we can write the binary operator
% Base/Height tA Area

%infix binary operator
:- op(500, xfy, tA).

Base/Height tA Area :- Area is 0.5*Base*Height.
