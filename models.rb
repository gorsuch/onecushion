require 'rubygems'
require 'dm-core'

# let us just rock a memory-bound sqlite3 database
DataMapper.setup(:default, ENV['DATABASE_URL'] || 'sqlite3:///tmp/cushion.db')

class User
  include DataMapper::Resource
  
  property :id,           Serial
  property :email,        String
  property :display_name, String
  property :password,     String
  property :created_at,   DateTime
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