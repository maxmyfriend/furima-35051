class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :delivery_fee, :prefecture, :arrival_date 

  validates :name, :content, :price, presence: true
  validates :category_id, :status_id, :delivery_fee_id, :prefecture_id, :arrival_date_id, numericality: { other_than: 1 }

  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, leth_than_or_equal_to: 9999999}
end
