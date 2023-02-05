# Detalhes do projeto

## Objetivo

Este projeto é uma pequena aplicação para importar pedidos de um arquivo de tabulação.

## Configuração

Este projeto roda em **Ruby** na versão`3.0.2` utilizando **Rails** `7.0.4`. Se precisar você pode utilizar um gerenciador de versões para facilitar como o [ASDF](https://www.lucascaton.com.br/2020/02/17/instalacao-do-ruby-do-nodejs-no-ubuntu-linux-usando-asdf).

Neste projeto, estamos usando o SQLite, se você precisar alterá-los para rodar em sua maquina local, você pode fazê-lo em [database.yml](config/database.yml).

O uso do banco de dados SQLite foi motivado pela facilidade de configuração do mesmo em ambientes unix, particularmente preferia o uso do PostgreSQL que é o que estou mais habituado porem para o avaliador pode ser que seja complicado/demorado a instalação do mesmo, isso imaginando que o avaliador usará linux.

Mas caso tenha dificuldade em instalar o mesmo basta seguir esse artigo [Como instalar SQLite](https://www.alura.com.br/artigos/sqlite-da-instalacao-ate-primeira-tabela#:~:text=Instalando%20no%20MacOs,voc%C3%AA%20deve%20abrir%20o%20terminal.&text=Com%20isso%2C%20ao%20digitarmos%20sqlite3,ferramenta%2C%20precedido%20de%20sqlite3%3E%20.)

Para executar o projeto siga os passos a abaixo:

```console
$ bundle install
$ bin/rails db:create && db:migrate
$ bin/rails server
```

Para testes foi utilizado o RSpec e as gems shoulda-matchers, database cleaner,Faker e FactoryBot, caso queiram executar os testes da aplicação utilize o comando abaixo:

```console
$ bin/rails db:migrate RAILS_ENV=test
$ bundle exec rspec
```

Para qualidade de código e linter foi utilizado as gems rubocop, rubocop-rails, rubocop-rspec e rubocop-performance. Você pode executar utilizando o comando abaixo:

```console
$ bundle exec rubocop
```

Para mais detalhes das gems utilizadas você pode consultar o arquivo [Gemfile](Gemfile)

OBS: Foi feito algumas configurações personalizadas elas estão em [.rubocop.yml](.rubocop.yml) alterá-los para rodar em sua maquina local, você pode fazê-lo em [database.yml](config/database.yml).
