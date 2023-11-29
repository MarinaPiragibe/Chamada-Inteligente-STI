# Chamada-Inteligente-STI
Sistema de controle de presença para professores e alunos da UFF

## Documentação
[Esquema de modelagem dos dados](https://my.vertabelo.com/model/VlRUTikZLzV9SvhaUxCiOFWy1hTRhfAw)

[Protótipo e Wireframe](https://www.figma.com/file/f19r8Q6nTcef34r9EGXLde/Untitled?type=design&node-id=0%3A1&mode=design&t=CRkxwl5NJLjc1UDJ-1)

[Escopo do Produto](https://docs.google.com/document/d/1Sc5YDTkYkXfVGYPtUyo-DcPb2SR9EkCiPhPTnM18WK4/edit?usp=sharing)

[Escopo do Projeto](https://miro.com/app/board/uXjVMg-R4WI=/?share_link_id=737493383632)

[Estimativa de Pontos Função](https://docs.google.com/spreadsheet/d/1pj4oui_9xO733Zhwut7nKLJ7TPqdJ_IHffl2M9g2dHE/edit#gid=0)

## Backend
Nova atualização no modelo de desenvolvimento:
  - `rails db:drop`
  - `rails db:create`
  - `rails db:migrate`
    
Dependência nova:
  - `bundle install`
  - `bundle update`

## Testes
  - Executar todos os testes:
      `bundle exec rspec --format documentation`
  - Executar um teste específico
      `bundle exec rspec ./spec/testeN_spec.rb`
