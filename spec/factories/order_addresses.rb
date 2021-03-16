FactoryBot.define do
  factory :order_address do
    token                  {'tok_abcdefghijk00000000000000000'}
    post_code              {'123-4567'}
    shipment_place_id      {2}
    city                   {'テスト'}
    street_num             {'テスト'}
    tel_num                {'12345678901'}
  end
end
