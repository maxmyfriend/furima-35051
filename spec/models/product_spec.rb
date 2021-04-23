require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品の出品' do
    context '商品の出品ができる場合' do
      it '全ての情報が入力されていれば商品を出品できる' do
        expect(@product).to be_valid
      end
    end

    context '商品の出品ができない場合' do
      it '商品画像が空だと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("商品の画像を選択してください")
      end
      it '商品名が空だと出品できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品の説明が空だと出品できない' do
        @product.content = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("商品の説明を入力してください")
      end
      it '商品のカテゴリーが---だと出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('カテゴリーを選択してください')
      end
      it '商品の状態が---だと出品できない' do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('商品の状態を選択してください')
      end
      it '配送料の負担が---だと出品できない' do
        @product.delivery_fee_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('配送料の負担を選択してください')
      end
      it '配送元の地域が---だと出品できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('発送元の地域を選択してください')
      end
      it '発送までの日数が---だと出品できない' do
        @product.arrival_date_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('発送までの日数を選択してください')
      end
      it '商品の販売価格が300円未満だと出品できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include('金額を正しく入力してください')
      end
      it '商品の販売価格が9,999,999円を超えると出品できない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('金額を正しく入力してください')
      end
      it '商品の販売価格は全角文字では登録できない' do
        @product.price = '５００'
        @product.valid?
        expect(@product.errors.full_messages).to include('金額を正しく入力してください')
      end
      it '商品の販売価格は半角英数混合では登録できない' do
        @product.price = '1a1a1a'
        @product.valid?
        expect(@product.errors.full_messages).to include('金額を正しく入力してください')
      end
      it '商品の販売価格は半角英語では登録できない' do
        @product.price = 'aaa'
        @product.valid?
        expect(@product.errors.full_messages).to include('金額を正しく入力してください')
      end
      it '紐づくユーザーが存在しないと保存できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
