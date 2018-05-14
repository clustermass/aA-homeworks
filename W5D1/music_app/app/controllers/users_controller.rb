class UsersController < ApplicationController


def new
  @user = User.new
  render :new
end

def create
  @user = User.new(user_params)
  if @user.save
    login(@user)
  return redirect_to user_url(@user)
  end
  # flash.now[:errors] = @user.errors.full_messages
  # render :new
end

def show
  @user = current_user
  render :show
end


def index
  @users = User.all
end
def user_params
  params.require(:user).permit(:username, :password)
end

end
