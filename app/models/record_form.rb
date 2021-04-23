class RecordForm
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :prefecture_id, :post_cord, :city, :house_number, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :city
    validates :house_number
    validates :token
    validates :post_cord
    validates :phone_number
  end

  validates :post_cord, format: { with: /\A\d{3}-\d{4}\z/ }, allow_blank: true
  validates :phone_number, format: { with: /0\d{9,10}\z/ }, allow_blank: true
  validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }

  def save
    record = Record.create(user_id: user_id, product_id: product_id)
    Address.create(prefecture_id: prefecture_id, post_cord: post_cord, city: city, house_number: house_number,
                   building_name: building_name, phone_number: phone_number, record_id: record.id)
  end

end
