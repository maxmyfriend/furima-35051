class RecordForm
  
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :prefecture_id, :post_cord, :city, :house_number, :building_name, :phone_number

  with_options presece: true do
    validates :user_id, :product_id, :city, :house_number
    validates :post_cord, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone_number, format: { with: /0\d{9,10}/ }
  end
  
  validates :prefecture_id, numericality: { other_than: 0, message: 'must be selected' }
  
  def save
    Record.create(user: user, product: product)
    Address.create(address: address)
  end
end