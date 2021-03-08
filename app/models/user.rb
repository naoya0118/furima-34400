class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  FULL_NAME = /\A[ぁ-んァ-ン一-龥々]+\z/
  KANA_NAME = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :nickname 
    validates :password,format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i , message: 'には英字と数字の両方を含めて設定してください' }
    validates :last_name, format: { with: FULL_NAME, message: '漢字、カタカナ、平仮名で入力してください' }
    validates :first_name,format: { with: FULL_NAME, message: '漢字、カタカナ、平仮名で入力してください' }
    validates :kana_last_name,format: { with: KANA_NAME, message: 'カタカナで入力してください' }
    validates :kana_first_name,format: { with: KANA_NAME, message: 'カタカナで入力してください' }
    validates :birthday
  end

  has_many :items
  #has_many :buys
  
end
