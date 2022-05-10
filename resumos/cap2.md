# Resumo capítulo 2

Um agente é tudo que pode ser considerado capaz de perceber seu **ambiente** por meio de **sensores** e agir sobre esse ambiente por intermédio de **atuadores**. 

* Se considerarmos por exemplo o corpo humano como um agente, podemos considerar seus olhos, ouvidos e outros orgãos como sensores que percebem o ambiente ao seu redor e as mãos, baços, pernas e outros orgãos como atuadores.
* Se considerar um agente robótico, câmeras, detectores de faixa de infravermelho, receptores de ondas sonoras e outros aparelhos como sensores e podemos considerar um conjunto de motores como seus atuadores.
* Se considerar um agente de software, as entradas de teclas digitadas, pacote de redes e imagens podem ser considerado como sensores e o ato de exibir uma mensagem na tela ou enviar uma mensagem pode ser considerado seus atuadores.

O termo **percecpção** faz referência às entradas perceptivas de um agente em um determinado instante. Já o termo **sequência de percepções** faz referência ao histórico de todas as entradas perceptivas de um agente. 

Em termos matemáticos, afirmamos que o comportamento do agente é descrito pela **função do agente** que mapeia qualquer sequência de percepções específica para uma ação. O termo: **função agente** se difere de **programa do agente** de modo que: a função de agente é uma descrição matemática abstrata; o programa do agente é uma implementação concreta, executada em um sistema físico.

<br/>
<br/>

## Agente racional

De maneira resumida, um **agente racional** é aquele que faz a coisa certa. 

Quando um agente é colocado em um determinado ambiente, espera-se uma sequência de ações de acordo com as percepções que ele recebe. Essa sequência de ações faz com que o ambiente passe por uma sequência de estados. Se a sequência de estados for desejável, o agente teve bom desempenho. Essa noção de “desejável” é capturada por uma medida de desempenho que avalia qualquer sequência dada dos estados do ambiente.

Ou seja, um agente racional é aquele capaz de selecionar a ação que maximize seu critérito de desempenho para cada sequência perceptiva possível por meio da interpretação da sequência perceptível ou qualquer outro conhecimento que o agente tenha disponível.

Se considerarmos o agente aspirador de pó simples que limpa um quadrado se ele estiver sujo e passa para o outro quadrado se o primeiro não estiver sujo. Para que esse agente seja racional devemos definr primeiro o que é a medida de desempenho, o que se conhece sobre o ambiente e quais são os sensores e atuadores que o agente tem. Supondo que:

* A medida de desempenho ofereça o prêmio de um ponto para cada quadrado limpo em cada período de tempo, ao longo de um “tempo de vida” de 1.000 passos de tempo.
* A “geografia” do ambiente seja conhecida a priori (Lado A e Lado B), mas a distribuição da sujeira e a posição inicial do agente não sejam previamente conhecidas. Quadrados limpos permanecem limpos, e a aspiração limpa o quadrado atual. As ações Esquerda e Direita movem o agente para a esquerda e para a direita, exceto quando isso leva o agente para fora do ambiente; nesse caso, o agente permanece onde está.
* As únicas ações disponíveis são Esquerda, Direita e Aspirar.
* O agente percebe corretamente sua posição e se essa posição contém sujeira.

Sob essas condições afirmamos que o agente é racional e espera-se que seu
desempenho seja pelo menos tão alto quanto o de qualquer outro agente. Mas se por acaso o agente oscila desnecessariamente de um lado para outro quando ambos os lados estão limpos e sua medida de desempenho inclua penalidade de um ponto para cada movimento à esquerda ou à direita, o agente ficará em má situação e será considerado como irracional.
<p align="center">
    <img src="https://user-images.githubusercontent.com/62517334/167521458-bcd158de-3470-430b-a930-64fcf8b5b84b.png">
</p>

<br/>
<br/>

## Racionalidade

Racionalidade e perfeição são conceitos diferentes, analisar a rua e perceber que não há movimento, então atravessar e ser atingido por um meteoro que caia do espaço é uma atitude racional, mas não perfeita. A racionalidade maximiza o **desempenho esperado**, enquanto a perfeição maximiza o **desempenho real**.