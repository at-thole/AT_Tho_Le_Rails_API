# == Schema Information
#
# Table name: categories_articles
#
#  id          :integer          not null, primary key
#  category_id :integer
#  article_id  :integer
#  deleted_at  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_categories_articles_on_article_id   (article_id)
#  index_categories_articles_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_61ff9d7815  (category_id => categories.id)
#  fk_rails_d5cb316600  (article_id => articles.id)
#

class CategoriesArticle < ApplicationRecord
  belongs_to :category
  belongs_to :article

  acts_as_paranoid column: :deleted_at
end
