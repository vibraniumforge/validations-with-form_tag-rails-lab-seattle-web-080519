class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    @post = Post.all
  end

  def new
    @author = Author.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    puts @post.errors.full_messages
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def delete
    @post = Post.find(params[:id])
    @post.destroy
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
