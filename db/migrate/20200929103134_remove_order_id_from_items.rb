class RemoveOrderIdFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :order_id, :integer
  end
end
