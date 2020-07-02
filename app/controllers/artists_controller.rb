class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
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
