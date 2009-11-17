class MinuteColumn < ActiveRecord::Migration
  def self.up
    add_column :tweets, :minutes, :integer
  end

  def self.down
    remove_column :tweets, :minutes
  end
end