redis: redis-server --bind 127.0.0.1
sidekiq: bundle exec sidekiq -c 2
server: bundle exec puma -e $RAILS_ENV -S ~/puma -C config/puma_$RAILS_ENV.rb -b unix:///tmp/puma.$SOCK_NAME.sock
