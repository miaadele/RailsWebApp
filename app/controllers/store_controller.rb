class StoreController < ApplicationController
  skip_before_action :authorize
  
  include CurrentCart
  before_action :set_cart
  def index
    @products = Product.all
    #filter products based on URL parameters, check if they are present
    if params[:search_by_title].present?
      @products = @products.where("title LIKE ?", "%#{params[:search_by_title]}%")
    end
    if params[:search_by_desc].present?
      @products = @products.where("description LIKE ?", "%#{params[:search_by_desc]}%")
    end
  end
end
