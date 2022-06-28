:-include(perguntas). 

cls:- write('\33\[2J').

chat_bot :-
    nl,nl,format('Olá seja bem vindo ao atendimento virtual da Conexão de Internet Ágil -CIA- '),nl,
    repeat,
    nl,nl,format('Digite sua escolha conforme nosso menu de opções:'),nl,nl,
    format('\t1 - Consultar um plano em vigor.'),nl,
    format('\t2 - Fazer uma reclamação.'),nl,
    format('\t3 - Agendar uma visita técnica.'),nl,
    format('\t4 - Consultar informações de planos.'),nl,
    format('\t5 - Contratar um novo plano.'),nl,
    format('\t6 - Tire sua dúvida sobre conexão.'),nl,
    nl,format('Como posso te ajudar ?'),nl,
	
    nl, format('-> '),
    read(Input),
    pergunta(Input),
    off(Input).


    off(Input):-
		  Input = ('exit').

    