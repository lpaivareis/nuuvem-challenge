class CreateMerchants < ActiveRecord::Migration[7.0]
  def change
    create_table :merchants do |t|

      t.timestamps
    end
  end
end
