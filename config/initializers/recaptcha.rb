Recaptcha.configure do |config|
  config.site_key  = ENV['CAPTCHA_SITE_KEY'] || '6LdIeXYUAAAAABUSJIzuzzXtbNskQcL3e68F6JdD'
  config.secret_key = ENV['CAPTCHA_SECRET_KEY'] || '6LdIeXYUAAAAAG5MeXrqIy_kvGVcUa5hDzNg2Ae5'
  # Uncomment the following line if you are using a proxy server:
  # config.proxy = 'http://myproxy.com.au:8080'
end