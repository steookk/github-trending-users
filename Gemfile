source 'https://rubygems.org'

ruby "2.0.0"  #specify ruby version for heroku 
gem 'rails', '3.2.16'
gem 'pg' #postgres 

#data scraping from webpage 
gem 'nokogiri', '1.5.4'
gem 'rest-client', "~> 1.6.0"

gem 'jquery-rails'

group :assets do
	gem 'sass-rails',   '~> 3.2.3'
	gem 'coffee-rails', '~> 3.2.1'
	gem 'uglifier', '>= 1.0.3'
end

group :development, :test do 
	#rspec and factorygirl must be in dev group in order to generate files
  	gem 'rspec-rails', '~> 2.14.0' 
	#gem 'factory_girl_rails', '~> 4.3.0'
end

group :test do 
	#gem 'webmock', '~> 1.16'
end

group :production do 
	#gem 'memcachier'
	#gem 'dalli'
end