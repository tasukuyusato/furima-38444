FactoryBot.define do
  factory :item do

      item_name   {Faker::Name.initials(number: 2)}
      description {Faker::Name.initials(number: 2)}
      category_id {2}   
      status_id    {2}     
      delivery_charge_id {2} 
      prifecture_id  {2}
      shipping_day_id {2}
      price  {500}
      association :user

      after(:build) do |item|
        item.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
      end
       
  
    end
end

