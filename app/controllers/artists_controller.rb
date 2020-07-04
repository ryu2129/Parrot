class ArtistsController < ApplicationController

  def index
    @artists = Artist.order("name")
  end

  def show
    @artist = Artist.find(params[:id])
    @posts = @artist.posts.where("schedule > ?", DateTime.now)
  end

  def search
    @artists = Artist.search(params[:keyword])
    #respond_to do |format|
      #format.html
      #format.json
    #end
  end


  private
  def artist_params
    params.require(:artist).permit(:name, :image, :profile, :is_enabled)
  end

end
