class ArtistsController < ApplicationController

  def index
    @artists = Artist.order("name")
  end

  def show
    @artist = Artist.find(params[:id])
    @posts = @artist.posts.where("schedule > ?", DateTime.now).order("schedule ASC")
  end

  def search
    @artists = Artist.search(params[:keyword])
  end


  private
  def artist_params
    params.require(:artist).permit(:name, :image, :profile, :is_enabled)
  end

end
