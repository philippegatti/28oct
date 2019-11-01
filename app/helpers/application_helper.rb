module ApplicationHelper
def current_user
  if session[:user_id]
    current_user = User.find_by(id: session[:user_id])
  elsif cookies[:user_id]
    user = User.find_by(id: cookies[:user_id])
    if user && BCrypt::Password.new(user.remember_digest).is_password?(cookies[:remember_token])
      log_in user
      current_user = user
    end
  end
end

  def log_in(user)
    session[:user_id] = user.id
  end
   def logged_in?
    session[:user_id]
  end
  def authenticate_user
  	unless current_user
	  redirect_to new_session_path
	end
  end
end
