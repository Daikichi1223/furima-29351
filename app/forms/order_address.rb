class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :exhibitor_area_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :order_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は(-)を含めてください。"}
    validates :exhibitor_area_id, numericality: {other_than: 1, message: "を選択してください" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
  end

  def save

    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, exhibitor_area_id: exhibitor_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end