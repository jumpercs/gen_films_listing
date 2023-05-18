# GEN Films listing - Aplicativo Flutter

Este aplicativo Flutter foi desenvolvido para exibir uma lista de filmes da Marvel (com um bônus de filmes da DC) usando dados mock ou consumindo uma API REST real. O projeto segue o padrão Clean Architecture, separando as responsabilidades nos locais apropriados e aderindo aos princípios SOLID. O Flutter Modular é utilizado para gerenciar as dependências, enquanto o Mockito e o Build Runner são empregados para a geração de mocks nos testes de caso de uso. O objetivo do projeto é demonstrar o desenvolvimento seguindo padrões de qualidade.

## Recursos

- Listagem de filmes da Marvel com um bônus de filmes da DC.
- Exibição de detalhes do filme, incluindo título, data de lançamento, sinopse e pôster.
- Possibilidade de utilizar dados mock ou consumir uma API REST real.
- Arquitetura seguindo o padrão Clean Architecture.
- Separação de responsabilidades em diferentes camadas: data, domain, external e presentation.
- Utilização do Flutter Modular para injeção de dependências e gerenciamento de rotas.
- Utilização do Mockito para simulação de dependências nos testes de caso de uso.
- Uso do Build Runner para geração de mocks.

## Estrutura do Projeto

O projeto segue uma estrutura organizada, aderindo ao padrão Clean Architecture. Aqui está uma visão geral dos principais diretórios e suas finalidades:

- **lib**: Contém o código principal do aplicativo.
  - **src**: Contém os principais módulos do aplicativo.
    - **modules**: Contém os módulos do aplicativo, incluindo o módulo `home_list`.
      - **data**: Contém a implementação da camada de dados.
        - **datasources**: Fornece acesso aos dados, seja através de mocks ou de uma API REST real.
        - **repositories**: Implementa a lógica de acesso e manipulação de dados.
      - **domain**: Contém a implementação da camada de domínio.
        - **models**: Define os modelos de dados utilizados na aplicação.
        - **repositories**: Define as interfaces dos repositórios para a obtenção de dados.
        - **usecases**: Implementa os casos de uso da aplicação.
      - **external**: Contém a implementação da camada externa.
        - **datasources**: Fornece implementações concretas dos datasources externos.
      - **presentation**: Contém a implementação da camada de apresentação.
        - **home_list**: Implementa a tela de listagem de filmes da Marvel (e com bônus da DC).
    - **shared**: Contém recursos compartilhados entre os módulos, como widgets e constantes úteis.
    - **utils**: Contém utilitários e classes auxiliares utilizados em todo o projeto.

## Testes

O projeto inclui testes unitários para os casos de uso e testes de integração para a camada de dados. Para executar os testes, execute o seguinte comando:

```bash
flutter test
```

Os testes utilizam o Mockito para simular dependências e garantir a correção da lógica de negócio.


Este projeto tem como objetivo demonstrar o desenvolvimento de um aplicativo Flutter seguindo altos padrões de qualidade, como Clean Architecture, princípios SOLID e desenvolvimento orientado a testes. Se tiver alguma dúvida ou feedback, sinta-se à vontade para entrar em contato. Divirta-se explorando o universo dos filmes da Marvel e DC!

<p align="center">
  <img src="https://github.com/jumpercs/gen_films_listing/assets/60657808/a2148f81-f23d-436a-85bc-3b6ea01630c8" width="350" title="Home Page Mock">
   <img src="https://github.com/jumpercs/gen_films_listing/assets/60657808/f30e3711-6737-44c1-85ee-25acb87ffd92" width="350" title="Home Page Consumindo API Real">
</p>
<p align="center">
  <img src="https://github.com/jumpercs/gen_films_listing/assets/60657808/360febed-08c8-4b09-96fc-09ddf02eb345" width="350" title="Home Page Filme Detalhe">
   <img src="https://github.com/jumpercs/gen_films_listing/assets/60657808/15372a3e-defc-4d05-9914-09b90a287dde" width="350" title="Home Page Filme Detalhe 2">
</p>
