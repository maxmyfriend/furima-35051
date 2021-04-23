class Product < ApplicationRecord
  belongs_to :user
  has_one :record
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :arrival_date

  validates :name, :content, :price, presence: true
  validates :image, presence: { message: 'を選択してください' }
  validates :category_id, :status_id, :delivery_fee_id, :prefecture_id, :arrival_date_id, numericality: {
    other_than: 1, message: 'を選択してください'
  }

  validates :price, numericality: {
    only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'を正しく入力してください'
  }, allow_blank: true
end
