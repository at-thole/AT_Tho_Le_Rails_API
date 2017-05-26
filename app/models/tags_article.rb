# == Schema Information
#
# Table name: tags_articles
#
#  id         :integer          not null, primary key
#  tag_id     :integer
#  article_id :integer
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tags_articles_on_article_id  (article_id)
#  index_tags_articles_on_tag_id      (tag_id)
#
# Foreign Keys
#
#  fk_rails_91745c928a  (tag_id => tags.id)
#  fk_rails_f5f2ab0a12  (article_id => articles.id)
#

class TagsArticle < ApplicationRecord
  belongs_to :tag
  belongs_to :article

  acts_as_paranoid column: :deleted_at
end
