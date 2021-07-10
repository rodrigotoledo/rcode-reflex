# Requirements

- https://www.docker.com/
- Cool and good edtor: Visual Studio
- RSpec knowledge

# Setup

First of all you must have install `Docker` and have `docker-compose` as fuctional command in your terminal. With that inside the project root directory, execute:

- `docker-compose build && docker-compose up`
  of course packages too
- `docker-compose run recode_app yarn`
  ...will create the applicationn with current folder name
- `docker-compose run recode_app bundle exec rails db:drop db:create db:migrate`
  and finally create, migrate tables
- `docker-compose run recode_app bundle exec rails db:seed`
- `docker-compose run recode_app bundle exec rails dev:cache`
  if you need populate with sample data

# Coding and of course, testing...

This project use `guard` and `rspec` as monitor and test engine of application, so everytime that you will be code something the application should have coverage of tests.

- `docker-compose run recode_app bundle exec guard`
  ...will execute `guard`, wait you code something in the project and then execute tests

The coverage of your tests will be in the `coverage` directory

## Your code need to stay good and clean

With simplecov in `rspec` we have coverage of code, but must important is keep the code with good practices.

# Execute something

As explained, the application run with `docker-compose` so execute the command and obtain results:

- `docker-compose up`

if you want interact in console run

- `docker-compose run recode_app bundle exec rails c`

# Development

This project uses git flow workflow so each developer should follow the steps to build or fix something.

Inside your project run

- `git-flow init`

To start feature

- `git-flow feature start name-of-feature`

code, commit and the feature

- `git commit -am 'name-of-feature fixed with short text'`
- `git-flow feature finish name-of-feature`

# Production

This project use the master branch to deploy in the production server. Actually it's using the heroku. Follow the commands to deploy in production environment

- `git checkout master`
- `git pull origin master`
- `git push origin heroku`
- `heroku run rake db:migrate`
