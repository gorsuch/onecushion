require 'rubygems'
require 'sinatra'

configure do
  # start raising errors beyond this application
  set(:raise_errors, true) if ENV['RACK_ENV'] != 'development'
end

get "/" do
  erb :index
end