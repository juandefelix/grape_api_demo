ENV['RACK_ENV'] = 'development'
require File.expand_path('../config/environment', __FILE__)

use Rack::Cors do
  allow do
    origins '*'
    resource '*', :headers => :any, :methods => :any 
  end
end

run ListingApp::API