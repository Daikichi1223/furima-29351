FactoryBot.define do
  factory :order_address do
    token              {"sumple1234"}
    postal_code        {Faker::Number.leading_zero_number(digits: 3) + "-" + Faker::Number.leading_zero_number(digits: 4)}
    exhibitor_area_id  {Faker::Number.between(from: 2, to: 48)}
    city               {Gimei.address.city.to_s}
    address            {Gimei.address.town.to_s}
    building_name      {"柳ビル103"}
    phone_number       {"09012345678"}
  end
end