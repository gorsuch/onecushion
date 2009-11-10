require 'rubygems'
require 'dm-core'

DataMapper.setup(:default, ENV['DATABASE_URL']  || 'sqlite3:///tmp/cushion.db')

class Tweet
  include DataMapper::Resource

  property :id, Integer, :key => true
  property :from_user_id, Integer
  property :from_user, String
  property :profile_image_url, String
  property :text, String
end