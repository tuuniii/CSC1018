book(illiad, homer, study, 500).
book(c, richie, study, 150).
book(nt_bible, sams, reference, 480).
book(monty_python, cleese, comedy, 300).

buildLibrary(Lib) :- findall(book(Title, Author, Genre, Size), book(Title, Author, Genre, Size), Lib).

holiday(_,[]). % Base Case

holiday(book(HT, HA, _, _), [book(Title,Author,Genre,Size)|_]) :-
    HT = Title,
    HA = Author,
    Size < 400,
    Genre \== study,
    Genre \== reference.

holiday(B, [book(_,_,_,_) | XS]) :-
    holiday(B, XS).
    % holiday(B, List). this predicate checks if B is in the List
    % Every list is defined by Head (first element) and Tail (the rest of the list). So here we are
    % saying [head | tail]. where book(_,_,_,_) is the first book in the list and we dont care about its details
    % Recursive case. Checking if the book belongs to the category holiday

revision(_, []). %Base case

revision(book(RT, RA, _, _), [book(Title, Author, Genre, Size) | _]) :-
    RT = Title,
    RA = Author,
    Genre == study,
    Size > 300.

revision(book(RT, RA, _, _), [book(Title, Author, Genre, Size) | _]) :-
    RT= Title,
    RA = Author,
    Genre = reference,
    Size > 300.

revision(B, [book(_,_,_,_) | XS]) :-
    revision(B, XS).

literary(_,[]). %Base case

literary(book(LitT, LitA,_,_), [book(Title, Author, Genre, _) | _ ]) :-
    LitT = Title,
    LitA = Author,
    Genre == drama.

literary(B, book(_,_,_,_) | XS) :-
    literary(B, XS). % Recursive Case

leisure(_,[]). % Base Case

leisure(book(LT,LA,_,_), [book(Title, Author, Genre, _) | _ ]) :-
    LT = Title,
    LA = Author,
    (Genre == comedy; Genre == fiction).

leisure(B, [book(_,_,_,_)|XS]) :-
    leisure(B, XS). % recursive case. Continue searching in the tail.





































