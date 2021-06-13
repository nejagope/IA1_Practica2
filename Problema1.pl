%----- Parejas --------

pareja(marta, bruce).
pareja(bruce, marta).

pareja(diana, peter).
pareja(peter, diana).

pareja(may, ben).
pareja(ben, may).

pareja(barry, pepper).
pareja(pepper, barry).

pareja(rachel, enrique).
pareja(enrique, rachel).

%----- Madres --------

madre(marta, diana).
madre(marta, may).
madre(marta, barry).
madre(marta, rachel).

madre(diana, mary).
madre(diana, harry).

madre(may, ezio).
madre(may, lorenzo).
madre(may, sergio).

madre(pepper, tony).
madre(pepper, lara).

madre(rachel, clark).
madre(rachel, lois).


%----- Padres --------

padre(bruce, diana).
padre(bruce, may).
padre(bruce, barry).
padre(bruce, rachel).

padre(peter, mary).
padre(peter, harry).

padre(ben, ezio).
padre(ben, lorenzo).
padre(ben, sergio).

padre(barry, tony).
padre(barry, lara).

padre(enrique, clark).
padre(enrique, lois).

%----- Hijos --------
hijo(diana, marta).
hijo(diana, bruce).
hijo(may, marta).
hijo(may, bruce).
hijo(barry, marta).
hijo(barry, bruce).
hijo(rachel, marta).
hijo(rachel, bruce).

hijo(mary, diana).
hijo(mary, peter).
hijo(harry, diana).
hijo(harry, peter).

hijo(ezio, may).
hijo(ezio, ben).
hijo(lorenzo, may).
hijo(lorenzo, ben).
hijo(sergio, may).
hijo(sergio, ben).

hijo(tony, pepper).
hijo(lara, pepper).
hijo(tony, barry).
hijo(lara, barry).

hijo(clark, rachel).
hijo(clark, enrique).
hijo(lois, rachel).
hijo(lois, enrique).

%----- Hermanos --------
hermana(diana, may).
hermana(diana, barry).
hermana(diana, rachel).
hermana(may, diana).
hermana(may, barry).
hermana(may, rachel).
hermana(rachel, diana).
hermana(rachel, may).
hermana(rachel, barry).
hermana(lara, tony).
hermana(lois, clark).
hermana(mary, harry).

hermano(barry, diana).
hermano(barry, may).
hermano(barry, rachel).
hermano(harry, mary).
hermano(ezio, lorenzo).
hermano(ezio, sergio).
hermano(lorenzo, ezio).
hermano(lorenzo, sergio).
hermano(sergio, ezio).
hermano(sergio, lorenzo).
hermano(tony, lara).
hermano(clark, lois).


%---------------------------------------

primo(P1, P2) :-      padre(PA1, P1), padre(PA2, P2), hermano(PA1, PA2)
                    ; madre(MA1, P1), madre(MA2, P2), hermana(MA1, MA2)
                    ; madre(MA1, P1), padre(PA2, P2), hermana(MA1, PA2)
                    ; padre(PA1, P1), madre(MA2, P2), hermano(PA1, MA2).

tio(P1, P2) :-   	padre(P, P2), hermano(P, P1)
                  ; madre(M, P2), hermana(M, P1)
                  ; padre(P, P2), hermano(P, H), pareja(H, P1)
                  ; madre(M, P2), hermana(M, H), pareja(H, P1).

abuelo(P1, P2) :-     padre(P, P2), padre(P1, P)
                    ; padre(P, P2), madre(P1, P)
    		        ; madre(M, P2), padre(P1, M)
                    ; madre(M, P2), madre(P1, M).

culpable(C) :- hermana(H, C), primo(H, clark), tio(barry, H), write('El culpable es '), write(C), nl.

arbol(_) :-   write('------------------------------------------------------------------'), nl
			, write('                      _ Marta          Bruce _                   '), nl
			, write('                 /                 /\\           \\          '), nl
			, write('             /                 /      \\            \\          '), nl
			, write('         /                 /            \\             \\          '), nl
			, write('       May  Ben         Diana Peter    Barry Pepper  Rachel Enrique'), nl
			, write('          |                  |              |              |       '), nl
			, write('   /      |     \\         /     \\         /   \\          /   \\   '), nl
			, write('Lorenzo Sergio  Ezio    Mary    Harry   Tony  Lara     Clark  Lois'), nl
			, write('------------------------------------------------------------------'), nl.