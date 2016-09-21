class VinylsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @vinyls = Vinyl.all.includes(:images)
    sort_attribute = params[:sort]
    sort_order = params[:sort_order]
    discount_level = params[:discount]
    search_term = params[:search_term]
    category = params[:category]

    @cart_count = current_user.currently_carted.count

    if category
      @vinyls = Category.find_by(name: category).vinyls
    end

    if search_term
      fuzzy_search_term = "%#{search_term}%"
      @vinyls = @vinyls.where("artist_name ILIKE ? OR record_title ILIKE ?", fuzzy_search_term, fuzzy_search_term)
    end

    if discount_level
      @vinyls = @vinyls.where("price < ?", discount_level)
      #"price < 7" can be in single or double quotations in rails but not in Postico and discount_level should be set on the link.
    end

    if sort_attribute && sort_order
      @vinyls = @vinyls.order(sort_attribute => sort_order)
    elsif sort_attribute
      @vinyls = @vinyls.order(sort_attribute)
    end
  end

  def new
    unless current_user && current_user.admin
      redirect_to '/'
    end
  end

  def create
      @vinyl = Vinyl.create(artist_name: params[:artist_name], 
                            record_title: params[:record_title],
                            genre: params[:genre],
                            description: params[:description],
                            playtime: params[:playtime],
                            label: params[:label],
                            price: params[:price],
                            supplier_id: params[:supplier_id],
                            img_url: params[:img_url])

    
    # supplier_id: params[:supplier][:supplier_id] 
    # must have the foreign key from the associated table
    # same as Image model table bmust have the vinyl_id: params[:vinyl_id] 
    # need to add Image code here Image.create(url: params[:image], product_id: @product.id)

    flash[:success] = "Your data has been received."
    redirect_to "/vinyls/#{@vinyl.id}"
  end

  def show
      @vinyl = Vinyl.all.sample
      @supplier = @vinyl.supplier
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
                    price: params[:price],
                    img_url: params[:img_url])

      flash[:success] = "Your data has been updated."
      redirect_to "/vinyls/#{@vinyl.id}"  
  end

  def destroy
    @vinyl = Vinyl.find(params[:id])
    @vinyl.destroy
    
    flash[:warning] = "And...your data...she gone...bai bai."
    redirect_to '/vinyls'   
  end

  def random
    random_vinyl = Vinyl.all.sample
    redirect_to "/vinyls/#{random_vinyl}"
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
