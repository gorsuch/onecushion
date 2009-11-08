require 'rubygems'
require 'sinatra'

configure do
  # start raising errors beyond this application
  set :raise_errors, true
end

get "/" do
  erb :index
end

# test method to help us examine global exception handling
get "/bang" do
  raise "you've been shot!"
end