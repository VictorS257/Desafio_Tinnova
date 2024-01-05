Feature: Transferência de valores entre correntistas do banco XYZ

    Scenario: Valido exibição das informações na tela
        Given que possuo uma conta corrente ativa no banco XYZ
        And estou autenticado na minha conta
        When acesso a opção "Transferência de valores entre correntistas"
        Then o título da página deve conter o nome da instituição "Banco XYZ"
        And o subtítulo deve ser "Transferência de valores entre correntistas"
        And deve ser apresentado o saldo seguindo o padrão "Saldo R$ <valor>"
        And devem existir os campos "Cliente destino", "Valor" e "Data de efetivação"
        And devem existir os botões "Transferir" e "Cancelar"

    Scenario: Valido campos de preenchimento obrigatórios
        Given que possuo uma conta corrente ativa no banco XYZ
        And estou autenticado na minha conta
        And acesso a opção "Transferência de valores entre correntistas"
        When clico no botão "Transferir" sem preencher nenhum campo
        Then a operação não deve ser efetivada
        And deve ser exibida informação de que os campos são de preenchimento obrigatório

    Scenario: Valido transferência realizada com sucesso
        Given que possuo uma conta corrente ativa no banco XYZ
        And estou autenticado na minha conta
        And acesso a opção "Transferência de valores entre correntistas"
        And informo corretamente os campos "Cliente destino", "Valor" e "Data de efetivação"
        When clico no botão "Transferir"
        Then o valor informado no campo "Valor" deve ser subtraído da conta de origem e adicionado à conta informada em "Cliente destino"
        And deve ser exibido um comprovante da transferência
 
    Scenario: Valido funcionamento do botão "Cancelar"
        Given que possuo uma conta corrente ativa no banco XYZ
        And estou autenticado na minha conta
        And acesso a opção "Transferência de valores entre correntistas"
        And informo corretamente os campos "Cliente destino", "Valor" e "Data de efetivação"
        When clico no botão "Cancelar"
        Then todos os campos devem ser limpos
        And a operação não deve ser efetivada

    Scenario: Valido funcionamento do campo "Cliente destino"
        Given que possuo uma conta corrente ativa no banco XYZ
        And estou autenticado na minha conta
        And acesso a opção "Transferência de valores entre correntistas"
        When informo algum dado inválido no campo "Cliente destino"
        Then a operação não deve ser efetivada
        And deve ser exibida informação de que o campo precisa possuir um valor válido e diferente do proprietário da conta

    Scenario: Valido funcionamento do campo "Data de efetivação"
        Given que possuo uma conta corrente ativa no banco XYZ
        And estou autenticado na minha conta
        And acesso a opção "Transferência de valores entre correntistas"
        When informo uma data inválida ou passada no campo "Data de efetivação"
        Then a operação não deve ser efetivada
        And deve ser apresentada mensagem informando que a data precisa ser válida, além de ser igual ou posterior à atual
        
    Scenario: Valido funcionamento do campo "Valor" para digitação inválida
        Given que possuo uma conta corrente ativa no banco XYZ
        And estou autenticado na minha conta
        And acesso a opção "Transferência de valores entre correntistas"
        When informo um valor inválido
        Then a operação não deve ser efetivada
        And deve ser apresentada a mensagem de que o valor precisa ser válido

    Scenario: Valido funcionamento do campo "Valor" para valores maiores que o saldo
        Given que possuo uma conta corrente ativa no banco XYZ
        And estou autenticado na minha conta
        And acesso a opção "Transferência de valores entre correntistas"
        When informo um valor maior que o saldo disponível
        Then a operação não deve ser efetivada
        And deve ser apresentada a mensagem de que o saldo é insuficiente