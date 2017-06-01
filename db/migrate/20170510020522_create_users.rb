class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :phone
      t.string :address
      t.string :avatar
      t.text :about_me
      t.string :slug
      t.integer :role,default: 0
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
