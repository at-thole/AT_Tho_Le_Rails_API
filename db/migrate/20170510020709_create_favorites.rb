class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
