class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :shipment_place_id, :city, :street_num, :building, :tel_num, :order_id, :item_id, :user_id, :token
  #配送先住所に関するバリデーション
  with_options presence: { message: 'は必ず入力してください' } do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'にはハイフン（OOO-OOOO）が必要です'}
    validates :city
    validates :street_num
    validates :tel_num, format: { with: /\A[0-9]+\z/, message: 'はハイフン無し半角数字で入力してください'}
    validates :tel_num, length: { maximum: 11 , message: 'は11桁以内にしてください' } 
  end
  #注文支払いに関するバリデーション\
  with_options presence: { message: 'は必ず入力してください'} do
    validates :token
  end


  #アクティブハッシュのバリデーション
  validates :shipment_place_id, numericality: { other_than: 1, message: 'は---以外を選択してください' }

  def save
    order = Order.create(item_id: item_id, user_id: user_id )
    Address.create(post_code: post_code, shipment_place_id: shipment_place_id,city: city, street_num: street_num, building: building, tel_num: tel_num, order_id: order.id)  
  end  


end  