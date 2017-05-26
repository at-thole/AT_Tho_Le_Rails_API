class CreateTagsArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :tags_articles do |t|
      t.references :tag, foreign_key: true
      t.references :article, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
