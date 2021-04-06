class ProductsController < ApplicationController
  before_action :authenticate_user!, except: :index
  
  def index
    @products = Product.all
    # @products = Product.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else  
      render :new 
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :content, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :arrival_date_id, :price).merge(user_id: current_user.id)
  end
end