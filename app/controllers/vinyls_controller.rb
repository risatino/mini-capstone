class VinylsController < ApplicationController
  def all_artists
    @artists = Vinyl.find
  end

  def artist
  end
end
