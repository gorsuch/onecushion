require 'rubygems'
require 'activerecord'

dbconfig = YAML.load(File.read('config/database.yml'))
ActiveRecord::Base.establish_connection dbconfig['production']

class Tweet < ActiveRecord::Base
  
end