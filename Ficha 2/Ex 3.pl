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

evolucao(squirtle, wartortle, blastoise).

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