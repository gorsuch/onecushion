require 'rubygems'
require 'sinatra'
require 'bugzscout'

configure do
  # configure bugzscout essentials
  set :bugzscout_url, ENV['BUGZSCOUT_URL'] || 'https://foobar.fogbugz.com/scoutsubmit.asp'
  set :bugzscout_user, ENV['BUGZSCOUT_USER'] || 'John Doe'
  set :bugzscout_project, ENV['BUGZSCOUT_PROJECT'] || 'Some Project'
  set :bugzscout_area, ENV['BUGZSCOUT_AREA'] || 'Some Area'
end

error do
  BugzScout.submit(options.bugzscout_url) do |scout|
    scout.user = options.bugzscout_user
    scout.project = options.bugzscout_project
    scout.area = options.bugzscout_area
    scout.title = env['sinatra.error'].class.name
    scout.body = env['sinatra.error'].message + "\n\n" + env['sinatra.error'].backtrace.to_s
  end
  
  erb :error_500
  
end

get "/" do
  erb :index
end

# test method to help us examine global exception handling
get "/bang" do
  raise "you've been shot!"
end