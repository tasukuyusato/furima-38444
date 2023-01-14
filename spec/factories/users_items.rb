FactoryBot.define do
      factory :users_item_pay do
        token {"tok_abcdefghijk00000000000000000"}
        post_code {"000-0000"}   
        prifecture_id {2}
        city {"街"}   
        address {"市"}     
        building {"ビル"}
        tel {"00000000000"} 
      end
end
