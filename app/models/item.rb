class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipment_place
  belongs_to :shipment_date
  belongs_to :category

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name 
    validates :detail 
    validates :image
  end

  #アクティブハッシュのバリデーション
  with_options numericality: { other_than: 1 } do
    validates :condition_id
    validates :shipping_fee
    validates :shipment_date
    validates :category
  end

  validates :shipment_place, numericality: { other_than: 0 }
end
