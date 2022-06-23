:- include(base_de_conhecimento).

%Consulta de informações do plano
consultar_plano:- 
    format('Informe seu nome:'),nl,
    read(Nome),
    cliente(Nome) -> informacoes_plano(Nome);
    format('Descupe mas esse nome não está cadastrado em nossos registros.').
informacoes_plano(Nome):-
    nl,format('Oi '), 
    format(Nome), 
    format(', você possui um plano de '), 
    planos_adquiridos(Nome, Plano),!, 
    format(Plano),
    format('. E sua mensalidade é: '),
    mensalidade(Plano, Mensalidade), !,
    format(Mensalidade).

%Reclamações
registrar_reclamacao:-
    format('Informe seu nome:'),nl,
    read(Nome),
    format('Informa sua reclamação:'),nl,
    read(Reclamacao),
    open('saidas/reclamações.txt',append,Stream),
    write(Stream,Nome), write(Stream,': '), write(Stream,Reclamacao), 
    nl(Stream),
    nl(Stream),
    nl,format('Sua reclamação foi registrada com sucesso'),nl,
    close(Stream).

%Visita Técnica
visita_tecnica:-
    format('Informe sua cidade:'),nl,
    read(Cidade),
    cidade(Cidade) -> visita_tecnica_verifica_nome(Cidade);
    format('Descupe mas não fornecemos serviços para essa localidade.').

visita_tecnica_verifica_nome(Cidade):-
    format('informe seu nome:'),nl, 
    read(Nome),
    cliente(Nome) -> agenda_visita_tecnica(Nome, Cidade);
    format('Descupe mas esse nome não está cadastrado em nossos registros.').

agenda_visita_tecnica(Nome, Cidade):-
    format('informe a data que deseja agendar uma visita:'),nl, 
    read(Data),
    open('saidas/visitas.txt',append,Stream),
    write(Stream,'Cliente: ') ,  write(Stream,Nome)  ,nl(Stream), 
    write(Stream,'Cidade: ')  ,  write(Stream,Cidade),nl(Stream),
    write(Stream,'Data: ')    ,  write(Stream,Data),  nl(Stream),
    nl(Stream),
    nl,format('Visita agendada para dia: '),format(Data),nl,
    close(Stream).

%Informações dos planos
informacao_planos:-
    format('Nossa empresa conta com os seguintes planos:'),
    planos_descricao('400 Mb', Primeiro),
    planos_descricao('600 Mb', Segundo),
    planos_descricao('1 Gb', Terceiro),

    nl,format('\t 400 Mb ->'), format(Primeiro),
    nl,format('\t 600 Mb ->'), format(Segundo),
    nl,format('\t 1   Gb ->'), format(Terceiro).


teste:-
    open('base_de_conhecimento.pl',append,Stream),
    format('Informe o nome: '),nl,
    read(Nome),
    nl(Stream),
    write(Stream, "cliente('"),
    write(Stream, Nome),
    write(Stream, ")"),
    write(Stream, '.'),
    close(Stream).




pergunta(Resposta):-
    (Resposta == 1) -> consultar_plano;
    (Resposta == 2) -> registrar_reclamacao;
    (Resposta == 3) -> visita_tecnica;
    (Resposta == 4) -> informacao_planos;
    (Resposta == 5) -> teste.


