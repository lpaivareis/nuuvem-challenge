class CreatePurchasers < ActiveRecord::Migration[7.0]
  def change
    create_table :purchasers do |t|
      t.string :name, null: false
      t.string :purchase_count

      t.timestamps
    end
  end
end
