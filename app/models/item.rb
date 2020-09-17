class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :purchase
  belongs_to :user
  has_one_attached :image
  
  belongs_to_active_hash :category
  
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :delivary_fee_id, numericality: { other_than: 1 }
  validates :exhibitor_area_id, numericality: { other_than: 1 }
  validates :delivary_day_id, numericality: { other_than: 1 }
end
