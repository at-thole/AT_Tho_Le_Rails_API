# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
  has_many :tags_articles, dependent: :destroy
  has_many :articles, through: :tags_articles, dependent: :destroy

  acts_as_paranoid column: :deleted_at
end
