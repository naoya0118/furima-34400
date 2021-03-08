class Item < ApplicationRecord

  validates :title, presence: true
  validates :explanation, presence:true
  validates :price, presence: true
  validates :image, presence: true
  
  belongs_to :user
  has_one_attached :image
  #- has_one :buy
end
