class CreateMerchants < ActiveRecord::Migration[7.0]
  def change
    create_table :merchants do |t|
      t.string :name, null: false
      t.string :address

      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
