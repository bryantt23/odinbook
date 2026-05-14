class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post=Post.find(params[:post_id])
    @comment=@post.comments.build(comment_params)
    @comment.user=current_user
    if @comment.save
      flash[:alert]="Your comment has been added"
    else
      flash[:alert]="Invalid comment"
    end

    redirect_to @post
  end

  private
  def comment_params
    params.expect(comment: [ :content ])
  end
end
