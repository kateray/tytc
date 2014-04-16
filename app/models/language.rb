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
  has_many :links, through: :tags, order: 'votes_count DESC'

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  before_create :generate_slug

  def generate_slug
    self.slug = self.name.downcase.gsub(/[^\w\-]+/, "-")
  end

  def to_param
    slug
  end
end
