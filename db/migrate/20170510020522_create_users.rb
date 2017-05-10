class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.integer :phone
      t.string :address
      t.string :avatar
      t.integer :role

      t.timestamps
    end
  end
end