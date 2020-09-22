FactoryBot.define do
  factory :item do
    image                 {Faker::Lorem.sentence}
    name                  {Faker::Lorem.characters(number: 10)}
    explanation           {Faker::Lorem.characters(number: 10)}
    category_id           {Faker::Number.between(from: 2, to: 11)}
    condition_id          {Faker::Number.between(from: 2, to: 7)}
    delivary_fee_id       {Faker::Number.between(from: 2, to: 3)}
    exhibitor_area_id     {Faker::Number.between(from: 2, to: 48)}
    delivary_day_id       {Faker::Number.between(from: 2, to: 4)}
    price                 {Faker::Number.between(from: 300, to: 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end