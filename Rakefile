require 'rubygems'
require 'activerecord'

namespace :db do
  task :environment do
      dbconfig = YAML.load(File.read('config/database.yml'))
      ActiveRecord::Base.establish_connection dbconfig['production']
  end
  
  task(:migrate => :environment) do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate("db/migrate")
  end
end