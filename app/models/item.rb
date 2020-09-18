class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :purchase
  belongs_to :user
  has_one_attached :image
  
  belongs_to_active_hash :category

  with_options presence: true do
    validates :image, presence: { message: "を選択してください"}
    validates :name
    validates :explanation
    validates :category_id, presence: { message: "を選択してください"}
    validates :condition_id, presence: { message: "を選択してください"}
    validates :delivary_fee_id, presence: { message: "を選択してください"}
    validates :exhibitor_area_id, presence: { message: "を選択してください"}
    validates :delivary_day_id, presence: { message: "を選択してください"}
    validates :price
  end

  validates :price, format: {with: /\A[0-9]+\z/, message: "は半角数字で入力してください"}


end
