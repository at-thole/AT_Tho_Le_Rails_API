class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :username
      t.string :email
      t.string :content
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
