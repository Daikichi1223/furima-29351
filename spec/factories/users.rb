FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {Faker::Name.last_name}
    first_name            {Faker::Name.first_name}
    last_name_ruby        {Gimei.last.katakana}
    first_name_ruby       {Gimei.first.katakana}
    birthday              {Faker::Date.birthday(min_age: 5, max_age: 90)}
  end
end