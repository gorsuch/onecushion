class Init < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.integer   :twitter_id
      t.integer   :from_user_id
      t.string    :from_user
      t.string    :profile_image_url
      t.string    :text
      t.datetime  :created_at
      t.integer   :to_user_id
      t.text      :source_tweet
    end
  end

  def self.down
    drop_table :tweets
  end
end