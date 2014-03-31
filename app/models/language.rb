# == Schema Information
#
# Table name: languages
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  links_count :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Language < ActiveRecord::Base
  has_many :tags, inverse_of: :language
  has_many :links, through: :tags, order: 'votes_count'

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def to_param
    name
  end
end
