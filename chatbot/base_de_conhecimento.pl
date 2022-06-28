cliente('Gustavo').
cliente('Luiz').
cliente('Sávio').

planos('1 Gb').
planos('400 Mb').
planos('600 Mb').

planos_adquiridos('Gustavo', '1 Gb').
planos_adquiridos('Luiz',    '400 Mb').
planos_adquiridos('Sávio',   '600 Mb').

planos_descricao('1 Gb', ' Recomendado para pequenas empresas e para o trabalho em casa.').
planos_descricao('400 Mb', ' Recomendado para famílias, é nosso plano mais econômico.').
planos_descricao('600 Mb', ' Melhor custo benefício e ultra velocidade.').


mensalidade('1 Gb',  'R$ 200,00').
mensalidade('400 Mb','R$ 100,00').
mensalidade('600 Mb','R$ 150,00').

cidade('Pitangui').
cidade('Divinópolis').
cidade('Arcos').
cidade('Itaúna').

duvidas('Sem conexão', 'Primeiramente, verifique se seu modem se encontra adequadamente ligado a energia e com algumas luzes acesas.', 0).
duvidas('Sem conexão', 'Tente desligar seu modem da tomada por pelo menos dois minutos e o ligue novamente.', 1).
duvidas('Sem conexão', 'Tente fazer uma apelo para Elon Musk te conceder acesso ao Star Link.', 2).
duvidas('Sem conexão', 'Infelizmente seu pedido precisará da orientação de um profissional, ligue no número: 0800 322 145', 3).

duvidas('Internet lenta', 'Para que sua conexão fique mais rápida, adicione o dns do google em seu Linux ubuntu. \n Primeiramente abra o menu configurações.', 0).
duvidas('Internet lenta', 'Selecione o menu Wi-Fi', 1).
duvidas('Internet lenta', 'Selecione o ícone de engrenagem na frente do nome da rede conectada', 2).
duvidas('Internet lenta', 'Nos menus superiores selecione a opção IP4', 3).
duvidas('Internet lenta', 'Desmarque o DNS automático', 4).
duvidas('Internet lenta', 'Insira -1.1.1.1,1.0.0.1- no campo de texto de DNS', 5).

duvidas('Trocar senha', 'Para trocar a senha do Wi-Fi entre em contato com a Central de Atendimento, ligue no número: 0800 322 145. Por favor, não tente realizar esse procedimento por contra própria.', 0).
duvidas('Ping','ping eh o tempo que um arquivo digital leva para sair de um ponto a outro, ele eh diferente do jitter, que considera uma media de varios pings', 0).
duvidas('Speed Test', 'Speed test é o termo em inglês para “teste de velocidade”. As palavras estrangeiras se tornaram comuns com a popularização no uso dos velocímetros para medir a velocidade de internet.', 0).

cliente('Alisson').
planos_adquiridos('Alisson','1 Gb').