/*
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

longestEvenSequence([], _,_,_,R):-
      flatten(R, RF),
      writeln(RF).


longestEvenSequence([H|T], M, L, C, R):-

    M < L ->
    longestEvenSequence([H|T], L, L, C,C);

    isEven(H)->
    longestEvenSequence(T, M, L+1, [C,H], R);
    \+isEven(H)->
    longestEvenSequence(T, M, 0,[],R).



longestEvenSequenceSublist([H|T],R):-
      is_list(H) ->
      longestEvenSequence(H, 0,0,[],[]),
      longestEvenSequenceSublist(T,R);
      \+is_list(H)->
      longestEvenSequenceSublist(T,R).




