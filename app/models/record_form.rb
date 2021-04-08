class RecordForm
  include ActiveModel::module

  attr_accessor :user, :product, :address
  validates :user,   presence: true, foreign_key: true
  validates :product, presence: true, foreign_key: true
  validates :genre,   presence: true

  def save
    Record.create(user: user, product: product)
    Address.create(address: address)
  end
end