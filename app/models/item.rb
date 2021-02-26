class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipment_place
  belongs_to :shipment_date
  belongs_to :category

  belongs_to :user
  has_one_attached :image

  with_options presence: { message: 'は必ず入力してください' } do
    validates :name, length: { maximum: 40 , message: 'は40文字以下にしてください' } 
    validates :detail, length: { maximum: 1000 , message: 'は1000文字以下にしてください' } 
    validates :image
    validates :price,  inclusion: { in: 300..9999999, message: 'は300〜9999999円の間にしてください' } 
    validates :price,  numericality: {only_integer: true, message: 'は半角数字で入力してください'}
    validates :price,  numericality: {only_integer: true, message: 'は数字で入力してください'}
    
  end

  #アクティブハッシュのバリデーション
  with_options numericality: { other_than: 1, message: 'は---以外を選択してください' } do
    validates :condition_id
    validates :shipping_fee_id
    validates :shipment_date_id
    validates :category_id
    validates :shipment_place_id
  end

 
end
