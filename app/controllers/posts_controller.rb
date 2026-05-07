class PostsController < ApplicationController
  def show
    @post=Post.find(params[:id])
  end

  def index
    @posts=Post.includes(:user).all
  end

  def edit
    @post=Post.find(params[:id])
  end

  def update
    @post=Post.find(params[:id])

    if @post.user_id!=current_user.id
      render :edit, status: :unprocessable_entity
    elsif @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post=Post.find(params[:id])
    if @post.user_id==current_user.id
      @post.destroy
      redirect_to posts_path
    else
      render :show, status: :unprocessable_entity
    end
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
