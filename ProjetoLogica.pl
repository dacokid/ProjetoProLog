/* Cinco irmas fazem aniversario em um mes diferente e cada uma em um dia diferente da semana. Usando  as dicas abaixo, determine o mes e o dia da semana em que cai o aniversario de cada irma.
Paula nasceu em Marco mas nao no sabado. O aniversario de Abigail nao foi na sexta nem na quarta.
A garota que nasceu na segunda nasceu antes no ano que Brenda e Mary.
Tara não nasceu em Fevereiro e o seu aniversario foi no fim de semana.
Mary nao nasceu em Dezembro nem seu aniversario foi em um dia útil da semana. A garota cujo aniversario foi em Junho, nasceu no domingo.
Tara nasceu antes de Brenda, cujo aniversario nao foi na sexta. Mary nao nasceu em Julho. */

nasceu_mes_antes(X, Y, Mes) :-
	nth1(Xi, Mes, X),
	nth1(Yi, Mes, Y),
	Xi < Yi.

print_solucao([Head|Tail]) :-
	write(Head),
	nl,
	print_solucao(Tail).	

solucao(S) :-

	S = [[Nome1, Mes1, Dia1],
	     [Nome2, Mes2, Dia2],
	     [Nome3, Mes3, Dia3],
	     [Nome4, Mes4, Dia4],
	     [Nome5, Mes5, Dia5]],
    

    Nomes = [abigail, brenda, mary, paula, tara],
    Nomes = [Nome1, Nome2, Nome3, Nome4, Nome5],
    Mes =[fevereiro, marco, junho, julho, dezembro],
    permutation(Mes, [Mes1, Mes2, Mes3, Mes4, Mes5]),

    Dia = 	[domingo, segunda, quarta, quinta, sexta],
    permutation(Dia, [Dia1, Dia2, Dia3, Dia4, Dia5]),

	/* Paula nasceu em Marco mas nao no sabado. */
	member([paula, marco, Dia4], S), Dia4 \= sabado,
	
	%O %aniversario %de %Abigail %nao %foi %na %sexta %nem %na %quarta
	Dia1 \= sexta, Dia1 \= quarta,

	/* A garota que nasceu na segunda nasceu antes no ano que Brenda e Mary.*/
	member([_, C1, segunda], S),
	member([brenda, Mes2, Dia2], S), nasceu_mes_antes(C1, Mes2, Mes),
	member([mary, Mes3, _], S), nasceu_mes_antes(C1, Mes3, Mes),

	/* Tara não nasceu em Fevereiro e o seu aniversario foi no fim de semana. */
	member([tara, Mes5, Dia5], S), Mes5 \= fevereiro, (Dia5 = sabado ; Dia5 = sexta),

	/* Mary nao nasceu em Dezembro nem seu aniversario foi em um dia útil da semana. */
	member([mary, Mes3, Dia3], S), Mes3 \= dezembro, (Dia3 = sabado ; Dia3 = domingo),

	/* A garota cujo aniversario foi em Junho, nasceu no domingo. */
	member([_, junho, domingo], S),

	/* Tara nasceu antes de Brenda, cujo aniversario nao foi na sexta. */
	member([brenda, Mes2, Dia2], S), Dia2 \= sexta,
	member([tara, Mes5, _], S), nasceu_mes_antes(Mes5, Mes2, Mes),

	Dia2 \== sexta,

	/* Mary nao nasceu em Julho. */
	Mes3 \== julho,

	print_solucao(S).