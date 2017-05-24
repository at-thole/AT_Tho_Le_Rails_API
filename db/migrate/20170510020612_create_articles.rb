class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.text :content
      t.references :user, foreign_key: true
      t.datetime :deleted_at
      t.string :slug

      t.timestamps
    end
  end
end
