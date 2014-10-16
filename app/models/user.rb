class User < ActiveRecord::Base
  has_many :posts
  has_secure_password

  validates :password, length: { minimum: 7}
  validates_confirmation_of :password
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :avatar

  mount_uploader :avatar, AvatarUploader

  def self.authenticate(email, password)
    user = User.find_by_email(email).authenticate(password)
  end
end
