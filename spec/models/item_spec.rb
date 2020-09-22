require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品の出品が上手くいく時' do
      it "image、name、explanation、category_id、condition_id、delivary_fee_id、exhibitor_area_id、delivary_day_idとpriceが存在すれば出品できる" do
        expect(@item).to be_valid
      end
      it "nameが40文字以下で出品できる" do
        @item.name = "aaaaa"
        expect(@item).to be_valid
      end
      it "explanationが1000文字以下で出品できる" do
        @item.explanation = "aaaaa"
        expect(@item).to be_valid
      end
      it "出品価格が300円以上で出品できる" do
        @item.price = "300"
        expect(@item).to be_valid
      end
      it "出品価格が9,999,999円以下で出品できる"do
      @item.price = "9999999"
      expect(@item).to be_valid
      end
    end

    context '商品の出品が上手くいかない時' do
      it "imageが未選択であれば出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像を選択してください")
      end
      it "nameが空であれば出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it "nameが41文字以上であれば出品できない" do
        @item.name = "a" * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名は40文字以内で入力してください")
      end
      it "explanationが1001文字以上であれば出品できない" do
        @item.name = "a" * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名は40文字以内で入力してください")
      end
      it "category_idが1であれば出品できない"do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it "condition_idが1であれば出品できない"do
        @item.condition_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
      it "delivary_fee_idが1であれば出品できない"do
        @item.delivary_fee_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it "exhibitor_area_idが1であれば出品できない"do
        @item.exhibitor_area_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end
      it "delivary_day_idが1であれば出品できない"do
        @item.delivary_day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end
      it "priceが空白であれば出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("出品価格を入力してください")
      end
      it "priceが299円以下であれば出品できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("出品価格は300円~9,999,999円の範囲で入力してください")
      end
      it "priceが10,000,000円以上であれば出品できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("出品価格は300円~9,999,999円の範囲で入力してください")
      end
      it "priceが全角数字であれば出品できない" do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("出品価格は半角数字で入力してください")
      end
    end
  end
end 
