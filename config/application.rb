$LOAD_PATH.unshift(File.expand_path('../../app', __FILE__))

require 'rubygems'
require 'bundler/setup'

Bundler.require :default

Dir[File.expand_path('../../app/*.rb', __FILE__)].each do |f|
  require f
end
