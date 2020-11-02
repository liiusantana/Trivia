
    Dado('que navego para a página de busca do banco de questões') do
        visit "https://opentdb.com/browse.php"
    end
    
    Dado('digito no campo de busca:') do |table|
        user = table.rows_hash

       find(:id, "query").set user[:info]
    end
      
    Quando('clico no botão de buscar') do
        botao = find(".btn").click
    end

    Então('visualizo uma mensagem: {string}') do |expect_message|
        alert = find(".alert")
        expect(alert.text).to eql expect_message
    end
      
    Quando('escolho filtrar pela categoria {string}') do |categoria|
      find("option[value*=Category]").click 
      find(:id, "query").set categoria
      botao = find(".btn").click
    end
    
    Então('verifico que a listagem retorna vinte e cinco itens') do
     lista_questions = find_all('.table tbody tr')
     total = lista_questions.length
     expect(total).to eql 25
    end
    
    Então('que o controle de paginação é exibido corretamente') do
      find("center ul")
    end

    Quando('escolho filtrar por User {string}') do |nome|
      find("option[value*=User]").click 
      find(:id, "query").set nome
      botao = find(".btn").click
    end
    
    Então('verifico que a lista retorna questões que o Created By seja Karen') do
      usu = find(".table tbody td a").text
      expect(usu).to eql 'Karen'
    end
