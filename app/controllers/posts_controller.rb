class PostsController < ApplicationController
  before_action :authenticate_member!

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    if @post.save!
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
  end

  def edit
    @post = Post.find(params[:id])
    if @post.member != current_member
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "更新成功！"
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end


  def fav
    post = Post.find(params[:id])
    if post.favorited_by?(current_member)
      fav = current_member.favorites.find_by(post_id: post.id)
      fav.destroy
      render json: post.id
    else
      fav = current_member.favorites.new(post_id: post.id)
      fav.save
      render json: post.id
    end
  end
  private
  def post_params
    params.require(:post).permit(:artist_id, :title, :image, :introduction, :schedule, :watching_method, :detailed_url, :admission)
  end

end
