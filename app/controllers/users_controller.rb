class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users=User.all
  end

  def show
    @user=User.find(params[:id])
    @inverse_friendships=@user.inverse_friendships.includes(:user)
    @friendships=@user.friendships.includes(:user)
  end
end
