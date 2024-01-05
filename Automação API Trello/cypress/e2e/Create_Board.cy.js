describe ('Cadastrar um board', () => { 
    //Aqui é definido o nome do Board
    const BoardNome = 'Board1'
    //Faço a criação do Board
    it.only('Create Board', () => {
        cy.request({
            method: 'POST',
            url: 'https://api.trello.com/1/boards/?name='+BoardNome+'&key=0e09c876057d988e863314117c1f5a5b&token=ATTA1b23cc54c68d278d2e5f8f8391a58befac200ab1cabdd2f4cb17d0374c9aba3c7E87AD30',
            failOnStatusCode: false,
        }).as('details')
        //Inicio as validações
        cy.get('@details').its('status').should('eq', 200) //Valido que o status da API retornou 200
        cy.get('@details').then((response) => {
            expect(JSON.stringify(response.body['id'])).not.to.be.empty //Valido que o ID do board criado não está vazio
            expect(JSON.stringify(response.body['name'])).to.contain(BoardNome) //Valido que o nome do Board criado é o mesmo definido na variável
        })
    })
  })
  