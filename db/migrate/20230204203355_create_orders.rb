class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :item_description
      t.string :item_price

      t.timestamps
    end
  end
end
