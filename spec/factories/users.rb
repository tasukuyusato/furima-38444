FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    nickname  {Faker::Name.initials(number: 2)}
    first_name {Faker::Name.initials(number: 2)}   
    last_name {Faker::Name.initials(number: 2)}     
    first_name_kana {"カタ"} 
    last_name_kana  {"カナ"}
    birthday {Faker::Date.birthday}
  end
end