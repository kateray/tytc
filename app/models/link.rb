# == Schema Information
#
# Table name: links
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  url         :string(255)
#  description :text
#  user_id     :integer
#  votes_count :integer
#  level       :integer
#  free        :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

class Link < ActiveRecord::Base
  attr_accessor :language

  belongs_to :user
  has_many :votes, inverse_of: :link
  has_one :tag, inverse_of: :link
  has_one :language, through: :tag

  BEGINNER = 1
  INTERMEDIATE = 2
  ADVANCED = 3

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :url, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true
  validates :level, presence: true
  validates :user, presence: true

  #TODO Very Bad
  def level_name
    if level == 1
      "Beginner"
    elsif level == 2
      "Intermediate"
    elsif level == 3
      "Advanced"
    end
  end

end
