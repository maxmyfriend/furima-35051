class Address < ApplicationRecord
  belongs_to :record
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
