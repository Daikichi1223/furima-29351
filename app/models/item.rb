class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivary_fee
  belongs_to_active_hash :exhibitor_area
  belongs_to_active_hash :delivary_day
  has_one :purchase
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image, presence: { message: "を選択してください"}
    validates :name
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :delivary_fee_id
    validates :delivary_day_id
  end

  with_options numericality: { other_than: 1 } do
  validates :category_id, numericality: { message: "を選択してください" }
  validates :condition_id, numericality: { message: "を選択してください" }
  validates :delivary_fee_id, numericality: { message: "を選択してください" }
  validates :delivary_day_id, numericality: { message: "を選択してください" }
  end

  validates :name, length: { maximum: 40 }
  validates :explanation, length: { maximum: 1000 }
  validates :price, presence: true, inclusion: { in: 300..9999999, message: "は300円~9,999,999円の範囲で入力してください"}
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }

end
