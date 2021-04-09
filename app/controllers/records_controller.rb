class RecordsController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
    @record_form = RecordForm.new
  end

  def create
    @record_form = RecordForm.new(record_params)
    @product = Product.find(params[:product_id])
    if @record_form.valid?
      @record_form.save
      redirect_to root_path
    else  
      render :index
    end
  end

  private

  def record_params
    params.require(:record_form).permit(:prefecture_id, :post_cord, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id])
  end

end