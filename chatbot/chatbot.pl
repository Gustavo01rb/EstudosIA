:-include(perguntas). 

chat_bot :-
    repeat,
    nl,nl,format('Olá seja bem vindo ao atendimento virtual da Conexão de Internet Ágil -CIA- '),nl,
    format('Digite sua escolha conforme nosso menu de opções:'),nl,nl,
    format('1 - Consultar um plano em vigor.'),nl,
    format('2 - Fazer uma reclamação.'),nl,
    format('3 - Agendar uma visita técnica.'),nl,
    format('4 - Consultar informações de planos.'),nl,
    nl,format('Como posso te ajudar ?'),nl,
	
    nl, format('-> '),
    read(Input),
    pergunta(Input),
    off(Input).


    off(Input):-
		  Input = ('exit').

    