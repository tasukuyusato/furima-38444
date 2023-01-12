require 'rails_helper'

RSpec.describe Pay, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.build(:item)
    @pay = FactoryBot.build(:pay, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do

    context '商品購入が成功する場合' do

      it '全ての項目が入力されていれば登録できる' do
        expect(@pay).to be_valid 
      end
    end
    
    context '商品購入に失敗する場合' do

      it '郵便番号が空では購入できない' do
        @pay.post_code = ''
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Post_code can't be blank")
      end

      it '郵便番号が「３桁ハイフン４桁」でないと登録できない' do
        @pay.post_code = '00-000'
        @pay.valid?
       expect(@pay.errors.full_messages).to include("Post_code is invalid")
      end

      it '都道府県が空では購入できない' do
        @pay.prifecture_id = 1
        @pay.valid?
       expect(@pay.errors.full_messages).to include("Prifecture can't be blank")
      end

      it '市町村が空では購入できない' do
        @pay.city = ''
        @pay.valid?
        expect(@pay.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では購入できない' do
        @pay.address = ''
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Address can't be blank")
      end

      it '建物が空では購入できない' do
        @pay.building = ''
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Building can't be blank")
      end

      it '電話番号が空では購入できない' do
        @pay.tel = ''
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Tel can't be blank")
      end

      it '電話番号が10桁以下では登録できない' do
        @pay.tel = '0000000000'
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Tel is invalid")
      end

      it '電話番号が12桁以上では登録できない' do
        @pay.tel = '000000000000'
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Tel is invalid")
      end

    end 

  end


end
