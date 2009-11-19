require 'rubygems'
require 'sinatra'
require 'models'
require 'tweet_utils'

configure do
  # start raising errors beyond this application
  set(:raise_errors, true) if ENV['RACK_ENV'] != 'development'
end

get "/" do
  @tweets = Tweet.find(:all, :order => 'twitter_id DESC')
  @minutes = Tweet.sum("minutes")
  @title = "One Cushion"
  erb :index
end