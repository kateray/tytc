# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  username               :string(255)
#  github_id              :integer
#  god                    :boolean
#  created_at             :datetime
#  updated_at             :datetime
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:github]

  has_many :links, inverse_of: :user
  has_many :votes, inverse_of: :user

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  # validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :github_id, presence: true, uniqueness: true

  def self.github_find_or_create(auth)
    unless user = User.find_by_github_id(auth['uid'])
      user = create! do |u|
        u.github_id = auth['uid']
        u.avatar_url = auth['info']['image']
        u.username = auth['info']['nickname']
        u.email = auth['info']['email']
        u.password = SecureRandom.hex(6)
      end
    end
    return user
  end

  def is_god?
    god == true
  end

  def voted_on?(link_id)
    votes.where(link_id: link_id).any?
  end

end
