class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, presence: true,format: { with: /^[0-9a-zA-Z]*$/}

  @full_name = /\A[ぁ-んァ-ン一-龥々]+\z/
  @kana_name = /\A[ァ-ヶー－]+\z/
  
  with_options presence: true do
    validates :nickname 
    validates :last_name, format: {with: @full_name}
    validates :first_name, format: {with: @full_name}
    validates :kana_last_name, format: {with: @kana_name}
    validates :kana_first_name, format: {with: @kana_name}
    validates :birthday
  end

  has_many :items
  #has_many :buys
  
end
