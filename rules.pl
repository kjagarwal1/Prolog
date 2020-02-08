member(H, [H|_]).
member(H, [_|T]) :- member(H, T).

expand([], _).
expand([H|T],Artist) :- collab(Artist,H), Artist \== H ,expand(T,Artist).

collab(Artist, Feature) :- song(_,L,_), member(Artist, L), member(Feature, L).

solo(Artist,Year) :- album(Album, Year), notasolotest(Artist,Album).

notasolotest(Artist, Album) :- song(_,List,Album), member(Artist, List), othermember(Artist, List), !, fail.
notasolotest(Artist, Album) :- song(_,List,Album), member(Artist, List).
othermember(Artist, List) :- member(Newartist, List), Artist \== Newartist.

release(Title,Year) :- song(Title,_,Album), album(Album, Year).