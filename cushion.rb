require 'rubygems'
require 'sinatra'
require 'bugzscout'

configure do
  # start raising errors beyond this application
  set :raise_errors, true
end

helpers do
  def scoutsubmit(title, message)
    begin 
      BugzScout.submit(options.bugzscout_url) do |scout|
        scout.user = options.bugzscout_user
        scout.project = options.bugzscout_project
        scout.area = options.bugzscout_area
        scout.title = title
        scout.body = message
      end
    rescue
      return false
    end
  end
end

error do
  # we protect this so we don't get caught in some odd error loop in the case that this fails
  scoutsubmit(env['sinatra.error'].class.name, env['sinatra.error'].message + "\n\n" + env['sinatra.error'].backtrace.to_s)  
  erb :error_500
end

get "/" do
  erb :index
end

# test method to help us examine global exception handling
get "/bang" do
  raise "you've been shot!"
end