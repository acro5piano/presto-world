# README

- Docker
  - Ruby 2.3.1
  - Postgresql 9.5
  - Nodejs 6.9

- Heroku automatic Deployment

```
git clone git@github.com:acro5piano/presto-world.git
cd presto-world

docker-compose build

docker-compose run --rm web bundle install --path vendor/bundle
docker-compose run --rm nodejs npm install

docker-compose up -d

docker-compose exec web bundle exec rake db:create
docker-compose exec web bundle exec rake db:migrate
docker-compose exec web bundle exec rake db:seed
```
