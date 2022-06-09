# Atividade 01 - Prolog

Considerando o problema: <b> Árvore Genealógica - Joao e Joana criaram dois filhos, Joaquim e Serafina. Serafina teve duas filhas, Maria e Ana. Marcelino e filho de Joaquim. Aristides é filho de 
Marcelino e Maria.</b>

### Diagrama - Árvore Genealógica

<p align="center">
    <img src="https://user-images.githubusercontent.com/62517334/171719827-0802cca7-2724-4bb4-b709-1c721b18be7a.png">
</p>

# Base de dados:

~~~Prolog
    women(joana).	women(serafina).
    women(maria).	women(ana).

    men(aristides).	men(joao).		
    men(marcelino).	men(joaquim).

    parent(joao, joaquim).		parent(joao, serafina).
    parent(joana, joaquim).		parent(joana, serafina).
    parent(serafina, maria).	parent(serafina, ana).
    parent(joaquim, marcelino).	parent(marcelino, aristides).
    parent(maria, aristides).
~~~

## Relação entre os integrantes
Dado a base de dados acima é possível inferir relações entre os integrantes. 

### Pai ou mãe
~~~Polog
    mother(X,Y) :- parent(X,Y),women(X).
    father(X,Y) :- parent(X,Y),men(X).
~~~

>X é mãe de Y se X é progenitor de Y e X é mulher. <br/> X é pai de Y se X é progenitor de Y e X é homem. 

### Irmãos
~~~Polog
    sibling(X,Y) :- parent(Z,X), parent(Z,Y), X\==Y.
    sister(X,Y)  :- sibling(X,Y),women(Y).
    brother(X,Y) :- sibling(X,Y),men(Y).
~~~

>X é irmão de Y se existe um Z que é pai de X e também é pai de Y. <br/> Se Y é homem é irmão, se é mulher é irmã.

### Avós
~~~Polog
    grandparent(X,Y) :- parent(Z,Y),      parent(X,Z).
    grandmother(X,Y) :- grandparent(X,Y), women(X).
    grandfather(X,Y) :- grandparent(X,Y), men(X).
~~~

>X é avô de Y se existe um Z que é pai de Y e ao mesmo tempo é filho de X. <br/> Se X é homem é avô, se é mulher é avó.

### Tios
~~~Polog
    uncles(X,Y) :- parent(Z,Y), sibling(Z,X).
    uncle(X,Y)  :- uncles(X,Y), men(X).
    aunt(X,Y)   :- uncles(X,Y), women(X).
~~~

>X é tio de Y se existe um Z que é irmão dos pais de Y.

### Primos
~~~Polog
    cousins(X,Y)      :- uncles(Z,X),  parent(Z,Y).
    maleCousin(X,Y)   :- cousins(X,Y), men(Y).
    cousinWoman(X,Y)  :- cousins(X,Y), women(Y).
~~~

>X é primo de Y se existe um Z que é tio de X e pai de Y. 

# Perguntas

1. O Joaquim e filho do José?
    ~~~Prolog
    parent(joaquim, jose).
    ~~~
    > Resposta: <b>false</b>

2.  Quem são os filhos da Joana?
    ~~~Prolog
    parent(joana, X).
    ~~~
    > Resposta: <br> <b>X</b> = joaquim <br>  <b>X</b> = serafina
    
3. Quem são os primos do Marcelino?
    ~~~Prolog
    cousins(X, marcelino).
    ~~~
    > Resposta: <br> <b>X</b> = maria <br>  <b>X</b> = ana

4. Quantos sobrinhos/sobrinhas com algum Tio existem?
    ~~~Prolog
    findall(X, uncle(_,X),Result), sort(Result,ResultFinal), length(ResultFinal,L).
    ~~~
    > Resposta: <br/> <b>ResultFinal</b> = [ana, maria] <br/> <b>L</b> = 2, <br/> <b>Result</b> = [maria, maria, ana, ana]

5. Quem sao os ascendentes do Aristides?
    ~~~Prolog
    findall(X, ascendants(X,aristides), Y), sort(Y,Result).
    ~~~
    > Resposta: <b>Result</b> = [joana, joao, joaquim, marcelino, maria, serafina],

6. A Maria tem irmãos? E irmãs?
    ~~~Prolog
    brother(X, maria).
    sister(X, maria).
    ~~~
    > Resposta: <br/> <b>false</b> <br/> <b>X</b> = ana


