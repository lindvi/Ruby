class User < ActiveRecord::Base
  attr_accessible :phone, :password, :password_confirmation, :username

  has_secure_password

  before_save :create_remember_token

  validates :phone, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  phone           :string(255)
#  admin           :boolean         default(FALSE)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  username        :string(255)
#  password_digest :string(255)
#  remember_token  :string(255)
#

