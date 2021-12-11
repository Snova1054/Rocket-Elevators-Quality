class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validate :password_special

  def password_special
    # Rails.logger.info 'email log in attempt as ' + email + ' '
    return if password.blank? || password =~ /\A(?=.*\d)(?=.*[A-Z])(?=.*\W)[^ ]{8,}\z/
    errors.add :password, 'Minimum requirements of 8 characters including 1 uppercase letter, 1 number, 1 special character'
  end
end