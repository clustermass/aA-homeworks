

class User < ApplicationRecord
  validates :username, :session_token, presence: true
  validates :password_digest, presence: { message: 'Password can\'t be blank'}
  validates :session_token, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  before_validation :ensure_session_token

attr_reader :password

def self.find_by_credentials(username,password)
  user = User.find_by(username: username)
  if BCrypt::Password.new(user.password_digest).is_password?(password)
    return user
  else
    return nil
  end
end

def self.generate_session_token
  SecureRandom::urlsafe_base64(16)
end

def reset_session_token!
  self.session_token = self.class.generate_session_token
  self.save!
  self.session_token
end

def ensure_session_token
  if self.session_token == nil
    self.reset_session_token!
  end
end

def password=(password)
  @password = password
  self.password_digest = BCrypt::Password.create(password)
end



end
