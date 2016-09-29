class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :find_categories_list
  before_action :calculate_cart_count
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]   
  end
  
  helper_method :current_user

private
  
  def authenticate_admin!
    redirect_to '/' unless current_user && current_user.admin
  end

  def authenticate_user!
    redirect_to '/login' unless current_user
  end

  def find_categories_list
    @categories_list = Category.all
  end

  def calculate_cart_count
    if current_user
      if session[:cart_count]
        @cart_count = session[:cart_count]
      else
        @cart_count = current_user.currently_carted.count   
        session[:cart_count] = @cart_count
      end
    else
      @cart_count = 0
    end 
  end
end
