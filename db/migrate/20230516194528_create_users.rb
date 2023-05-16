class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :description
      t.binary :avatar
      t.boolean :admin, default: false, null: false
      t.string :password_digest

      t.timestamps
    end
  end
end
