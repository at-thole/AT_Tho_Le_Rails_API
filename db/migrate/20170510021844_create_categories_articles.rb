class CreateCategoriesArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :categories_articles do |t|
      t.references :category, foreign_key: true
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
