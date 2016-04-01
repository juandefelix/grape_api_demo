ENV['RACK_ENV'] = 'development'
require File.expand_path('../config/environment', __FILE__)

run ListingApp::API