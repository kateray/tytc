# == Schema Information
#
# Table name: tags
#
#  id          :integer          not null, primary key
#  link_id     :integer
#  language_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Tag < ActiveRecord::Base
  belongs_to :link, dependent: :destroy
  belongs_to :language, dependent: :destroy

  validates :link, presence: true, uniqueness: { scope: :language_id}
  validates :language, presence: true
end
