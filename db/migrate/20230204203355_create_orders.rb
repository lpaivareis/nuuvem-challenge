class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :item_description
      t.string :item_price

      t.references :import_file, null: false, foreign_key: true

      t.timestamps
    end
  end
end
