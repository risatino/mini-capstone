class VinylsController < ApplicationController
  def index
    @vinyls = Vinyl.all
  end

  def new
  
  end

  def create
    @vinyl = Vinyl.create(artist_name: params[:artist_name], 
                          record_title: params[:record_title],
                          genre: params[:genre],
                          description: params[:description],
                          playtime: params[:playtime],
                          label: params[:label],
                          price: params[:price])

    flash[:success] = "Your data has been received."
    redirect_to "/vinyls/#{@vinyl.id}"
  end

  def show
    @vinyl = Vinyl.find(params[:id])
  end

  def edit
    @vinyl = Vinyl.find(params[:id])      
  end

  def update
    @vinyl = Vinyl.find(params[:id])
    @vinyl.update(artist_name: params[:artist_name], 
                  record_title: params[:record_title],
                  genre: params[:genre],
                  description: params[:description],
                  playtime: params[:playtime],
                  label: params[:label],
                  price: params[:price])

    flash[:success] = "Your data has been updated."
    redirect_to "/vinyls/#{@vinyl.id}"
  end

  def destroy
    @vinyl = Vinyl.find(params[:id])
    @vinyl.destroy
    
    flash[:warning] = "And...your data...she gone...bai bai."
    redirect_to '/vinyls'
  end
end  
  # @vinyl.assign_attributes(artist_name: params[:artist_name], 
  #                     record_title: params[:record_title],
  #                     genre: params[:genre],
  #                     description: params[:description],
  #                     playtime: params[:playtime],
  #                     label: params[:label],
  #                     price: params[:price])
  # @recipe.save
  #

  # def all_artists
  #   @artists = Vinyl.all
  # end

  # def artist
  #   @artist = Vinyl.all.sample
  # end
