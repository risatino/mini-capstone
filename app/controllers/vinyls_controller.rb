class VinylsController < ApplicationController
  def all_artists
    @artists = Vinyl.all
  end

  def artist
    @artist = Vinyl.all.sample
  end
end
