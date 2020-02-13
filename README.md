![abntextor](https://raw.githubusercontent.com/pherde/abntextor/master/app/assets/images/logo.png)

[![Rails-Verison](https://img.shields.io/badge/Rails-5.0.1-red.svg)](http://rubyonrails.org/)
[![Ruby-Verison](https://img.shields.io/badge/Ruby-2.3.3-orange.svg)](http://rubyonrails.org/)
[![Gem-Verison](https://img.shields.io/badge/Gem-2.5.2-yellow.svg)](http://rubyonrails.org/)
[![Texlive-Verison](https://img.shields.io/badge/Texlive-3.14-green.svg)](http://rubyonrails.org/)
[![Git-Verison](https://img.shields.io/badge/Git-2.7.4-blue.svg)](http://rubyonrails.org/)

O AbnTeXtor é um editor de texto para trabalhos acadêmicos. A aplicação é feita basicamente com Ruby On Rails e Latex. 

Na aplicação existem alguns templates de acordo com as regras da ABNT para trabalhos acadêmicos. Basta o usuário criar um trabalho e escrevê-lo. Todo o trabalho de formatação, dentro das regras, será feita pelo AbnTeXtor.

## Funcionalidades

* Sistema completo de controle de usuários
* Usuários admin e comum
* Templates prontos para utilização
* Possibilidade de criação, edição e exclusão de templates e trabalhos
* Usuários podem criar quantos trabalhos quiserem
* Separação das seções do trabalho atravé de menus
* Editor de textos de fácil utilização para escrever conteúdo
* Trabalho gerado em PDF com compilação feita em Latex

## Dependências

* Ruby 2.3.3
* Gem 2.5.2
* Ruby On Rails 5.0.1
* Texlive 3.14
* MySQL 14.14
* Git 2.7.4

## Instalação

### Docker

Clone o repositório, navegue até a pasta raiz da aplicação e execute o comando a seguir.

```
$ MYSQL_USER=abntextor_user MYSQL_PASSWORD=abntextor_password MYSQL_DATABASE=abntextor_database docker-compose up --build
```

Para executar a migration e seed (opcional) uma vez que o container MySQL esteja disponível (pode demorar alguns segundos), execute `docker exec abntextor rails db:migrate db:seed`.

Para acessar basta digitar o endereço [localhost:3000](localhost:300) no navegador

**Login**: admin@admin.com
**Senha**: admin
