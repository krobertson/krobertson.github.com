require 'rubygems'
require 'bundler'
require 'yaml'

Bundler.require

use Rack::EY::Solo::DomainRedirect
run Rack::Jekyll.new