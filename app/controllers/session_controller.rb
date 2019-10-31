class SessionController < ApplicationController
def new
end

def create
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to welcome_path(user.first_name)
  else
    flash.now[:danger] = 'Invalid email/password combination'
    render 'new'
  end
end

def destroy
  session.delete(:user_id)
  redirect_to welcome_index_path
end
end
