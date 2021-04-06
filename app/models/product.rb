class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :arrival_date 

  validates :name, :content, :image, :price, presence: true
  validates :category_id, :status_id, :delivery_fee_id, :prefecture_id, :arrival_date_id, numericality: { other_than: 1, message: "must be selected" }

  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999, message: "is from 300 to 9,999,999"}

end
