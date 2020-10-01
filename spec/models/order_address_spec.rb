require 'rails_helper'
describe  OrderAddress do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいく時' do
      it "token、postal_code、exhibitor_area_id、city、address、building_nameとphone_numberが存在すれば購入できる" do
        sleep(1)
        expect(@order_address).to be_valid
      end
      it "phone_numberが10桁で購入できる" do
        @order_address.phone_number = "0901234567"
        sleep(1)
        expect(@order_address).to be_valid
      end
      it "phone_numberが11桁で購入できる" do
        @order_address.phone_number = "09012345678"
        sleep(1)
        expect(@order_address).to be_valid
      end
      it "building_nameが空でも購入できる" do
        @order_address.building_name = ""
        sleep(1)
        expect(@order_address).to be_valid
      end
    end
    
    context '商品購入がうまくいかない時' do
      it "tokenが空であれば購入できない" do
        @order_address.token = ""
        sleep(1)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("クレジットカード情報を正しく入力してください")
      end
      it "postal_codeが空であれば購入できない" do
        @order_address.postal_code = ""
        sleep(1)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it "postal_codeにハイフンがないと購入できない" do
        @order_address.postal_code = "1111111"
        sleep(1)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号は(-)を含めてください")
      end
      it "exhibitor_area_idが1であれば購入できない" do
        @order_address.exhibitor_area_id = "1"
        sleep(1)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を選択してください")
      end
      it "cityが空であれば購入できない" do
        @order_address.city = ""
        sleep(1)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it "addressが空であれば購入できない" do
        @order_address.address = ""
        sleep(1)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end
      it "phone_numberが空であれば購入できない" do
        @order_address.phone_number = ""
        sleep(1)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it "phone_numberが12桁以上であれば購入できない" do
        @order_address.phone_number = "090123456789"
        sleep(1)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it "phone_numberが9桁以下であれば購入できない" do
        @order_address.phone_number = "090123456"
        sleep(1)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it "phone_numberにハイフンが含まれていれば購入できない" do
        @order_address.phone_number = "090-1234-5678"
        sleep(1)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
    end
  end
end