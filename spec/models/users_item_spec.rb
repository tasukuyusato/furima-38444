require 'rails_helper'

RSpec.describe UsersItemPay, type: :model do

  describe '商品購入' do
     
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @user_item_pay = FactoryBot.build(:users_item_pay,user_id: user.id, item_id: item.id)
    end

    context '商品購入が成功する場合' do

      it '全ての項目が入力されていれば登録できる' do
        expect(@user_item_pay).to be_valid 
      end

      it '建物の項目が入力されていなくても登録できる' do
        @user_item_pay.building = ''
        expect(@user_item_pay).to be_valid 
      end

    end
    
    context '商品購入に失敗する場合' do

      it "tokenが空では登録できないこと" do
        @user_item_pay.token = nil
        @user_item_pay.valid?
        expect(@user_item_pay.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空では購入できない' do
        @user_item_pay.post_code = ''
        @user_item_pay.valid?
        expect(@user_item_pay.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号が「３桁ハイフン４桁」でないと登録できない' do
        @user_item_pay.post_code = '00-000'
        @user_item_pay.valid?
       expect(@user_item_pay.errors.full_messages).to include("Post code 例）123-4567")
      end

      it '郵便番号にハイフンがないと登録できない' do
        @user_item_pay.post_code = '0000000'
        @user_item_pay.valid?
       expect(@user_item_pay.errors.full_messages).to include("Post code 例）123-4567")
      end

      it '都道府県が空では購入できない' do
        @user_item_pay.prifecture_id = 1
        @user_item_pay.valid?
       expect(@user_item_pay.errors.full_messages).to include("Prifecture can't be blank")
      end

      it '市町村が空では購入できない' do
        @user_item_pay.city = ''
        @user_item_pay.valid?
        expect(@user_item_pay.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では購入できない' do
        @user_item_pay.address = ''
        @user_item_pay.valid?
        expect(@user_item_pay.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空では購入できない' do
        @user_item_pay.tel = ''
        @user_item_pay.valid?
        expect(@user_item_pay.errors.full_messages).to include("Tel can't be blank")
      end

      it '電話番号が9桁以下では登録できない' do
        @user_item_pay.tel = '000000000'
        @user_item_pay.valid?
        expect(@user_item_pay.errors.full_messages).to include("Tel is invalid")
      end

      it '電話番号が12桁以上では登録できない' do
        @user_item_pay.tel = '000000000000'
        @user_item_pay.valid?
        expect(@user_item_pay.errors.full_messages).to include("Tel is invalid")
      end

      it '電話番号が半角数字以外では登録できない' do
        @user_item_pay.tel = '000-0000-0000'
        @user_item_pay.valid?
        expect(@user_item_pay.errors.full_messages).to include("Tel is invalid")
      end

      it 'userが紐づいていなければ登録できない' do
        @user_item_pay.user_id = ''
        @user_item_pay.valid?
        expect(@user_item_pay.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐づいていなければ登録できない' do
        @user_item_pay.item_id = nil
        @user_item_pay.valid?
        expect(@user_item_pay.errors.full_messages).to include("Item can't be blank")
      end
    end 

  end


end
