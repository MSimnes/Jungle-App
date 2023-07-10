class User < ApplicationRecord

  has_secure_password
  
  # add authentication logic here
  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true

end
