bundle check || bundle install
bundle exec rails db:setup RAILS_ENV=development

bundle exec puma -C config/puma.rb
