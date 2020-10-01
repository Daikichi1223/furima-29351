require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it "nicknameとemail、password、last_name、first_name、last_name_ruby、first_name_rubyとbirthdayが存在すれば登録できる" do
        expect(@user).to be_valid
        binding.pry
      end
    end

    context '新規登録がうまくいかない時' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "emailに@が存在しない場合は登録できない" do
        @user.email = "furima.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが6文字以下だと登録できない" do
        @user.password = "a0000"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが半角英数字でなければ登録できない" do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end
      it "last_nameが全角でないと登録できない" do
        @user.last_name = "ﾌﾘﾏ"
        @user.valid?
        expect(@user.errors.full_messages).to include("名字は全角で入力してください。")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it "first_nameが全角でないと登録できない" do
        @user.first_name = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は全角で入力してください。")
      end
      it "last_name_rubyが空だと登録できない" do
        @user.last_name_ruby = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名字カナを入力してください")
      end
      it "last_name_rubyが全角カタカナでないと登録できない" do
        @user.last_name_ruby = "ﾌﾘﾏ"
        @user.valid?
        expect(@user.errors.full_messages).to include("名字カナは全角カタカナで入力して下さい。")
      end
      it "first_name_rubyが空だと登録できない" do
        @user.first_name_ruby = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナを入力してください")
      end
      it "first_name_rubyが全角カタカナでないと登録できない" do
        @user.first_name_ruby = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナは全角カタカナで入力して下さい。")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end