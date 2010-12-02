require 'rubygems'
require 'bundler'
require 'yaml'

Bundler.require

require 'lib/pygment_update.rb'

run Rack::Jekyll.new