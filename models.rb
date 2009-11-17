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
    results = results.since(Tweet.find(:first, :order => "twitter_id desc")) if Tweet.count > 0
    
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
  
  def parse_hashtags
    text.split(" ").reject do |item|
      item[0].chr != '#'
    end
  end
  
  def parse_minutes
    match_data = /.*(\d+) minute?/.match(self.text)
    if match_data
      match_data[1].to_i + self.parse_hours * 60
    else
      self.parse_hours * 60
    end
  end
  
  def parse_hours
    match_data = /.*(\d+) hour?/.match(self.text)
    if match_data
      match_data[1].to_i
    else
      0
    end
  end
  
  def before_save
    self.minutes = parse_minutes
  end
  
end