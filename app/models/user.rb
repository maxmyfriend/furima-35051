class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products 
  has_many :records
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'を正しく入力してください' }, allow_blank: true
  with_options presence: true do 
    validates :nickname
    validates :birthday
    validates :last_name
    validates :first_name
    validates :kana_last_name
    validates :kana_first_name
  end

  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'を正しく入力してください' }, allow_blank: true do 
    validates :last_name
    validates :first_name
  end

  with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'を正しく入力してください' }, allow_blank: true do 
    validates :kana_last_name
    validates :kana_first_name
  end
end
