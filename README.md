# Chamada-Inteligente-STI
Sistema de controle de presença para professores e alunos da UFF

## Documentação
Link para esquema de modelagem dos dados: https://my.vertabelo.com/model/VlRUTikZLzV9SvhaUxCiOFWy1hTRhfAw

Link para Protótipo e Wireframe: https://www.figma.com/file/f19r8Q6nTcef34r9EGXLde/Untitled?type=design&node-id=0%3A1&mode=design&t=CRkxwl5NJLjc1UDJ-1

Link para o Escopo do Produto: https://docs.google.com/document/d/1Sc5YDTkYkXfVGYPtUyo-DcPb2SR9EkCiPhPTnM18WK4/edit?usp=sharing

Link para o Escopo do Projeto: https://miro.com/app/board/uXjVMg-R4WI=/?share_link_id=737493383632

Link para Estimativa de Pontos Função: https://docs.google.com/spreadsheet/d/1pj4oui_9xO733Zhwut7nKLJ7TPqdJ_IHffl2M9g2dHE/edit#gid=0

## Backend
Quando puxar uma nova atualização no modelo de desenvolvimento, importante dar os seguintes comandos no terminal para renovar o banco de dados:
  - rails db:drop
  - rails db:create
  - rails db:migrate
    
### Dependência nova:
  - bundle install
  - bundle update

## Testes
  - Para rodar todos os testes:
      ´´´bundle exec rspec --format documentation´´´
  - Para rodar um teste específico
      ´´´bundle exec rspec ./spec/testeN_spec.rb´´´

      

