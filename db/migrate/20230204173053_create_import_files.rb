class CreateImportFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :import_files do |t|
      t.float :total_amount

      t.timestamps
    end
  end
end
