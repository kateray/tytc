# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  link_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Vote < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :link, dependent: :destroy, counter_cache: true

  validates :user, presence: true, uniqueness: { scope: :link_id}
  validates :link, presence: true

end
