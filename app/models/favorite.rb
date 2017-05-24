# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  article_id :integer
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_favorites_on_article_id  (article_id)
#  index_favorites_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_00f2e522fe  (article_id => articles.id)
#  fk_rails_d15744e438  (user_id => users.id)
#

class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :article

  acts_as_paranoid column: :deleted_at
end
