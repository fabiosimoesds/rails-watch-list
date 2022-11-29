class User < ApplicationRecord
  has_many :lists, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, password_length: 8..128

  validate :password_complexity

  def password_complexity
    if password.present? and not password.match(/(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)/)
      errors.add :password, "Must include at least one lowercase letter, one uppercase letter, one number and one symbol"
    end
  end
end
