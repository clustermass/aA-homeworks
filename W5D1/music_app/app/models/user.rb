# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
validates :username, :password_digest, :session_token, uniqueness: true, presence: true
validates :password, length: { minimum:6, allow_nil: true }
attr_reader :password
before_validation :ensure_session_token!

def self.generate_session_token
   SecureRandom.urlsafe_base64(16)
end

def self.find_by_credentials(username, password)
  user = User.find_by(username: username)
  user && user.is_password?(password) ? user : nil
end

def ensure_session_token!
  self.session_token ||= self.class.generate_session_token
end

def reset_session_token!
  self.session_token = self.class.generate_session_token
  self.save!
  self.session_token
end


def password=(password)
  @password = password
  self.password_digest = BCrypt::Password.create(password)
  self.save!
end

def is_password?(password)
  BCrypt::Password.new(self.password_digest).is_password?(password)
end

end
