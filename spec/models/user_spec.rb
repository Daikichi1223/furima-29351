require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it "nicknameとemail、password、last_name、first_name、last_name_ruby、first_name_rubyとbirthdayが存在すれば登録できる" do
      end
      it "passwordが6文字以上であれば登録できる" do
      end
      it "passwordが半角英数字混合であれば登録できる" do
      end
      it "last_nameとfirst_nameが全角であれば登録できる" do
      end
      it "last_name_rubyとfirst_name_rubyが全角カタカナであれば登録できる" do
      end
    end

    context '新規登録がうまくいかない時' do
      it "nicknameが空だと登録できない" do
      end
      it "emailが空だと登録できない" do
      end
      it "重複したemailが存在する場合は登録できない" do
      end
      it "passwordが空だと登録できない" do
      end
      it "passwordが6文字以下だと登録できない" do
      end
      it "passwordが半角英数字でなければ登録できない" do
      end
      it "passwordは2回入力しないと登録できない" do
      end
      it "last_nameが空だと登録できない" do
      end
      it "last_nameが全角でないと登録できない" do
      end
      it "first_nameが空だと登録できない" do
      end
      it "first_nameが全角でないと登録できない" do
      end
      it "last_name_rubyが空だと登録できない" do
      end
      it "last_name_rubyが全角カタカナでないと登録できない" do
      end
      it "first_name_rubyが空だと登録できない" do
      end
      it "first_name_rubyが全角カタカナでないと登録できない" do
      end
      it "birthdayが空だと登録できない" do
      end
    end
  end
end