# Resumo capítulo 3
O capitulo 3 nos introduz o assunto de algoritmo busca, que é um algoritmo que recebe um problema de entrada e devolve uma solução sob uma forma de sequência de ações. Algumas considerações:
 * Os agentes de solução de problemas usam representações atômicas.
 * São considerados ambientes mais simples: episódico, agente único totalmente observável, determinístico, estático, discreto e conhecido.

Além disso é importante resslatar que um problema pode ser dividido em 4 parte:

1. **Formulação de metas**:Formulação de metas: organizam o comportamento e limitam os ações a serem consideradas.
2. **Formulação do problema**: descrição dos estados e ações necessárias para atingir o objetivo.
3. **Busca**: simulação de sequência de ações visando encontrar a sequência de ações que permitam atingir o objetivo
4. **Execução**: executa as ações na solução encontrada

E podem existir dois tipos de problemas conhecidos como:
1. **Malha aberta**: o agente após descobrir a solução ignora suas percepções enquanto executa as ações - ambiente determinístico.
2. **Malha fechada**: a agente monitora suas percepções durante a execução das ações - ambiente não determinístico.

<br/>

## 5 Passos para uma boa definição do problema:
1. **Estado inicial**: Descrição do estado no qual o agente começa, lembrando que o estado inicial não precisa ser necessariamente único.
2. **Ações**: São uma descrição das atividades que um agente pode fazer em um determinado estado. Por exemplo, no estado: EM(Arad) as ações aplicáveis são: {IR(Sibiu), IR(Timissoara), IR(Zerind)}
3. **Modelo de transição**: É uma descrição do que cada ação implica, ou seja rertorna o estado sucessor após realizar uma ação. Considerando que um agente esteja no estado *s* : EM(Arad) e decida tomar a ação *a*: IR(Zerind), a função chamada será RESULTADO(*s*, *a*) e o estado retornado será EM(Zerind).
4. **Teste de objetivo**: Função que determina se um estado é o estado objetivo, por exemplo se o agente estiver no estado EM(Arad) e seu objetivo for EM(Bucarest) a função objetivo só retornará verdadeiro se o estado objetivo for alcançado.
5. **Função Custo**: Define o custo de cada caminho escolhido, ou seja cada ação pode ou não implicar em um custo.

Para uma boa formulação de problema devemos levar em consideração o conceito de **abstração**:
>*"O processo de remover detalhes de uma representação é chamado de abstração"*

A escolha de uma boa abstração envolve, portanto, a remoção da maior quantidade possível de detalhes, enquanto se preserva a validade e se assegura que as ações abstratas são fáceis de executar.

### Exemplo de formulação de um problema
O **quebra-cabeça de oito peças**, consiste de um tabuleiro 3 × 3 com oito peças numeradas e um quadrado vazio. Uma peça adjacente ao quadrado vazio pode deslizar para esse quadrado. O objetivo é alcançar um estado objetivo especificado, como o do lado direito da figura. 
<p align="center">
    <img src="https://user-images.githubusercontent.com/62517334/167852350-9afc241f-d422-4dd5-bf36-e1601c510c28.png">
</p>

* **Estados**: Uma descrição de estado especifica a posição de cada uma das oito peças e do quadrado vazio em um dos nove quadrados.
* **Estado** inicial: Qualquer estado pode ser designado como o estado inicial. Observe que qualquer objetivo específico pode ser alcançado a partir de exatamente metade dos estados iniciais possíveis.
* **Ações**: A formulação mais simples define as ações como movimentos do quadrado vazio Esquerda, Direita, Para Cima ou Para Baixo. Pode haver subconjuntos diferentes desses, dependendo de onde estiver o quadrado vazio.
* **Modelo de transição**: Dado um estado e ação, ele devolve o estado resultante; por exemplo, se aplicarmos Esquerda para o estado inicial na Figura 3.4, o estado resultante terá comutado o 5 e o branco.
* **Teste de objetivo**: Verifica se o estado corresponde à configuração de estado objetivo mostrada na figura a direita.
* **Custo de caminho**: Cada passo custa 1 e,assim, o custo do caminho é o número de passos do caminho.

<br/>
<br/>

# Algoritmos de Busca
Depois de formular alguns problemas, precisamos resolvê-los. Uma **solução** é uma sequência de ações, de modo que os algoritmos de busca consideram várias sequências de ações possíveis. As sequências de ações possíveis que começam a partir do estado inicial formam uma árvore de busca
com o estado inicial na raiz; os ramos são as ações, e os nós correspondem aos estados no espaço deestados do problema.

Em um algoritmo de busca é fundamental considerar a escolha de diversas ações. Isso é feito pela **expansão** do estado atual, ou seja, aplicando cada ação válida no estado atual, gerando assim um novo conjunto de estados.

## Estrutura de dados de um nó:
* **n.ESTADO**: o estado no espaço de estado a que o nó corresponde;
* **n.PAI**: o nó na árvore de busca que gerou esse nó;
* **n.AÇÃO**: a ação que foi aplicada ao pai para gerar o nó;
* **n.CUSTO-DO-CAMINHO**: o custo, tradicionalmente denotado por g(n), do caminho do estado inicial até o nó, indicado pelos ponteiros para os pais.

## Estrutura de dados de uma fronteira:
<p align="center">
    <img src="https://user-images.githubusercontent.com/62517334/167855870-a7bf13e0-bfe2-4101-9d52-4ddac7a1d19a.png">
</p>

* **VAZIO**:  retorna verdadeiro somente se não houver nós na fronteira
* **POP**(frontier): remove o nó superior da fronteira e o retorna
* **TOP**(frontier): retorna (mas não remove) o nó superior da fronteira
* **INSERIR**(node, frontier ): insere um nó em seu devido lugar na fila

## Medida de desempenho e complexidade em algoritmos de busca
* Desempenho
    * **Completeza**: garantia de encontrar uma solução, se existir
    * **Otimalidade**: estratégia busca encontra solução ótima
    * **Complexidade** temporal: tempo para achar uma solução
    * **Complexidade** espacial: quantidade de memória para a busca
* Complexidade
    * **Fator de ramificação** (b): número máximo de sucessores de um nó
    * **Profundidade** (d): profundidade do nó meta mais raso
    * **Comprimento** trajetória (m): maior entre todas as trajetórias

<br/>
<br/>

## Busca sem informação ou Busca não informada
A expressão significa que elas não têm nenhuma informação adicional sobre estados, além daquelas fornecidas na definição do problema. Tudo o que elas podem fazer é gerar sucessores e distinguir um estado objetivo de um estado não objetivo. Todas as estratégias de busca se distinguem pela ordem em que os nós são expandidos.

### Busca em largura
