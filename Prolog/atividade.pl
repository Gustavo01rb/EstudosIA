% Sexo dos integrantes
women(joana).	women(serafina).
women(maria).	women(ana).

men(aristides).	men(joao).		
men(marcelino).	men(joaquim).

% Filiação dos integrantes
parent(joao, joaquim).		parent(joao, serafina).
parent(joana, joaquim).		parent(joana, serafina).
parent(serafina, maria).	parent(serafina, ana).
parent(joaquim, marcelino).	parent(marcelino, aristides).
parent(maria, aristides).

% Pai e mãe
mother(X,Y) :- parent(X,Y),women(X).
father(X,Y) :- parent(X,Y),men(X).

% Irmãos
sibling(X,Y) :- parent(Z,X), parent(Z,Y), X\==Y.
sister(X,Y)  :- sibling(X,Y),women(Y).
brother(X,Y) :- sibling(X,Y),men(Y).

% Avós
grandparent(X,Y) :- parent(Z,Y),      parent(X,Z).
grandmother(X,Y) :- grandparent(X,Y), women(X).
grandfather(X,Y) :- grandparent(X,Y), men(X).

% Tios
uncles(X,Y) :- parent(Z,Y), sibling(Z,X).
uncle(X,Y)  :- uncles(X,Y), men(X).
aunt(X,Y)   :- uncles(X,Y), women(X).

% Primos
cousins(X,Y)      :- uncles(Z,X),  parent(Z,Y).
maleCousin(X,Y)   :- cousins(X,Y), men(Y).
cousinWoman(X,Y)  :- cousins(X,Y), women(Y).

%Descendentes e ascendentes
descendant(X,Y) :- parent(Y,X).
descendant(X,Y) :- parent(Y,Z),descendant(X,Z).
ascendants(X,Y) :- parent(X,Y).
ascendants(X,Y) :- parent(Z,Y),descendant(Z,X).