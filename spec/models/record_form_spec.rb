require 'rails_helper'

RSpec.describe RecordForm, type: :model do
  before do
    sleep 0.01
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
    @record_form = FactoryBot.build(:record_form, user_id: @user.id, product_id: @product.id)
  end
  
  describe '商品の購入' do
    context '商品の購入ができるとき' do
      it 'すべての項目の入力が存在すれば購入ができる' do
        expect(@record_form).to be_valid
      end
    end

    context '商品の購入ができないとき' do
      it 'post_cordが空だと購入できない' do
        @record_form.post_cord = ''
        @record_form.valid?
        expect(@record_form.errors.full_messages).to include("Post cord can't be blank")
      end
      it 'post_cordが3桁の半角数字、ハイフン、4桁の半角数字でないと購入できない' do
        @record_form.post_cord = '1234567'
        @record_form.valid?
        expect(@record_form.errors.full_messages).to include('Post cord is invalid')
      end
      it 'prefecture_idが---だと購入できない' do
        @record_form.prefecture_id = 1
        @record_form.valid?
        expect(@record_form.errors.full_messages).to include('Prefecture must be selected')
      end
      it 'cityが空だと購入できない' do
        @record_form.city = ''
        @record_form.valid?
        expect(@record_form.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと購入できない' do
        @record_form.house_number = ''
        @record_form.valid?
        expect(@record_form.errors.full_messages).to include("House number can't be blank")
      end
      it 'building_nameが空でも購入できる' do
        @record_form.building_name = ''
        expect(@record_form).to be_valid
      end
      it '電話番号が空だと購入できない' do 
        @record_form.phone_number = ''
        @record_form.valid?
        expect(@record_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が0から始まる10、11桁の半角数字でないと購入できない' do
        @record_form.phone_number = '1234567890'
        @record_form.valid?
        expect(@record_form.errors.full_messages).to include('Phone number is invalid')
      end
      it '商品の購入情報に紐づくユーザーが存在しないと購入できない' do
        @record_form.user_id = nil  
        @record_form.valid?
        expect(@record_form.errors.full_messages).to include("User can't be blank")
      end
      it '商品の購入情報に紐づく商品が存在しないと購入できない' do
        @record_form.product_id = nil
        @record_form.valid?
        expect(@record_form.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end
