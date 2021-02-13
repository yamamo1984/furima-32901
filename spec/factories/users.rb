FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'000yyy'}
    password_confirmation {password}
    first_name            {'テスト'}
    last_name             {'テスト'}
    kana_first_name       {'テスト'} 
    kana_last_name        {'テスト'}
    birthday              {'2020-1-1'}  
  end
end     