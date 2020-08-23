class FavoritesController < ApplicationController

  before_action :post_params
  def create
    @favorite = Favorite.create(member_id: current_member.id, post_id: @post.id)
    @post.create_notification_favorite!(current_member)
  end

  def destroy
    @favorite = current_member.favorites.find_by(post_id: @post.id)
    @favorite.destroy
  end

  private
  def post_params
    @post = Post.find(params[:post_id])
  end
end
