class LikesController < ApplicationController
  before_action :authenticate_user!
  def update
    @post_id=params[:id]
    @post=Post.find(@post_id)
    @likes=@post.likes
    @user_like=@likes.find_by(user_id: current_user.id)
    if @user_like
      @user_like.destroy
      flash[:alert]="Post unliked"
    else
      Like.create(post_id: @post_id, user_id: current_user.id)
      flash[:alert]="Post liked"
    end

    redirect_to @post
  end
end
