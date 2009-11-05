helpers do
  def logged_in?
    if session[:user_id]
      return true
    else
      return false
    end
  end
  
  def user
    User.get(session[:user_id])
  end
  
end