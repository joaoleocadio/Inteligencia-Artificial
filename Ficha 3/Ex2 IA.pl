%Homem(nome) && HOUSE BARATHEON
homem("Stannis").
homem("Renly").
homem("Robert").
homem("Joffrey").
homem("Tommen").
homem("Loras Tyrell").
homem("Gandor Clegane").
homem("Ser Gregor Clegane").
%Homem(nome) && HOUSE LANNISTER
homem("Tywin").
homem("Kevan").
homem("Ser Jaime").
homem("Tyrion").
homem("Lancel").
%Homem(nome) && HOUSE TARGARYEN
homem("Aerys II").
homem("Rhaegar").
homem("Rhaenys").
homem("Aegon").
homem("Viserys").
homem("Khal Drogo").

mulher("Myrcella").
mulher("Joanna").
mulher("Dorna").
mulher("Cersei").
mulher("Rhaella").
mulher("Elia").
mulher("Daenerys").

familia("Stannis", "Baretheon").
familia("Renly", "Baretheon").
familia("Robert", "Baretheon").
familia("Joffrey", "Baretheon").
familia("Tommen", "Baretheon").
familia("Loras Tyrell", "Baretheon").
familia("Gandor Clegane", "Baretheon").
familia("Ser Gregor Clegane", "Baretheon").
familia("Myrcella", "Baretheon").

familia("Stannis", "Lannister").
familia("Kevan", "Lannister").
familia("Ser Jaime", "Lannister").
familia("Tyrion", "Lannister").
familia("Lancel", "Lannister").
familia("Joanna", "Lannister").
familia("Dorna", "Lannister").
familia("Cersei", "Lannister").

familia("Aeris II", "Targaryen").
familia("Rhaegar", "Targaryen").
familia("Rhaenys", "Targaryen").
familia("Aegon", "Targaryen").
familia("Viserys", "Targaryen").
familia("Khal Drogo", "Targaryen").
familia("Rhaella", "Targaryen").
familia("Elia", "Targaryen").
familia("Daenerys", "Targaryen").

casados("Tywin", "Joanna").
casados("Kevan", "Dorna").
casados("Robert", "Cersei").
casados("Aerys II", "Rhaella").
casados("Rhaegar", "Elia").
casados("Khal Drogo", "Daenerys").

descDir("Kevan", "Dorna", "Lancel").
descDir("Tywin", "Joanna", "Cersei").
descDir("Tywin", "Joanna", "Ser Jaime").
descDir("Tywin", "Joanna", "Tyrion").
descDir("Robert", "Cersei", "Joffrey").
descDir("Robert", "Cersei", "Myrcella").
descDir("Robert", "Cersei", "Tommen").
descDir("Aerys II", "Rhaella", "Rhaegar").
descDir("Aerys II", "Rhaella", "Viserys").
descDir("Aerys II", "Rhaella", "Daenerys").
descDir("Rhaegar", "Elia", "Aegon").
descDir("Rhaegar", "Elia", "Rhaenys").

irmao(X, Y):- descDir(P, M, X), descDir(P, M, Y), P==P, Y==Y, X\==Y.

matou("Robert", "Rhaegar").
matou("Ser Jaime", "Aeris II").
matou("Tyrion", "Joanna").
matou("Ser Gregor Clegane", "Elia").
matou("Ser Gregor Clegane", "Rhaenys").
matou("Ser Gregor Clegane", "Aegon").
matou("Tyron", "Robert").

inimigo("Gandor Clegane", "Ser Gregor Clegane").

relAmorosaI("Ser Jaime", "Cersei").
relAmorosaI("Cersei", "Ser Jaime").
relAmorosa("Loras Tyrel", "Renly").
% Este facto foi adicionado para verificar os viúvos amorosos
relAmorosa("Tywin", "Rhaella").

% Este facto foi adicionado para verificar o facto de infiel
relAmorosa("Lancel", "Daenerys").

amigo("Loras Tyrel", "Renly").

gay("Loras Tyrel", "Renly").

filho(X, Y):- descDir(X,_, Y), homem(X), homem(Y).

filha(X, Y):- descDir(X, _, Y), homem(X), mulher(Y).

viuvo(X):- casados(X, M), matou(_, M), homem(X).

viuva(X):- casados(M, X), matou(_, M), mulher(X).

viuvos_amorosos(X, Y):- viuvo(X), viuva(Y), relAmorosa(X, Y), homem(X), mulher(Y). 

vinganca(X, Y):- matou(Y, M), (casados(X, M);casados(M, X)).
    
assassino(X):- matou(X,_), homem(X).

morto(M):- matou(_, M).

incesto(X, Y):- (relAmorosaI(X, Y); relAmorosaI(Y, X)), (irmao(X, Y); irmao(Y,X)).

vingou(X, Y):- matou(P, Y), matou(X, P).

infiel(X):- (casados(X, Y); casados(Y, X)), not(morto(Y)), (relAmorosa(X, A); relAmorosa(A, X)), not(morto(A)).

matouFamilia(X, Y):- matou(X, M), familia(M, Y).