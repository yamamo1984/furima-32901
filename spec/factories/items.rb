FactoryBot.define do
  factory :item do
    name                  {Faker::Name.initials(number: 2)}
    price                 {300}
    detail                {'TEST'}
    condition_id          {2}
    shipping_fee_id       {2}
    shipment_place_id     {2}
    shipment_date_id      {2}
    category_id           {2}
    association :user

     after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
     end
  end
end
