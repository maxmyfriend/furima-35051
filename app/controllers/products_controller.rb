class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:edit, :update, :show, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :sold_out_moving, only: [:edit, :update, :destroy]
  
  def index
    @products = Product.order('created_at DESC')
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

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else   
      render :edit
    end
  end 

  def show
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(
      :image, :name, :content, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :arrival_date_id, :price
    ).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def move_to_index
    redirect_to root_path if current_user.id != @product.user.id
  end

  def sold_out_moving
    redirect_to root_path if @product.records.exists?
  end
end
