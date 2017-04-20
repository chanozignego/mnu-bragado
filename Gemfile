source "https://rubygems.org"

gem "rails", "4.2.5"

# ENV managing
gem "dotenv-rails", groups: %i[development test]

# Misc
gem "letter_opener", group: :development
gem "mail"
gem "gmail"

# Debugging
gem "pry"
gem "pry-rails"
gem "pry-byebug"
gem "pry-remote"
gem "pry-stack_explorer"

group :development do
  gem "better_errors"
  gem "binding_of_caller"
end

# Persistance
gem "pg", "~> 0.15"

# Model stuff
gem "mini_magick"
gem "carrierwave"
gem "carrierwave-base64"
gem "countries"
gem "searchlight"
gem "money-rails"
gem "deep_cloneable", "~> 2.2.0"
gem "email_validator"
gem "acts-as-taggable-on", "~> 3.4"

# Templating and frontend stuff
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "slim"
gem "haml", "~> 4.0.3"
gem "bower-rails"
gem "i18n-js", ">= 3.0.0.rc8"
gem "rails-i18n", "~> 4.0.0"
gem "simple_form"
gem 'to_xls-rails'

#Bourbon
gem 'bourbon', '~> 4.0'

# Asset Gems (use bower if possible pls?)
gem "bootstrap-wysihtml5-rails"
gem "js-routes"
gem "cocoon"
gem "bootstrap-sass"
gem "inline_svg"

# Auth
gem "devise"

# Admin
gem "administrate",
  github: "micapam/administrate",
  branch: "feature/namespaced-models"

# Testing
gem "rspec-rails"
gem "factory_girl_rails"
gem "database_cleaner"
gem "faker"

# Controller stuff
gem "angular_rails_csrf"
gem "draper"
gem "oj" # faster json rendering
gem "oj_mimic_json"

# Mailing
gem "mailgun_rails"

# Background jobs
gem "sidekiq"
gem "sidetiq"

# Excel manager
gem "roo", "~> 2.7.0"
gem 'roo-xls'

# Doc
group :development do
  gem "yard"
  gem "yard-rails-plugin", ">= 0.1.0", github: "lorddoig/yard-rails-plugin"
  gem "yard-activerecord"
end

# Deployment
gem "newrelic_rpm"

group :production do
  gem 'foreman', '0.63.0'
  gem 'stackmint', git: "git@github.com:chanozignego/stackmint.git"
  gem 'puma'
  gem 'recipient_interceptor' #for staging environment - SET ENV['STAGING'] for to use
end
#ruby "2.2.4"