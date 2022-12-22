FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password {"1a" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    nickname  {Faker::Name.initials(number: 2)}
    first_name {"侑"}   
    last_name {"佐藤"}     
    first_name_kana {"カタ"} 
    last_name_kana  {"カナ"}
    birthday {Faker::Date.birthday}
  end
end