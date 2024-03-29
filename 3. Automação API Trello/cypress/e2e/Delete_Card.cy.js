describe ('Deletar um Card', () => {
    // Aqui é passado o ID do Card a ser deletado
    const CardID = '659860069c33451c3c040fec'
    // Envio a requisição para a API
    it.only('Delete Card', () => {
        cy.request({
            method: 'DELETE',
            url: 'https://api.trello.com/1/cards/'+CardID+'?key=0e09c876057d988e863314117c1f5a5b&token=ATTA1b23cc54c68d278d2e5f8f8391a58befac200ab1cabdd2f4cb17d0374c9aba3c7E87AD30',
            failOnStatusCode: false,
        }).as('details')
        // Valido que retornou status 200
        cy.get('@details').its('status').should('eq', 200)
        })
    })


