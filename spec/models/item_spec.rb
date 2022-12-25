require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { create(:user) }
  let(:item) { create(:item,user: user) }
  
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規投稿' do
  
    context '商品投稿が成功する場合' do

      it '全ての項目が入力されていれば登録できる' do
        expect(@item).to be_valid 
      end

    end

    context '商品登録に失敗する場合' do
      
      it '商品画像が空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空だと登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品名の説明が空だと登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーが空だと登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が空だと登録できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it '配送料の負担が空だと登録できない' do
      @item.delivery_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end

      it '発送元の地域が空だと登録できない' do
      @item.prifecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prifecture can't be blank")
      end

      it '発送までの日数が空だと登録できない' do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it '価格が空だと登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格は300円より低いと登録できない' do
      @item.price = '200'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end  

      it '価格は9,999,999円より上だと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
        end  

      it '価格に半角数字以外（全角数字）が含まれていると登録できない' do
      @item.price = '５５５'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

    end
  end


end
