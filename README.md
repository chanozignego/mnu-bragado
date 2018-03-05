# MNU Bragado

Things you may want to cover:

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Ruby
* Versión: 2.3.1

## Rails
* Versión: 4.2.5.1

## Postgres
* Versión: 9.4

Para deployar a producción:
* cap production depoy
* cap production foreman:stop
* cap production foreman:start
* si falla: 
  * entrar por ssh
  * cd /home/simp-server/app
  * git pull origin master
  * sudo su mnubragado
  * bash -l
  * bundle exec rake db:migrate
  * bundle exec rake RAILS_GROUPS=assets assets:precompile
  * cap production foreman:stop
  * cap production foreman:start