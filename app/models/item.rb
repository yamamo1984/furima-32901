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
    validates :price,  format: { with: /\A[0-9]+\z/, message: 'has to use half-width alphanumeric' }
    validates :price,  inclusion: { in: 300..9999999, message: 'は300〜9999999円の間にしてください' }
  end

  #アクティブハッシュのバリデーション
  with_options numericality: { other_than: 1 } do
    validates :condition_id
    validates :shipping_fee_id
    validates :shipment_date_id
    validates :category_id
    validates :shipment_place_id
  end

 
end
