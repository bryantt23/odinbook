class PostsController < ApplicationController
  def show
    @post=Post.find(params[:id])
  end

  def index
    @posts=Post.includes(:user).all
  end

  def edit
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def new
    @post=Post.new
  end

  def create
    @post=current_user.posts.build(post_params)

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def post_params
    params.expect(post: [ :subject, :content ])
  end
end
