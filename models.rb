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
  property :created_at, DateTime
  property :to_user_id, Integer
  property :geo, String #unsure about this data type
  property :iso_language_code, String
  property :source, String
  
  def self.fetch
    query = CGI.escape('#onecushion')
    
    if Tweet.all.count > 0
      outside_tweets = Twitter::Search.new(query).since(Tweet.last.id)
    else
      outside_tweets = Twitter::Search.new(query)
    end
    outside_tweets.each do |ot|
      t = Tweet.new
      t.attributes = ot
      t.save
    end
  end
end