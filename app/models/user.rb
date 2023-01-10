class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  validates :firstname, :lastname, :email, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-'.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX, allow_blank: true }

  def active_for_authentication?
    super && self.active
  end

  def inactive_message
    "Sorry, this account has been deactivated."
  end

end
