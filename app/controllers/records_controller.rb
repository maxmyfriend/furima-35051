class RecordsController < ApplicationController
  before_action :set_product, only: [:index, :create]

  def index
    @record_form = RecordForm.new
  end

  def create
    @record_form = RecordForm.new(record_params)
    if @record_form.valid?
      pay_product
      @record_form.save
      redirect_to root_path
    else  
      render :index
    end
  end

  private

  def record_params
    params.require(:record_form).permit(
      :prefecture_id, :post_cord, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token]
      )
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @product.price,
        card: record_params[:token],
        currency: 'jpy'
    )
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

end