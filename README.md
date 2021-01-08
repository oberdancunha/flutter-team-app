# Consulta de time de futebol usando o flutter, flutter_modular, flutter_bloc e arquitetura limpa

Aplicativo para a consulta de time de futebol. Ao digitar um time, o aplicativo realiza a busca e, em caso de sucesso, exibe as informações para o usuário. Caso contrário, é exibido o respectivo problema encontrado.

Este é um aplicativo bem simples, pois a ênfase não é o produto e sim a sua construção. A construção usou o framework flutter, pacotes como o flutter_modular, para injeção de dependência e rotas e o flutter_bloc para eventos e gerência de estados, além de outros pacotes. Por fim, uso de conceitos de arquitetura limpa e testes (exceto os de interfaces/widgets), apesar desses dois últimos serem redundantes.

Esse tutorial, no momento, não entrará em detalhes sobre os pacotes utilizados, nem sobre os conceitos de arquitetura limpa. A documentação dos pacotes encontra-se em <https://pub.dev/>. Sobre arquitetura limpa e código limpo, o conselho é a leitura dos livros homônimos do Robert Martin (Uncle Bob).

## Sucesso na consulta

Quando a consulta é realizada com sucesso, o aplicativo exibe os seguintes resultados:

- Escudo do time
- **Name:** nome do time encontrado. Nesse momento, como a consulta exige o nome exato do time de interesse (flexível apenas para maiúsculas e minúsculas), esse dado é simplesmente uma réplica da consulta do usuário. Em um futuro, caso a consulta trabalhe com termos (substrings), tratados na api ou no aplicativo, a exibição do nome exato do time encontrado já está pronto.
- **Country:** país de origem do time
- **Founded:** ano de fundação do time

A tela do usuário é atualizada a cada nova pesquisa, primeiramente exibindo o ícone de loading e em seguida o resultado encontrado.

<p
  float="left"
>
  <img
    src="images/initial_screen.png"
    alt="initialscreen"
    title="Initial screen"
    width="150"
    height="300"
    border= "1px solid black"
  />
  <img
    src="images/result_loading.png"
    alt="resultloading"
    title="Result loading"
    width="150"
    height="300"
    border= "1px solid black"
  />
  <img
    src="images/result_found.png"
    alt="resultfound"
    title="Result found"
    width="150"
    height="300"
    border= "1px solid black"
  />
   <img
    src="images/new_result_loading.png"
    alt="newresultloading"
    title="New result loading"
    width="150"
    height="300"
    border= "1px solid black"
  />
  <img
    src="images/new_result_found.png"
    alt="newresultfound"
    title="New result found"
    width="150"
    height="300"
    border= "1px solid black"
  />
</p>

## Problemas na consulta

A consulta por um time de interesse pode apresentar os seguintes problemas:

**Server error:** algum erro não identificado na api utilizada
**Device is not connected:** desconexão ou alta latência de rede, impedindo que o dispositivo acesse a api
**Team not found:** o time de interesse não foi encontrado

Podemos classificar os dois primeiros items como problemas, propriamente dito. Problemas na api, estando inacessível por algum motivo (credenciais ou problemas de servidor) no caso do primeiro item. No segundo item temos problemas na internet (problemas técnicos na internet móvel, doméstica ou de trabalho), até mesmo uma distração do usuário que desabilitou qualquer tipo de acesso a internet do dispositivo. No último item não temos característicamente um problema, apenas a tentativa de encontrar dados de um time que não existe.

<p
  float="left"
>
  <img
    src="images/server_error.png"
    alt="servererror"
    title="Server error"
    width="150"
    height="300"
    border= "1px solid black"
  />
  <img
    src="images/device_not_connected.png"
    alt="devicenotconnected"
    title="Device not connected"
    width="150"
    height="300"
    border= "1px solid black"
  />
  <img
    src="images/team_not_found.png"
    alt="teamnotfound"
    title="Team not found"
    width="150"
    height="300"
    border= "1px solid black"
  />
</p>

## API

<https://rapidapi.com/api-sports/api/api-football-beta?endpoint=apiendpoint_17386806-d0bb-4fc4-b0d8-7a4a035f437e>

## Credenciais de acesso

A api exige um cadastro para uso. Esse cadastro emitirá uma credencial de acesso. No momento da escrita desse tutorial, o cadastro e o acesso à api estão gratuitos, de acordo com as respectivas limitações do plano.

No entanto, nada impede que futuramente ocorram mudanças quanto a sua gratuidade, sendo necessário atualizações no cadastro para satisfazer tais mudanças. Com isso, é provável que a credencial esteja inválida, até que tais atualizações estejam devidamente concluídas, podendo acarretar em erros de difícil compreensão e correção a quem fez o download e quer executar o aplicativo em um primeiro momento.

Por isso, a credencial de acesso não estará disponível no repositório, sendo necessário, antes de mais nada, o cadastro na api para obter a sua credencial. Essa credencial precisa ser colocada em **config/app_config.json**, na chave **apiKey**.
