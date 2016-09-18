class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :find_categories_list
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]   
  end
  helper_method :current_user

  def authenticate_user!
    redirect_to '/login' unless current_user
  end

  def find_categories_list
    @categories_list = Category.all
  end
end
