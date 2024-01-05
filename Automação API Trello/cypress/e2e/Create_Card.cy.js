describe ('Cadastrar um Card', () => {
    // Aqui é passado o ID da lista onde o Card será criado
    const ListID = '65985753ef1ab760930ad6db'
    // Aqui informo o nome do Card
    const CardName = 'Card1'
    //Envio a requisição para a API
    it.only('Create Card', () => {
        cy.request({
            method: 'POST',
            url: 'https://api.trello.com/1/cards?idList='+ListID+'&key=0e09c876057d988e863314117c1f5a5b&token=ATTA1b23cc54c68d278d2e5f8f8391a58befac200ab1cabdd2f4cb17d0374c9aba3c7E87AD30&name='+CardName+'',
            failOnStatusCode: false,
        }).as('details')
        // Inicio as validações
        cy.get('@details').its('status').should('eq', 200) //Valido que o status da API retornou 200
        cy.get('@details').then((response) => {
            expect(JSON.stringify(response.body['id'])).not.to.be.empty //Valido que o ID do Card criado não está em branco
            expect(JSON.stringify(response.body['name'])).to.contain(CardName) //Valido que o nome do Card criado é o mesmo do passado na variável
        })
    })
  })
  