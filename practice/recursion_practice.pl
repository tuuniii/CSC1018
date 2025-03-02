% Practice for the lab exam
%
% SUM RECURSION - find the sum of all integers between A and B.
%
sum_recursion(A,A,A). %Base case: when A = B, Result = A. Eg. when A=3 and B=3, the sum of all ints between them is 3 (there are no ints between them)
sum_recursion(A,B,Result) :-
    A1 is A + 1, % increment by 1
    sum_recursion(A1,B,Result1), % recursively find the sum, excludes A.
    Result is A + Result1. % add A to the result1 to get the final result.

% It's very important that all recursions have some statement that
% shrinks the case so we can reach the base case and the rec can go
% back.

% FIBONACCI SEQUENCE - fib(0) = 1, fib(1) = 1.
% fib(n) = fib(n - 1) + fib(n - 2)

% 2 base cases!!
fib_recursion(0,1).
fib_recursion(1,1).

% Y1 and Y2 are the numbers that are the result of X-1 and X-2, and we
% combine them together to get the final result Y.
fib_recursion(X,Y) :-
    X > 1,
    X1 is X - 1,
    X2 is X - 2,
    fib_recursion(X1,Y1),
    fib_recursion(X2, Y2),
    Y is Y1 + Y2.

% converter ig
fib_it(N,F) :-
    fib_it(N,1,1,F). % we need two running counters 0 and 1 for fibonacci 0 and 1.

% Base case - N,N-1,N-2,Result
fib_it(1,F,_,F).

fib_it(N,T1,T2,F):-
    N > 1,
    N1 is N - 1,
    T is T1 + T2,
    fib_it(N1,T,T1,F).
%Work through
%fib_it(5,X)
%fibit(5,1,1,F).
%fibit(5,1,1,F).
%fibit(4,2,1,F).
%fibit(3,3,2,F).
%fibit(2,5,3,F).
%fibit(1,8,5,F).
%fibit(0,13,8,13).


%FACTORIAL RECURSIVE
% n! = n.(n-1).(n-2)...1.
%
% 0! = 1
% n! = n.(n-1)!

factorial(0, 1).
factorial(X,R):-
    X > 0,
    X1 is X - 1,
    factorial(X1, R1),
    R is R1 * X.

% FACTORIAL ITERATIVE
% idea, start at 0, keep track of a running total and a counter. and
% when it's up to N, it returns back the total.

%iterative factorial
%public predicate
factorial_it(N,F) :-
    factorial_it(0,N,1,F).
    % starting at 0 up to N, our total starts at 1,
    % F is the result. F is the only unbound value

%Base case
factorial_it(N,N,F,F). %when I reaches N (N,N), the Final is set to Total (F,F)

% recursive case
factorial_it(I,N,Total,Final) :-
    I < N,
    I1 is I + 1,
    Total1 is Total * I1,
    factorial_it(I1,N,Total1,Final).

% factorial_it(3,X).
% factorial_it(0,3,1,F). % with X = F
% factorial_it(1,3,1,F'). % with F = F', they are unified, when one gets
% factorial_it(2,3,2,F''). % with F' = F''
% factorial_it(3,3,6,F'''). Base caseee => F'' = F'''

% ANOTHER VERSION OF ITERATIVE FACTORIAL

factorial_itb(N,F):-
    factorial_itb(N,1,F).
% a version of counting down from N
% 0 is a constant here so we don't need to add it
% Total is set to 1.

factorial_itb(0,F,F).
% specific value for a counter that means done (0)

factorial_itb(N,Total,F):-
    N>0,
    T1 is Total * N,
    N1 is N-1,
    factorial_itb(N1, T1, F).

