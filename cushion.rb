require 'rubygems'
require 'sinatra'
require 'twitter'
require 'models'
require 'tweet_utils'

configure do
  # start raising errors beyond this application
  set(:raise_errors, true) if ENV['RACK_ENV'] != 'development'
end

get "/" do
  @tweets = Tweet.all(:order => [:id.desc])
  erb :index
end