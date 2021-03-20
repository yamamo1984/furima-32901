FactoryBot.define do
  factory :order_address do
    user_id                {1}
    item_id                {1}
    token                  {'tok_abcdefghijk00000000000000000'}
    post_code              {'123-4567'}
    shipment_place_id      {2}
    city                   {'テスト'}
    street_num             {'テスト'}
    building               {'テスト'}
    tel_num                {'12345678901'}
  end
end
