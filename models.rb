require 'rubygems'
require 'dm-core'
require 'dm-validations'
require 'digest/sha1'

# let us just rock a memory-bound sqlite3 database
DataMapper.setup(:default, ENV['DATABASE_URL'] || 'sqlite3:///tmp/cushion.db')

class User
  attr_accessor :password, :password_confirmation
  
  include DataMapper::Resource
  
  property :id,                   Serial,   :nullable => false
  property :email,                String,   :nullable => false, :format => :email_address
  property :display_name,         String,   :nullable => false
  property :hashed_password,      String
  property :created_at,           DateTime
  
  validates_is_unique :email
  validates_is_confirmed :password
  
  before :save do
    if self.password
      self.hashed_password = Digest::SHA1.hexdigest(self.password)
    end
  end
  
  def self.login(email, password)
    return self.first(:email => email, :hashed_password => Digest::SHA1.hexdigest(password))
  end
  
end

class Sit
  include DataMapper::Resource
  
  property :id,         Serial
  property :created_at, DateTime
  property :on,         DateTime
  property :minutes,    Integer
  property :practice,   String
end

#DataMapper.auto_migrate!