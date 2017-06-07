class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :title
      t.string :username
      t.string :tag
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
