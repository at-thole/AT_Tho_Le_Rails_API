class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :picture
      t.references :article, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
