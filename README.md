# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 2.5.0

* Rails version: 5.2.0

* System dependencies

* Configuration
config mysql database and establish a new account user. open mysql servicer in terminal and execute:
grant all on *.* to flamehaze@'%' identified by 'flamehaze'; flush privileges;

* Database creation
switch to the project root directory then execute: rails db:create

* Database initialization
switch to the project root directory then execute: rails db:migrate

* How to run the test suite
witch to the project root directory then execute: rspec .

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
