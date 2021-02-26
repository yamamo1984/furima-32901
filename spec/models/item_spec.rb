require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end 

  describe '商品出品' do
    context '出品できるとき' do
      it 'name、price、detail、image、condition_id、shipping_fee_id、shipment_place_id、shipment_date_id、category_id、user_idが存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it '商品名が40文字以下なら出品できる' do
        @item.name = 'テスト'
        expect(@item).to be_valid
      end
      it '販売価格が300〜9999999円の間であれば出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end
    
    context '新規登録できないとき' do

      it 'nameカラムが空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Name は必ず入力してください")
      end 
      it 'nameカラムが40文字以上だと出品できない' do
        @item.name = 'i' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include ("Name は40文字以下にしてください")
      end   
      it 'detailカラムが1000文字以上だと出品できない' do
        @item.detail = 'i' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include ("Detail は1000文字以下にしてください")
      end
      it 'imageカラムが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Image は必ず入力してください")
      end 
      it 'detailカラムが空だと出品できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Detail は必ず入力してください")
      end 
    
      it 'priceカラムが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price は必ず入力してください")
      end 

      it 'priceカラムが300円以下だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price は300〜9999999円の間にしてください")
      end 
      it 'priceカラムが9999999円以下だと出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price は300〜9999999円の間にしてください")
      end
      it 'priceカラムが半角英数字混合では出品できない' do
        @item.price = 'AAA' 
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price は数字で入力してください")
      end 
      it 'priceカラムが半角英字では出品できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price は半角数字で入力してください")
      end 
      it 'priceカラムが全角文字では登録できないこと' do
        @item.price = '２９９'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price は半角数字で入力してください")
      end 
      it 'category_idカラムが1だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category は---以外を選択してください")
      end 
      it 'condition_idカラムが1だと出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Condition は---以外を選択してください")
      end 
      it 'shipping_fee_idカラムが1だと出品できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Shipping fee は---以外を選択してください")
      end 
      it 'shipment_place_idカラムが1だと出品できない' do
        @item.shipment_place_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Shipment place は---以外を選択してください")
      end 
      it 'shipment_date_idカラムが1だと出品できない' do
        @item.shipment_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Shipment date は---以外を選択してください")
      end 
    end
  end    
end
