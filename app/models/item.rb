class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :title, presence: true
  validates :explanation, presence:true
  validates :price, presence: true
  validates :image, presence: true
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :delivery_area_id, numericality: { other_than: 1 }
  validates :delivery_date_id, numericality: { other_than: 1 }

  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :delivery_area
  belongs_to :delivery_date
  belongs_to :user
  has_one_attached :image
  #- has_one :buy
end