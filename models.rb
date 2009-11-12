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
    outside_tweets = Twitter::Search.new(query)
    
    outside_tweets = outside_tweets.since(Tweet.last.id) if Tweet.all.size > 0

    outside_tweets.each do |ot|
      t = Tweet.new
      t.attributes = ot
      t.save
    end
  end
  
  # needs to be moved into some other class, but will work for now
  def self.fix_migration
    repository(:default).adapter.query("ALTER TABLE tweets ALTER COLUMN id TYPE bigint")
    repository(:default).adapter.query("ALTER TABLE tweets ALTER COLUMN from_user_id TYPE bigint")
    repository(:default).adapter.query("ALTER TABLE tweets ALTER COLUMN to_user_id TYPE bigint")
  end
  
end