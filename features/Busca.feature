#language: pt

Funcionalidade: Busca no Banco de Questões
    Sendo um visitante do site Open Trivia Data Base
    Quero fazer uma pesquisa
    Para encontrar a(s) questão(es) desejada(s)

    @fail_questao
    Cenario: Busca por questão inexistente
        Dado que navego para a página de busca do banco de questões
        E digito no campo de busca:
            | info | Science: Computers |
        Quando clico no botão de buscar
        Então visualizo uma mensagem: "No questions found."

    @happy_category
    Cenario: Busca por categoria
        Dado que navego para a página de busca do banco de questões
        Quando escolho filtrar pela categoria "Science: Computers"
        Então verifico que a listagem retorna vinte e cinco itens
        E que o controle de paginação é exibido corretamente

    @happy_user
    Cenario: Busca por Usuário
        Dado que navego para a página de busca do banco de questões
        Quando escolho filtrar por User 'Karen'
        Então verifico que a lista retorna questões que o Created By seja Karen

