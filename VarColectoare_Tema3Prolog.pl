/*
 * Student: Leca Marian-Rafael
 * Grupa: 10LF292
 * Enunt: 14. (a) Scrieți un predicat care determina cea mai lungă secvență de numere pare consecutive.
      (b) Pentru o listă Eterogenă, formată din numere întregi și liste de numere, scrieți un predicat care determina cea mai lungă secvență de numere pare consecutive din fiecare sublista.
[1, [2, 1, 4, 6, 7], 5, [1, 2, 3, 4], 2, [1, 4, 6, 8, 3], 2, [1, 5], 3] => [1, [4, 6], 5, [2], 2, [4, 6, 8], 2, [], 3]

a)
longestEvenSequence(l1, l2, ..., ln, R=[], C=[], max, length )={
                                             R, n=0
                                             longestEvenSequence(l1,
                                             ..., ln, C,
                                             C,
                                             length, 0), max <= length
					     longestEvenSequence(l2, ..., ln, R, C U l1, max, length+1), isEven(l1)=1
                                             longestEvenSequence(l2,
                                             ..., ln, R, [], max, 0),
                                             otherwise
				            }
isEven(a) = {
		a%2, always
	    }



b)
longestEvenSequenceSublist(l1, l2, ..., ln)={
                                              longestEvenSequence(l1),
                                              is_list(l1) =:= 1
                                              longestEvenSequenceSublist(l2,...,
                                              ln), otherwise
                                             }



*/

isEven(A):-
      mod(A,2)=:=0.


longestEvenSequence([], _,_,_,R, RF):-
      flatten(R,RF).


longestEvenSequence([H|T], M, L, C, R, RF):-

    M < L ->
    longestEvenSequence([H|T], L, L, C,C, RF);

    isEven(H)->
    longestEvenSequence(T, M, L+1, [C,H], R, RF);
    \+isEven(H)->
    longestEvenSequence(T, M, 0,[],R, RF).



longestEvenSequenceSublist([],R):-
      %flat(R,RF),
      writeln(R).

longestEvenSequenceSublist([H|T],R):-
      is_list(H) ->(
      var(R) ->(
      longestEvenSequence(H, 0,0,[],[],RT),
      longestEvenSequenceSublist(T,RT)
      );
      \+var(R)->(
      longestEvenSequence(H, 0,0,[],[],RT),
      longestEvenSequenceSublist(T,[R,RT])
      )
      );
      \+is_list(H)->
      (
      var(R) ->
      longestEvenSequenceSublist(T,H);
      \+var(R) ->
      longestEvenSequenceSublist(T,[R,H])
      ).



