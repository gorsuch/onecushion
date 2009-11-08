require 'rubygems'
require 'sinatra'

configure do
  # start raising errors beyond this application
  set :raise_errors, true
end

get "/" do
  erb :index
end