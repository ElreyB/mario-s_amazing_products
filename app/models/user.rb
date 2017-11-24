class User < ApplicationRecord
  attr_accessor :password
  validates_confirmation_of :password
  validates :password, :presence => true, :length => { minimum: 6 }, format: { with: /\A(?=.{6,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/,
    message: "must contain at least 6 characters, a number, a lowercase letter, uppercase letter, a symbol."  } 
  validates :email, :presence => true, :uniqueness => true, format: { with: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/, multiline: true}
  before_save :encrypt_password

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
  end

  def self.authenticate(email, password)
    user = User.find_by "email = ?", email
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def check_password_format
  end
end
