% 1ª Geração
casados("Jan Simon", "John Hamilton").

% 2º Geração
casados("Abby Hamilton", "Steve Smith").
casados("Gabi Julian", "John Hamilton").
casados("Barb Hamilton", "Dale Calebs").

% 3ªa Geração
casados('Cami Smith', 'Dale Marx').
casados('Pam Calebs', 'Mark Grant').
casados('Alex Jones', 'Mike Calebs').

%filhos da 1ª geração
filhos("Jan Simon", "John Hamilton", "Abby Hamilton").
filhos("Jan Simon", "John Hamilton", "John Hamilton").
filhos("Jan Simon", "John Hamilton", "Barb Hamilton").

filhos("Abby Hamilton", "Steve Smith", "Cami Smith").
filhos("Abby Hamilton", "Steve Smith", "Fae Smith").

filhos("Gabi Julian", "John Hamilton", "Meg Hamilton").

filhos("Barb Hamilton", "Dale Calebs", "Pam Calebs").
filhos("Barb Hamilton", "Dale Calebs", "Mike Calebs").

filhos("Pam Calebs", "Mark Grant", "Angie Grant").

filhos("Alex Jones", "Mike Calebs", "Mary Calebs").

irmao(X, Y):- filhos(M, P, X), filhos(M, P, Y), P==P, M==M, X\==Y.

mae(M, F):- filhos(M, _, F).
pai(P, F):- filhos(_, P, F).


%Avó Neta
avó(A, N):- filhos(M, P, N), ( filhos(A, _, M); filhos(A, _, P)).
avô(A, N):- filhos(M, P, N), (filhos(_, A, M); filhos(_, A, P)).

