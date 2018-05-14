class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(params[:user][:username],params[:user][:password])
    if user
      login(user)
       redirect_to user_url(id: user.id)
    else
      flash.now[:errors] = "Username or password is invalid"
      render :new
    end
  end

  def new

  end

  def destroy
    current_user
    logout
    redirect_to new_sessions_url
  end

end
