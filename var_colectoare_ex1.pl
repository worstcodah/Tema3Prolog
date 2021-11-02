nrAparitii([],_,0).
nrAparitii([H|T], E,R):-
    H=:=E,
    nrAparitii(T,E,R1),
    R is R1+1.
nrAparitii([H|T], E,R):-
    H=\=E,
    nrAparitii(T,E,R).
