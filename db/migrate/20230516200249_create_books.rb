class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.binary :poster
      t.string :description
      t.integer :price
      t.string :genre

      t.timestamps
    end
  end
end
