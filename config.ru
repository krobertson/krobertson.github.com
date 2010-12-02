require 'rubygems'
require 'bundler'
require 'yaml'
require 'lib/pygment_update.rb'

Bundler.require

run Rack::Jekyll.new