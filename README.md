# AbnTeXtor

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

### Vagrant

Está disponível uma máquinha virtual feita no Vagrant para facilitar a instalação da aplicação.

Para utilizar essa máquina é importante ter o [Virtualbox](https://www.virtualbox.org/) a o [Vagrant](https://www.vagrantup.com/) instalados. Com essa máquina as dependências relacionadas acima estão sanadas. Para instalar a máquina inicialmente faça:

```
$ vagrant init pherde/railstex --box-version 0.0.1
$ vagrant up
```

Porém, ainda teremos que redirecionar a porta padrão do Rails. Abra o arquivo Vagrantfile que foi gerado depois do init e insira a seguinte linha nele:

```
config.vm.network "forwarded_port", guest: 3000, host: 3000
```

Na sequência para acessar a máquina basta digitar o comando:

```
$ vagrant ssh
```

### Instalando o AbnTeXtor

A receita de bolo para instalar o AbnTeXtor na máquina virtual:

```
$ git clone https://github.com/pherde/abntextor.git
$ cd abntextor
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails db:seed
$ rails s
```

Para acessar basta digitar o endereço [localhost:3000](localhost:300) no navegador

**Login**: admin@admin.com
**Senha**: admin