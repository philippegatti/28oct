class SessionController < ApplicationController
  include SessionHelper
def new
end

def create
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    log_in(user)
    remember(user)
    redirect_to welcome_path(user.first_name)
  else
    flash.now[:danger] = 'Invalid email/password combination'
    render 'new'
  end
end

def destroy
  log_out(current_user)
  redirect_to welcome_index_path
end
end
