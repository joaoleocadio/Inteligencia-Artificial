tipo(bulbasaur, grass).
tipo(charmander, fire).
tipo(squirtle, water).
tipo(pikachu, electric).
tipo(chikorita, grass).
tipo(cyndaquil, fire).
tipo(totodile, water).
tipo(charizard, dragon).
tipo(charizard, flying).
tipo(mewtwo, psychic).
tipo(pidgeot, flying).
tipo(pidgeot, normal).
tipo(pidgey, normal).
tipo(pidgeotto, normal).
tipo(rattata, normal).
tipo(raticate, normal).
tipo(spearow, normal).
tipo(fearow, normal).
tipo(caterpie, bug).
tipo(metapod, bug).
tipo(ledyba, bug).
tipo(ledian, bug).
tipo(spinarak, bug).
tipo(ariados, bug).
tipo(pineco, bug).

geracao(bulbasaur, 1).
geracao(charmander, 1).
geracao(squirtle, 1).
geracao(pikachu, 1).
geracao(chikorita, 2).
geracao(cyndaquil, 2).
geracao(totodile, 2).
geracao(charizard, 2).
geracao(mewtwo, 1).
geracao(pidgeot, 1).
geracao(ledyba, 2).
geracao(ledian, 2).
geracao(spinarak, 2).
geracao(ariados, 2).
geracao(pineco, 2).

bst(bulbasaur, 318).
bst(charmander, 309).
bst(squirtle, 314).
bst(pikachu, 320).
bst(chikorita, 318).
bst(cyndaquil, 309).
bst(totodile, 314).
bst(charizard, 534).
bst(mewtwo, 680).
bst(pidgeot, 479).

%         	   hp  atk  def
status(golbat, 75, 80, 70).
status(bulbasaur, 45, 49, 49).
status(pidgeot, 83, 80, 75).
status(pidgey, 40, 45, 40).
status(pidgeotto, 63, 60, 65).
status(rattata, 30, 56, 35).
status(raticate, 55, 81, 60).
status(spearow, 40, 60, 30).
status(fearow, 65, 90, 65).
status(ledyba, 40, 20, 30).
status(ledian, 55, 35, 50).
status(spinarak, 40, 60, 40).
status(ariados, 70, 90, 70).
status(pineco, 50, 65, 90).

evolucao(squirtle, wartortle, blastoise).

ev(X, Y):- evolucao(X, Y, _); evolucao(X, _, Y).

eficiencia(fight, normal).
eficiencia(fight, rock).
eficiencia(fight, ice).

eficiencia(flying, fight).
eficiencia(flying, bug).
eficiencia(flying, grass).

eficiencia(poison, bug).
eficiencia(poison, grass).

eficiencia(ground, poison).
eficiencia(ground, rock).
eficiencia(ground, electric).

eficiencia(rock, flying).
eficiencia(rock, bug).
eficiencia(rock, fire).

eficiencia(fire, bug).
eficiencia(fire, grass).
eficiencia(fire, ice).

eficiencia(water, ground).
eficiencia(water, rock).
eficiencia(water, fire).

eficiencia(electric, flying).
eficiencia(electric, water).

eficiencia(dragon, dragon).

%status(golbat, HP, ATK, DEF).
%tipo(X, electric), geracao(X, 1)
%findall(X, tipo(X, dragon); tipo((X, dragon), not(geracao(X, 3))), L)