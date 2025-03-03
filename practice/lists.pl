% We can have compound terms in lists:
% ?- [X, b(Y), c(3)] = [a(1), b(2), c(3)].
%     X=a(1),
%     Y=2.
%
% Pipe operator | separates the Head and Tail of the list:
% List = [H|T].
%
% [a] = [a|[]].
%
% ?- L = [1|[2,3]].
%     L = [1,2,3].
%
% ?- X=[1|[2|3|[]]].
%     X=[1,2,3].
%
% [a|b] != [a,b].
% [a,b] is a proper list, [a|b] is not.
%
% ?- [1,2,3,4,5] = [H|T].
%     H = 1,
%     T = [2,3,4,5].
%
% !!! Head is ALWAYS going to be an atom
% Tail is ALWAYS going to be a list, even an empty list.
%
% ?- [1,2,3,4] = [_,_|X].
%     X = [3,4].
%
% ?- [1,2,3,4] = [_,_,_,X].
%     X = 4.
%
% ?- [1,2,3,4] = [_,_,_|[X]].
%     X = 4.
%
% ?- [1,2,3,4] = [_,_,_|X].
%     X = [4].


%Example
%student(id, name([last,first]), grades([a1,a2,a3,test])).
student(1001, name([allteron, alice]), grades([92,75,100,85])).
student(1002, name([boberson, bob]), grades([50,64,73,66])).
student(1003, name([charleston, charlie]), grades([65,75,85,100])).
student(1004, name([davidson, dave]), grades([10,92,34,87])).
student(1005, name([ellenovitch, ellen]), grades([72,87,82,70])).

% How did alice do on assignment 1?
% ?- student(_, name([_,alice]), grades([X,_,_,_])).
% X = 92.

% How did alice do on assignment 2?
% ?- student(_, name([_,alice]), grades([_,X,_,_])).
% X = 75.

% How did student 1002 do on the test?
% ?- student(1002, _, grades([_,_,_,X])).
% X = 66.

% Who got 100 on the test?
% ?- student(_, X, grades([_,_,_,100])).
% X = name([charleston, charlie]).

% Did anyone get 100 on anything?
% ?- student(_,name(Name),grades(Grades)), member(100,Grades).
% Name = [allteron, alice],
% Grades = [92, 75, 100, 85] ;
% Name = [charleston, charlie],
% Grades = [65, 75, 85, 100] ;
% false.

% What is each student's average grade
% ?- student(_,name(Name), grades([A1,A2,A3,Test])), Average is (A1+A2+A3+Test)/4.
%Name = [allteron, alice],
%A1 = 92,
%A2 = 75,
%A3 = 100,
%Test = 85,
%Average = 88 ;
%Name = [boberson, bob],
%A1 = 50,
%A2 = 64,
%A3 = 73,
%Test = 66,
%Average = 63.25 ;
%Name = [charleston, charlie],
%A1 = 65,
%A2 = 75,
%A3 = 85,
%Test = 100,
%Average = 81.25 ;
%Name = [davidson, dave],
%A1 = 10,
%A2 = 92,
%A3 = 34,
%Test = 87,
%Average = 55.75 ;
%Name = [ellenovitch, ellen],
%A1 = 72,
%A2 = 87,
%A3 = 82,
%Test = 70,
%Average = 77.75.

