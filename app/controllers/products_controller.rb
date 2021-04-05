class ProductsController < ApplicationController
  
  def index
  end


private

def product_params
  params.require(:product),permit(:image, :name, :content, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :arrival_id, :price).merge(user_id: current_user.id)
end
