# README

- Ruby 2.3.1
- Heroku automatic Deployment

```
git clone git@github.com:acro5piano/presto-world.git
cd presto-world
bundle install --path vendor/bundle
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
gulp # or rails s
```
