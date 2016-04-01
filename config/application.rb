$LOAD_PATH.unshift(File.expand_path('../../app', __FILE__))

require 'rubygems'
require 'bundler/setup'

Bundler.require :default
env_file = File.expand_path('../local_env.yml', __FILE__)
yaml = YAML.load(File.open(env_file))
$FILE_LOCATION = yaml[ENV['RACK_ENV']]['default_file_location']

Dir[File.expand_path('../../app/*.rb', __FILE__)].each do |f|
  require f
end

