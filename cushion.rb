require 'rubygems'
require 'sinatra'
require 'bugzscout'

get "/" do
  erb :index
end

# test method to help us examine global exception handling
get "/bang" do
  raise "you've been shot!"
end