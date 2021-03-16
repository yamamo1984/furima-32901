require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end 

  
    context '購入に成功した時' do
      it 'すべての値が正しく入力されていれば、購入できること' do
        expect(@order_address).to be_valid
      end
      
    end  

  
    context '購入に失敗した時' do
      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token は必ず入力してください")
      end  
      it 'post_codeが空では登録できないこと' do
        @order_address.post_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code は必ず入力してください")
      end  
      it 'shipment_place_idカラムが1だと出品できない' do
        @order_address.shipment_place_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include ("Shipment place は---以外を選択してください")
      end  
      it 'cityが空では登録できないこと' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City は必ず入力してください")
      end 
      it 'street_numが空では登録できないこと' do
        @order_address.street_num = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street num は必ず入力してください")
      end 
      it 'tel_numが空では登録できないこと' do
        @order_address.tel_num = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel num は必ず入力してください")
      end
      it 'post_codeはハイフンが必須であること' do
        @order_address.post_code = 0000000
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code にはハイフン（OOO-OOOO）が必要です")
      end
      it 'tel_numにはハイフンが不要なこと' do
        @order_address.tel_num = "11-1111-11"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel num はハイフン無し半角数字で入力してください")
      end
      it 'tel_numは11桁以下のこと' do
        @order_address.tel_num = "000000000000"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel num は11桁以内にしてください")
      end

    end
  end    
end
