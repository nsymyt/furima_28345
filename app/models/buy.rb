class Buy < ApplicationRecord
  belongs_to : users
  belongs_to : items

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
