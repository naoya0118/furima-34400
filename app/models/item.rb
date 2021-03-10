class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :title
    validates :explanation
    validates :price
    validates :image
  end
  validates :price,format: { with: /\A[0-9]+\z/ , message: '' }
  validates :title, length: { maximum: 40 }
  validates :explanation, length: { maximum: 1000 }
  validates :price, inclusion: { in: (300)..(9999999) }

  with_options numericality: { other_than: 1 } do
    validates :delivery_fee_id
    validates :delivery_area_id
    validates :delivery_date_id
    validates :category_id
    validates :state_id
  end

  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :delivery_area
  belongs_to :delivery_date
  belongs_to :user
  has_one_attached :image
  #- has_one :buy
end