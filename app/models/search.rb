# == Schema Information
#
# Table name: searches
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  username   :string(255)
#  tag        :string(255)
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_searches_on_article_id  (article_id)
#
# Foreign Keys
#
#  fk_rails_6ec15fca4f  (article_id => articles.id)
#

class Search < ApplicationRecord
  belongs_to :article

  scope :get_article_id, -> key_search do
    where("title like '%#{key_search}%' || username like '%#{key_search}%' || tag like '%#{key_search}%'")
  end
end
