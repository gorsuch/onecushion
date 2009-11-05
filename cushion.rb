require 'rubygems'
require 'sinatra'

require 'models'
require 'helpers'

enable :sessions

get "/" do
  erb :index
end

get "/register" do 
  erb :register
end

post "/register" do
  u = User.new
  u.attributes = params
  if !u.save 
    u.errors.inspect
  else
      "good"
  end
end

get "/login" do
  erb :login
end

post "/login" do
  u = User.login(params[:email], (params[:password]))  
  if u
    session[:user_id] = u.id
    redirect "/"
  else
    "nope"
  end
end

get "/logout" do
  session[:user_id] = nil
  redirect "/"
end