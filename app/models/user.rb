class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validate :password_special

  # def password_special
  #   return if password.blank? || password =~ /\A(?=.*\d)(?=.*[A-Z])(?=.*\W)[^ ]{8,}\z/
  #   errors.add :password, 'Password should contain a minimum of 8 characters including 1 uppercase letter, 1 number, 1 special character'
  # end
end