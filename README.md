# Desafio_Tinnova

* Primeiro desafio:
  - Objetivo: Criar os cenários de testes para a função de "Transferência entre correntistas" do banco "XYZ"
    - Solução proposta: Foi utilizado o método de escrita Gherkin para criar o BDD com os cenários necessários para a
                        funcionalidade;
                        Local do arquivo: "./1. BDD Banco XYZ"

* Segundo desafio:
  - Objetivo: Escrever 5 Query's SQL para consultas nas tabelas baseado no modelo Entidade / Relacionamento
    - Solução proposta: Foram criadas as 5 Query's em um arquivo contendo comentários com a indicação de cada uma delas;    
                        Local do arquivo com as Query's: "./2. Query's SQL"

* Terceiro desafio:
    - Objetivo: Criar uma automação em Cypress para as API's Trello com validação para as 4 requisições abaixo:            
      1-Criar um Board (https://api.trello.com/1/boards/?name={BoardName}&key={API Key}&token={token})                
      2-Deletar um Board (https://api.trello.com/1/boards/{BoardID}?key={API Key}&token={token})                  
      3-Criar um Card (https://api.trello.com/1/cards?{IDList}&key={API Key}&token={token}&name={CardName})              
      4-Deletar um Card (https://api.trello.com/1/cards/{CardID}?key={API Key}&token={token})            
        - Solução proposta: Foi criada a pasta "Automação API Trello" e nela foi configurado o Cypress;                
          Local dos arquivos "./3. Automação API Trello\cypress\e2e";

            * Executando os testes automatizados:
                - Através da interface do Cypress (Execução dos testes individualmente):              
                  1. Abra o projeto através de uma IDE ou Editor de texto (IntelliJ ou VSCode);                  
                  2. Execute o seguinte comando no terminal: 'npx cypress open --project './3. Automação API Trello';              
                  3. Será exibida a interface do Cypress, basta selecionar a opção "E2E Testing" e selecionar o navegador;          
                  (Como se tratam de testes de API, o navegador selecionado não interfere, recomendado utilizar 'Electron')
                  4. Agora basta selecionar o teste desejado e a execução será iniciada.      

                - Direto no Terminal (Executa todos os testes):                          
                  1. Abra o projeto através de uma IDE ou Editor de texto (IntelliJ ou VSCode);          
                  2. Execute o seguinte comando no terminal: 'npx cypress run --project './3. Automação API Trello'';        
                  3. A execução será iniciada e o relatório exibido no Terminal.

                  Obs: As requisições 'Deletar Board' e 'Deletar Card' necessitam que seja informado o ID do item a ser
                  deletado.
                  Na automação foi passado o ID de itens válidos, porém uma vez que forem executados estes testes, estes
                  itens serão deletados e será necessário informar outros ID's para as próximas execuções.

