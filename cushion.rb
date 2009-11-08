require 'rubygems'
require 'sinatra'
require 'bugzscout'

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