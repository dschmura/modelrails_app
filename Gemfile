source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# ruby "3.3.0.rc1"
ruby file: ".tool-versions"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.2.0.rc-1"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 6.4.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Use Tailwind CSS [https://github.com/rails/tailwindcss-rails]
gem "tailwindcss-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

gem "inline_svg"

gem "devise", "~> 4.8"
gem "devise-pwned_password"
gem "omniauth-google-oauth2"

gem "omniauth-saml", "~> 2.1"
gem "omniauth-rails_csrf_protection"
# gem "omniauth-facebook"bin/dev
gem "valid_email2"
gem "acts_as_tenant"
# Use Sass to process CSS
# gem "sassc-rails"
gem "honeybadger"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails"
  gem "guard-rspec", require: false
  gem "bullet"
  gem "annotate"
  gem "standard"
  gem "dotenv-rails"
  gem "capybara"
  gem "selenium-webdriver"
  # gem "webdrivers"
  gem "factory_bot_rails"
  gem "ffaker"
  gem "capybara_accessibility_audit"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
  gem "hotwire-livereload"
  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  gem "rack-mini-profiler", require: ["enable_rails_patches", "rack-mini-profiler"]
  gem "letter_opener_web"
  gem "rails-erd"
  gem "ruby-lsp", require: false
  gem "launchy"
  gem "rails_real_favicon"
  gem "ruby-lsp-rails"
end

gem "watir"
gem "nokogiri"
gem "mini_magick"
