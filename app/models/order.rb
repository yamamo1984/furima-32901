class Order < ApplicationRecord 
  belongs_to :user
  has_one    :item
  belongs_to :address
end
