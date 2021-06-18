% Hechos

hombre(daniel).
hombre(manuel).
hombre(jonas).
hombre(lamar).
hombre(pedro).
hombre(feliciano).

mujer(diana).
mujer(constancia).
mujer(ines).
mujer(ruth).
mujer(ana).
mujer(soledad).

es_madre(ana,ruth).
es_madre(ana,pedro).
es_madre(diana,jonas).
es_madre(ruth,ines).
es_madre(ruth,manuel).
es_madre(soledad,constancia).
es_madre(soledad,daniel).

es_padre(lamar,pedro).
es_padre(lamar,ruth).
es_padre(pedro,jonas).
es_padre(feliciano,manuel).
es_padre(feliciano,ines).
es_padre(jonas,constancia).
es_padre(jonas,daniel).


es_hermano(ruth,pedro).
es_hermano(pedro,ruth).
es_hermano(ines,manuel).
es_hermano(manuel,ines).
es_hermano(constancia,daniel).
es_hermano(daniel,constancia).


es_pareja(ana,lamar).
es_pareja(lamar,ana).
es_pareja(diana,pedro).
es_pareja(pedro,diana).
es_pareja(soledad,jonas).
es_pareja(jonas,soledad).
es_pareja(ruth,feliciano).
es_pareja(feliciano,ruth).


es_hijo(ruth,lamar).
es_hijo(pedro,lamar).
es_hijo(ruth,ana).
es_hijo(pedro,ana).

es_hijo(jonas,pedro).
es_hijo(jonas,diana).
es_hijo(manuel,feliciano).
es_hijo(ines,feliciano).
es_hijo(manuel,ruth).
es_hijo(ines,ruth).
es_hijo(daniel,jonas).
es_hijo(daniel,soledad).
es_hijo(constancia,jonas).
es_hijo(constancia,soledad).



% Reglas
es_abuelo(Var1,Var2):-(es_padre(Var1,Var3);es_madre(Var1,Var3)),(es_padre(Var3,Var2);es_madre(Var3,Var2)).

es_primo(Var1,Var2):-(es_padre(Var3,Var2);es_madre(Var3,Var2)),((es_padre(Var4,Var1);es_madre(Var4,Var1)),es_hermano(Var4,Var3)).

es_cunado(Var1,Var2):-(es_hermano(Var1,Var3),es_pareja(Var2,Var3));(es_pareja(Var1,Var3),es_hermano(Var3,Var2)).

es_tio(Var1,Var2):-((es_padre(Var3,Var2);es_madre(Var3,Var2)),es_hermano(Var3,Var1));((es_padre(Var3,Var2);es_madre(Var3,Var2)),es_pareja(Var1,Var4),es_hermano(Var3,Var4)).


arbol(_) :-write('------------------------------------------------------------------'), nl
			, write('                           Ana--------Lamar                    '), nl
			, write('                                  |                     '), nl
			, write('                               /     \\                     '), nl
			, write('                           /            \\                       '), nl
			, write('       Feliciano ------ Ruth            Pedro-----Diana'), nl
			, write('                   |                           |           '), nl
			, write('   	         /      \\                     /     '), nl
			, write('             Manuel   Ines               Jonas-----Soledad'), nl
			, write('                                                |           '), nl
			, write('   	                                       / \\    '), nl
			, write('                           		  Daniel   Constancia '), nl
			, write('------------------------------------------------------------------'), nl.
