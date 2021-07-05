class PostsController < ApplicationController

  def new
    @post = Post.new
    @post.movies.build
  end 

  def create
    @post = Post.new(post_params)
    if @post.movies.present?
      @post.save
      redirect_to root_path
      flash[:notice] = "投稿が保存されました"
    else 
      redirect_to root_path
      flash[:alert] = "投稿に失敗しました"
    end 

    def index
      @posts = Post.limit(10).includes(:movies, :user).order('created_at DESC')
    end 
  end

  private
    def post_params
      params.require(:post).permit(:caption, movies_attributes: [:video]).merge(user_id: current_user.id)
    end 
end
