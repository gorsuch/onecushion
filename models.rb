require 'rubygems'
require 'activerecord'
require 'twitter'

dbconfig = YAML.load(File.read('config/database.yml'))
ActiveRecord::Base.establish_connection dbconfig['production']

class Tweet < ActiveRecord::Base
  serialize :source_tweet
  
  def self.fetch
    query = '#onecushion'
    results = Twitter::Search.new(query)
    results = results.since(Tweet.last.twitter_id) if Tweet.count > 0
    
    results.each do |r|
      t = Tweet.new
      t.twitter_id = r.id
      t.from_user_id = r.from_user_id
      t.from_user = r.from_user
      t.profile_image_url = r.profile_image_url
      t.text = r.text
      t.to_user_id = r.to_user_id
      t.created_at = r.created_at
      t.source_tweet = r
      t.save
    end
    
  end
  
  def hashtags
    text.split(" ").reject do |item|
      item[0].chr != '#'
    end
  end
  
end