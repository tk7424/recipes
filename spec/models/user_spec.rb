require 'rails_helper'

RSpec.describe User, type: :model do
  
   # ユーザー名、メールアドレス、パスワードがあれば有効な状態であること
   it "is valid with a username, email, and password" do
     user = User.new(
       username:  "tk7424",
       email:      "tk@7424.com",
       password:   "Tk7424",
     )
     expect(user).to be_valid
   end
   
   # ユーザー名がなければ無効な状態であること
  it "is invalid without a username" do
    user = User.new(username: nil)
    user.valid?
    expect(user.errors[:username]).to include("が入力されていません。")
  end
  
  # メールアドレスがなければ無効な状態であること
  it "is invalid without a email" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("が入力されていません。")
  end
  
  # パスワードがなければ無効な状態であること
  it "is invalid without a password" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("が入力されていません。")
  end
  
  # 重複したメールアドレスなら無効な状態であること
   it "is invalid with a duplicate email address" do
     User.create(
       username:  "tk7424",
       email:      "tk@7424.com",
       password:   "Tk7424",
     )
     user = User.new(
       username:  "Tk7424",
       email:      "tk@7424.com",
       password:   "Tk7424",
     )
     user.valid?
     expect(user.errors[:email]).to include("は既に使用されています。")
   end
end
