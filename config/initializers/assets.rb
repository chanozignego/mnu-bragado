# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( index.css )
Rails.application.config.assets.precompile += %w( admin/person/form.js )
Rails.application.config.assets.precompile += %w( admin/application.js )
Rails.application.config.assets.precompile += %w( application.js )
Rails.application.config.assets.precompile += %w( admin/application.css )
Rails.application.config.assets.precompile += %w( application.css )
Rails.application.config.assets.precompile += %w( admin/person/form.js )
Rails.application.config.assets.precompile += %w( agency.css )
Rails.application.config.assets.precompile += %w( home.css )

Rails.application.config.assets.precompile += %w( js/bootstrap.min.js )
Rails.application.config.assets.precompile += %w( js/jquery.easing.min.js )
Rails.application.config.assets.precompile += %w( js/jquery.js )
Rails.application.config.assets.precompile += %w( js/classie.js )
Rails.application.config.assets.precompile += %w( js/cbpAnimatedHeader.js )
Rails.application.config.assets.precompile += %w( js/jqBootstrapValidation.js )
Rails.application.config.assets.precompile += %w( js/contact_me.js )
Rails.application.config.assets.precompile += %w( js/agency.js )

Rails.application.config.assets.precompile += %w( css/agency.css )
Rails.application.config.assets.precompile += %w( css/bootstrap.css )
Rails.application.config.assets.precompile += %w( css/bootstrap.min.css )
