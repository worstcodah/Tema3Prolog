/* Leca Marian Rafael
   Grupa: 10LF292

   a) Scrieți un predicat care determina cea mai lungă secvență de
   numere pare consecutive.

   (b) Pentru o listă Eterogenă, formată din
   numere întregi și liste de numere, scrieți un predicat care
   determina cea mai lungă secvență de numere pare consecutive din
   fiecare sublista. Ex:[1, [2, 1, 4, 6, 7], 5, [1, 2, 3, 4], 2, [1, 4,
   6, 8, 3], 2, [1, 5], 3] => [1, [4, 6], 5, [2], 2, [4, 6, 8], 2, [],
   3]

   a)

   longestEvenSequence(l1, l2, ..., ln, M, L, C, R)={
                                                    R,n=0;
                                                    longestEvenSequence(l1, ..., ln, C, C, length, 0), max <= length;
                                                    longestEvenSequence(l2, ..., ln, R, C U l1, max, length+1), isEven(l1)=1;
                                                    longestEvenSequence(l2, ..., ln, R, [], max, 0),otherwise
                                                    }
   isEven(a) = {a%2, always}

   b)

   longestEvenSequenceSublist(l1, l2, ..., ln)={
                                               longestEvenSequence(l1),is_list(l1)=:=1;
                                               longestEvenSequenceSublist(l2,...,ln),otherwise
                                               }
*/

isEven(A):-
      mod(A,2)=:=0.


/*longestEvenSequence([],M,L,C,R,RF):-
    \+length(C,0)-> (
          M < L ->
          longestEvenSequence([],_,_,_,C,RF);
          M >= L -> longestEvenSequence([],_,_,_,R,RF)).
*/

longestEvenSequence([],M,L,C,_,RF):-
      \+length(C,0),
      M < L,
      longestEvenSequence([],_,_,_,C,RF).

longestEvenSequence([],M,L,C,R,RF):-
      \+length(C,0),
      M >= L,
      longestEvenSequence([],_,_,_,R,RF).


longestEvenSequence([], _,_,_,R, RF):-
      flatten(R,RF).

longestEvenSequence([H|T], M, L, C, _, RF):-

    M < L,
    longestEvenSequence([H|T], L, L, C,C, RF).

longestEvenSequence([H|T], M, L, C, R, RF):-
    isEven(H),
    longestEvenSequence(T, M, L+1, [C,H], R, RF).

longestEvenSequence([H|T], M, _, _, R, RF):-
    \+isEven(H),
    longestEvenSequence(T, M, 0,[],R, RF).


longestEvenSequenceSublist([],[]).

longestEvenSequenceSublist([H|T],[H|TR]):-
      \+is_list(H),
      longestEvenSequenceSublist(T,TR).

longestEvenSequenceSublist([H|T],[H1|TR]):-
      is_list(H),
      longestEvenSequence(H,0,0,[],[],H1),
      longestEvenSequenceSublist(T,TR).



